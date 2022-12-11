Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B664937A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 10:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4J1g-0006ZH-Au; Sun, 11 Dec 2022 04:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4J1W-0006Z5-BH
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 04:53:30 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4J1T-0006IR-Py
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 04:53:29 -0500
Received: by mail-ed1-x52e.google.com with SMTP id s5so8905401edc.12
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 01:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuME9iNxD68/qPunfhZV9Tt9D/PNj2Kjz1Kby5qOwwY=;
 b=NpxkbgqLyR3xsK9+SB9gqrgA5QiwYW3B8Skjn8+6lmZAzV0pP6/ZYyERbkcu0tpiIy
 eGcyynY1Wavj9UBIvS4AObYGWveVrV54mcgX0Q2ZNKuzxbnDpMoI7cyb5+93BiW7mel6
 YTgdWQGMIgQiHAoS7GwjOMQhBqXN5tim46esa34UClvINplVq6ivQM+GT+pZ83VixgHj
 uwKuoltBIhGq7DmP3//pNxLlYa4wlbkpn9y8fJj3Q8armYvhe8KkpdPxM9UegucYOkYk
 aM+nMRRPS8J+Xre9Ntff9ycqKdo64k6AgBcndzqD/BElbHP1334GVCjDg+FrG272fVuP
 D04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tuME9iNxD68/qPunfhZV9Tt9D/PNj2Kjz1Kby5qOwwY=;
 b=1KTUwpyeJCnJKM1rh7/1w++i5jZNj3ulQaLfE6HeGuQRa9Mi8nXULqaADBrqravSUy
 IAGBm0EBJsQsdW/GJh62QQS22Idn2/X0HwK9T49y1xbrLRoVDAfDxxIvFvC8EkGa5GRH
 ucybYBJlK3QQinzqmZiJZlE5YCiqsIgjJ/HBjFprqV/B/xjJCGujUk0k+IQ2aAJy08LQ
 0rJ86iN3E1hCtvSBW2NTBAfR5QdUUgOByXzWnRRduEF0XgFVdV0vnOki5ygzuWIGvvov
 a0543lHKb/4A7W1f7pu/TwS8bzOooArLVZ7SJ2cHdlLTOjER2RW06BM8+wfYCX3iytFG
 YYhw==
X-Gm-Message-State: ANoB5plvDPTwxyOyYGnr5y95E+I7moB5n6oL5b7A/wJFV9zS3n+YZ9wP
 q9p7F6utvnbScCbMDhRkMC8=
X-Google-Smtp-Source: AA0mqf7jjlJ/+KSN0oDIoe89tx7MpLG9QwdUvRpyZhU9Kwiiqu0jAsZhb2X0wgROlG8g2oNJBawOeA==
X-Received: by 2002:aa7:cad7:0:b0:461:b693:3d61 with SMTP id
 l23-20020aa7cad7000000b00461b6933d61mr10583214edt.6.1670752404890; 
 Sun, 11 Dec 2022 01:53:24 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200150f11b7b1e9e208.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:150f:11b7:b1e9:e208])
 by smtp.gmail.com with ESMTPSA id
 d9-20020aa7d5c9000000b004611c230bd0sm2554668eds.37.2022.12.11.01.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 01:53:24 -0800 (PST)
Date: Sun, 11 Dec 2022 09:53:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-8=2E0_7/7=5D_hw/mips/malta=3A_Use?=
 =?US-ASCII?Q?_bootloader_generator_API_for_nanoMIPS_CPUs?=
In-Reply-To: <20221210155502.74609-8-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-8-philmd@linaro.org>
Message-ID: <1FA77176-616E-4BC9-9AD1-DC502F03F68D@gmail.com>
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



Am 10=2E Dezember 2022 15:55:02 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>Similarly to how commit 0c8427baf0 ("hw/mips/malta: Use bootloader
>helper to set BAR registers") converted write_bootloader(), convert
>the equivalent write_bootloader_nanomips(), allowing us to modify
>the bootloader code more easily in the future=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/mips/malta=2Ec | 148 ++++++++++++------------------------------------
> 1 file changed, 35 insertions(+), 113 deletions(-)
>
>diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>index 944730af98=2E=2Ed0da0b71eb 100644
>--- a/hw/mips/malta=2Ec
>+++ b/hw/mips/malta=2Ec
>@@ -614,6 +614,7 @@ static void write_bootloader_nanomips(uint8_t *base, =
uint64_t run_addr,
>                                       uint64_t kernel_entry)
> {
>     uint16_t *p;
>+    void *v;
>=20
>     /* Small bootloader */
>     p =3D (uint16_t *)base;
>@@ -682,123 +683,44 @@ static void write_bootloader_nanomips(uint8_t *bas=
e, uint64_t run_addr,
>     stw_p(p++, 0x80e7); stw_p(p++, NM_LO(loaderparams=2Eram_low_size));
>                                 /* ori a3,a3,%lo(loaderparams=2Eram_low_=
size) */
>=20
>-    /*
>-     * Load BAR registers as done by YAMON:
>-     *
>-     *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
>-     *  - set up PCI0 MEM0 at 0x10000000, size 0x8000000
>-     *  - set up PCI0 MEM1 at 0x18200000, size 0xbe00000
>-     *
>-     */
>-    stw_p(p++, 0xe040); stw_p(p++, 0x0681);
>-                                /* lui t1, %hi(0xb4000000)      */
>-
> #if TARGET_BIG_ENDIAN
>-
>-    stw_p(p++, 0xe020); stw_p(p++, 0x0be1);
>-                                /* lui t0, %hi(0xdf000000)      */
>-
>-    /* 0x68 corresponds to GT_ISD (from hw/mips/gt64xxx_pci=2Ec)  */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
>-                                /* sw t0, 0x68(t1)              */
>-
>-    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
>-                                /* lui t1, %hi(0xbbe00000)      */
>-
>-    stw_p(p++, 0xe020); stw_p(p++, 0x0801);
>-                                /* lui t0, %hi(0xc0000000)      */
>-
>-    /* 0x48 corresponds to GT_PCI0IOLD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9048);
>-                                /* sw t0, 0x48(t1)              */
>-
>-    stw_p(p++, 0xe020); stw_p(p++, 0x0800);
>-                                /* lui t0, %hi(0x40000000)      */
>-
>-    /* 0x50 corresponds to GT_PCI0IOHD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9050);
>-                                /* sw t0, 0x50(t1)              */
>-
>-    stw_p(p++, 0xe020); stw_p(p++, 0x0001);
>-                                /* lui t0, %hi(0x80000000)      */
>-
>-    /* 0x58 corresponds to GT_PCI0M0LD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
>-                                /* sw t0, 0x58(t1)              */
>-
>-    stw_p(p++, 0xe020); stw_p(p++, 0x07e0);
>-                                /* lui t0, %hi(0x3f000000)      */
>-
>-    /* 0x60 corresponds to GT_PCI0M0HD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
>-                                /* sw t0, 0x60(t1)              */
>-
>-    stw_p(p++, 0xe020); stw_p(p++, 0x0821);
>-                                /* lui t0, %hi(0xc1000000)      */
>-
>-    /* 0x80 corresponds to GT_PCI0M1LD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9080);
>-                                /* sw t0, 0x80(t1)              */
>-
>-    stw_p(p++, 0xe020); stw_p(p++, 0x0bc0);
>-                                /* lui t0, %hi(0x5e000000)      */
>-
>+#define cpu_to_gt32 cpu_to_le32
> #else
>-
>-    stw_p(p++, 0x0020); stw_p(p++, 0x00df);
>-                                /* addiu[32] t0, $0, 0xdf       */
>-
>-    /* 0x68 corresponds to GT_ISD                               */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
>-                                /* sw t0, 0x68(t1)              */
>-
>-    /* Use kseg2 remapped address 0x1be00000                    */
>-    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
>-                                /* lui t1, %hi(0xbbe00000)      */
>-
>-    stw_p(p++, 0x0020); stw_p(p++, 0x00c0);
>-                                /* addiu[32] t0, $0, 0xc0       */
>-
>-    /* 0x48 corresponds to GT_PCI0IOLD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9048);
>-                                /* sw t0, 0x48(t1)              */
>-
>-    stw_p(p++, 0x0020); stw_p(p++, 0x0040);
>-                                /* addiu[32] t0, $0, 0x40       */
>-
>-    /* 0x50 corresponds to GT_PCI0IOHD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9050);
>-                                /* sw t0, 0x50(t1)              */
>-
>-    stw_p(p++, 0x0020); stw_p(p++, 0x0080);
>-                                /* addiu[32] t0, $0, 0x80       */
>-
>-    /* 0x58 corresponds to GT_PCI0M0LD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
>-                                /* sw t0, 0x58(t1)              */
>-
>-    stw_p(p++, 0x0020); stw_p(p++, 0x003f);
>-                                /* addiu[32] t0, $0, 0x3f       */
>-
>-    /* 0x60 corresponds to GT_PCI0M0HD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
>-                                /* sw t0, 0x60(t1)              */
>-
>-    stw_p(p++, 0x0020); stw_p(p++, 0x00c1);
>-                                /* addiu[32] t0, $0, 0xc1       */
>-
>-    /* 0x80 corresponds to GT_PCI0M1LD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9080);
>-                                /* sw t0, 0x80(t1)              */
>-
>-    stw_p(p++, 0x0020); stw_p(p++, 0x005e);
>-                                /* addiu[32] t0, $0, 0x5e       */
>-
>+#define cpu_to_gt32 cpu_to_be32
> #endif
>+    v =3D p;
>=20
>-    /* 0x88 corresponds to GT_PCI0M1HD                          */
>-    stw_p(p++, 0x8422); stw_p(p++, 0x9088);
>-                                /* sw t0, 0x88(t1)              */
>+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
>+    bl_gen_write_u32(&v, /* GT_ISD */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
>+                     cpu_to_gt32(0x1be00000 << 3));
>+
>+    /* setup MEM-to-PCI0 mapping */

+ as done by YAMON

That would preserve an existing comment and would document where these num=
bers come from (if the comment is correct)=2E

Best regards,
Bernhard

>+    /* setup PCI0 io window to 0x18000000-0x181fffff */
>+    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
>+                     cpu_to_gt32(0x18000000 << 3));
>+    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
>+                     cpu_to_gt32(0x08000000 << 3));
>+    /* setup PCI0 mem windows */
>+    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
>+                     cpu_to_gt32(0x10000000 << 3));
>+    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
>+                     cpu_to_gt32(0x07e00000 << 3));
>+
>+    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
>+                     cpu_to_gt32(0x18200000 << 3));
>+    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
>+                     cpu_to_gt32(0x0bc00000 << 3));
>+
>+    p =3D (uint16_t *)v;
>+
>+#undef cpu_to_gt32
>=20
>     stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
>=20

