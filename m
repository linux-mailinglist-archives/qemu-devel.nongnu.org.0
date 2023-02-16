Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE36998DC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:28:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgBB-0007gH-9t; Thu, 16 Feb 2023 10:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSgB9-0007eY-M3; Thu, 16 Feb 2023 10:28:11 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSgB8-0005or-0R; Thu, 16 Feb 2023 10:28:11 -0500
Received: by mail-ed1-x52e.google.com with SMTP id u21so4245099edv.3;
 Thu, 16 Feb 2023 07:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bRI1kP0BE4Sd+I1miyrTmioZ75A2bUnvaSfrPmhC8Pc=;
 b=neon9URBCS2cHnhwXnZSBv7RAahfa7lkj5YCIM2jrIZb95Ojo5AeLiZuSawzup+Oxu
 KR6SLDFO9LstZ/kUWI0QyeDKfhzR8WNDaEH6eMyaEqLmVO6sguREg7QAiUMbA84wNgGY
 EHSmbsSlIAMC6eXB/4Yg2juDrbx1CMbQd+F/7dkZkKhhJj6ZYcFdINOd/0V4ZXC3d+kl
 8/IXqDAGjHz02jS9MzJbd+6c4N5PbuBPpkevD3NYu1SIYo3u/ppQhfF2EV2/72wV2GDv
 3tRxuQPKYYngu1D8LMl8aLZrYk3bGH+9dbKMpDfmP23P+YnCoNXzqz9gZ2Fx3xsGDS0Y
 VW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bRI1kP0BE4Sd+I1miyrTmioZ75A2bUnvaSfrPmhC8Pc=;
 b=cgovypTwvmuug96WZL5k+HbCVQ8dFpjpc35wjqDMttgsWGplmFpUPQ8tGLbKDtSVLz
 ozs1cTfDLPrtzBJFDfHXfnQg1y9E6ecxZyzEvFlFjdz+eOMyE7SChlbBs+Km+pzFJCp4
 S2afzz/dJjJzkhRvJa4RjKxg3RISazNAy/tuKLVhIz/t31dfdFHbKLWNTdAIWxM4PUIv
 QB72y8ysOaoRfF9h+ReBMyTN2IFN/7rpc+Ouc5UaQS0jiRuB/DPvSKB8HdO0RjYH1VZ+
 dncKFjVyKr4WKliWgNc0Ng5A5DRSLHDhabPMsaPi1MbMHMIVFHtXIhVszyyW/Yoz/Rc5
 xSTw==
X-Gm-Message-State: AO0yUKVEbsAyWWsp0egQNrIncXjjYmCWV/tKVJGuTuiyXyTR4ktuILCb
 u1EEAA9hTZ3cZCXgi6mTnjC/xHKQLgA=
X-Google-Smtp-Source: AK7set9IIeo02o27YesKzbjZ5W2axH6awJmp0c6JD/Te3Xde37Ezh4bU0ol6Ok9SM0Lw3JyBtvmbtA==
X-Received: by 2002:aa7:d816:0:b0:4ac:c562:bf7d with SMTP id
 v22-20020aa7d816000000b004acc562bf7dmr6761373edq.2.1676561287800; 
 Thu, 16 Feb 2023 07:28:07 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-175-191.89.12.pool.telefonica.de.
 [89.12.175.191]) by smtp.gmail.com with ESMTPSA id
 q11-20020a50c34b000000b004ad601533a3sm670466edb.55.2023.02.16.07.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 07:28:07 -0800 (PST)
Date: Thu, 16 Feb 2023 15:28:01 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 18/18] hw/isa: Remove empty ISADeviceClass structure
In-Reply-To: <20230215161641.32663-19-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-19-philmd@linaro.org>
Message-ID: <F19418C9-5725-4509-A734-D05874616AB5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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



Am 15=2E Februar 2023 16:16:41 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>ISADeviceClass is an empty class and just increase code
>complexity=2E Remove it, directly embedding DeviceClass in
>classes expanding TYPE_ISA_DEVICE=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/isa/isa-bus=2Ec                  | 1 -
> hw/rtc/m48t59-isa=2Ec               | 2 +-
> include/hw/isa/i8259_internal=2Eh   | 2 +-
> include/hw/isa/isa=2Eh              | 6 +-----
> include/hw/isa/superio=2Eh          | 2 +-
> include/hw/timer/i8254_internal=2Eh | 2 +-
> 6 files changed, 5 insertions(+), 10 deletions(-)
>
>diff --git a/hw/isa/isa-bus=2Ec b/hw/isa/isa-bus=2Ec
>index f44817b88b=2E=2E1276f31826 100644
>--- a/hw/isa/isa-bus=2Ec
>+++ b/hw/isa/isa-bus=2Ec
>@@ -221,7 +221,6 @@ static const TypeInfo isa_device_type_info =3D {
>     =2Eparent =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(ISADevice),
>     =2Eabstract =3D true,
>-    =2Eclass_size =3D sizeof(ISADeviceClass),
>     =2Eclass_init =3D isa_device_class_init,
> };
>=20
>diff --git a/hw/rtc/m48t59-isa=2Ec b/hw/rtc/m48t59-isa=2Ec
>index e61f7ec370=2E=2E5bb46f2383 100644
>--- a/hw/rtc/m48t59-isa=2Ec
>+++ b/hw/rtc/m48t59-isa=2Ec
>@@ -47,7 +47,7 @@ struct M48txxISAState {
> };
>=20
> struct M48txxISADeviceClass {
>-    ISADeviceClass parent_class;
>+    DeviceClass parent_class;
>     M48txxInfo info;
> };
>=20
>diff --git a/include/hw/isa/i8259_internal=2Eh b/include/hw/isa/i8259_int=
ernal=2Eh
>index d272d879fb=2E=2E155b098452 100644
>--- a/include/hw/isa/i8259_internal=2Eh
>+++ b/include/hw/isa/i8259_internal=2Eh
>@@ -35,7 +35,7 @@
> OBJECT_DECLARE_TYPE(PICCommonState, PICCommonClass, PIC_COMMON)
>=20
> struct PICCommonClass {
>-    ISADeviceClass parent_class;
>+    DeviceClass parent_class;
>=20
>     void (*pre_save)(PICCommonState *s);
>     void (*post_load)(PICCommonState *s);
>diff --git a/include/hw/isa/isa=2Eh b/include/hw/isa/isa=2Eh
>index c9954a7d99=2E=2E411d12330b 100644
>--- a/include/hw/isa/isa=2Eh
>+++ b/include/hw/isa/isa=2Eh
>@@ -11,7 +11,7 @@
> #define ISA_NUM_IRQS 16
>=20
> #define TYPE_ISA_DEVICE "isa-device"
>-OBJECT_DECLARE_TYPE(ISADevice, ISADeviceClass, ISA_DEVICE)
>+OBJECT_DECLARE_SIMPLE_TYPE(ISADevice, ISA_DEVICE)
>=20
> #define TYPE_ISA_BUS "ISA"
> OBJECT_DECLARE_SIMPLE_TYPE(ISABus, ISA_BUS)
>@@ -48,10 +48,6 @@ struct IsaDmaClass {
>                              void *opaque);
> };
>=20
>-struct ISADeviceClass {
>-    DeviceClass parent_class;
>-};
>-
> struct ISABus {
>     /*< private >*/
>     BusState parent_obj;
>diff --git a/include/hw/isa/superio=2Eh b/include/hw/isa/superio=2Eh
>index b9f5c19155=2E=2E0dc45104d4 100644
>--- a/include/hw/isa/superio=2Eh
>+++ b/include/hw/isa/superio=2Eh
>@@ -44,7 +44,7 @@ typedef struct ISASuperIOFuncs {
>=20
> struct ISASuperIOClass {
>     /*< private >*/
>-    ISADeviceClass parent_class;
>+    DeviceClass parent_class;
>     /*< public >*/
>     DeviceRealize parent_realize;
>=20
>diff --git a/include/hw/timer/i8254_internal=2Eh b/include/hw/timer/i8254=
_internal=2Eh
>index a9a600d941=2E=2E1761deb4cf 100644
>--- a/include/hw/timer/i8254_internal=2Eh
>+++ b/include/hw/timer/i8254_internal=2Eh
>@@ -58,7 +58,7 @@ struct PITCommonState {
> };
>=20
> struct PITCommonClass {
>-    ISADeviceClass parent_class;
>+    DeviceClass parent_class;
>=20
>     void (*set_channel_gate)(PITCommonState *s, PITChannelState *sc, int=
 val);
>     void (*get_channel_info)(PITCommonState *s, PITChannelState *sc,

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

