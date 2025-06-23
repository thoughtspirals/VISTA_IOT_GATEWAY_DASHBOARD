import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import type { BridgeBlock } from "@/lib/stores/configuration-store";

interface DataConversionConfigProps {
    config: any;
    onUpdate: (config: any) => void;
}

export function DataConversionConfig({ config, onUpdate }: DataConversionConfigProps) {
    const handleDataTypeChange = (value: string) => {
        onUpdate({ ...config, toType: value });
    };

    return (
        <div className="space-y-4 animate-in fade-in-50 duration-300">
            <p className="text-sm text-muted-foreground">
                Convert the data type of the value passing through the bridge.
            </p>
            <div>
                <Label htmlFor="dataType">Convert To</Label>
                 <Select value={config.toType || ''} onValueChange={handleDataTypeChange}>
                    <SelectTrigger id="dataType">
                        <SelectValue placeholder="Select a target data type" />
                    </SelectTrigger>
                    <SelectContent>
                        <SelectItem value="string">String</SelectItem>
                        <SelectItem value="integer">Integer</SelectItem>
                        <SelectItem value="float">Float</SelectItem>
                        <SelectItem value="boolean">Boolean</SelectItem>
                    </SelectContent>
                </Select>
                 <p className="text-xs text-muted-foreground mt-1">Select the target data type for the conversion.</p>
            </div>
        </div>
    );
} 