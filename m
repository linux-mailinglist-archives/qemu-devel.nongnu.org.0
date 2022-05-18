Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F189752B9E5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:31:21 +0200 (CEST)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrIpk-0004Pf-Iq
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrIm7-0002eH-DK
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:27:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrIm5-0006qA-QO
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:27:35 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrIl1-000AxY-VE; Wed, 18 May 2022 13:26:32 +0100
Message-ID: <db251587-d70e-76d7-e4e7-925075a2ed28@ilande.co.uk>
Date: Wed, 18 May 2022 13:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org,
 qemu-devel@nongnu.org
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-2-mark.cave-ayland@ilande.co.uk>
 <CAARzgwx4u0N1-XC2z18kKJZ3gkna22YMZ3nw+tikJt=sv-zc-w@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAARzgwx4u0N1-XC2z18kKJZ3gkna22YMZ3nw+tikJt=sv-zc-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/6] hw/acpi/viot: rename build_pci_range_node() to
 pci_host_bridges()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 18/05/2022 12:36, Ani Sinha wrote:

> On Wed, May 18, 2022 at 4:38 PM Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This is in preparation for separating out the VIOT ACPI table build from the
>> PCI host bridge numeration.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/acpi/viot.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
>> index c1af75206e..2897aa8c88 100644
>> --- a/hw/acpi/viot.c
>> +++ b/hw/acpi/viot.c
>> @@ -17,7 +17,7 @@ struct viot_pci_ranges {
>>   };
>>
>>   /* Build PCI range for a given PCI host bridge */
>> -static int build_pci_range_node(Object *obj, void *opaque)
>> +static int pci_host_bridges(Object *obj, void *opaque)
> 
> Please rename this as build_pci_host_bridges()

I'm not sure this makes sense? The naming here is deliberate since the whole aim of 
patches 1-3 is to remove the ACPI table build code out of this function so that its 
only purpose is to enumerate the PCI host bridges. This is similar to the approach 
already taken in hw/arm/virt-acpi-build.c in build_iort().

>>   {
>>       struct viot_pci_ranges *pci_ranges = opaque;
>>       GArray *blob = pci_ranges->blob;
>> @@ -78,7 +78,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>>       };
>>
>>       /* Build the list of PCI ranges that this viommu manages */
>> -    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
>> +    object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
>>                                      &pci_ranges);
>>
>>       /* ACPI table header */
>> --
>> 2.20.1


ATB,

Mark.

