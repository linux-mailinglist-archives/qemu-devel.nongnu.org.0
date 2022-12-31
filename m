Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D465A36C
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 10:55:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBYZB-0007pZ-8t; Sat, 31 Dec 2022 04:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pBYZ8-0007oy-Mn
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 04:54:10 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pBYZ6-0004UO-U0
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 04:54:10 -0500
Received: by mail-ej1-x62f.google.com with SMTP id fc4so56173948ejc.12
 for <qemu-devel@nongnu.org>; Sat, 31 Dec 2022 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAvGH7swPG4QbYoynr5tH1GwrIPLsjTxcIqtcFleAzc=;
 b=kg4zNprBX2+fYBVFqDMcZ4lFr9BK1uxzJAbgJpJFbga3aiyN7d34SZyayNMb0Uvp5W
 RpnwvaC2Q+/vlm1hjlbQJVxrtkRGhPnJXARtdEewaQPgXCt2Eurz01QomzgeL+lU5k6Z
 jFRh472qaWmDYn3CkTBBg+i/Taw7yqjYLD60uvBrRDyDE7+cYM9JG9g143t6pGWaMrMu
 B5AiwHdMBkNS1Bc196eEC5TTsX1TMYH2C+ey4qXiUV7p0ymZ+krnfPmIH5vwwm208Szh
 Vqrt+7YwaviyCrk30sK3bs3GRdPtbsdjnzBW4qFh5nKneCwJNeGDgpwzoyd+EcFmAHwu
 sOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAvGH7swPG4QbYoynr5tH1GwrIPLsjTxcIqtcFleAzc=;
 b=M5SRwXpPVE9M58uJ2gw3rApOjiDh2DosXL0eRN4olJiAeVnW0SGzEw0Z6L0vFYYQ7q
 Ymtf+bph86H/SY3ZtEqJztxrsalwElu1IcLIZIpajakI0HR6Qa1xOx+3JPdIIyf7HVti
 r4qKXApK1h+qC7SpdYgiLXl2hbYdRGAo6i/nkUxpOqs4XMg+mnwb40myQnPII5CJpBmV
 xEKfjmUCArrceDQZRmQkv2Oo0NaHjP2RO149AYjnSeE/qPpwBEWc/wt7mZIj6SYlv9QR
 SD4ioN+RqI4q2lej9rY6Po3FRrBXicZk1A8F9SYfnLdD1Rb1r8VDLlXTt0Z71E8JX+Ua
 OfwQ==
X-Gm-Message-State: AFqh2kqiuukUf2xm871ChViURFFEOHQg/Of3NixA81il47wQV03qn84E
 rNHZBLJprVnesrJVConaKpY=
X-Google-Smtp-Source: AMrXdXur8EsKvsDIHMDvaVk287nuo3EOkozW3PEFAhMLWwlv0jRDOh/2XqYNtjg1EQODPxdhXg2LFg==
X-Received: by 2002:a17:907:cb85:b0:7c0:f216:cc14 with SMTP id
 un5-20020a170907cb8500b007c0f216cc14mr29532505ejc.11.1672480447096; 
 Sat, 31 Dec 2022 01:54:07 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200c08da1f0d4e5fc32.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:c08d:a1f0:d4e5:fc32])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a056402139300b004642b35f89esm10328765edv.9.2022.12.31.01.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Dec 2022 01:54:06 -0800 (PST)
Date: Sat, 31 Dec 2022 09:53:56 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/3=5D_hw/mips/malta=3A_Set_?=
 =?US-ASCII?Q?PIIX4_IRQ_routes_in_embedded_bootloader?=
In-Reply-To: <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
 <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
Message-ID: <2E4C442C-9057-4006-AE8D-123B513ED894@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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



Am 21=2E November 2022 15:34:05 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>
>
>Am 27=2E Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>>Linux kernel expects the northbridge & southbridge chipsets
>>configured by the BIOS firmware=2E We emulate that by writing
>>a tiny bootloader code in write_bootloader()=2E
>>
>>Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>>the PIIX4 configuration space included values specific to
>>the Malta board=2E
>>
>>Set the Malta-specific IRQ routing values in the embedded
>>bootloader, so the next commit can remove the Malta specific
>>bits from the PIIX4 PCI-ISA bridge and make it generic
>>(matching the real hardware)=2E
>>
>>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>---
>>FIXME: Missing the nanoMIPS counter-part!
>
>Who will be taking care of this? I have absolutely no clue how the write_=
bootloader functions work, so I don't see how to fix it=2E

Ping

>Couldn't we just do it like in pegasos2_init() where the registers are in=
itialized by QEMU directly if there is no bootloader binary configured? I c=
ould do that=2E
>
>Best regards,
>Bernhard
>>---
>> hw/mips/malta=2Ec | 19 +++++++++++++++++++
>> 1 file changed, 19 insertions(+)
>>
>>diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>>index df0f448b67=2E=2E4403028778 100644
>>--- a/hw/mips/malta=2Ec
>>+++ b/hw/mips/malta=2Ec
>>@@ -804,6 +804,8 @@ static void write_bootloader_nanomips(uint8_t *base,=
 uint64_t run_addr,
>>     stw_p(p++, 0x8422); stw_p(p++, 0x9088);
>>                                 /* sw t0, 0x88(t1)              */
>>=20
>>+    /* TODO set PIIX IRQC[A:D] routing values! */
>>+
>>     stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
>>=20
>>     stw_p(p++, NM_HI2(kernel_entry));
>>@@ -841,6 +843,9 @@ static void write_bootloader_nanomips(uint8_t *base,=
 uint64_t run_addr,
>> static void write_bootloader(uint8_t *base, uint64_t run_addr,
>>                              uint64_t kernel_entry)
>> {
>>+    const char pci_pins_cfg[PCI_NUM_PINS] =3D {
>>+        10, 10, 11, 11 /* PIIX IRQRC[A:D] */
>>+    };
>>     uint32_t *p;
>>=20
>>     /* Small bootloader */
>>@@ -915,6 +920,20 @@ static void write_bootloader(uint8_t *base, uint64_=
t run_addr,
>>=20
>> #undef cpu_to_gt32
>>=20
>>+    /*
>>+     * The PIIX ISA bridge is on PCI bus 0 dev 10 func 0=2E
>>+     * Load the PIIX IRQC[A:D] routing config address, then
>>+     * write routing configuration to the config data register=2E
>>+     */
>>+    bl_gen_write_u32(&p, /* GT_PCI0_CFGADDR */
>>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcf8),
>>+                     tswap32((1 << 31) /* ConfigEn */
>>+                             | PCI_BUILD_BDF(0, PIIX4_PCI_DEVFN) << 8
>>+                             | PIIX_PIRQCA));
>>+    bl_gen_write_u32(&p, /* GT_PCI0_CFGDATA */
>>+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcfc),
>>+                     tswap32(ldl_be_p(pci_pins_cfg)));
>>+
>>     bl_gen_jump_kernel(&p,
>>                        true, ENVP_VADDR - 64,
>>                        /*

