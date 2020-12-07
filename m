Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5B2D1EB8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:01:26 +0100 (CET)
Received: from localhost ([::1]:56220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQRZ-0000Rl-Uc
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMV-0004P7-PP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:56:11 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMT-0004Gm-9T
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:56:11 -0500
Received: by mail-ej1-x644.google.com with SMTP id x16so22046476ejj.7
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fXIIajBmYb1UTSbWfTKRq6sJ1Saykn5Ztt68M0JOMdc=;
 b=OQ0aZVig5WznsdWT71WWazlA6LanlAzD7zkuFKg5rPC09Pnk4r0TedIAM8S5PJcsJ0
 PBNo3lPkvEOQ9PfXxA3WfjKWAFc8KI+mtPvMUB1jEw4mnl7VpplxxraeHwTW8W2UE0lA
 F9Om+8mc1pX/rmEIo7w7LYTVnV1veaj2T50LeQypiWqdOSw8CR6IfMT5sDc25NGdfSAs
 l32RaOECFmLhFDuS+x75tcTAAi3QqUxEJzHDFtz1aQxvBgs1xIEH3OCIv+0tCL03b5Gj
 vD7Mg+jrp8EC6thbMGK0JZ5T9sDWm5kBm5Sg2TyPzNVfB6h6XiDGk1CpV/ZPfnBJeGNN
 otew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fXIIajBmYb1UTSbWfTKRq6sJ1Saykn5Ztt68M0JOMdc=;
 b=l1cVQRlnse28PVPB3EUXju/YwpSbmVoY4apZoj6wfwCQcCW3tw/itU96EJE52d/+h4
 RfzaVDq5KI5aePkMye9aQuPZk4Ni/oFsskqSvWTE1crY1kON9hPjd72fVWscKPIhvmAS
 JpVxvtyEAMjaKNs1vWN++WWqTvMLIoWDDhoOFxFmpn+tV//lMTPSoZx92l+G8Vi2ss8s
 M5dD7bPY1YP6YMCi242jtY/GTidYGnTexMyjtNYUPAiOvKA/NmkcgpKx5lN52pvL6tVm
 Ke3GN9tn4yuYFy4B4b4I5hHaBSpAsezHXGMQutmMo3PKqicqf3gvtBd0og6crSVnYp/e
 rhEg==
X-Gm-Message-State: AOAM530/ITE2VeOFjxxlz/ZTLUaiddwp2g4/T18jBKpYya6VR1DBEMGF
 O+wHIljDjZZ9jEe3hqpkDK0j1OteUco=
X-Google-Smtp-Source: ABdhPJyqV/nOBCIw3MeA/Og51hKn/shzih1DJe/HHRvTMHe0yOmQ2xe4/ceBW//ESc15aqER1j2rbw==
X-Received: by 2002:a17:907:447d:: with SMTP id
 oo21mr21376886ejb.367.1607385367893; 
 Mon, 07 Dec 2020 15:56:07 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n1sm13709974ejb.2.2020.12.07.15.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:56:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] target/mips/fpu_helper: Remove unused headers
Date: Tue,  8 Dec 2020 00:55:37 +0100
Message-Id: <20201207235539.4070364-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207235539.4070364-1-f4bug@amsat.org>
References: <20201207235539.4070364-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/fpu_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 7d949cd8e3a..a3c05160b35 100644
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
 #include "fpu_helper.h"
 
-- 
2.26.2


