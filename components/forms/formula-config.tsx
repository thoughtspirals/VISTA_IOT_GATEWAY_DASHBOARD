import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import type { BridgeBlock } from "@/lib/stores/configuration-store";
import { Textarea } from "@/components/ui/textarea";

interface FormulaConfigProps {
    config: any;
    onUpdate: (config: any) => void;
}

export function FormulaConfig({ config, onUpdate }: FormulaConfigProps) {
    const handleChange = (key: string, value: any) => {
        onUpdate({ ...config, [key]: value });
    };

    return (
        <div className="space-y-4 animate-in fade-in-50 duration-300">
             <p className="text-sm text-muted-foreground">
                Apply a mathematical formula to transform the incoming data. Use 'x' to represent the value.
            </p>
            <div>
                <Label htmlFor="formula">Formula Expression</Label>
                <Textarea
                    id="formula"
                    placeholder="e.g., (x * 9/5) + 32"
                    value={config.expression || ''}
                    onChange={(e) => handleChange('expression', e.target.value)}
                    className="font-mono"
                />
                 <p className="text-xs text-muted-foreground mt-1">Example: Convert Celsius to Fahrenheit.</p>
            </div>
        </div>
    );
} 