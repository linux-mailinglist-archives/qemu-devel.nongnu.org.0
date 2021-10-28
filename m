Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B0443F215
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:53:50 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDLJ-00037H-Bw
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCgH-0001VT-Gh
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:26 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCgB-0007XW-Fq
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso5363045wmc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4+dw+1Xcz/zHwGjc+X6ZkAOJvuUJcE17DmY+cMGe3w=;
 b=CeIhF1MqicHOHjvtHsQ7n24jJ+hB/3GGssoSpfk3ccmM66infPqXPPU+aJ3056qnrt
 /b/sVWr2ph9Ijxak9RDr9qrj4YUAL9F/ayIrbM7AOwAoPCUsfwMabnmX4Ii7nICFsgb+
 qh08J5c8AG+y2lT8ilVoPAINFbz6TPrr4EglLecbtquRhLDw+oqOPVMtVRCtJRNrresi
 jFb6VaJNh5p9LYuwecoOg0i6YmEw0xYdokapnyGH21uLsNsXgclAP/V5FG3PZLpgEs7V
 6pA0BGeStn0XgOl9Jh1w2BQvmT0sLT8Y1THoY8JPsE0gUcA9SJdKyrPL4L70GkPd1V5O
 0vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R4+dw+1Xcz/zHwGjc+X6ZkAOJvuUJcE17DmY+cMGe3w=;
 b=Ed57Qhwfdho1SBUjXNDMz/IoXNgy4Np6XRVj+Xw2I60fAyvRi4CPGPG2ddMpoPQjhM
 Byy2UslB3Jbz9Upf8DkjpYPUL4cXbweFu6SDFHN9u65w6zU2LU62Ltw8MNYZcGzh5EEv
 Z8oYKqXCj/TM3BBf/7VXTj2JO8suZlITk40NYFCiUvmWyfQWhzEyJKYLOc/Jbb6oMgyq
 yklq+CUv6FHnazX1sKbcjeDkGZMANVV7NppCPQSpHajRpGe7RKNY5fu3hnfBSTZwAB8Z
 YNYmeOTq8stk7IxWbJbu21VI5pLW8sTxwuCnNgT4YE1CxoxSg8L+DlUcqcYutwSoWaqs
 7F0w==
X-Gm-Message-State: AOAM530yNYuS3J34Hs046tz0Zu3KZlXVz+m82yh0Lo7I6RTriMtWh2aO
 3fi0aeuEXzq+CEk8B+RSIX+xNcKNNV8=
X-Google-Smtp-Source: ABdhPJwTTR0U+L6byHzFbqE/8I6gJjhXufhgYCpi7tWJHKj9O7lJW/+/ydq6UzF/BgQ/qqHZkMettQ==
X-Received: by 2002:a05:600c:17d4:: with SMTP id
 y20mr11857394wmo.113.1635455477352; 
 Thu, 28 Oct 2021 14:11:17 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h17sm2312464wrp.34.2021.10.28.14.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:11:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/32] target/mips: Remove one MSA unnecessary decodetree
 overlap group
Date: Thu, 28 Oct 2021 23:08:42 +0200
Message-Id: <20211028210843.2120802-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the MSA generic opcode was overlapping with the other
instructions. Since the previous commit removed it, we can
now remove the overlap group. The decodetree script forces
us to re-indent the opcodes.

Diff trivial to review using `git-diff --ignore-all-space`.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode | 398 ++++++++++++++++++-------------------
 1 file changed, 198 insertions(+), 200 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 124768132ba..95752891956 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -56,205 +56,203 @@ BNZ_V               010001 01111  ..... ................    @bz_v
 BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
+ANDI                011110 00 ........ ..... .....  000000  @i8
+ORI                 011110 01 ........ ..... .....  000000  @i8
+NORI                011110 10 ........ ..... .....  000000  @i8
+XORI                011110 11 ........ ..... .....  000000  @i8
+BMNZI               011110 00 ........ ..... .....  000001  @i8
+BMZI                011110 01 ........ ..... .....  000001  @i8
+BSELI               011110 10 ........ ..... .....  000001  @i8
+SHF                 011110 .. ........ ..... .....  000010  @i8_df
+
+ADDVI               011110 000 .. ..... ..... ..... 000110  @u5
+SUBVI               011110 001 .. ..... ..... ..... 000110  @u5
+MAXI_S              011110 010 .. ..... ..... ..... 000110  @s5
+MAXI_U              011110 011 .. ..... ..... ..... 000110  @u5
+MINI_S              011110 100 .. ..... ..... ..... 000110  @s5
+MINI_U              011110 101 .. ..... ..... ..... 000110  @u5
+
+CEQI                011110 000 .. ..... ..... ..... 000111  @s5
+CLTI_S              011110 010 .. ..... ..... ..... 000111  @s5
+CLTI_U              011110 011 .. ..... ..... ..... 000111  @u5
+CLEI_S              011110 100 .. ..... ..... ..... 000111  @s5
+CLEI_U              011110 101 .. ..... ..... ..... 000111  @u5
+
+LDI                 011110 110 .. ..........  ..... 000111  @ldi
+
+SLLI                011110 000 ....... ..... .....  001001  @bit
+SRAI                011110 001 ....... ..... .....  001001  @bit
+SRLI                011110 010 ....... ..... .....  001001  @bit
+BCLRI               011110 011 ....... ..... .....  001001  @bit
+BSETI               011110 100 ....... ..... .....  001001  @bit
+BNEGI               011110 101 ....... ..... .....  001001  @bit
+BINSLI              011110 110 ....... ..... .....  001001  @bit
+BINSRI              011110 111 ....... ..... .....  001001  @bit
+
+SAT_S               011110 000 ....... ..... .....  001010  @bit
+SAT_U               011110 001 ....... ..... .....  001010  @bit
+SRARI               011110 010 ....... ..... .....  001010  @bit
+SRLRI               011110 011 ....... ..... .....  001010  @bit
+
+SLL                 011110 000.. ..... ..... .....  001101  @3r
+SRA                 011110 001.. ..... ..... .....  001101  @3r
+SRL                 011110 010.. ..... ..... .....  001101  @3r
+BCLR                011110 011.. ..... ..... .....  001101  @3r
+BSET                011110 100.. ..... ..... .....  001101  @3r
+BNEG                011110 101.. ..... ..... .....  001101  @3r
+BINSL               011110 110.. ..... ..... .....  001101  @3r
+BINSR               011110 111.. ..... ..... .....  001101  @3r
+
+ADDV                011110 000.. ..... ..... .....  001110  @3r
+SUBV                011110 001.. ..... ..... .....  001110  @3r
+MAX_S               011110 010.. ..... ..... .....  001110  @3r
+MAX_U               011110 011.. ..... ..... .....  001110  @3r
+MIN_S               011110 100.. ..... ..... .....  001110  @3r
+MIN_U               011110 101.. ..... ..... .....  001110  @3r
+MAX_A               011110 110.. ..... ..... .....  001110  @3r
+MIN_A               011110 111.. ..... ..... .....  001110  @3r
+
+CEQ                 011110 000.. ..... ..... .....  001111  @3r
+CLT_S               011110 010.. ..... ..... .....  001111  @3r
+CLT_U               011110 011.. ..... ..... .....  001111  @3r
+CLE_S               011110 100.. ..... ..... .....  001111  @3r
+CLE_U               011110 101.. ..... ..... .....  001111  @3r
+
+ADD_A               011110 000.. ..... ..... .....  010000  @3r
+ADDS_A              011110 001.. ..... ..... .....  010000  @3r
+ADDS_S              011110 010.. ..... ..... .....  010000  @3r
+ADDS_U              011110 011.. ..... ..... .....  010000  @3r
+AVE_S               011110 100.. ..... ..... .....  010000  @3r
+AVE_U               011110 101.. ..... ..... .....  010000  @3r
+AVER_S              011110 110.. ..... ..... .....  010000  @3r
+AVER_U              011110 111.. ..... ..... .....  010000  @3r
+
+SUBS_S              011110 000.. ..... ..... .....  010001  @3r
+SUBS_U              011110 001.. ..... ..... .....  010001  @3r
+SUBSUS_U            011110 010.. ..... ..... .....  010001  @3r
+SUBSUU_S            011110 011.. ..... ..... .....  010001  @3r
+ASUB_S              011110 100.. ..... ..... .....  010001  @3r
+ASUB_U              011110 101.. ..... ..... .....  010001  @3r
+
+MULV                011110 000.. ..... ..... .....  010010  @3r
+MADDV               011110 001.. ..... ..... .....  010010  @3r
+MSUBV               011110 010.. ..... ..... .....  010010  @3r
+DIV_S               011110 100.. ..... ..... .....  010010  @3r
+DIV_U               011110 101.. ..... ..... .....  010010  @3r
+MOD_S               011110 110.. ..... ..... .....  010010  @3r
+MOD_U               011110 111.. ..... ..... .....  010010  @3r
+
+DOTP_S              011110 000.. ..... ..... .....  010011  @3r
+DOTP_U              011110 001.. ..... ..... .....  010011  @3r
+DPADD_S             011110 010.. ..... ..... .....  010011  @3r
+DPADD_U             011110 011.. ..... ..... .....  010011  @3r
+DPSUB_S             011110 100.. ..... ..... .....  010011  @3r
+DPSUB_U             011110 101.. ..... ..... .....  010011  @3r
+
+SLD                 011110 000 .. ..... ..... ..... 010100  @3r
+SPLAT               011110 001 .. ..... ..... ..... 010100  @3r
+PCKEV               011110 010 .. ..... ..... ..... 010100  @3r
+PCKOD               011110 011 .. ..... ..... ..... 010100  @3r
+ILVL                011110 100 .. ..... ..... ..... 010100  @3r
+ILVR                011110 101 .. ..... ..... ..... 010100  @3r
+ILVEV               011110 110 .. ..... ..... ..... 010100  @3r
+ILVOD               011110 111 .. ..... ..... ..... 010100  @3r
+
+VSHF                011110 000 .. ..... ..... ..... 010101  @3r
+SRAR                011110 001 .. ..... ..... ..... 010101  @3r
+SRLR                011110 010 .. ..... ..... ..... 010101  @3r
+HADD_S              011110 100.. ..... ..... .....  010101  @3r
+HADD_U              011110 101.. ..... ..... .....  010101  @3r
+HSUB_S              011110 110.. ..... ..... .....  010101  @3r
+HSUB_U              011110 111.. ..... ..... .....  010101  @3r
+
 {
-  ANDI              011110 00 ........ ..... .....  000000  @i8
-  ORI               011110 01 ........ ..... .....  000000  @i8
-  NORI              011110 10 ........ ..... .....  000000  @i8
-  XORI              011110 11 ........ ..... .....  000000  @i8
-  BMNZI             011110 00 ........ ..... .....  000001  @i8
-  BMZI              011110 01 ........ ..... .....  000001  @i8
-  BSELI             011110 10 ........ ..... .....  000001  @i8
-  SHF               011110 .. ........ ..... .....  000010  @i8_df
-
-  ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
-  SUBVI             011110 001 .. ..... ..... ..... 000110  @u5
-  MAXI_S            011110 010 .. ..... ..... ..... 000110  @s5
-  MAXI_U            011110 011 .. ..... ..... ..... 000110  @u5
-  MINI_S            011110 100 .. ..... ..... ..... 000110  @s5
-  MINI_U            011110 101 .. ..... ..... ..... 000110  @u5
-
-  CEQI              011110 000 .. ..... ..... ..... 000111  @s5
-  CLTI_S            011110 010 .. ..... ..... ..... 000111  @s5
-  CLTI_U            011110 011 .. ..... ..... ..... 000111  @u5
-  CLEI_S            011110 100 .. ..... ..... ..... 000111  @s5
-  CLEI_U            011110 101 .. ..... ..... ..... 000111  @u5
-
-  LDI               011110 110 .. ..........  ..... 000111  @ldi
-
-  SLLI              011110 000 ....... ..... .....  001001  @bit
-  SRAI              011110 001 ....... ..... .....  001001  @bit
-  SRLI              011110 010 ....... ..... .....  001001  @bit
-  BCLRI             011110 011 ....... ..... .....  001001  @bit
-  BSETI             011110 100 ....... ..... .....  001001  @bit
-  BNEGI             011110 101 ....... ..... .....  001001  @bit
-  BINSLI            011110 110 ....... ..... .....  001001  @bit
-  BINSRI            011110 111 ....... ..... .....  001001  @bit
-
-  SAT_S             011110 000 ....... ..... .....  001010  @bit
-  SAT_U             011110 001 ....... ..... .....  001010  @bit
-  SRARI             011110 010 ....... ..... .....  001010  @bit
-  SRLRI             011110 011 ....... ..... .....  001010  @bit
-
-  SLL               011110 000.. ..... ..... .....  001101  @3r
-  SRA               011110 001.. ..... ..... .....  001101  @3r
-  SRL               011110 010.. ..... ..... .....  001101  @3r
-  BCLR              011110 011.. ..... ..... .....  001101  @3r
-  BSET              011110 100.. ..... ..... .....  001101  @3r
-  BNEG              011110 101.. ..... ..... .....  001101  @3r
-  BINSL             011110 110.. ..... ..... .....  001101  @3r
-  BINSR             011110 111.. ..... ..... .....  001101  @3r
-
-  ADDV              011110 000.. ..... ..... .....  001110  @3r
-  SUBV              011110 001.. ..... ..... .....  001110  @3r
-  MAX_S             011110 010.. ..... ..... .....  001110  @3r
-  MAX_U             011110 011.. ..... ..... .....  001110  @3r
-  MIN_S             011110 100.. ..... ..... .....  001110  @3r
-  MIN_U             011110 101.. ..... ..... .....  001110  @3r
-  MAX_A             011110 110.. ..... ..... .....  001110  @3r
-  MIN_A             011110 111.. ..... ..... .....  001110  @3r
-
-  CEQ               011110 000.. ..... ..... .....  001111  @3r
-  CLT_S             011110 010.. ..... ..... .....  001111  @3r
-  CLT_U             011110 011.. ..... ..... .....  001111  @3r
-  CLE_S             011110 100.. ..... ..... .....  001111  @3r
-  CLE_U             011110 101.. ..... ..... .....  001111  @3r
-
-  ADD_A             011110 000.. ..... ..... .....  010000  @3r
-  ADDS_A            011110 001.. ..... ..... .....  010000  @3r
-  ADDS_S            011110 010.. ..... ..... .....  010000  @3r
-  ADDS_U            011110 011.. ..... ..... .....  010000  @3r
-  AVE_S             011110 100.. ..... ..... .....  010000  @3r
-  AVE_U             011110 101.. ..... ..... .....  010000  @3r
-  AVER_S            011110 110.. ..... ..... .....  010000  @3r
-  AVER_U            011110 111.. ..... ..... .....  010000  @3r
-
-  SUBS_S            011110 000.. ..... ..... .....  010001  @3r
-  SUBS_U            011110 001.. ..... ..... .....  010001  @3r
-  SUBSUS_U          011110 010.. ..... ..... .....  010001  @3r
-  SUBSUU_S          011110 011.. ..... ..... .....  010001  @3r
-  ASUB_S            011110 100.. ..... ..... .....  010001  @3r
-  ASUB_U            011110 101.. ..... ..... .....  010001  @3r
-
-  MULV              011110 000.. ..... ..... .....  010010  @3r
-  MADDV             011110 001.. ..... ..... .....  010010  @3r
-  MSUBV             011110 010.. ..... ..... .....  010010  @3r
-  DIV_S             011110 100.. ..... ..... .....  010010  @3r
-  DIV_U             011110 101.. ..... ..... .....  010010  @3r
-  MOD_S             011110 110.. ..... ..... .....  010010  @3r
-  MOD_U             011110 111.. ..... ..... .....  010010  @3r
-
-  DOTP_S            011110 000.. ..... ..... .....  010011  @3r
-  DOTP_U            011110 001.. ..... ..... .....  010011  @3r
-  DPADD_S           011110 010.. ..... ..... .....  010011  @3r
-  DPADD_U           011110 011.. ..... ..... .....  010011  @3r
-  DPSUB_S           011110 100.. ..... ..... .....  010011  @3r
-  DPSUB_U           011110 101.. ..... ..... .....  010011  @3r
-
-  SLD               011110 000 .. ..... ..... ..... 010100  @3r
-  SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
-  PCKEV             011110 010 .. ..... ..... ..... 010100  @3r
-  PCKOD             011110 011 .. ..... ..... ..... 010100  @3r
-  ILVL              011110 100 .. ..... ..... ..... 010100  @3r
-  ILVR              011110 101 .. ..... ..... ..... 010100  @3r
-  ILVEV             011110 110 .. ..... ..... ..... 010100  @3r
-  ILVOD             011110 111 .. ..... ..... ..... 010100  @3r
-
-  VSHF              011110 000 .. ..... ..... ..... 010101  @3r
-  SRAR              011110 001 .. ..... ..... ..... 010101  @3r
-  SRLR              011110 010 .. ..... ..... ..... 010101  @3r
-  HADD_S            011110 100.. ..... ..... .....  010101  @3r
-  HADD_U            011110 101.. ..... ..... .....  010101  @3r
-  HSUB_S            011110 110.. ..... ..... .....  010101  @3r
-  HSUB_U            011110 111.. ..... ..... .....  010101  @3r
-
-  {
-    CTCMSA          011110 0000111110  ..... .....  011001  @elm
-    SLDI            011110 0000 ...... ..... .....  011001  @elm_df
-  }
-  {
-    CFCMSA          011110 0001111110  ..... .....  011001  @elm
-    SPLATI          011110 0001 ...... ..... .....  011001  @elm_df
-  }
-  {
-    MOVE_V          011110 0010111110  ..... .....  011001  @elm
-    COPY_S          011110 0010 ...... ..... .....  011001  @elm_df
-  }
-  COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
-  INSERT            011110 0100 ...... ..... .....  011001  @elm_df
-  INSVE             011110 0101 ...... ..... .....  011001  @elm_df
-
-  FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
-  FCUN              011110 0001 . ..... ..... ..... 011010  @3rf_w
-  FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf_w
-  FCUEQ             011110 0011 . ..... ..... ..... 011010  @3rf_w
-  FCLT              011110 0100 . ..... ..... ..... 011010  @3rf_w
-  FCULT             011110 0101 . ..... ..... ..... 011010  @3rf_w
-  FCLE              011110 0110 . ..... ..... ..... 011010  @3rf_w
-  FCULE             011110 0111 . ..... ..... ..... 011010  @3rf_w
-  FSAF              011110 1000 . ..... ..... ..... 011010  @3rf_w
-  FSUN              011110 1001 . ..... ..... ..... 011010  @3rf_w
-  FSEQ              011110 1010 . ..... ..... ..... 011010  @3rf_w
-  FSUEQ             011110 1011 . ..... ..... ..... 011010  @3rf_w
-  FSLT              011110 1100 . ..... ..... ..... 011010  @3rf_w
-  FSULT             011110 1101 . ..... ..... ..... 011010  @3rf_w
-  FSLE              011110 1110 . ..... ..... ..... 011010  @3rf_w
-  FSULE             011110 1111 . ..... ..... ..... 011010  @3rf_w
-
-  FADD              011110 0000 . ..... ..... ..... 011011  @3rf_w
-  FSUB              011110 0001 . ..... ..... ..... 011011  @3rf_w
-  FMUL              011110 0010 . ..... ..... ..... 011011  @3rf_w
-  FDIV              011110 0011 . ..... ..... ..... 011011  @3rf_w
-  FMADD             011110 0100 . ..... ..... ..... 011011  @3rf_w
-  FMSUB             011110 0101 . ..... ..... ..... 011011  @3rf_w
-  FEXP2             011110 0111 . ..... ..... ..... 011011  @3rf_w
-  FEXDO             011110 1000 . ..... ..... ..... 011011  @3rf_w
-  FTQ               011110 1010 . ..... ..... ..... 011011  @3rf_w
-  FMIN              011110 1100 . ..... ..... ..... 011011  @3rf_w
-  FMIN_A            011110 1101 . ..... ..... ..... 011011  @3rf_w
-  FMAX              011110 1110 . ..... ..... ..... 011011  @3rf_w
-  FMAX_A            011110 1111 . ..... ..... ..... 011011  @3rf_w
-
-  FCOR              011110 0001 . ..... ..... ..... 011100  @3rf_w
-  FCUNE             011110 0010 . ..... ..... ..... 011100  @3rf_w
-  FCNE              011110 0011 . ..... ..... ..... 011100  @3rf_w
-  MUL_Q             011110 0100 . ..... ..... ..... 011100  @3rf_h
-  MADD_Q            011110 0101 . ..... ..... ..... 011100  @3rf_h
-  MSUB_Q            011110 0110 . ..... ..... ..... 011100  @3rf_h
-  FSOR              011110 1001 . ..... ..... ..... 011100  @3rf_w
-  FSUNE             011110 1010 . ..... ..... ..... 011100  @3rf_w
-  FSNE              011110 1011 . ..... ..... ..... 011100  @3rf_w
-  MULR_Q            011110 1100 . ..... ..... ..... 011100  @3rf_h
-  MADDR_Q           011110 1101 . ..... ..... ..... 011100  @3rf_h
-  MSUBR_Q           011110 1110 . ..... ..... ..... 011100  @3rf_h
-
-  AND_V             011110 00000 ..... ..... .....  011110  @vec
-  OR_V              011110 00001 ..... ..... .....  011110  @vec
-  NOR_V             011110 00010 ..... ..... .....  011110  @vec
-  XOR_V             011110 00011 ..... ..... .....  011110  @vec
-  BMNZ_V            011110 00100 ..... ..... .....  011110  @vec
-  BMZ_V             011110 00101 ..... ..... .....  011110  @vec
-  BSEL_V            011110 00110 ..... ..... .....  011110  @vec
-  FILL              011110 11000000 .. ..... .....  011110  @2r
-  PCNT              011110 11000001 .. ..... .....  011110  @2r
-  NLOC              011110 11000010 .. ..... .....  011110  @2r
-  NLZC              011110 11000011 .. ..... .....  011110  @2r
-  FCLASS            011110 110010000 . ..... .....  011110  @2rf
-  FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
-  FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
-  FSQRT             011110 110010011 . ..... .....  011110  @2rf
-  FRSQRT            011110 110010100 . ..... .....  011110  @2rf
-  FRCP              011110 110010101 . ..... .....  011110  @2rf
-  FRINT             011110 110010110 . ..... .....  011110  @2rf
-  FLOG2             011110 110010111 . ..... .....  011110  @2rf
-  FEXUPL            011110 110011000 . ..... .....  011110  @2rf
-  FEXUPR            011110 110011001 . ..... .....  011110  @2rf
-  FFQL              011110 110011010 . ..... .....  011110  @2rf
-  FFQR              011110 110011011 . ..... .....  011110  @2rf
-  FTINT_S           011110 110011100 . ..... .....  011110  @2rf
-  FTINT_U           011110 110011101 . ..... .....  011110  @2rf
-  FFINT_S           011110 110011110 . ..... .....  011110  @2rf
-  FFINT_U           011110 110011111 . ..... .....  011110  @2rf
-
-  LD                011110 .......... ..... .....   1000 .. @ldst
-  ST                011110 .......... ..... .....   1001 .. @ldst
+  CTCMSA            011110 0000111110  ..... .....  011001  @elm
+  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
 }
+{
+  CFCMSA            011110 0001111110  ..... .....  011001  @elm
+  SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+}
+{
+  MOVE_V            011110 0010111110  ..... .....  011001  @elm
+  COPY_S            011110 0010 ...... ..... .....  011001  @elm_df
+}
+COPY_U              011110 0011 ...... ..... .....  011001  @elm_df
+INSERT              011110 0100 ...... ..... .....  011001  @elm_df
+INSVE               011110 0101 ...... ..... .....  011001  @elm_df
+
+FCAF                011110 0000 . ..... ..... ..... 011010  @3rf_w
+FCUN                011110 0001 . ..... ..... ..... 011010  @3rf_w
+FCEQ                011110 0010 . ..... ..... ..... 011010  @3rf_w
+FCUEQ               011110 0011 . ..... ..... ..... 011010  @3rf_w
+FCLT                011110 0100 . ..... ..... ..... 011010  @3rf_w
+FCULT               011110 0101 . ..... ..... ..... 011010  @3rf_w
+FCLE                011110 0110 . ..... ..... ..... 011010  @3rf_w
+FCULE               011110 0111 . ..... ..... ..... 011010  @3rf_w
+FSAF                011110 1000 . ..... ..... ..... 011010  @3rf_w
+FSUN                011110 1001 . ..... ..... ..... 011010  @3rf_w
+FSEQ                011110 1010 . ..... ..... ..... 011010  @3rf_w
+FSUEQ               011110 1011 . ..... ..... ..... 011010  @3rf_w
+FSLT                011110 1100 . ..... ..... ..... 011010  @3rf_w
+FSULT               011110 1101 . ..... ..... ..... 011010  @3rf_w
+FSLE                011110 1110 . ..... ..... ..... 011010  @3rf_w
+FSULE               011110 1111 . ..... ..... ..... 011010  @3rf_w
+
+FADD                011110 0000 . ..... ..... ..... 011011  @3rf_w
+FSUB                011110 0001 . ..... ..... ..... 011011  @3rf_w
+FMUL                011110 0010 . ..... ..... ..... 011011  @3rf_w
+FDIV                011110 0011 . ..... ..... ..... 011011  @3rf_w
+FMADD               011110 0100 . ..... ..... ..... 011011  @3rf_w
+FMSUB               011110 0101 . ..... ..... ..... 011011  @3rf_w
+FEXP2               011110 0111 . ..... ..... ..... 011011  @3rf_w
+FEXDO               011110 1000 . ..... ..... ..... 011011  @3rf_w
+FTQ                 011110 1010 . ..... ..... ..... 011011  @3rf_w
+FMIN                011110 1100 . ..... ..... ..... 011011  @3rf_w
+FMIN_A              011110 1101 . ..... ..... ..... 011011  @3rf_w
+FMAX                011110 1110 . ..... ..... ..... 011011  @3rf_w
+FMAX_A              011110 1111 . ..... ..... ..... 011011  @3rf_w
+
+FCOR                011110 0001 . ..... ..... ..... 011100  @3rf_w
+FCUNE               011110 0010 . ..... ..... ..... 011100  @3rf_w
+FCNE                011110 0011 . ..... ..... ..... 011100  @3rf_w
+MUL_Q               011110 0100 . ..... ..... ..... 011100  @3rf_h
+MADD_Q              011110 0101 . ..... ..... ..... 011100  @3rf_h
+MSUB_Q              011110 0110 . ..... ..... ..... 011100  @3rf_h
+FSOR                011110 1001 . ..... ..... ..... 011100  @3rf_w
+FSUNE               011110 1010 . ..... ..... ..... 011100  @3rf_w
+FSNE                011110 1011 . ..... ..... ..... 011100  @3rf_w
+MULR_Q              011110 1100 . ..... ..... ..... 011100  @3rf_h
+MADDR_Q             011110 1101 . ..... ..... ..... 011100  @3rf_h
+MSUBR_Q             011110 1110 . ..... ..... ..... 011100  @3rf_h
+
+AND_V               011110 00000 ..... ..... .....  011110  @vec
+OR_V                011110 00001 ..... ..... .....  011110  @vec
+NOR_V               011110 00010 ..... ..... .....  011110  @vec
+XOR_V               011110 00011 ..... ..... .....  011110  @vec
+BMNZ_V              011110 00100 ..... ..... .....  011110  @vec
+BMZ_V               011110 00101 ..... ..... .....  011110  @vec
+BSEL_V              011110 00110 ..... ..... .....  011110  @vec
+FILL                011110 11000000 .. ..... .....  011110  @2r
+PCNT                011110 11000001 .. ..... .....  011110  @2r
+NLOC                011110 11000010 .. ..... .....  011110  @2r
+NLZC                011110 11000011 .. ..... .....  011110  @2r
+FCLASS              011110 110010000 . ..... .....  011110  @2rf
+FTRUNC_S            011110 110010001 . ..... .....  011110  @2rf
+FTRUNC_U            011110 110010010 . ..... .....  011110  @2rf
+FSQRT               011110 110010011 . ..... .....  011110  @2rf
+FRSQRT              011110 110010100 . ..... .....  011110  @2rf
+FRCP                011110 110010101 . ..... .....  011110  @2rf
+FRINT               011110 110010110 . ..... .....  011110  @2rf
+FLOG2               011110 110010111 . ..... .....  011110  @2rf
+FEXUPL              011110 110011000 . ..... .....  011110  @2rf
+FEXUPR              011110 110011001 . ..... .....  011110  @2rf
+FFQL                011110 110011010 . ..... .....  011110  @2rf
+FFQR                011110 110011011 . ..... .....  011110  @2rf
+FTINT_S             011110 110011100 . ..... .....  011110  @2rf
+FTINT_U             011110 110011101 . ..... .....  011110  @2rf
+FFINT_S             011110 110011110 . ..... .....  011110  @2rf
+FFINT_U             011110 110011111 . ..... .....  011110  @2rf
+
+LD                  011110 .......... ..... .....   1000 .. @ldst
+ST                  011110 .......... ..... .....   1001 .. @ldst
-- 
2.31.1


