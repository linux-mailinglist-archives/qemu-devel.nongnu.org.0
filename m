Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89052EE8E0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:40:48 +0100 (CET)
Received: from localhost ([::1]:49294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdxX-0007fH-OB
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiJ-0000Vo-Mf
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:03 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiI-0005L0-8b
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:03 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a12so7099533wrv.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gI14Ji2kQ24pI0kCRkP9vvsGbZB3n+f8o62PO5KS7K4=;
 b=c7qDgjfesbw0fPKyUWabRn2PZk1yUuEoxi3oAC3tSzPrvSRdHkJFwMBEsrr4rEZiYa
 f3fwfxvE7zy71dHQpv3Zlyvn6d02pbrv2irtq60wtvFQJ2U9dyO81PQkJSEiaOc0bOc3
 8UGOO1iYZDSpTfH9Qx8/EmQ9E5a16WuuWn4t0otSOVxODo2qgRx2cDYq37jdh1bA3EOg
 98Q5na4Gf/Z9i+DkfI6yE8J7dnW7YdP0E0jwcALz2Bwob9I1b4cPvRKDK3KlTCDBt9M6
 0yR24vOnyTVHyLd18TPjlialzASY4nT9G2dDrxJgdByH3ofWnz1MQFBwEn9QrmYbelVi
 IBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gI14Ji2kQ24pI0kCRkP9vvsGbZB3n+f8o62PO5KS7K4=;
 b=HfFzo/bKsf9gF9jCgo1pDjvhWEpMcOTRYzdtuYOLL2O86XleVp/Vv/P8zAjkAlu5Bq
 ItY7SavDBWgpUidj2IhmupMaf4Vn2NLs4NIbGtKLnHDXNpPVlFg+GgKyyn3VEWLGhTs4
 r15a0Sjsq06XzCpqr0MF+CuIVTdsGkHr7aCzc2ee3qDq+0kuP2atkTbCxh/qgBGwVayU
 mdnWzAzTY8SacspTjCA+nmfG4NjBoSfKxmhplB5z6orIAngVUAMmgnS3QJ4MzxSlNDsf
 Sn5O13sSWMfzWrks3tFingCvUYAfO3sZC1wqBG2vBBKeclkSW2ZWhSpTMhd4wbccJGY7
 qkPQ==
X-Gm-Message-State: AOAM533JuaAlAg1BURzmUaxwlqGT5hjCj+8uHEnXUlLSiCFMVUuJrBB3
 0o21jCrsqHdFymZk+X7aFRh1SXvxNWs=
X-Google-Smtp-Source: ABdhPJw15tAhDZ4T7gT3ayIVkuqHqqJlWYyDvjljJaWQJpFYLDbZMgZTYcpXwM5yCxkV09NCfHPK3Q==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr667290wrr.61.1610058300729;
 Thu, 07 Jan 2021 14:25:00 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id h9sm9773734wme.11.2021.01.07.14.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/66] target/mips: Rename helper.c as tlb_helper.c
Date: Thu,  7 Jan 2021 23:22:11 +0100
Message-Id: <20210107222253.20382-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

This file contains functions related to TLB management,
rename it as 'tlb_helper.c'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-13-f4bug@amsat.org>
---
 target/mips/{helper.c => tlb_helper.c} | 2 +-
 target/mips/meson.build                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/mips/{helper.c => tlb_helper.c} (99%)

diff --git a/target/mips/helper.c b/target/mips/tlb_helper.c
similarity index 99%
rename from target/mips/helper.c
rename to target/mips/tlb_helper.c
index 68804b84b15..b02c0479e79 100644
--- a/target/mips/helper.c
+++ b/target/mips/tlb_helper.c
@@ -1,5 +1,5 @@
 /*
- *  MIPS emulation helpers for qemu.
+ * MIPS TLB (Translation lookaside buffer) helpers.
  *
  *  Copyright (c) 2004-2005 Jocelyn Mayer
  *
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 4179395a8ea..5a49951c6d7 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -4,10 +4,10 @@
   'dsp_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
-  'helper.c',
   'lmmi_helper.c',
   'msa_helper.c',
   'op_helper.c',
+  'tlb_helper.c',
   'translate.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-- 
2.26.2


