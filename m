Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B097442F98
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:59:42 +0100 (CET)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuKD-0005uG-KP
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu3u-0006lE-UA
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:42:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu3s-0005vt-Vz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:42:50 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b12so28951632wrh.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYjaEEe+Ru5uUdnZddVxZVIqZpROsaQfXPXEBpgAmpU=;
 b=ejYoKfOlWFOGWZKWCfDrxBO8+FPgENXnKkHhBLgwdhvFWR05z2g+8De6mood5EWsuu
 1E8B9fvWJUp8yIMZtHKtUBpWcEe8ZMXyTaNEbxz05Xnzcjf5eoKRFRbEEtHyV51U6QC6
 fREcZk9dDj6L7DFH+pDY3N+sHvcc65/v4+O+w85zMwqZoQsK2sFdAFs7jiD6fA7bu74x
 jTv2xHh2xgKRtvN5ccvm6WchuPmGvKeEv3rmCxDcaGbPhlKs9xSaB97kOx0jAkhS6Tcb
 aVLam6KTgMHkGwssyKsaswmvaj4oy06CUHvmzvPgKBc9CwPS+LDmJcqvouFeweSk66DE
 91Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GYjaEEe+Ru5uUdnZddVxZVIqZpROsaQfXPXEBpgAmpU=;
 b=kFRR3sQ8F/bbaheu7FKbNM5fWTNWJ810rwn4u/gd5YcG6toKR2YBa/B9r3GYxi2o56
 LIQTbkbxDvJ/1YT8x0GziREKxY6zjGybrWpO97i0xNxGExgOvfblthpnILhLoUx01vf/
 IUHnrAJSRd+ueYsSgsXeKFPu8UdHOU1DDMVrkOrYKRLmYNtwq9JfFPVW6jqp6BB6Q5rH
 Il2xPKlbvc6zy+vr9Wc9CK6sz+qf0yDX3I0q7rcbLurbbN9eL+We9wDo/qZtDqUVxGoH
 F7mYeS9X79oe6Tu//j7oO79p6i45zbtpSiEbxGhdkASURzi0eQqk8dx4WHP1fxas3tS2
 gE6A==
X-Gm-Message-State: AOAM530Y1A2pHuK/5S/vaeONiWAFjgey61d8s2XJtdcCl2Zdhh6u6cdD
 NLaiB/WEj9L1hrma6VuU7C4r/Qlhu5g=
X-Google-Smtp-Source: ABdhPJy8eCx1Jms5zop7wnLN7WUFKF/3+d9vOPn6xKBu28TqoG4iEtnCSimopoKlwnqHFMXZLfTi4Q==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr27825205wrn.72.1635860567317; 
 Tue, 02 Nov 2021 06:42:47 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 q193sm2857011wme.48.2021.11.02.06.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:42:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/41] MAINTAINERS: Add MIPS general architecture support entry
Date: Tue,  2 Nov 2021 14:42:00 +0100
Message-Id: <20211102134240.3036524-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The architecture is covered in TCG (frontend and backend)
and hardware models. Add a generic section matching the
'mips' word in patch subjects.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211004092515.3819836-2-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 310a9512ea1..a156c4bffc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -109,6 +109,12 @@ K: ^Subject:.*(?i)s390x?
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
+MIPS general architecture support
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Jiaxun Yang <jiaxun.yang@flygoat.com>
+S: Odd Fixes
+K: ^Subject:.*(?i)mips
+
 Guest CPU cores (TCG)
 ---------------------
 Overall TCG CPUs
@@ -242,7 +248,6 @@ F: include/hw/mips/
 F: include/hw/misc/mips_*
 F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
-K: ^Subject:.*(?i)mips
 
 MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
-- 
2.31.1


