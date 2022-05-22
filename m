Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C0530369
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 15:51:04 +0200 (CEST)
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nslz5-00026x-A8
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 09:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nslxw-0001PI-KW
 for qemu-devel@nongnu.org; Sun, 22 May 2022 09:49:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nslxv-0008Gd-1q
 for qemu-devel@nongnu.org; Sun, 22 May 2022 09:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1H3njCpZiEFlngLdkj9/VxvHOr8CYwvmAEPhqN2gers=; b=evg1DbkA182LfCPcaz7Ml9svSt
 b0HpsJioSwk7T1rQIAoKc0PB+zJoFyfP1+IndKjHzEWCP3UtyyjHB3TxIJJQvMQ0U3vRBIJRbIU1I
 /MZJl04Dy98wHtK54wFVAUd9p0sK2wJWDgVLidIVoHDTcPFtVbejryhdjbmCBdUirKtOMFjYrBIGo
 DaGmxABxOIDpwuh7f4krTnDfrPKlZ7wveRAD+dj5WHHHA6ZpKdvmrwRfjqe16RQLCqKe3z/SvG8kx
 PnHz3Cp0eak4/4rTDP7bGYglmxGqQNzlrf1sUwb6uBFoZcOt5ag/H7ii90VKWXU5rwi/sboHAa3GV
 Is5x8u/XqVhDl4B6EKVSNn3ejGPWwUHjySTkzXczvT2iMqQYfqyBXeQkFuHXSLjqseoyjdoRdMIX1
 rUxULfNXbOwpyvi3wjcbHfrTsnNjqo9L3H/hfvjUOC6VjE0TBDtQ0H7ZXrvSrjyM8D/oHHAWmNAli
 FsOh4VSQADgWy7Lb3UhFiYyEtXRVtkXSad80BQNz0XMRCs194uC/KVXoFhicx0qHK8Cwmclp5k/Gz
 aiYEheg40+0qCaJ0dJwfSPaUm2yHZfaz/swXjBQduwjd4gfyBbxjXZaDVVwtjo/57eWcApoSSw6JL
 6GklwuSmI2xgtQvYYFtwxaQTS4mlzQuxe5jh9cNi4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nslwp-0006Tl-MW; Sun, 22 May 2022 14:48:47 +0100
Message-ID: <bc0d4b6c-1cb7-7bb7-2032-7cf09fcb3b38@ilande.co.uk>
Date: Sun, 22 May 2022 14:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org,
 qemu-devel@nongnu.org
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-2-mark.cave-ayland@ilande.co.uk>
 <CAARzgwx4u0N1-XC2z18kKJZ3gkna22YMZ3nw+tikJt=sv-zc-w@mail.gmail.com>
 <db251587-d70e-76d7-e4e7-925075a2ed28@ilande.co.uk>
 <CAARzgwxEU4hnSW4=1uYj_Pp6YZxm-FWahLoHwS_yArMvi7zbig@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAARzgwxEU4hnSW4=1uYj_Pp6YZxm-FWahLoHwS_yArMvi7zbig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/6] hw/acpi/viot: rename build_pci_range_node() to
 pci_host_bridges()
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

On 19/05/2022 08:45, Ani Sinha wrote:

> On Wed, May 18, 2022 at 5:57 PM Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 18/05/2022 12:36, Ani Sinha wrote:
>>
>>> On Wed, May 18, 2022 at 4:38 PM Mark Cave-Ayland
>>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>>
>>>> This is in preparation for separating out the VIOT ACPI table build from the
>>>> PCI host bridge numeration.
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> ---
>>>>    hw/acpi/viot.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
>>>> index c1af75206e..2897aa8c88 100644
>>>> --- a/hw/acpi/viot.c
>>>> +++ b/hw/acpi/viot.c
>>>> @@ -17,7 +17,7 @@ struct viot_pci_ranges {
>>>>    };
>>>>
>>>>    /* Build PCI range for a given PCI host bridge */
>>>> -static int build_pci_range_node(Object *obj, void *opaque)
>>>> +static int pci_host_bridges(Object *obj, void *opaque)
>>>
>>> Please rename this as build_pci_host_bridges()
>>
>> I'm not sure this makes sense?
> 
> How about enumerate_pci_host_bridges() then?

Sure, that works for me. I'll update this for v2.

>   The naming here is deliberate since the whole aim of
>> patches 1-3 is to remove the ACPI table build code out of this function so that its
>> only purpose is to enumerate the PCI host bridges. This is similar to the approach
>> already taken in hw/arm/virt-acpi-build.c in build_iort().
>>
>>>>    {
>>>>        struct viot_pci_ranges *pci_ranges = opaque;
>>>>        GArray *blob = pci_ranges->blob;
>>>> @@ -78,7 +78,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>>>>        };
>>>>
>>>>        /* Build the list of PCI ranges that this viommu manages */
>>>> -    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
>>>> +    object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
>>>>                                       &pci_ranges);
>>>>
>>>>        /* ACPI table header */
>>>> --
>>>> 2.20.1


ATB,

Mark.

