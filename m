Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CB2D082C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:47:26 +0100 (CET)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3kT-0002Pj-5F
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3de-0005NG-GQ
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:22 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dR-0007T3-9g
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:22 -0500
Received: by mail-wm1-x341.google.com with SMTP id 3so12019517wmg.4
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XM32sGEjA2NXWYAKzKhgTdbipbFOwi76R5qWtxt4kUc=;
 b=Ncs0+H+gQE1fr7o37GxbbjzKAZ+KHNVELm8jGKBgLMS+T/eVT5HpkqSY3FCkmUAwnt
 VZXhyiZBQqwAByA1gEh9z5JxlveDyWZhhx1CYEAbGocruA52FLckPeYZe5+lidCB9L/d
 ztwDbNjqxhB0/xUuyb5MDVTp5Opjg6Gq6aJL1sG21723zjoXQQdpu0yu2x153r2Fc9NM
 U4j37LoiN9DzIwlIbY5QrdEO6U6pqLpnVaKZhcZwm9NwIBMsNR8rbPdLZ6ETAtC6pDh/
 8QfoR59ntau1MwlvfkhXk42Z/vZRCzRQXPSol/45BGTF9jneakXaZEcL/s8pc4gyWzK9
 CvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XM32sGEjA2NXWYAKzKhgTdbipbFOwi76R5qWtxt4kUc=;
 b=rCNkOEF8fm7b2k/PQHuMUEm/YuRvnLc5RUysI2z6iYaO+A0ytU+NVWT4AQNYDOJvBd
 kvmRHvDXz1524k2v5ngXwT1clNctp0JU7xwZ+vJ3wFGo5whtXKFG5lovRyqLsLvhg53m
 8nrW7YWk+eELf/FGby1AzSZwXBueaY7NNceSsHeklEqQK02WOihmhWYt8MOPACmDgyBZ
 iu3AEmNAMSE1OA4jnwE+UNK4oy/8lvJ5XSFs0YAvVgp/Th23hdNom2i13dMrEXsZdIuu
 Te4QKTeyn+3gxVJYerl4s39ChQxuMqqa7lnHXffOPAQv+NMc3zwqZ+vbSW8EK7AfIvyk
 CHpQ==
X-Gm-Message-State: AOAM533SzRfbbODuPhsvi1Q6SX1218v59FOAJw23Ms8x7xsOHs/qjBTs
 wgVqalkhTwxfm63xfU2cmSsT8CFMJe8=
X-Google-Smtp-Source: ABdhPJxlh5IC/oOpnriO1JnFl0cFXBOn29HlgUnDWDg1BSvBhFrPq93YsA0bYQ3pF4kE7N3nTcYigg==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr15169430wmj.171.1607298007613; 
 Sun, 06 Dec 2020 15:40:07 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 64sm11892213wmd.12.2020.12.06.15.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/19] target/mips: Remove unused headers from fpu_helper.c
Date: Mon,  7 Dec 2020 00:39:33 +0100
Message-Id: <20201206233949.3783184-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/fpu_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 020b768e87b..956e3417d0f 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -21,15 +21,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
-#include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "exec/memop.h"
-#include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
 
 
-- 
2.26.2


