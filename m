Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408D951F951
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:06:35 +0200 (CEST)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0Hi-0000tz-2G
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1no0Cv-0007JN-Ph; Mon, 09 May 2022 06:01:37 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1no0Ct-0006QU-My; Mon, 09 May 2022 06:01:37 -0400
Received: by mail-ed1-x535.google.com with SMTP id k27so15641102edk.4;
 Mon, 09 May 2022 03:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=ZqQErfe033WzHkqHcREjfuujLxdUhRLTfIeWA8F3QSc=;
 b=HPWXpRZ++l5RkZjWDXctKK5FylWMfIv3rm+URBWIAWThmqJjRr/u/Hhv70CT8b+Sws
 /sK31hBRwEhnjI/CJjCR0BynLWl+Phkvgo5QCEG0B1G7oy7o3rQUgqEM7Fkv1djhYKAP
 O+WQAgbLCjGIC4YbRmaIQQKqiULdR7B2LdMx17E1UeRMzf2Y7ois2kmFzbGQEmcywQa8
 FWeikIBym23eS1a+1B+vJcZedX1BklcdWA1maWduwYAnwVUuzHf7qJDPo0CQjS3GKvH2
 pJn635MYIWmIlpoA/oxJbf/U7FF+cniP4agUBc9YAelhZWp1G51htOODBSTWlaN7t7Li
 8Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=ZqQErfe033WzHkqHcREjfuujLxdUhRLTfIeWA8F3QSc=;
 b=QM4pL8ACwG7Q5KQiItqk8PvmgKvEgxoZgK4kq/qC/gI5jENb8MBQb50HMSM0uhpsVC
 EaUSKR+0+X4pG7Xgn5ak9VykKHkFDrOq5FnxSEBLOuf0h1g/PqqFD66Hl3MEGSOMgYlD
 d8p8RLUfQqs7/2CS+IG7gEZvIB30JgDJbsp4sxUevZAWn/+gceL0STFRL0uZ5j7DBMiu
 ALaUWI+QlE3lViMRKVApr+hVq1m2ZVRGNTVf2hEFVIgf2LzpKt/Ae4wHl/k8XdzLwI1P
 6vO2TFIBKkVnTCBLE6rJjlzSdePSf5FPOJred7WAq1KDJCidRx2NGHQpO8s0d/dSF469
 5K2Q==
X-Gm-Message-State: AOAM531MQOUJugbkIZKDdilxxRCI/o85yJd5XfYKBew+zJQPJzARLuoy
 ukK1ck27IJuaL4kFgvb63oI=
X-Google-Smtp-Source: ABdhPJz84zv7VmcS6ff/C+IzKqHG8uhClLj5BrvVbBtth3kgGsLcbb7tOqsakQ8+5hQ2I1SuYgDWFg==
X-Received: by 2002:a50:ed16:0:b0:425:f420:e51a with SMTP id
 j22-20020a50ed16000000b00425f420e51amr16590673eds.23.1652090493268; 
 Mon, 09 May 2022 03:01:33 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-108-001.77.13.pool.telefonica.de.
 [77.13.108.1]) by smtp.gmail.com with ESMTPSA id
 a7-20020a170906274700b006f8c8e43a45sm2190376ejd.103.2022.05.09.03.01.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 May 2022 03:01:33 -0700 (PDT)
Date: Mon, 09 May 2022 10:01:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: paul@xen.org, "Durrant, Paul" <xadimgnik@gmail.com>, qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:IDE" <qemu-block@nongnu.org>
Subject: Re: [PATCH 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
In-Reply-To: <724c6af0-277b-a6d1-b773-89e1b03e0c53@gmail.com>
References: <20220508103432.14874-1-shentey@gmail.com>
 <20220508103432.14874-4-shentey@gmail.com>
 <724c6af0-277b-a6d1-b773-89e1b03e0c53@gmail.com>
Message-ID: <51E7FF85-EF4C-408F-96A9-71DB622D11E7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 9=2E Mai 2022 08:02:13 UTC schrieb "Durrant, Paul" <xadimgnik@gmail=2Eco=
m>:
>On 08/05/2022 11:34, Bernhard Beschow wrote:
>> This function was declared in a generic and public header, implemented
>> in a device-specific source file but only used in xen_platform=2E Given=
 its
>> 'aux' parameter, this function is more xen-specific than piix-specific=
=2E
>> Also, the hardcoded magic constants seem to be generic and related to
>> PCIIDEState and IDEBus rather than piix=2E
>>=20
>> Therefore, move this function to xen_platform, unexport it, and drop th=
e
>> "piix3" in the function name as well=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>Reviewed-by: Paul Durrant <paul@xen=2Eorg>
>
>=2E=2E=2E with one suggestion=2E=2E=2E
>
>> ---
>>   hw/i386/xen/xen_platform=2Ec | 49 +++++++++++++++++++++++++++++++++++=
++-
>>   hw/ide/piix=2Ec              | 46 -----------------------------------
>>   include/hw/ide=2Eh           |  3 ---
>>   3 files changed, 48 insertions(+), 50 deletions(-)
>>=20
>> diff --git a/hw/i386/xen/xen_platform=2Ec b/hw/i386/xen/xen_platform=2E=
c
>> index 72028449ba=2E=2E124ffeae35 100644
>> --- a/hw/i386/xen/xen_platform=2Ec
>> +++ b/hw/i386/xen/xen_platform=2Ec
>> @@ -26,6 +26,7 @@
>>   #include "qemu/osdep=2Eh"
>>   #include "qapi/error=2Eh"
>>   #include "hw/ide=2Eh"
>> +#include "hw/ide/pci=2Eh"
>>   #include "hw/pci/pci=2Eh"
>>   #include "hw/xen/xen_common=2Eh"
>>   #include "migration/vmstate=2Eh"
>> @@ -134,6 +135,52 @@ static void pci_unplug_nics(PCIBus *bus)
>>       pci_for_each_device(bus, 0, unplug_nic, NULL);
>>   }
>>   +/*
>> + * The Xen HVM unplug protocol [1] specifies a mechanism to allow gues=
ts to
>> + * request unplug of 'aux' disks (which is stated to mean all IDE disk=
s,
>> + * except the primary master)=2E
>> + *
>> + * NOTE: The semantics of what happens if unplug of all disks and 'aux=
' disks
>> + *       is simultaneously requested is not clear=2E The implementatio=
n assumes
>> + *       that an 'all' request overrides an 'aux' request=2E
>> + *
>> + * [1] https://xenbits=2Exen=2Eorg/gitweb/?p=3Dxen=2Egit;a=3Dblob;f=3D=
docs/misc/hvm-emulated-unplug=2Epandoc
>> + */
>> +static int pci_xen_ide_unplug(DeviceState *dev, bool aux)
>> +{
>> +    PCIIDEState *pci_ide;
>> +    int i;
>> +    IDEDevice *idedev;
>> +    IDEBus *idebus;
>> +    BlockBackend *blk;
>> +
>> +    pci_ide =3D PCI_IDE(dev);
>> +
>> +    for (i =3D aux ? 1 : 0; i < 4; i++) {
>> +        idebus =3D &pci_ide->bus[i / 2];
>> +        blk =3D idebus->ifs[i % 2]=2Eblk;
>> +
>> +        if (blk && idebus->ifs[i % 2]=2Edrive_kind !=3D IDE_CD) {
>> +            if (!(i % 2)) {
>> +                idedev =3D idebus->master;
>> +            } else {
>> +                idedev =3D idebus->slave;
>> +            }
>> +
>> +            blk_drain(blk);
>> +            blk_flush(blk);
>> +
>> +            blk_detach_dev(blk, DEVICE(idedev));
>> +            idebus->ifs[i % 2]=2Eblk =3D NULL;
>> +            idedev->conf=2Eblk =3D NULL;
>> +            monitor_remove_blk(blk);
>> +            blk_unref(blk);
>> +        }
>> +    }
>> +    qdev_reset_all(dev);
>> +    return 0;
>
>The return value is ignored so you may as well make this a static void fu=
nction=2E

Good catch! I'll prepare a v2=2E Meanwhile, I'm looking forward to comment=
s on the other patches as well=2E

Thanks,
Bernhard

>  Paul
>
>> +}
>> +
>>   static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
>>   {
>>       uint32_t flags =3D *(uint32_t *)opaque;
>> @@ -147,7 +194,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, v=
oid *opaque)
>>         switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
>>       case PCI_CLASS_STORAGE_IDE:
>> -        pci_piix3_xen_ide_unplug(DEVICE(d), aux);
>> +        pci_xen_ide_unplug(DEVICE(d), aux);
>>           break;
>>         case PCI_CLASS_STORAGE_SCSI:
>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>> index bc1b37512a=2E=2E9a9b28078e 100644
>> --- a/hw/ide/piix=2Ec
>> +++ b/hw/ide/piix=2Ec
>> @@ -173,52 +173,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, E=
rror **errp)
>>       }
>>   }
>>   -/*
>> - * The Xen HVM unplug protocol [1] specifies a mechanism to allow gues=
ts to
>> - * request unplug of 'aux' disks (which is stated to mean all IDE disk=
s,
>> - * except the primary master)=2E
>> - *
>> - * NOTE: The semantics of what happens if unplug of all disks and 'aux=
' disks
>> - *       is simultaneously requested is not clear=2E The implementatio=
n assumes
>> - *       that an 'all' request overrides an 'aux' request=2E
>> - *
>> - * [1] https://xenbits=2Exen=2Eorg/gitweb/?p=3Dxen=2Egit;a=3Dblob;f=3D=
docs/misc/hvm-emulated-unplug=2Epandoc
>> - */
>> -int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
>> -{
>> -    PCIIDEState *pci_ide;
>> -    int i;
>> -    IDEDevice *idedev;
>> -    IDEBus *idebus;
>> -    BlockBackend *blk;
>> -
>> -    pci_ide =3D PCI_IDE(dev);
>> -
>> -    for (i =3D aux ? 1 : 0; i < 4; i++) {
>> -        idebus =3D &pci_ide->bus[i / 2];
>> -        blk =3D idebus->ifs[i % 2]=2Eblk;
>> -
>> -        if (blk && idebus->ifs[i % 2]=2Edrive_kind !=3D IDE_CD) {
>> -            if (!(i % 2)) {
>> -                idedev =3D idebus->master;
>> -            } else {
>> -                idedev =3D idebus->slave;
>> -            }
>> -
>> -            blk_drain(blk);
>> -            blk_flush(blk);
>> -
>> -            blk_detach_dev(blk, DEVICE(idedev));
>> -            idebus->ifs[i % 2]=2Eblk =3D NULL;
>> -            idedev->conf=2Eblk =3D NULL;
>> -            monitor_remove_blk(blk);
>> -            blk_unref(blk);
>> -        }
>> -    }
>> -    qdev_reset_all(dev);
>> -    return 0;
>> -}
>> -
>>   static void pci_piix_ide_exitfn(PCIDevice *dev)
>>   {
>>       PCIIDEState *d =3D PCI_IDE(dev);
>> diff --git a/include/hw/ide=2Eh b/include/hw/ide=2Eh
>> index c5ce5da4f4=2E=2E60f1f4f714 100644
>> --- a/include/hw/ide=2Eh
>> +++ b/include/hw/ide=2Eh
>> @@ -8,9 +8,6 @@
>>   ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isa=
irq,
>>                           DriveInfo *hd0, DriveInfo *hd1);
>>   -/* ide-pci=2Ec */
>> -int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux);
>> -
>>   /* ide-mmio=2Ec */
>>   void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo=
 *hd1);
> =20


