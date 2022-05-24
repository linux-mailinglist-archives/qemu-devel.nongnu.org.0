Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD734532F82
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:17:54 +0200 (CEST)
Received: from localhost ([::1]:57136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYAL-0006nc-Bo
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntY8d-00062z-6f
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:16:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntY8Z-00056G-2M
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Li3bMyvpk2aNNgWPFz2xjq6Z3SO6OexqRR2M5F2KK3Q=; b=QrzeaudUQs1iEZKHGe79Oioupl
 DVH6gVlxsYWr8NY+q6mWUD4I97bok44D6g1tnPNKSNwt1gfVzZ+me1wIKlAbWdRhMTa2YoRSfpaqp
 NdhYPQO8xv1qAFfsQG4zxyuKRkeEY1IECX306nct4VntTcw7aEcYXWn8Y4PEzBKsj7yLjMPpuaxJa
 lTIICxePqEHmht1lMur50HWtNf1VHkQrTSsm2vd8cFdSFaJ7HkdQzGGRdO9kPSYZ8TX6re3kGmFnm
 naBlOSe+/TS9JyX1etAzovmLtbXHxnmK99Q4bBmHRuonrfB+fx1FITz3GSKw/hWVzuI5YL0xLBsSB
 CHG/Sh0po5xuUCwXVmEY1CSBoKZGbEh3RCbaYFP4AAPQjaZmgkNNZht2yYm+CX3zPuYsnKdi4G4hQ
 NKMoZdbw/lkrk4QYkPSteoGHLjQwyp0dzH7ol1KeK4uCXrttdXpTfXRAuYs0ss6OtquOrzB24kOmM
 WwkDFRPHqw9Qt7AR1cdttHRMdbM0snJnhTXNqty4ofXcnapBag9OYQ61QIql7LqexKQa2UzfBktJ7
 2oZ6KI3A4a3FPNzt7V9muPV/lHEuXzh3PVkOsjMzmKdOP6oTjuN6eEfGSM1HL/42+dzGCMDDS7gW+
 h+hdVw0dLmjm664lwcxugFfZ3vRXIK3k/m9BQGe4w=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntY7O-000AVE-BP; Tue, 24 May 2022 18:14:54 +0100
Message-ID: <aaff4a20-a979-1709-75b0-7c3697221b93@ilande.co.uk>
Date: Tue, 24 May 2022 18:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-4-mark.cave-ayland@ilande.co.uk>
 <63dfb837-99e6-922f-f172-9b4796cad16a@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <63dfb837-99e6-922f-f172-9b4796cad16a@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/6] hw/acpi/viot: build array of PCI host bridges before
 generating VIOT ACPI table
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/05/2022 23:11, Philippe Mathieu-Daudé via wrote:

> On 18/5/22 13:08, Mark Cave-Ayland wrote:
>> Perform the generation of the VIOT ACPI table in 2 separate passes: the first pass
>> enumerates all of the PCI host bridges and adds the min_bus and max_bus information
>> to an array.
>>
>> Once this is done the VIOT table header is generated using the size of the array
>> to calculate the node count, which means it is no longer necessary to use a
>> sub-array to hold the PCI host bridge range information along with viommu_off.
>>
>> Finally the PCI host bridge array is iterated again to add the required entries
>> to the final VIOT ACPI table.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/acpi/viot.c | 42 ++++++++++++++++++++++++------------------
>>   1 file changed, 24 insertions(+), 18 deletions(-)
> 
>> @@ -44,8 +43,7 @@ static void build_pci_host_range(GArray *table_data, int min_bus, 
>> int max_bus,
>>   /* Build PCI range for a given PCI host bridge */
>>   static int pci_host_bridges(Object *obj, void *opaque)
>>   {
>> -    struct viot_pci_ranges *pci_ranges = opaque;
>> -    GArray *blob = pci_ranges->blob;
>> +    GArray *pci_host_ranges = opaque;
>>       if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
>>           PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
>> @@ -55,9 +53,11 @@ static int pci_host_bridges(Object *obj, void *opaque)
>>               pci_bus_range(bus, &min_bus, &max_bus);
>> -            build_pci_host_range(blob, min_bus, max_bus,
>> -                                 pci_ranges->output_node);
>> -            pci_ranges->count++;
>> +            struct viot_pci_host_range pci_host_range = {
> 
> Nitpicking, const?
> 
>> +                .min_bus = min_bus,
>> +                .max_bus = max_bus,
>> +            };
>> +            g_array_append_val(pci_host_ranges, pci_host_range);
>>           }
>>       }

Yes, that works here. I'll wait a day or so and see if anyone else has any further 
comments before posting a v3.


ATB,

Mark.

