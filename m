Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D2570D41
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 00:19:15 +0200 (CEST)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB1kI-000157-OX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 18:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oB1is-00070J-8Z
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 18:17:46 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oB1iq-000569-NL
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 18:17:46 -0400
Received: by mail-ej1-x62e.google.com with SMTP id bp15so902569ejb.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 15:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=qDW6Zju6Vbx+u9eAuAX3AvR7N7OIW99lWjajL/LS30s=;
 b=nVIsR9YLiu5mk0QPq5esLo2Al6Kud6JxN2jN6Y8HPkwkvt4sBn8rBICFb0d6IZGYBm
 tFF964rtenDLWv97UsUIRjNNGXxfmdu5QCr0s5B6xvJBQP0Y8cJvIPFJoAwpEH35ay5r
 ncO/k6+knrl51IvD2EEg2fh/Ax6S10ginmmk3dSD0IL8dr3O+2pBdBU3ZVhhCsB2cxEf
 6Me8lVfn8y8jhszTi9PTAYEa8VnyNt5xpOxgGjgdRk2lhAPHwxPQztUY8Blo0NvgHrD6
 A5fACyze9Jl532lXs5Z41ixFkI7gw7KgwjH2sB9JttXDJOE/sYzeWWY4/7MwUCF/N9wG
 +c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=qDW6Zju6Vbx+u9eAuAX3AvR7N7OIW99lWjajL/LS30s=;
 b=N0iWBpV0B1bqgz9frbqSy3f62A3H1DylbUfirmA+GEJXCPuFX2Nzt3WirBsfDU1Rs3
 RAqH3NWoFkiY9bdJQ0jw5gAtmRKNtkN1/cXxk0ea/K2/nOpcc5eboMV5Zsg2IEbeW5Cx
 uM5N4TDhJHEgc5FVqtpwX4ezsExr2FJNbB7noPslaRDVzO0OCE4+rTnuu5lzJHgzrI1Q
 sGqrVN0BuY802csBviov6DF6dklgzlYmoerb5wnANAj1qbNK6L4kmSQldrj9YQitQxZS
 1CEEDTEuuXeiGd5ChJ+i21i+7K08FXQhm+6JsN7NSbagevQ1KwfNBODv8X3bpFyBw/Sv
 sJww==
X-Gm-Message-State: AJIora95E/NTXggd6LlU4WDlOG/L8rS82o7KBKLv6XE1L6OOay0/A9nY
 bKmNDy8o0YEyIZFBiC+Nq7U=
X-Google-Smtp-Source: AGRyM1vpdTnmKoUR8GRbslJr3m4oANYggJ/eJMx2S44o1sOeYf0aOpU+ySyNbbVEzKZNSJWyf/SwsQ==
X-Received: by 2002:a17:907:75f9:b0:72b:1438:474d with SMTP id
 jz25-20020a17090775f900b0072b1438474dmr20769533ejc.738.1657577862024; 
 Mon, 11 Jul 2022 15:17:42 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-011-030.89.14.pool.telefonica.de.
 [89.14.11.30]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170906199800b00724261b592esm3048868ejd.186.2022.07.11.15.17.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jul 2022 15:17:41 -0700 (PDT)
Date: Mon, 11 Jul 2022 22:17:39 +0000
From: B <shentey@gmail.com>
To: Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>
CC: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_03/10=5D_i386/pc=3A_pass_?=
 =?US-ASCII?Q?pci=5Fhole64=5Fsize_to_pc=5Fmemory=5Finit=28=29?=
In-Reply-To: <0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-4-joao.m.martins@oracle.com>
 <FA725D44-6D1C-4A6A-9D83-FF9482DB4593@gmail.com>
 <0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com>
Message-ID: <2A6CE4BD-F846-4802-BADA-4983F5462343@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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



Am 11=2E Juli 2022 10:01:49 UTC schrieb Joao Martins <joao=2Em=2Emartins@o=
racle=2Ecom>:
>On 7/9/22 21:51, B wrote:
>> Am 1=2E Juli 2022 16:10:07 UTC schrieb Joao Martins <joao=2Em=2Emartins=
@oracle=2Ecom>:
>>> Use the pre-initialized pci-host qdev and fetch the
>>> pci-hole64-size into pc_memory_init() newly added argument=2E
>>> piix needs a bit of care given all the !pci_enabled()
>>> and that the pci_hole64_size is private to i440fx=2E
>>=20
>> It exposes this value as the property PCI_HOST_PROP_PCI_HOLE64_SIZE=2E=
=20
>
>Indeed=2E
>
>> Reusing it allows for not touching i440fx in this patch at all=2E
>>=20
>> For code symmetry reasons the analogue property could be used for Q35 a=
s well=2E
>>=20
>Presumably you want me to change into below while deleting i440fx_pci_hol=
e64_size()
>from this patch (see snip below)=2E

Yes, exactly=2E

>IMHO, gotta say that in q35 the code symmetry
>doesn't buy much readability here,

That's true=2E It communicates, though, that a value is used which was del=
iberately made public, IOW that the code isn't sneaky=2E (That's just my in=
terpretation, not sure what the common understanding is) Feel free to do ho=
wever you prefer=2E

Best regards,
Bernhard

>albeit it does remove any need for that other
>helper in i440fx=2E
>
>@Igor let me know if you agree with the change and whether I can keep the=
 Reviewed-by=2E
>
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index 504ddd0deece=2E=2Ecc0855066d06 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -167,7 +167,9 @@ static void pc_init1(MachineState *machine,
>         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>         rom_memory =3D pci_memory;
>         i440fx_host =3D qdev_new(host_type);
>-        hole64_size =3D i440fx_pci_hole64_size(i440fx_host);
>+        hole64_size =3D object_property_get_uint(OBJECT(i440fx_host),
>+                                               PCI_HOST_PROP_PCI_HOLE64_=
SIZE,
>+                                               &error_abort);
>     } else {
>         pci_memory =3D NULL;
>         rom_memory =3D system_memory;
>diff --git a/hw/i386/pc_q35=2Ec b/hw/i386/pc_q35=2Ec
>index 4b747c59c19a=2E=2E466f3ef3c918 100644
>--- a/hw/i386/pc_q35=2Ec
>+++ b/hw/i386/pc_q35=2Ec
>@@ -208,7 +208,9 @@ static void pc_q35_init(MachineState *machine)
>     q35_host =3D Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>
>     if (pcmc->pci_enabled) {
>-        pci_hole64_size =3D q35_host->mch=2Epci_hole64_size;
>+        pci_hole64_size =3D object_property_get_uint(OBJECT(q35_host),
>+                                                   PCI_HOST_PROP_PCI_HOL=
E64_SIZE,
>+                                                   &error_abort);
>     }
>
>     /* allocate ram and load rom/bios */
>diff --git a/hw/pci-host/i440fx=2Ec b/hw/pci-host/i440fx=2Ec
>index 15680da7d709=2E=2Ed5426ef4a53c 100644
>--- a/hw/pci-host/i440fx=2Ec
>+++ b/hw/pci-host/i440fx=2Ec
>@@ -237,13 +237,6 @@ static void i440fx_realize(PCIDevice *dev, Error **e=
rrp)
>     }
> }
>
>-uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
>-{
>-        I440FXState *i440fx =3D I440FX_PCI_HOST_BRIDGE(i440fx_dev);
>-
>-        return i440fx->pci_hole64_size;
>-}
>-
> PCIBus *i440fx_init(const char *pci_type,
>                     DeviceState *dev,
>                     MemoryRegion *address_space_mem,

