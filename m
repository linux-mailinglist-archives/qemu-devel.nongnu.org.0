Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5B53036F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 16:01:46 +0200 (CEST)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsm9R-0007JI-7D
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 10:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsm71-0006S3-Co
 for qemu-devel@nongnu.org; Sun, 22 May 2022 09:59:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsm6z-0001FP-Nn
 for qemu-devel@nongnu.org; Sun, 22 May 2022 09:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6wnJP+5B3PvaFvqOlcTFbztRfpxPOJe1xlm6TivZLmo=; b=twjzex5edKHCl9kP9VN3DI/IwY
 Ma/MX1coMvYNHscUYB8/7OvtcmiaV0mQRo3N1I/OY89HN4BL77lxzkKHjw1NbzKk4MaJndcRWubTE
 jNkblHgjpCsz0gIWn+fQoxDPOEtCppqxsaz5D6SjO3sB1kPTuFMEetAtGHDIbUGG/92kbQM1sVec4
 mp/SEPAF+0E3TsqLdQzYFocXzZbt5pMjWvwLzRWP59u9lnYTTlQgpnVQh8UapqRT8RHPjMLT/2+mR
 D+dUwh5gBuKyF3JO6SzExwrYbYSSe4arqEyL8WG24abYFKXe3YgEOKVZaufqI15dqdAhHmu2eJyXT
 h0cZc7jMZ+9+bx5Elclk7xCoSsymGxv9KzQUntiXxP2HlNlJg70F8FEgw8uaoAdXTKxwroz8gOwQj
 2ud8MuVj/m47hj9WrQsOqqQOB5Xd1L6eeiRopSAhmFIMHWGYmEGQvKYq30uv0bJs3WWxaMixeN6pG
 4egU2lqjel2s6QDKREzyLfDFyT56gO7VNk7GyX8bnEWGQi/9xzcwf7QGAWUpmtkO02D1Q/MHF+/9y
 LG2DLBUYnUzncPIEo0u7q+vKtaX7VXEwYs44ovXFkOV/H7xdHC1EMgr9TnoOKyqaAa9J1EjyRooy1
 eZJzw9J7fXi0rJgEiMj0HFliIAqvlagh2TwxJr1IM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsm5u-0006VD-9x; Sun, 22 May 2022 14:58:10 +0100
Message-ID: <557a30e1-5233-fe9d-3704-0acc44c50f06@ilande.co.uk>
Date: Sun, 22 May 2022 14:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org,
 qemu-devel@nongnu.org
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-6-mark.cave-ayland@ilande.co.uk>
 <CAARzgwwepTkx0-ss8Ayitg=-kbFajkSW-V6e_cUxLBBTnXY4qQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAARzgwwepTkx0-ss8Ayitg=-kbFajkSW-V6e_cUxLBBTnXY4qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 5/6] hw/acpi/viot: sort VIOT ACPI table entries by PCI
 host bus min_bus
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

On 19/05/2022 08:50, Ani Sinha wrote:

> On Wed, May 18, 2022 at 4:39 PM Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This ensures that the VIOT ACPI table output is always stable for a given PCI
>> topology by ensuring that entries are ordered according to min_bus.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> other than the nit below,
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> 
>> ---
>>   hw/acpi/viot.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
>> index ce3b7b8c75..f5714b95bd 100644
>> --- a/hw/acpi/viot.c
>> +++ b/hw/acpi/viot.c
>> @@ -64,6 +64,20 @@ static int pci_host_bridges(Object *obj, void *opaque)
>>       return 0;
>>   }
>>
>> +static int pci_host_range_compare(gconstpointer a, gconstpointer b)
> 
> nit: shouldn't this have a gint return type since we use gconstpointer
> as arguments anyway?
> https://docs.gtk.org/glib/callback.CompareFunc.html

I guess so - int/gint seem to be fairly interchangeable, and there are examples of 
both in the QEMU codebase. The only reason it appears in the patch as int is because 
that was how it was in the reference code I used from iort_idmap_compare().

I'll change this to gint for v2.

>> +{
>> +    struct viot_pci_host_range *range_a = (struct viot_pci_host_range *)a;
>> +    struct viot_pci_host_range *range_b = (struct viot_pci_host_range *)b;
>> +
>> +    if (range_a->min_bus < range_b->min_bus) {
>> +        return -1;
>> +    } else if (range_a->min_bus > range_b->min_bus) {
>> +        return 1;
>> +    } else {
>> +        return 0;
>> +    }
>> +}
>> +
>>   /*
>>    * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
>>    * endpoints.
>> @@ -87,6 +101,9 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>>       object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
>>                                      pci_host_ranges);
>>
>> +    /* Sort the pci host ranges by min_bus */
>> +    g_array_sort(pci_host_ranges, pci_host_range_compare);
>> +
>>       /* ACPI table header */
>>       acpi_table_begin(&table, table_data);
>>       /* Node count */
>> --
>> 2.20.1


ATB,

Mark.

