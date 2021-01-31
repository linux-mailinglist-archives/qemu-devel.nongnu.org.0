Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07B309BD1
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 13:04:47 +0100 (CET)
Received: from localhost ([::1]:53002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BTD-0003yp-1R
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 07:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BGE-0002Q7-QT; Sun, 31 Jan 2021 06:51:23 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BGD-0005bk-By; Sun, 31 Jan 2021 06:51:22 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i9so10772050wmq.1;
 Sun, 31 Jan 2021 03:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
 b=gl98KYub5B29/tDooPia1xnr8+DmGiIx/UpfjZiG2dzed7ztMbOcE8dmG/zmD7gDo/
 m3xjb2iOLwq4AAnp936pJB2UouZ3Pp0jvFX0EsfKlRJ2IQmdAGNbxE9BodCmgzqA3Ct0
 TLXHEvox2NBLbAcOgZDzUhtVagwSvVh+EsbIlZWKE051QySQy3QpembGI0HzfLJ9puRy
 Xc9uTGEJSYwRLljm4PblNNWj8OU/kwtZNbNwvbfxiI6dFrNbjLw1T9pEqCv3Q5LxRi+F
 3FtUQXdmzCR18IAHolP9KhcEobiw7hrsRc8eUqk1F42n4Xisy1QOrEZgC5TAU0cnF0oB
 3m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
 b=b2305I7zuNVkH0Lqk4Wu9GEhH81yTeKdq7hyiP+2wLkB77o7fFYW023+kPAaPD+QIE
 p+nr1g86YqCyj7jK9JEscVPuKHHtY/P06iWT4dV/3m77Cjlh6JMw/0S2rEQymia67Qiu
 W9yk2l5Qq8whXXQiugI2A/CB4kJYdWrZqgoG2io+VCuzoNk6fT30x4UmQCQuhMNDCtYu
 1lMpLy0kT610Rvot6Bj2jZC14YZu7CUul5uh9Hs16DRKCQUaqFJOlw+BbO8PZoDoQTjo
 zIYyUXcNQGpp2D99U0NwiSM8ctZtoPgLNmHJdlODwf3RjnxeAyUsl18I20GPYY2Bsoo3
 ioKw==
X-Gm-Message-State: AOAM532DDNuDnLBj/sQXU5LtijNil4qKNEcMRgsEH6j3OioLzw1JSkLm
 3jwNsZF+H3Us6YsZsh0aMYFgfwYk8UA=
X-Google-Smtp-Source: ABdhPJy9DTxPrkq+mLcZ2GZAl5OyfPZtxNOXX4s39rpFzMKgY9kX7aWG61oNhcsR+ZIgBSBAHI6dug==
X-Received: by 2002:a05:600c:210b:: with SMTP id
 u11mr11134979wml.16.1612093875310; 
 Sun, 31 Jan 2021 03:51:15 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r16sm1563538wrt.68.2021.01.31.03.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:51:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/11] target/arm: Reorder meson.build rules
Date: Sun, 31 Jan 2021 12:50:20 +0100
Message-Id: <20210131115022.242570-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reorder the rules to make this file easier to modify.
No logical change introduced in this commit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/meson.build | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6c6081966cd..aac9a383a61 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -14,31 +14,36 @@
 
 arm_ss = ss.source_set()
 arm_ss.add(gen)
+arm_ss.add(zlib)
 arm_ss.add(files(
   'cpu.c',
-  'crypto_helper.c',
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
+  'vfp_helper.c',
+))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c',
+))
+
+arm_ss.add(files(
+  'crypto_helper.c',
+  'debug_helper.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
   'translate.c',
   'vec_helper.c',
-  'vfp_helper.c',
   'cpu_tcg.c',
 ))
-arm_ss.add(zlib)
-
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
 arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
 
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-  'cpu64.c',
-  'gdbstub64.c',
   'helper-a64.c',
   'mte_helper.c',
   'pauth_helper.c',
-- 
2.26.2


