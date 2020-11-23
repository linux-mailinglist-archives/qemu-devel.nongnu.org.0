Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B12C1717
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:05:02 +0100 (CET)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ1B-0002p6-Px
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIiG-0001C2-TC
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:28 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIiF-0001Nu-5T
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id l1so20093930wrb.9
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=euDk/VwCIM7OUksohionL4dhEPJJf8PLdnfc9cMimOk=;
 b=k0RollmFNFEcMFYAgQDmxERkdTFH3EWECJ1gz3QSQiNXxHEUZuunbi8sc/kVnOWGoI
 YQZuoVSY4v6mY8hqqQU2IZdKsREpwT+YYTMgRiu8jxWeQzG2JVmme3ylUiLaQuNWotbb
 HoMMyQebOhlKpO5AmmsYc40qyoYsO2gs4i501iJ7Fqrg4o4Vb6fGHa8xZl0G5uLIs+9G
 1G7rySqOD8O76Dzm1LHrD0KqoOdkySQo5+yp5NDy0o+eJKj4aMtXdbjZR0MRJvY8diLo
 78Wk7r6A3IBJbKbFeR2is+LOzx4YG7pdnqm7xVDpjJ1LAuC0HOmpXXjZypWQ3SZo0vTF
 ZTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=euDk/VwCIM7OUksohionL4dhEPJJf8PLdnfc9cMimOk=;
 b=Xgzm6OPCYHd218DztfPX/eARwASsX1uVHo5hZ+OpsuwhDbbGVUC+IPYlopprl0Sc/L
 8KzdZB9UVR9Dx9EnbsCmz1xnp2BoitqEgcwz05pJ1t5k7oP/7gDKMUNqXjFxd+ZHN+xY
 DtzZ8T/JPtHcjOVpQhE22gRlJssPRe2ahzyfLBEdSjVN/EtIyeuYPty4G7S3DwN60Fwa
 ULb8sFI8uM8cjUoqjZWw9oH81fH8f4/1k8tGkRE2aV/TZlNkvBd+DN5XkVL5/B5A/jod
 FvOVl7P2JbcvPqsJlDMynZ2xaYAcEiBPoUA03qaoie+yDK1PxEuSkV6vjx/0kLXjmsmQ
 8sRg==
X-Gm-Message-State: AOAM532MbawNjNBfO3qSLRXaciJFFoi13sPQs8D4ZZIJJ7v9BwFcxdY1
 s23NqPQD/5EvpUMUQwqn567X3rXNoEE=
X-Google-Smtp-Source: ABdhPJzu8PfIM6P4hMxgBXKaAlw9mEbkVxncg0bysjEiLGFJlqIFow+OWtPZJJHuuEJM6CkLVWrYiw==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr1500876wrp.186.1606164325553; 
 Mon, 23 Nov 2020 12:45:25 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id f2sm23173317wre.63.2020.11.23.12.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:45:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/28] target/mips: Rename dsp_helper.c as mod-dsp_helper.c
Date: Mon, 23 Nov 2020 21:44:27 +0100
Message-Id: <20201123204448.3260804-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'MIPS DSP' is defined as a Module by MIPS, rename it as
mod-dsp_helper.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201120210844.2625602-6-f4bug@amsat.org>
---
 target/mips/{dsp_helper.c => mod-dsp_helper.c} | 2 ++
 target/mips/meson.build                        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename target/mips/{dsp_helper.c => mod-dsp_helper.c} (99%)

diff --git a/target/mips/dsp_helper.c b/target/mips/mod-dsp_helper.c
similarity index 99%
rename from target/mips/dsp_helper.c
rename to target/mips/mod-dsp_helper.c
index 09b6e5fb15a..10a965bd20d 100644
--- a/target/mips/dsp_helper.c
+++ b/target/mips/mod-dsp_helper.c
@@ -15,6 +15,8 @@
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
  */
 
 #include "qemu/osdep.h"
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 35dbbbf6519..aa6ac67df76 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,12 +1,12 @@
 mips_ss = ss.source_set()
 mips_ss.add(files(
   'cpu.c',
-  'dsp_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
   'lmmi_helper.c',
   'op_helper.c',
+  'mod-dsp_helper.c',
   'mod-msa_helper.c',
 
   'translate.c',
-- 
2.26.2


