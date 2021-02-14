Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4C231B1F4
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:23:59 +0100 (CET)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM3q-0007MM-QB
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLh2-0007as-7B
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:33 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLh0-0004Nq-1u
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:24 -0500
Received: by mail-wr1-x436.google.com with SMTP id n8so6073253wrm.10
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDYzgz4nCnzAeAmRqFLDDh2jFjyyR2cEOET9WBNOhTQ=;
 b=Ch0AW4PVYKP/KtWr0Do6gwKwIwSv9Wwg+SwhS/OX3Fu1AZ8jVVB12lKrWl8KAc1KVO
 3TD35mGqC928qz73cB/qEgyEwTfTSPTdztsX6l4eNZaWqpzzJ5TxFqXJCupe9Pkww8CD
 1P51Bg6vaFPLBwoY5msk4PPSuLP5Q/qO8D9D+oxPfll5TTEK4sNkZb78v/pbK7XRoe9B
 fR1778MqjznHWMOG/jrkYET0jeiuC+rQoXkGG5bcq6p0+iVFd5pGLGbS2gA2mll+Rb2u
 GVoQY5RlqYicCIEv49klHaCsR6cbDGd8kpQ62IAdeHycsbrFeNtZI8v27VU3MwusAtFc
 aR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qDYzgz4nCnzAeAmRqFLDDh2jFjyyR2cEOET9WBNOhTQ=;
 b=njeUczVfdh+OxzBF1j/WcVYaINIlHKMolVnAoLIfLxsysl/iTx66lvS6a1NVHfiorY
 UoahhQqMMBGRXSpV07LX41q5RRqCZoHh4rHjB2Pfe1UFgMABFX/+4wyPqTOj7v901pxD
 7iFjiaaKoZ0CgSK+UeHNiJAxITFSFrFpxPtwO6GIBCKlDLEv/TkejWI4v9vSQCrLbfCb
 sOfiGYBuzXpIy/IoLjdkAMYZ4DFtknSiMaHTb5W1D1OAGp8kivrOgTViGAtWh6mHldi4
 u+CiUJf1/HJ5Uc7vxEJzjsyLWcM39exSGZQ2AmQFqIbhto+KTrGu4cAs4R4rnSqGBeLE
 S0EQ==
X-Gm-Message-State: AOAM533UdflZVsjNKIoQ8iyhfHOcKvJmVyEIR0F5QbOytuj8pPBredtF
 wb6CMLWvpXMeqF7qzha0CUFqlsPHge8=
X-Google-Smtp-Source: ABdhPJxeMmA1LeY4/YyrzsA75YGOh3SPNt4hT32uOhk904Mvvc7kD6tNZplAgmX2YcHpgLi5GqHfTw==
X-Received: by 2002:adf:bb54:: with SMTP id x20mr15218449wrg.112.1613325619857; 
 Sun, 14 Feb 2021 10:00:19 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm27879362wrs.45.2021.02.14.10.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/42] target/mips: Remove 'C790 Multimedia Instructions'
 dead code
Date: Sun, 14 Feb 2021 18:58:43 +0100
Message-Id: <20210214175912.732946-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have almost 400 lines of code full of /* TODO */ comments
which end calling gen_reserved_instruction().

As we are not going to implement them, and all the caller's
switch() default cases already call gen_reserved_instruction(),
we can remove this altogether.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 372 ----------------------------------------
 1 file changed, 372 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index cf5a6a83ae5..22d106405c6 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1970,207 +1970,12 @@ enum {
 enum {
     MMI_OPC_MADD       = 0x00 | MMI_OPC_CLASS_MMI, /* Same as OPC_MADD */
     MMI_OPC_MADDU      = 0x01 | MMI_OPC_CLASS_MMI, /* Same as OPC_MADDU */
-    MMI_OPC_PLZCW      = 0x04 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_CLASS_MMI0 = 0x08 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_CLASS_MMI2 = 0x09 | MMI_OPC_CLASS_MMI,
     MMI_OPC_MULT1      = 0x18 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MULT */
     MMI_OPC_MULTU1     = 0x19 | MMI_OPC_CLASS_MMI, /* Same min. as OPC_MULTU */
     MMI_OPC_DIV1       = 0x1A | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIV  */
     MMI_OPC_DIVU1      = 0x1B | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIVU */
     MMI_OPC_MADD1      = 0x20 | MMI_OPC_CLASS_MMI,
     MMI_OPC_MADDU1     = 0x21 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_CLASS_MMI1 = 0x28 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_CLASS_MMI3 = 0x29 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_PMFHL      = 0x30 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_PMTHL      = 0x31 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_PSLLH      = 0x34 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_PSRLH      = 0x36 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_PSRAH      = 0x37 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_PSLLW      = 0x3C | MMI_OPC_CLASS_MMI,
-    MMI_OPC_PSRLW      = 0x3E | MMI_OPC_CLASS_MMI,
-    MMI_OPC_PSRAW      = 0x3F | MMI_OPC_CLASS_MMI,
-};
-
-/*
- * MMI instructions with opcode field = MMI and bits 5..0 = MMI0:
- *
- *  31    26                        10     6 5      0
- * +--------+----------------------+--------+--------+
- * |   MMI  |                      |function|  MMI0  |
- * +--------+----------------------+--------+--------+
- *
- * function  bits 7..6
- *     bits |   0   |   1   |   2   |   3
- *    10..8 |   00  |   01  |   10  |   11
- *   -------+-------+-------+-------+-------
- *    0 000 | PADDW | PSUBW | PCGTW | PMAXW
- *    1 001 | PADDH | PSUBH | PCGTH | PMAXH
- *    2 010 | PADDB | PSUBB | PCGTB |   *
- *    3 011 |   *   |   *   |   *   |   *
- *    4 100 | PADDSW| PSUBSW| PEXTLW| PPACW
- *    5 101 | PADDSH| PSUBSH| PEXTLH| PPACH
- *    6 110 | PADDSB| PSUBSB| PEXTLB| PPACB
- *    7 111 |   *   |   *   | PEXT5 | PPAC5
- */
-
-#define MASK_MMI0(op) (MASK_OP_MAJOR(op) | ((op) & 0x7FF))
-enum {
-    MMI_OPC_0_PADDW  = (0x00 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PSUBW  = (0x01 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PCGTW  = (0x02 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PMAXW  = (0x03 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PADDH  = (0x04 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PSUBH  = (0x05 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PCGTH  = (0x06 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PMAXH  = (0x07 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PADDB  = (0x08 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PSUBB  = (0x09 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PCGTB  = (0x0A << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PADDSW = (0x10 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PSUBSW = (0x11 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PEXTLW = (0x12 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PPACW  = (0x13 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PADDSH = (0x14 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PSUBSH = (0x15 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PEXTLH = (0x16 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PPACH  = (0x17 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PADDSB = (0x18 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PSUBSB = (0x19 << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PEXTLB = (0x1A << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PPACB  = (0x1B << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PEXT5  = (0x1E << 6) | MMI_OPC_CLASS_MMI0,
-    MMI_OPC_0_PPAC5  = (0x1F << 6) | MMI_OPC_CLASS_MMI0,
-};
-
-/*
- * MMI instructions with opcode field = MMI and bits 5..0 = MMI1:
- *
- *  31    26                        10     6 5      0
- * +--------+----------------------+--------+--------+
- * |   MMI  |                      |function|  MMI1  |
- * +--------+----------------------+--------+--------+
- *
- * function  bits 7..6
- *     bits |   0   |   1   |   2   |   3
- *    10..8 |   00  |   01  |   10  |   11
- *   -------+-------+-------+-------+-------
- *    0 000 |   *   | PABSW | PCEQW | PMINW
- *    1 001 | PADSBH| PABSH | PCEQH | PMINH
- *    2 010 |   *   |   *   | PCEQB |   *
- *    3 011 |   *   |   *   |   *   |   *
- *    4 100 | PADDUW| PSUBUW| PEXTUW|   *
- *    5 101 | PADDUH| PSUBUH| PEXTUH|   *
- *    6 110 | PADDUB| PSUBUB| PEXTUB| QFSRV
- *    7 111 |   *   |   *   |   *   |   *
- */
-
-#define MASK_MMI1(op) (MASK_OP_MAJOR(op) | ((op) & 0x7FF))
-enum {
-    MMI_OPC_1_PABSW  = (0x01 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PCEQW  = (0x02 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PMINW  = (0x03 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PADSBH = (0x04 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PABSH  = (0x05 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PCEQH  = (0x06 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PMINH  = (0x07 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PCEQB  = (0x0A << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PADDUW = (0x10 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PSUBUW = (0x11 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PEXTUW = (0x12 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PADDUH = (0x14 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PSUBUH = (0x15 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PEXTUH = (0x16 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PADDUB = (0x18 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PSUBUB = (0x19 << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_PEXTUB = (0x1A << 6) | MMI_OPC_CLASS_MMI1,
-    MMI_OPC_1_QFSRV  = (0x1B << 6) | MMI_OPC_CLASS_MMI1,
-};
-
-/*
- * MMI instructions with opcode field = MMI and bits 5..0 = MMI2:
- *
- *  31    26                        10     6 5      0
- * +--------+----------------------+--------+--------+
- * |   MMI  |                      |function|  MMI2  |
- * +--------+----------------------+--------+--------+
- *
- * function  bits 7..6
- *     bits |   0   |   1   |   2   |   3
- *    10..8 |   00  |   01  |   10  |   11
- *   -------+-------+-------+-------+-------
- *    0 000 | PMADDW|   *   | PSLLVW| PSRLVW
- *    1 001 | PMSUBW|   *   |   *   |   *
- *    2 010 | PMFHI | PMFLO | PINTH |   *
- *    3 011 | PMULTW| PDIVW | PCPYLD|   *
- *    4 100 | PMADDH| PHMADH|  PAND |  PXOR
- *    5 101 | PMSUBH| PHMSBH|   *   |   *
- *    6 110 |   *   |   *   | PEXEH | PREVH
- *    7 111 | PMULTH| PDIVBW| PEXEW | PROT3W
- */
-
-#define MASK_MMI2(op) (MASK_OP_MAJOR(op) | ((op) & 0x7FF))
-enum {
-    MMI_OPC_2_PMADDW = (0x00 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PSLLVW = (0x02 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PSRLVW = (0x03 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PMSUBW = (0x04 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PMFHI  = (0x08 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PMFLO  = (0x09 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PINTH  = (0x0A << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PMULTW = (0x0C << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PDIVW  = (0x0D << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PCPYLD = (0x0E << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PMADDH = (0x10 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PHMADH = (0x11 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PAND   = (0x12 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PXOR   = (0x13 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PMSUBH = (0x14 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PHMSBH = (0x15 << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PEXEH  = (0x1A << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PREVH  = (0x1B << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PMULTH = (0x1C << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PDIVBW = (0x1D << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PEXEW  = (0x1E << 6) | MMI_OPC_CLASS_MMI2,
-    MMI_OPC_2_PROT3W = (0x1F << 6) | MMI_OPC_CLASS_MMI2,
-};
-
-/*
- * MMI instructions with opcode field = MMI and bits 5..0 = MMI3:
- *
- *  31    26                        10     6 5      0
- * +--------+----------------------+--------+--------+
- * |   MMI  |                      |function|  MMI3  |
- * +--------+----------------------+--------+--------+
- *
- * function  bits 7..6
- *     bits |   0   |   1   |   2   |   3
- *    10..8 |   00  |   01  |   10  |   11
- *   -------+-------+-------+-------+-------
- *    0 000 |PMADDUW|   *   |   *   | PSRAVW
- *    1 001 |   *   |   *   |   *   |   *
- *    2 010 | PMTHI | PMTLO | PINTEH|   *
- *    3 011 |PMULTUW| PDIVUW| PCPYUD|   *
- *    4 100 |   *   |   *   |  POR  |  PNOR
- *    5 101 |   *   |   *   |   *   |   *
- *    6 110 |   *   |   *   | PEXCH | PCPYH
- *    7 111 |   *   |   *   | PEXCW |   *
- */
-
-#define MASK_MMI3(op) (MASK_OP_MAJOR(op) | ((op) & 0x7FF))
-enum {
-    MMI_OPC_3_PMADDUW = (0x00 << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PSRAVW  = (0x03 << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PMTHI   = (0x08 << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PMTLO   = (0x09 << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PINTEH  = (0x0A << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PMULTUW = (0x0C << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PDIVUW  = (0x0D << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PCPYUD  = (0x0E << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_POR     = (0x12 << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PNOR    = (0x13 << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PEXCH   = (0x1A << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PCPYH   = (0x1B << 6) | MMI_OPC_CLASS_MMI3,
-    MMI_OPC_3_PEXCW   = (0x1E << 6) | MMI_OPC_CLASS_MMI3,
 };
 
 /* global register indices */
@@ -24713,29 +24518,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
 }
 
 
-#if defined(TARGET_MIPS64)
-
-/*
- *
- *           MMI (MultiMedia Interface) ASE instructions
- *           ===========================================
- */
-
-/*
- *          MMI instructions category: data communication
- *          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- *
- *   PCPYH    PEXCH    PEXTLB   PINTH    PPACB    PEXT5    PREVH
- *   PCPYLD   PEXCW    PEXTLH   PINTEH   PPACH    PPAC5    PROT3W
- *   PCPYUD   PEXEH    PEXTLW            PPACW
- *            PEXEW    PEXTUB
- *                     PEXTUH
- *                     PEXTUW
- */
-
-#endif
-
-
 #if !defined(TARGET_MIPS64)
 
 /* MXU accumulate add/subtract 1-bit pattern 'aptn1' */
@@ -27682,137 +27464,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
 
 #if defined(TARGET_MIPS64)
 
-static void decode_mmi0(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opc = MASK_MMI0(ctx->opcode);
-
-    switch (opc) {
-    case MMI_OPC_0_PADDW:     /* TODO: MMI_OPC_0_PADDW */
-    case MMI_OPC_0_PSUBW:     /* TODO: MMI_OPC_0_PSUBW */
-    case MMI_OPC_0_PCGTW:     /* TODO: MMI_OPC_0_PCGTW */
-    case MMI_OPC_0_PMAXW:     /* TODO: MMI_OPC_0_PMAXW */
-    case MMI_OPC_0_PADDH:     /* TODO: MMI_OPC_0_PADDH */
-    case MMI_OPC_0_PSUBH:     /* TODO: MMI_OPC_0_PSUBH */
-    case MMI_OPC_0_PCGTH:     /* TODO: MMI_OPC_0_PCGTH */
-    case MMI_OPC_0_PMAXH:     /* TODO: MMI_OPC_0_PMAXH */
-    case MMI_OPC_0_PADDB:     /* TODO: MMI_OPC_0_PADDB */
-    case MMI_OPC_0_PSUBB:     /* TODO: MMI_OPC_0_PSUBB */
-    case MMI_OPC_0_PCGTB:     /* TODO: MMI_OPC_0_PCGTB */
-    case MMI_OPC_0_PADDSW:    /* TODO: MMI_OPC_0_PADDSW */
-    case MMI_OPC_0_PSUBSW:    /* TODO: MMI_OPC_0_PSUBSW */
-    case MMI_OPC_0_PEXTLW:    /* TODO: MMI_OPC_0_PEXTLW */
-    case MMI_OPC_0_PPACW:     /* TODO: MMI_OPC_0_PPACW */
-    case MMI_OPC_0_PADDSH:    /* TODO: MMI_OPC_0_PADDSH */
-    case MMI_OPC_0_PSUBSH:    /* TODO: MMI_OPC_0_PSUBSH */
-    case MMI_OPC_0_PEXTLH:    /* TODO: MMI_OPC_0_PEXTLH */
-    case MMI_OPC_0_PPACH:     /* TODO: MMI_OPC_0_PPACH */
-    case MMI_OPC_0_PADDSB:    /* TODO: MMI_OPC_0_PADDSB */
-    case MMI_OPC_0_PSUBSB:    /* TODO: MMI_OPC_0_PSUBSB */
-    case MMI_OPC_0_PEXTLB:    /* TODO: MMI_OPC_0_PEXTLB */
-    case MMI_OPC_0_PPACB:     /* TODO: MMI_OPC_0_PPACB */
-    case MMI_OPC_0_PEXT5:     /* TODO: MMI_OPC_0_PEXT5 */
-    case MMI_OPC_0_PPAC5:     /* TODO: MMI_OPC_0_PPAC5 */
-        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI0 */
-        break;
-    default:
-        MIPS_INVAL("TX79 MMI class MMI0");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-static void decode_mmi1(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opc = MASK_MMI1(ctx->opcode);
-
-    switch (opc) {
-    case MMI_OPC_1_PABSW:     /* TODO: MMI_OPC_1_PABSW */
-    case MMI_OPC_1_PCEQW:     /* TODO: MMI_OPC_1_PCEQW */
-    case MMI_OPC_1_PMINW:     /* TODO: MMI_OPC_1_PMINW */
-    case MMI_OPC_1_PADSBH:    /* TODO: MMI_OPC_1_PADSBH */
-    case MMI_OPC_1_PABSH:     /* TODO: MMI_OPC_1_PABSH */
-    case MMI_OPC_1_PCEQH:     /* TODO: MMI_OPC_1_PCEQH */
-    case MMI_OPC_1_PMINH:     /* TODO: MMI_OPC_1_PMINH */
-    case MMI_OPC_1_PCEQB:     /* TODO: MMI_OPC_1_PCEQB */
-    case MMI_OPC_1_PADDUW:    /* TODO: MMI_OPC_1_PADDUW */
-    case MMI_OPC_1_PSUBUW:    /* TODO: MMI_OPC_1_PSUBUW */
-    case MMI_OPC_1_PEXTUW:    /* TODO: MMI_OPC_1_PEXTUW */
-    case MMI_OPC_1_PADDUH:    /* TODO: MMI_OPC_1_PADDUH */
-    case MMI_OPC_1_PSUBUH:    /* TODO: MMI_OPC_1_PSUBUH */
-    case MMI_OPC_1_PEXTUH:    /* TODO: MMI_OPC_1_PEXTUH */
-    case MMI_OPC_1_PADDUB:    /* TODO: MMI_OPC_1_PADDUB */
-    case MMI_OPC_1_PSUBUB:    /* TODO: MMI_OPC_1_PSUBUB */
-    case MMI_OPC_1_PEXTUB:    /* TODO: MMI_OPC_1_PEXTUB */
-    case MMI_OPC_1_QFSRV:     /* TODO: MMI_OPC_1_QFSRV */
-        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI1 */
-        break;
-    default:
-        MIPS_INVAL("TX79 MMI class MMI1");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-static void decode_mmi2(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opc = MASK_MMI2(ctx->opcode);
-
-    switch (opc) {
-    case MMI_OPC_2_PMADDW:    /* TODO: MMI_OPC_2_PMADDW */
-    case MMI_OPC_2_PSLLVW:    /* TODO: MMI_OPC_2_PSLLVW */
-    case MMI_OPC_2_PSRLVW:    /* TODO: MMI_OPC_2_PSRLVW */
-    case MMI_OPC_2_PMSUBW:    /* TODO: MMI_OPC_2_PMSUBW */
-    case MMI_OPC_2_PMFHI:     /* TODO: MMI_OPC_2_PMFHI */
-    case MMI_OPC_2_PMFLO:     /* TODO: MMI_OPC_2_PMFLO */
-    case MMI_OPC_2_PINTH:     /* TODO: MMI_OPC_2_PINTH */
-    case MMI_OPC_2_PMULTW:    /* TODO: MMI_OPC_2_PMULTW */
-    case MMI_OPC_2_PDIVW:     /* TODO: MMI_OPC_2_PDIVW */
-    case MMI_OPC_2_PMADDH:    /* TODO: MMI_OPC_2_PMADDH */
-    case MMI_OPC_2_PHMADH:    /* TODO: MMI_OPC_2_PHMADH */
-    case MMI_OPC_2_PAND:      /* TODO: MMI_OPC_2_PAND */
-    case MMI_OPC_2_PXOR:      /* TODO: MMI_OPC_2_PXOR */
-    case MMI_OPC_2_PMSUBH:    /* TODO: MMI_OPC_2_PMSUBH */
-    case MMI_OPC_2_PHMSBH:    /* TODO: MMI_OPC_2_PHMSBH */
-    case MMI_OPC_2_PEXEH:     /* TODO: MMI_OPC_2_PEXEH */
-    case MMI_OPC_2_PREVH:     /* TODO: MMI_OPC_2_PREVH */
-    case MMI_OPC_2_PMULTH:    /* TODO: MMI_OPC_2_PMULTH */
-    case MMI_OPC_2_PDIVBW:    /* TODO: MMI_OPC_2_PDIVBW */
-    case MMI_OPC_2_PEXEW:     /* TODO: MMI_OPC_2_PEXEW */
-    case MMI_OPC_2_PROT3W:    /* TODO: MMI_OPC_2_PROT3W */
-        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI2 */
-        break;
-    default:
-        MIPS_INVAL("TX79 MMI class MMI2");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opc = MASK_MMI3(ctx->opcode);
-
-    switch (opc) {
-    case MMI_OPC_3_PMADDUW:    /* TODO: MMI_OPC_3_PMADDUW */
-    case MMI_OPC_3_PSRAVW:     /* TODO: MMI_OPC_3_PSRAVW */
-    case MMI_OPC_3_PMTHI:      /* TODO: MMI_OPC_3_PMTHI */
-    case MMI_OPC_3_PMTLO:      /* TODO: MMI_OPC_3_PMTLO */
-    case MMI_OPC_3_PINTEH:     /* TODO: MMI_OPC_3_PINTEH */
-    case MMI_OPC_3_PMULTUW:    /* TODO: MMI_OPC_3_PMULTUW */
-    case MMI_OPC_3_PDIVUW:     /* TODO: MMI_OPC_3_PDIVUW */
-    case MMI_OPC_3_POR:        /* TODO: MMI_OPC_3_POR */
-    case MMI_OPC_3_PNOR:       /* TODO: MMI_OPC_3_PNOR */
-    case MMI_OPC_3_PEXCH:      /* TODO: MMI_OPC_3_PEXCH */
-    case MMI_OPC_3_PEXCW:      /* TODO: MMI_OPC_3_PEXCW */
-        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI3 */
-        break;
-    default:
-        MIPS_INVAL("TX79 MMI class MMI3");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
 static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
 {
     uint32_t opc = MASK_MMI(ctx->opcode);
@@ -27821,18 +27472,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     int rd = extract32(ctx->opcode, 11, 5);
 
     switch (opc) {
-    case MMI_OPC_CLASS_MMI0:
-        decode_mmi0(env, ctx);
-        break;
-    case MMI_OPC_CLASS_MMI1:
-        decode_mmi1(env, ctx);
-        break;
-    case MMI_OPC_CLASS_MMI2:
-        decode_mmi2(env, ctx);
-        break;
-    case MMI_OPC_CLASS_MMI3:
-        decode_mmi3(env, ctx);
-        break;
     case MMI_OPC_MULT1:
     case MMI_OPC_MULTU1:
     case MMI_OPC_MADD:
@@ -27845,17 +27484,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_DIVU1:
         gen_div1_tx79(ctx, opc, rs, rt);
         break;
-    case MMI_OPC_PLZCW:         /* TODO: MMI_OPC_PLZCW */
-    case MMI_OPC_PMFHL:         /* TODO: MMI_OPC_PMFHL */
-    case MMI_OPC_PMTHL:         /* TODO: MMI_OPC_PMTHL */
-    case MMI_OPC_PSLLH:         /* TODO: MMI_OPC_PSLLH */
-    case MMI_OPC_PSRLH:         /* TODO: MMI_OPC_PSRLH */
-    case MMI_OPC_PSRAH:         /* TODO: MMI_OPC_PSRAH */
-    case MMI_OPC_PSLLW:         /* TODO: MMI_OPC_PSLLW */
-    case MMI_OPC_PSRLW:         /* TODO: MMI_OPC_PSRLW */
-    case MMI_OPC_PSRAW:         /* TODO: MMI_OPC_PSRAW */
-        gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_CLASS_MMI */
-        break;
     default:
         MIPS_INVAL("TX79 MMI class");
         gen_reserved_instruction(ctx);
-- 
2.26.2


