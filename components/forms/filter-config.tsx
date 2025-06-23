import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import type { BridgeBlock } from "@/lib/stores/configuration-store";

interface FilterConfigProps {
    config: any;
    onUpdate: (config: any) => void;
}

export function FilterConfig({ config, onUpdate }: FilterConfigProps) {
    const handleChange = (key: string, value: any) => {
        onUpdate({ ...config, [key]: value });
    };

    return (
        <div className="space-y-4 animate-in fade-in-50 duration-300">
            <p className="text-sm text-muted-foreground">
                Only allow data to continue if it meets the specified condition. Use 'x' for the incoming value.
            </p>

            <div className="flex items-end gap-2">
                <div className="flex-1">
                    <Label>Condition</Label>
                    <Select value={config.condition} onValueChange={(v) => handleChange('condition', v)}>
                        <SelectTrigger><SelectValue /></SelectTrigger>
                        <SelectContent>
                            <SelectItem value="pass">Pass if</SelectItem>
                            <SelectItem value="block">Block if</SelectItem>
                        </SelectContent>
                    </Select>
                </div>
                <div className="text-muted-foreground pb-2">x</div>
                <div className="flex-1">
                    <Label>Operator</Label>
                    <Select value={config.operator} onValueChange={(v) => handleChange('operator', v)}>
                        <SelectTrigger><SelectValue /></SelectTrigger>
                        <SelectContent>
                            <SelectItem value="eq">== (equals)</SelectItem>
                            <SelectItem value="neq">!= (not equals)</SelectItem>
                            <SelectItem value="gt">&gt; (greater than)</SelectItem>
                            <SelectItem value="gte">&gt;= (greater or equal)</SelectItem>
                            <SelectItem value="lt">&lt; (less than)</SelectItem>
                            <SelectItem value="lte">&lt;= (less or equal)</SelectItem>
                        </SelectContent>
                    </Select>
                </div>
                <div className="flex-1">
                    <Label htmlFor="filter-value">Value</Label>
                    <Input
                        id="filter-value"
                        type="number"
                        placeholder="e.g., 100"
                        value={config.value || ''}
                        onChange={(e) => handleChange('value', e.target.value)}
                    />
                </div>
            </div>
             <p className="text-xs text-muted-foreground mt-1">Example: Pass if x &gt; 50.</p>
        </div>
    );
} 