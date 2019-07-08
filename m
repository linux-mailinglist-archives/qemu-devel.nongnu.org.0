Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D905F628BC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:32 +0200 (CEST)
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkYie-00081F-3E
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 14:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54481)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1hkYg5-00079G-6i
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 14:47:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1hkYg0-00005q-QP
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 14:47:51 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34788)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1hkYfx-0008Fn-5N
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 14:47:46 -0400
Received: by mail-wm1-x342.google.com with SMTP id w9so646043wmd.1
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YCIv1whswcl9y1jZV8PWG62hVjY7KfMM30SH+nNvvso=;
 b=XqRcxjlO9jV/jo1mwCx6dls5f1fMp4xGRreYpzzfjLtqlvhVl0DM+PAo2ZBVWZ1ASF
 mxylhjbtNdU9er9IWtGdHwFD1e6GSDy7SJ61aK+NjOxrv3RLRDKFhwd+NWrrIFFDsFSs
 RuP2vOSE3BWEf2en1P4EoeAUHsYcKYmDeSyDAQxX+d79NG3pCQFng/3IM8ashchoqL08
 biuIoNtZ9A6jzIpMwb+83W269lik5e/X1uaOUpz6+bqsmZMDTBVcmHkMbtTwdbjkFAZx
 8EIQyZrdHZWQqr56MYNZhi7vLNbDMAQ6MOwd5444eHXKxMRohi3KyMkLO5qvY01D4x3z
 tbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YCIv1whswcl9y1jZV8PWG62hVjY7KfMM30SH+nNvvso=;
 b=Pc2IEy/fhHjjyaXZ2/KYChK8w//xi3x/j3UiSVy9NgM5/pUarjuD6FpQMzu8XEI4an
 HEtxW07MyU4I0avtTNnyrsion8FJYtF3BDngpbPIoqcD12IWR5L9WnQRKCqkP4mxYULR
 KgD12cu78X7wz5LMs1ELq61DLZDmXPZ5m4ipd8jGeOuPMCsdArN3kaBr4zDYg/wdKZ7H
 un3vrTir2AmDPJCzCTa0GPd+8qQoaZqMPixRvdkiIFk2Xga03Cf55gq7Xx+B3nYQqsGO
 apqK84ETuxNC6R+fwyKOC9eYfQQDf+BIdobzRMBzACESperBRUR0rK+YMuYfgnX18yL8
 QiRQ==
X-Gm-Message-State: APjAAAXh3305NRkQhqtS5lzuq4jD1ud8JH1RUlj6ez6Cq2jAV7+v8eri
 cnxzd0DlnUzta6NCzO3ttqQ=
X-Google-Smtp-Source: APXvYqwMifVeY6PCcNCLUrnVKs0vdfonLFxVpaHoleQRm9yMz6snaV2YKm7sFgujyNWgsL1cSEvWYA==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr18516539wmf.60.1562611631026; 
 Mon, 08 Jul 2019 11:47:11 -0700 (PDT)
Received: from localhost.localdomain ([37.142.144.12])
 by smtp.gmail.com with ESMTPSA id o6sm33474533wra.27.2019.07.08.11.47.09
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 11:47:10 -0700 (PDT)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20190705010711.23277-1-marcel.apfelbaum@gmail.com>
 <03CB6DEC-3D25-4C09-9C9C-3A5206D1D1F7@gmail.com>
 <CAMzgYoMzLHEpSwLOu4nZAEK_E50xBsaYUfdXeCeHrq+-kaL=4w@mail.gmail.com>
 <49bb8456-a4b1-5a0e-e34d-cf5977e821ae@gmail.com>
 <20190708160320.GM2746@work-vm>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <f0110394-1dbe-5f7a-0022-d17ad1c9ee76@gmail.com>
Date: Mon, 8 Jul 2019 21:47:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190708160320.GM2746@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [PATCH] hw/net: fix vmxnet3 live migration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sukrit Bhatnagar <skrtbhtngr@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org,
 Yuval Shaia <yuval.shaia@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/8/19 7:03 PM, Dr. David Alan Gilbert wrote:
> * Marcel Apfelbaum (marcel.apfelbaum@gmail.com) wrote:
>>
>> On 7/5/19 2:14 PM, Sukrit Bhatnagar wrote:
>>> On Fri, 5 Jul 2019 at 16:29, Dmitry Fleytman <dmitry.fleytman@gmail.com> wrote:
>>>>> On 5 Jul 2019, at 4:07, Marcel Apfelbaum <marcel.apfelbaum@gmail.com> wrote:
>>>>>
>>>>> At some point vmxnet3 live migration stopped working and git-bisect
>>>>> didn't help finding a working version.
>>>>> The issue is the PCI configuration space is not being migrated
>>>>> successfully and MSIX remains masked at destination.
>>>>>
>>>>> Remove the migration differentiation between PCI and PCIe since
>>>>> the logic resides now inside VMSTATE_PCI_DEVICE.
>>>>> Remove also the VMXNET3_COMPAT_FLAG_DISABLE_PCIE based differentiation
>>>>> since at 'realize' time is decided if the device is PCI or PCIe,
>>>>> then the above macro is enough.
>>>>>
>>>>> Use the opportunity to move to the standard VMSTATE_MSIX
>>>>> instead of the deprecated SaveVMHandlers.
>>>>>
>>>>> Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>>> Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>>>>
>>> Tested-by: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
>> Thanks for the fast testing and review!
>>
>> David, since the live migration was broken long before this patch,
>> I don't need  to add any compatibility code, right?
> Right, although we should probably bump the version_id field, that way
> you'll get a nice clean error if you try and migrate from the old<->new.

Will do, thanks.

> (It's nice to get rid of the old msix oddity).
>
>> If so, can you merge it using your migration tree?
> I could do; or since it's entirely in vmxnet3 Dmitry can take it.

I'll ask him, thanks!
Marcel

>
> Dave
>
>> Thanks,
>> Marcel
>>
>>
>>>>> ---
>>>>> hw/net/vmxnet3.c | 52 ++----------------------------------------------
>>>>> 1 file changed, 2 insertions(+), 50 deletions(-)
>>>>>
>>>>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>>>>> index 10d01d0058..8b17548b02 100644
>>>>> --- a/hw/net/vmxnet3.c
>>>>> +++ b/hw/net/vmxnet3.c
>>>>> @@ -2141,21 +2141,6 @@ vmxnet3_cleanup_msi(VMXNET3State *s)
>>>>>       msi_uninit(d);
>>>>> }
>>>>>
>>>>> -static void
>>>>> -vmxnet3_msix_save(QEMUFile *f, void *opaque)
>>>>> -{
>>>>> -    PCIDevice *d = PCI_DEVICE(opaque);
>>>>> -    msix_save(d, f);
>>>>> -}
>>>>> -
>>>>> -static int
>>>>> -vmxnet3_msix_load(QEMUFile *f, void *opaque, int version_id)
>>>>> -{
>>>>> -    PCIDevice *d = PCI_DEVICE(opaque);
>>>>> -    msix_load(d, f);
>>>>> -    return 0;
>>>>> -}
>>>>> -
>>>>> static const MemoryRegionOps b0_ops = {
>>>>>       .read = vmxnet3_io_bar0_read,
>>>>>       .write = vmxnet3_io_bar0_write,
>>>>> @@ -2176,11 +2161,6 @@ static const MemoryRegionOps b1_ops = {
>>>>>       },
>>>>> };
>>>>>
>>>>> -static SaveVMHandlers savevm_vmxnet3_msix = {
>>>>> -    .save_state = vmxnet3_msix_save,
>>>>> -    .load_state = vmxnet3_msix_load,
>>>>> -};
>>>>> -
>>>>> static uint64_t vmxnet3_device_serial_num(VMXNET3State *s)
>>>>> {
>>>>>       uint64_t dsn_payload;
>>>>> @@ -2203,7 +2183,6 @@ static uint64_t vmxnet3_device_serial_num(VMXNET3State *s)
>>>>>
>>>>> static void vmxnet3_pci_realize(PCIDevice *pci_dev, Error **errp)
>>>>> {
>>>>> -    DeviceState *dev = DEVICE(pci_dev);
>>>>>       VMXNET3State *s = VMXNET3(pci_dev);
>>>>>       int ret;
>>>>>
>>>>> @@ -2249,8 +2228,6 @@ static void vmxnet3_pci_realize(PCIDevice *pci_dev, Error **errp)
>>>>>           pcie_dev_ser_num_init(pci_dev, VMXNET3_DSN_OFFSET,
>>>>>                                 vmxnet3_device_serial_num(s));
>>>>>       }
>>>>> -
>>>>> -    register_savevm_live(dev, "vmxnet3-msix", -1, 1, &savevm_vmxnet3_msix, s);
>>>>> }
>>>>>
>>>>> static void vmxnet3_instance_init(Object *obj)
>>>>> @@ -2440,29 +2417,6 @@ static const VMStateDescription vmstate_vmxnet3_int_state = {
>>>>>       }
>>>>> };
>>>>>
>>>>> -static bool vmxnet3_vmstate_need_pcie_device(void *opaque)
>>>>> -{
>>>>> -    VMXNET3State *s = VMXNET3(opaque);
>>>>> -
>>>>> -    return !(s->compat_flags & VMXNET3_COMPAT_FLAG_DISABLE_PCIE);
>>>>> -}
>>>>> -
>>>>> -static bool vmxnet3_vmstate_test_pci_device(void *opaque, int version_id)
>>>>> -{
>>>>> -    return !vmxnet3_vmstate_need_pcie_device(opaque);
>>>>> -}
>>>>> -
>>>>> -static const VMStateDescription vmstate_vmxnet3_pcie_device = {
>>>>> -    .name = "vmxnet3/pcie",
>>>>> -    .version_id = 1,
>>>>> -    .minimum_version_id = 1,
>>>>> -    .needed = vmxnet3_vmstate_need_pcie_device,
>>>>> -    .fields = (VMStateField[]) {
>>>>> -        VMSTATE_PCI_DEVICE(parent_obj, VMXNET3State),
>>>>> -        VMSTATE_END_OF_LIST()
>>>>> -    }
>>>>> -};
>>>>> -
>>>>> static const VMStateDescription vmstate_vmxnet3 = {
>>>>>       .name = "vmxnet3",
>>>>>       .version_id = 1,
>>>>> @@ -2470,9 +2424,8 @@ static const VMStateDescription vmstate_vmxnet3 = {
>>>>>       .pre_save = vmxnet3_pre_save,
>>>>>       .post_load = vmxnet3_post_load,
>>>>>       .fields = (VMStateField[]) {
>>>>> -            VMSTATE_STRUCT_TEST(parent_obj, VMXNET3State,
>>>>> -                                vmxnet3_vmstate_test_pci_device, 0,
>>>>> -                                vmstate_pci_device, PCIDevice),
>>>>> +            VMSTATE_PCI_DEVICE(parent_obj, VMXNET3State),
>>>>> +            VMSTATE_MSIX(parent_obj, VMXNET3State),
>>>>>               VMSTATE_BOOL(rx_packets_compound, VMXNET3State),
>>>>>               VMSTATE_BOOL(rx_vlan_stripping, VMXNET3State),
>>>>>               VMSTATE_BOOL(lro_supported, VMXNET3State),
>>>>> @@ -2508,7 +2461,6 @@ static const VMStateDescription vmstate_vmxnet3 = {
>>>>>       },
>>>>>       .subsections = (const VMStateDescription*[]) {
>>>>>           &vmxstate_vmxnet3_mcast_list,
>>>>> -        &vmstate_vmxnet3_pcie_device,
>>>>>           NULL
>>>>>       }
>>>>> };
>>>>> --
>>>>> 2.17.1
>>>>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


