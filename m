Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59C4CA276
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:51:21 +0100 (CET)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMZk-0007tW-Bm
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:51:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPMXi-0006SL-Gj; Wed, 02 Mar 2022 05:49:14 -0500
Received: from [2a00:1450:4864:20::62c] (port=40721
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPMXg-0002U1-UZ; Wed, 02 Mar 2022 05:49:14 -0500
Received: by mail-ej1-x62c.google.com with SMTP id p15so2813333ejc.7;
 Wed, 02 Mar 2022 02:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=7rrkiXHc8VJ7fc3zbr0X1gkXAhdAYfkWnD7av1JwCgU=;
 b=q1hjfgCBY3dKoUriSGWhs6L8Dwm5Kauf5ioMZ3N4f+wA8i94Mtqwn0zKnmPtUoo2PX
 MBzOEPUagbFJerl9bczGQPTu5g/i3QO7TeVxjwvHSNSQp1Dcwoj0T+tmevTGMyZsRXRo
 mWqPHXQxdcll/FAQRWxqE4k+TW5YHE8CSI5eATrr1rmG2PXBmYq3kLuoSGatFO1Qc8cX
 eKrw6FljoBCcPdJfPaIeZF8L9+ltO+hZQVndX/6+Xam60+Har0gGayukz9w9VHsw3l+U
 BX5Ls0xjg7iyIA3gLl6HeadLxoi5xrdKJuYVNcPsvaeLlXf5mIk1J0o8dle1qwKAuv41
 g8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=7rrkiXHc8VJ7fc3zbr0X1gkXAhdAYfkWnD7av1JwCgU=;
 b=OD/vabQfaTVl7SOJgEcCPtibh6bexNVCqylLIQjb6OePXvcpIIUIZZj87QFn2uas6I
 zp7IEDn23mXa8BWyfEUYH6Qsgf/pUGP+heLEVdX1XK6nJtC3CDCuTvLy3Jhxye3jT8KC
 U86Bp77DQ1ZpXG2nuWoCCMBD7Z6MS/th+wnxHCulcWfzydE1yoSM4bvf1DrWOdd/Yw+5
 MAdVcg17pnKwCUr0v6hXjBKZgAv/x9lS2Y8qPP28HI+TQgg6wgo0brl42gwTlQsz4qPo
 XmrS+yztpGQjC4xy9V4KBK7p2UnGZaaQjRczvw3PG4fSFMIrPhKmKoE6LG/h7P2kki4V
 tH7g==
X-Gm-Message-State: AOAM531WOnD6tuUtWO1u+I8/EL16HpfGmm3Q3fozDXyDUzx5MA53g2oo
 ChMfFEIC/463aNnmWe6DMm23y1pgTggG3w==
X-Google-Smtp-Source: ABdhPJwOwq5iwz5Lx/joVjscnQHzL2Wne8JjcFU7ADFQ6w+n1QIQVfkU77lrBSqWRk35It8QAqNUmA==
X-Received: by 2002:a17:907:8693:b0:6d9:67df:b21c with SMTP id
 qa19-20020a170907869300b006d967dfb21cmr2217320ejc.536.1646218146485; 
 Wed, 02 Mar 2022 02:49:06 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-087-134.78.55.pool.telefonica.de.
 [78.55.87.134]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm6239027eje.92.2022.03.02.02.49.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Mar 2022 02:49:06 -0800 (PST)
Date: Wed, 02 Mar 2022 10:49:03 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND_1/2=5D_hw/vfio/pci-qui?=
 =?US-ASCII?Q?rks=3A_Resolve_redundant_property_getters?=
In-Reply-To: <20220301225220.239065-2-shentey@gmail.com>
References: <20220301225220.239065-1-shentey@gmail.com>
 <20220301225220.239065-2-shentey@gmail.com>
Message-ID: <162428EB-D942-46C4-9B20-D824B56774E1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 1=2E M=C3=A4rz 2022 22:52:19 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>The QOM API already provides getters for uint64 and uint32 values, so reu=
se
>them=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: Alistair Francis <alistair=2Efrancis@wdc=2Ecom>

Meh, I accidently swapped Alistair's Reviewed-by into this patch while dro=
pping it from the other=2E Please ignore and sorry for that=2E

Best regards,
Bernhard

>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
> hw/vfio/pci-quirks=2Ec | 34 +++++++++-------------------------
> 1 file changed, 9 insertions(+), 25 deletions(-)
>
>diff --git a/hw/vfio/pci-quirks=2Ec b/hw/vfio/pci-quirks=2Ec
>index 0cf69a8c6d=2E=2Ef0147a050a 100644
>--- a/hw/vfio/pci-quirks=2Ec
>+++ b/hw/vfio/pci-quirks=2Ec
>@@ -1565,22 +1565,6 @@ static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice=
 *vdev, Error **errp)
>     return 0;
> }
>=20
>-static void vfio_pci_nvlink2_get_tgt(Object *obj, Visitor *v,
>-                                     const char *name,
>-                                     void *opaque, Error **errp)
>-{
>-    uint64_t tgt =3D (uintptr_t) opaque;
>-    visit_type_uint64(v, name, &tgt, errp);
>-}
>-
>-static void vfio_pci_nvlink2_get_link_speed(Object *obj, Visitor *v,
>-                                                 const char *name,
>-                                                 void *opaque, Error **e=
rrp)
>-{
>-    uint32_t link_speed =3D (uint32_t)(uintptr_t) opaque;
>-    visit_type_uint32(v, name, &link_speed, errp);
>-}
>-
> int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
> {
>     int ret;
>@@ -1618,9 +1602,9 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vd=
ev, Error **errp)
>                                nv2reg->size, p);
>     QLIST_INSERT_HEAD(&vdev->bars[0]=2Equirks, quirk, next);
>=20
>-    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
>-                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
>-                        (void *) (uintptr_t) cap->tgt);
>+    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
>+                                   (uint64_t *) &cap->tgt,
>+                                   OBJ_PROP_FLAG_READ);
>     trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev=2Ename, cap->tg=
t,
>                                           nv2reg->size);
> free_exit:
>@@ -1679,15 +1663,15 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Er=
ror **errp)
>         QLIST_INSERT_HEAD(&vdev->bars[0]=2Equirks, quirk, next);
>     }
>=20
>-    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
>-                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
>-                        (void *) (uintptr_t) captgt->tgt);
>+    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
>+                                   (uint64_t *) &captgt->tgt,
>+                                   OBJ_PROP_FLAG_READ);
>     trace_vfio_pci_nvlink2_setup_quirk_ssatgt(vdev->vbasedev=2Ename, cap=
tgt->tgt,
>                                               atsdreg->size);
>=20
>-    object_property_add(OBJECT(vdev), "nvlink2-link-speed", "uint32",
>-                        vfio_pci_nvlink2_get_link_speed, NULL, NULL,
>-                        (void *) (uintptr_t) capspeed->link_speed);
>+    object_property_add_uint32_ptr(OBJECT(vdev), "nvlink2-link-speed",
>+                                   &capspeed->link_speed,
>+                                   OBJ_PROP_FLAG_READ);
>     trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev=2Ename,
>                                               capspeed->link_speed);
> free_exit:


