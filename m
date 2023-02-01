Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53337683AE8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 01:04:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN0aS-0001u1-D6; Tue, 31 Jan 2023 19:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pN0aP-0001ss-VQ; Tue, 31 Jan 2023 19:02:49 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pN0aO-0002M2-Aj; Tue, 31 Jan 2023 19:02:49 -0500
Received: by mail-ej1-x62d.google.com with SMTP id dr8so24971136ejc.12;
 Tue, 31 Jan 2023 16:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjOXovAmKjL7g3Che6Eyc3siPVLhgOZzBH9rNAH5fwI=;
 b=CN3Zemqu1IZYEjBOttwDHThe1UwxG6oPnl5J7AvB0q+SFNiBnll/OWnZYh72yg2IXg
 ShO6Ivs0oUTNEq+C+nDLB7UafENNlPamRJmKKnECUzKQEOlSRpSzrt9vQB+ZCsjqlP8J
 ztcC/2Hly8GkWZQqg2YXEXWlnTYs8DXjzJZP2tmoCt401IcSM47UM5uxLu5beU6sa8TB
 JzHQyEEDkXP13oi4uE75mm4piAx7kWgf/nZDegLzYoC+N1MhN2Fe4k1VjkWz1VWg+f1q
 OCW4Y+M6vPDm+to3scljqnhQQidisGHQHgkXMcfwFKDBzeI5+peERVHKArcw8jbOZAdr
 i7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjOXovAmKjL7g3Che6Eyc3siPVLhgOZzBH9rNAH5fwI=;
 b=kpkP0rcj+6x7YXLpt6mS5pmaf46XgS4v8FCHB/KCtxOKMO5GEl6FD/Q0Nz42D13aEu
 4InEeopAitYL9TRztn5Ltn4b2qpQDMbbGFfOdWoEqqunXIj/fEx5gys1iOJuwDhtuxFE
 8r5OX0lzb2J/03mNVodWFfZpqm2aRdahsnmaIGdMjufze3vstw4xWs+lYaSz8kMz24qw
 TszkIsLeJCpmoUxLQhWy5uK9abenuSVwYe68HsNE9peT0FAs4I2nN4QPLVZYcIs+NZUx
 ehR4FykDYVzx4YbdtjDgZj12Vs3xg89owfxIS+yl0fo3x9a/FltzeNkJvUjDkQH9Z3vk
 sGLw==
X-Gm-Message-State: AO0yUKV19FgrkjCjnv6W8u3npc52x5jaA61NfhhrDcvr58Q/T0CcDCKD
 +2xty/JjJxqYuM+7yUnQu8vxtXbBb9U=
X-Google-Smtp-Source: AK7set/u9IIWYmcVavlAPhGufEEdkHir3RgiGe0/fk0J4Nybl7MVKEFAiaQs3R/vCUYGecD70PagqA==
X-Received: by 2002:a17:906:cc8f:b0:889:d998:1576 with SMTP id
 oq15-20020a170906cc8f00b00889d9981576mr226864ejb.66.1675209765436; 
 Tue, 31 Jan 2023 16:02:45 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-082-236.77.13.pool.telefonica.de.
 [77.13.82.236]) by smtp.gmail.com with ESMTPSA id
 la7-20020a170906ad8700b00872c0bccab2sm5275055ejb.35.2023.01.31.16.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 16:02:44 -0800 (PST)
Date: Wed, 01 Feb 2023 00:02:32 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_11/20=5D_hw/isa/lpc=5Fich9=3A_Reu?=
 =?US-ASCII?Q?se_memory_and_io_address_space_of_PCI_bus?=
In-Reply-To: <20230131115326.12454-12-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-12-shentey@gmail.com>
Message-ID: <F7A4EAA1-2150-4A4F-BD74-290FC22479CF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 31=2E Januar 2023 11:53:17 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>In pc_q35=2Ec the PCI host bridge's io and memory space is initialized
>with get_system_memory() and get_system_io() respectively=2E Therefore,
>using pci_address_space() and pci_address_space_io() is equivalent=2E

Self-NACK: pci_address_space() !=3D get_system_memory()=2E

Please ignore this patch=2E This patch can be omitted from the series w/o =
any syntactic or semantic conflicts=2E I'll omit it in v3=2E

>All
>in all this makes the LPC function respect whatever memory spaces the
>PCI bus was set up with=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> hw/isa/lpc_ich9=2Ec | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/hw/isa/lpc_ich9=2Ec b/hw/isa/lpc_ich9=2Ec
>index 9ab966ef88=2E=2E1b7e5585b3 100644
>--- a/hw/isa/lpc_ich9=2Ec
>+++ b/hw/isa/lpc_ich9=2Ec
>@@ -506,10 +506,10 @@ static void ich9_lpc_rcba_update(ICH9LPCState *lpc,=
 uint32_t rcba_old)
>     uint32_t rcba =3D pci_get_long(lpc->d=2Econfig + ICH9_LPC_RCBA);
>=20
>     if (rcba_old & ICH9_LPC_RCBA_EN) {
>-        memory_region_del_subregion(get_system_memory(), &lpc->rcrb_mem)=
;
>+        memory_region_del_subregion(pci_address_space(&lpc->d), &lpc->rc=
rb_mem);
>     }
>     if (rcba & ICH9_LPC_RCBA_EN) {
>-        memory_region_add_subregion_overlap(get_system_memory(),
>+        memory_region_add_subregion_overlap(pci_address_space(&lpc->d),
>                                             rcba & ICH9_LPC_RCBA_BA_MASK=
,
>                                             &lpc->rcrb_mem, 1);
>     }
>@@ -695,7 +695,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **er=
rp)
>         return;
>     }
>=20
>-    isa_bus =3D isa_bus_new(DEVICE(d), get_system_memory(), get_system_i=
o(),
>+    isa_bus =3D isa_bus_new(dev, pci_address_space(d), pci_address_space=
_io(d),
>                           errp);
>     if (!isa_bus) {
>         return;

