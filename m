Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8052EE8B5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:32:08 +0100 (CET)
Received: from localhost ([::1]:44550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdp9-0001ah-8A
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhE-0007Xr-EU
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:56 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhC-0004u8-Ut
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:56 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c5so7104783wrp.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sk0GjPOwaKw1OtxDzWJCyQVWdlOOm+hBJhH4fWESj5c=;
 b=Ss0ycgCC5JZfXAux5JSOCrB+Q7Y5oqbTi5F+SEeySab4XeeCqTXtN/8qp6l0WDGpKd
 KXuq5mhizBunxtgT+Er8zJ1orH4OQwEjnRAk2iPfdq+HWF7BRrXxXEZJOQKKu6iol899
 WZWTnN2JizHSe6SSJXtNJwngopejB7ndJUtWMqgWW536xbtkVaLgmVR2+1A6hd/R0zax
 LTrpT5inlf3doNGpekfnDOZaEVZf056NLjMbj8Yh7KLIDk5Ruk6RRKy4s0l8/jARVSsj
 YwVP0MIx/OOp708ZCZvMlKYFEzHGb55D5mRGwJueAFt0Ph20MC/Sq7arfh8KOC4Pu79+
 Oytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sk0GjPOwaKw1OtxDzWJCyQVWdlOOm+hBJhH4fWESj5c=;
 b=Ef7X+nMPru0FCu+am6ZNTFkuxVGvr5Pvd5mUkRnC7s2oudSkXIBezK9CD+P/e297F5
 qZiV+tQLd7i9Pnb42946MLeBPKgjx5mZWUU3C42TIZ+UTng1lAVSuSv0Xp6cHdn52jAN
 beSfM67C7vLAQ+oMTvp6VlA2AMqHwUKXf8IOx6xAR45Mem8ljJaEmzkbx/lZFtzvTzoC
 8dDGYtgnFayaf9jyqQykWO+dKjXgLMvXhtcVTwKpZxpsVtjTY9Fq65PMpgXPH3YaJlfI
 uCtweBWoGloLX5YfMLIE9UcMHCjdHzjRosvjsJTwcUtSQ6b0YZA+i+CGd4xd8EcUjKAJ
 bMQw==
X-Gm-Message-State: AOAM5338DJxHdchn6dnZbLtheHicf6Wfdk7A2eKoEKRuS8imS9OzRvvx
 oML6mEh3SihS8TLIBef2TaDEikPOd+A=
X-Google-Smtp-Source: ABdhPJxfMY/2VlzrtrNQv5zadl7d7OP9CwGcm/sT/2JQXSTpWmw1iz3t3qwI+FOR73I7mUwUdKKAgA==
X-Received: by 2002:adf:e688:: with SMTP id r8mr687398wrm.20.1610058233425;
 Thu, 07 Jan 2021 14:23:53 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id j9sm9990483wrm.14.2021.01.07.14.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/66] target/mips/mips-defs: Use ISA_MIPS32R3 definition to
 check Release 3
Date: Thu,  7 Jan 2021 23:21:58 +0100
Message-Id: <20210107222253.20382-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R3 definition to check if the Release 3
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R3 in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210104221154.3127610-9-f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index b36b59c12d3..ccdde0b4a43 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -19,7 +19,6 @@
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
-#define ISA_MIPS64R3      0x0000000000000400ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS64R5      0x0000000000001000ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
@@ -81,7 +80,7 @@
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
-#define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3 | ISA_MIPS64R3)
+#define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
 #define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
-- 
2.26.2


