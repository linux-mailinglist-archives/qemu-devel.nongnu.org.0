Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5E4E24C9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 11:59:19 +0100 (CET)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWFks-0004V2-Iz
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 06:59:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nWFji-0003VD-Er; Mon, 21 Mar 2022 06:58:06 -0400
Received: from [2a00:1450:4864:20::633] (port=46980
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nWFjg-0005ND-9D; Mon, 21 Mar 2022 06:58:05 -0400
Received: by mail-ej1-x633.google.com with SMTP id qx21so28917389ejb.13;
 Mon, 21 Mar 2022 03:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=UHD2rwzhO/TJ2rnxvDJT+g3gYC/JEmlEfWAc9AjYGlA=;
 b=j3bz/ZO/ucDavWpmSYREwiM+bZJZ/NKdEi7CWl/W8LUMASewcgoZgzkRA8cO8AH9Kp
 nNr5dOVj3JCEVKJCHfMWJfR5R8p8GIpy3fTNt05cjrGmJUcnAVa2Jtv5LtTAk3K3LRf7
 /G9sM3mus9btm2xukuFvDBYNe6lrmjy/nxmxbGp5/bEEq1xK9RMlSrgqCl6QVAZSv4j5
 Ucx83gvHSQ3HKO7TjFGgB6NHzmcU2yqk5NqPluR6ObO5yQ2kUS9geSxn66FwNBFA3VIk
 ykFFu6v+0zOeQK2BpwMof8NwPMy1P+gXLvrpE/gJmxaoTmw/dUMKbD/jQyEnQK4Bb8Eu
 f/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=UHD2rwzhO/TJ2rnxvDJT+g3gYC/JEmlEfWAc9AjYGlA=;
 b=K+Q/tJKdE02cHuoE9dBD2SHqEKumG6f5jatZvEfjfbgDBxIcqPp6SEZUqqYm+5RRcC
 E7PT7y3gTf1PprGo21CAZeuSdh9YeX3XxpPJvhkvEbvNRHONNZdy9Jy5fB3q6yJ2kWhb
 GYbM798vqwoEI++boUmXsVny1JQ2KvivtPmVGTC3rpk4rJW0pHjcm5Xr/blfvDsye/Ey
 /7z1HvYPgAVbwiM2gojOA1038tER+7eJVWfHcg4w3PFdj5TSEILI15zyqRR9x08rT6nC
 f5nGIJLw1AHueniGeWUAMaeVs1GXSluhVtbD/tjsPva1Mz4omVnrEYmUeiqemGl7BlSv
 k+Ow==
X-Gm-Message-State: AOAM530+wGkX63toNLnI85OegtT8tLOk8H+ceVtzG89oKs85+q1oHq1j
 zk7ArElqSKVwswv1bvcSK0jE7TVspWU=
X-Google-Smtp-Source: ABdhPJzbqb0AZW7zl4PjQRV7SIV1Ss5sgtVlvsRhaOwJFHkTMW7HtFtqJrJA12lRvfpO1lF/vqftIg==
X-Received: by 2002:a17:906:3117:b0:6cd:f81b:e295 with SMTP id
 23-20020a170906311700b006cdf81be295mr19328887ejx.511.1647860279047; 
 Mon, 21 Mar 2022 03:57:59 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-154-211.77.191.pool.telefonica.de.
 [77.191.154.211]) by smtp.gmail.com with ESMTPSA id
 sh31-20020a1709076e9f00b006dff86479d7sm1641588ejc.21.2022.03.21.03.57.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Mar 2022 03:57:58 -0700 (PDT)
Date: Mon, 21 Mar 2022 10:57:55 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND_1/2=5D_hw/vfio/pci-qui?=
 =?US-ASCII?Q?rks=3A_Resolve_redundant_property_getters?=
In-Reply-To: <20220301225220.239065-2-shentey@gmail.com>
References: <20220301225220.239065-1-shentey@gmail.com>
 <20220301225220.239065-2-shentey@gmail.com>
Message-ID: <5F510D6C-37E7-46A1-AEB8-E7D060B4ED0B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 1=2E M=C3=A4rz 2022 22:52:19 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>The QOM API already provides getters for uint64 and uint32 values, so reu=
se
>them=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
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

Ping

@Alistair: When resending, I accidently added a Reviewed-by with your name=
 here which I asked to be ignored *after* you re-acked patch 2/2=2E In case=
 you intended to ack this patch as well your voice would be needed again=2E

Thanks,
Bernhard

