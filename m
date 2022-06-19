Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71734550D57
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 23:46:10 +0200 (CEST)
Received: from localhost ([::1]:32856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o32kD-0001Se-08
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 17:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o32ia-0000To-0q; Sun, 19 Jun 2022 17:44:28 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o32iY-0005CF-Ao; Sun, 19 Jun 2022 17:44:27 -0400
Received: by mail-ed1-x52b.google.com with SMTP id es26so10955214edb.4;
 Sun, 19 Jun 2022 14:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=jDyeLgnmw1vtJkn84QJNvQTS6x9ae8YSmjSFMBPgcfU=;
 b=D0D7vNHWZR1Nn+QJmc86KDtvSl6M6lEkcu7P5thCVjfpbgBW2AegguzLy7u4kvu4NX
 EpnMJ2r6KMX9Ib+4UNPDd+mxtLF3T0pESLinzBohLYc/wB8MI1IbyCZX6pGCACZ0YENz
 I9hP809+0zgxT+qye3y4sm0vIYQ2lka91I1VFLxa62LkB1ccEAJA6Xxa4zwC1jJ3IRMO
 YIKjJDcsi08Wz8ZQKm6M/zHhb7O6lUmBRJxf6B3OuORiIxU+WvxBTqvvf48PXBV7NMlW
 ZL3dvUKzptyg0hQVUMLe56JSnIZNI8BU7F0QTxbt3Jw6KVJwnLaKYXXbSjMniljDN8HC
 fo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=jDyeLgnmw1vtJkn84QJNvQTS6x9ae8YSmjSFMBPgcfU=;
 b=6hwTJydJK8T8PKm5NuWxVjUeedN6kFgismB//RAkOLwwo1LwwySi32eTzquO8ongM5
 Oy38BydkQOKFUq2Hq+fsQ3P6g3KCR3FURutl2Na97cEbQn86OgLz9GL008lpy8l66vqu
 hZs8JSQSjqlU5wfCBH7+iUFo6+WcYklrBVbewKh+PVkAH5XK4JPtgtDEjAwRAqwMSdPK
 1HYYJ/8Eol6HbkO/HvISAOnvaoQGYP4Itb3xt+xXaunPCxK5y4svriH6PF2WT+fAGdEo
 yQmS7+2oW1Gqs/rrQ3k/PMoovMjg37cDsrGSZ+XCx0XvxIWeSwKEH/hKIMnBWFZY0rba
 6PCA==
X-Gm-Message-State: AJIora/glGUVUM1MtyPUWLoDzyrKJ3ocV7cA+xUmeTRR7NLQraOLX7jn
 omjMOjC4Py3DQXpLsiig+TBZShh8G5Vw0g==
X-Google-Smtp-Source: AGRyM1tKUz5kKK2Xz+Ty9Y1BjZhMQLdik8Gp7hJfFnyqnLaDWRpoBllcIvjGOddXkJYdSiDPS+39wg==
X-Received: by 2002:aa7:c80a:0:b0:435:7784:18e with SMTP id
 a10-20020aa7c80a000000b004357784018emr6779020edt.136.1655675063878; 
 Sun, 19 Jun 2022 14:44:23 -0700 (PDT)
Received: from ?IPv6:::1? ([2001:9e8:1946:f600:a881:84ce:a3ed:9c43])
 by smtp.gmail.com with ESMTPSA id
 24-20020a170906309800b006f3ef214dbesm4954901ejv.36.2022.06.19.14.44.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 Jun 2022 14:44:23 -0700 (PDT)
Date: Sun, 19 Jun 2022 21:44:21 +0000
From: B <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_hw/pci-host/i440fx=3A_Remov?=
 =?US-ASCII?Q?e_unused_parameter_from_i440fx=5Finit=28=29?=
In-Reply-To: <20220612192800.40813-1-shentey@gmail.com>
References: <20220612192800.40813-1-shentey@gmail.com>
Message-ID: <14F9EAAB-1FF2-4718-BA5B-9F5971099C94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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



Am 12=2E Juni 2022 19:28:00 UTC schrieb Bernhard Beschow <shentey@gmail=2E=
com>:
>pi440fx_state is an out-parameter which is never read by the caller=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>

Ping

>---
> hw/i386/pc_piix=2Ec            | 3 ---
> hw/pci-host/i440fx=2Ec         | 4 +---
> include/hw/pci-host/i440fx=2Eh | 1 -
> 3 files changed, 1 insertion(+), 7 deletions(-)
>
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index 0fc2361ffe=2E=2Ea234989ac3 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -82,7 +82,6 @@ static void pc_init1(MachineState *machine,
>     MemoryRegion *system_io =3D get_system_io();
>     PCIBus *pci_bus;
>     ISABus *isa_bus;
>-    PCII440FXState *i440fx_state;
>     int piix3_devfn =3D -1;
>     qemu_irq smi_irq;
>     GSIState *gsi_state;
>@@ -203,7 +202,6 @@ static void pc_init1(MachineState *machine,
>=20
>         pci_bus =3D i440fx_init(host_type,
>                               pci_type,
>-                              &i440fx_state,
>                               system_memory, system_io, machine->ram_siz=
e,
>                               x86ms->below_4g_mem_size,
>                               x86ms->above_4g_mem_size,
>@@ -217,7 +215,6 @@ static void pc_init1(MachineState *machine,
>         isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa=2E0")=
);
>     } else {
>         pci_bus =3D NULL;
>-        i440fx_state =3D NULL;
>         isa_bus =3D isa_bus_new(NULL, get_system_memory(), system_io,
>                               &error_abort);
>         pcms->hpet_enabled =3D false;
>diff --git a/hw/pci-host/i440fx=2Ec b/hw/pci-host/i440fx=2Ec
>index e08716142b=2E=2E1c5ad5f918 100644
>--- a/hw/pci-host/i440fx=2Ec
>+++ b/hw/pci-host/i440fx=2Ec
>@@ -238,7 +238,6 @@ static void i440fx_realize(PCIDevice *dev, Error **er=
rp)
> }
>=20
> PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>-                    PCII440FXState **pi440fx_state,
>                     MemoryRegion *address_space_mem,
>                     MemoryRegion *address_space_io,
>                     ram_addr_t ram_size,
>@@ -264,8 +263,7 @@ PCIBus *i440fx_init(const char *host_type, const char=
 *pci_type,
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>=20
>     d =3D pci_create_simple(b, 0, pci_type);
>-    *pi440fx_state =3D I440FX_PCI_DEVICE(d);
>-    f =3D *pi440fx_state;
>+    f =3D I440FX_PCI_DEVICE(d);
>     f->system_memory =3D address_space_mem;
>     f->pci_address_space =3D pci_address_space;
>     f->ram_memory =3D ram_memory;
>diff --git a/include/hw/pci-host/i440fx=2Eh b/include/hw/pci-host/i440fx=
=2Eh
>index f068aaba8f=2E=2E52518dbf08 100644
>--- a/include/hw/pci-host/i440fx=2Eh
>+++ b/include/hw/pci-host/i440fx=2Eh
>@@ -36,7 +36,6 @@ struct PCII440FXState {
> #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>=20
> PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>-                    PCII440FXState **pi440fx_state,
>                     MemoryRegion *address_space_mem,
>                     MemoryRegion *address_space_io,
>                     ram_addr_t ram_size,

