Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24110313D90
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:34:05 +0100 (CET)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BMK-0004c0-6h
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94rL-0005iA-C1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:37:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94rE-00052K-To
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:37:37 -0500
Received: by mail-wr1-x434.google.com with SMTP id g10so16700198wrx.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+9T4r0TCi3EB/RVY07CvBs5uobmRjxRJ/NckeQRa2M=;
 b=sIAKhnRWbxtec9lx89+141c/cTWYv/oN1HjfVJhSWOj7WQMxxHg0MDEfrDzN4sI3x3
 cHYoosI1bwRT+dJcLfg2NPWoFrdOUwD8jphqANzaMLSAGn4O2IKTIfuqtdh3RODJRcbl
 AC8AGRX+gXgadL19aaCOMG7cRWVlKvG7G0X0Y2Hh+HBLccBk3foeNnGn9uYmxFKO3aeg
 65uHgxBZn5qGeBytxXScrLhaNZxkrdpMGT/19Gaxv8oalHZZ+3Jy1FnrXGhZ6fZw43OX
 eu7yuRXbcOdDn9Oc3+3ZJ+GCUc+o6BHv1jrsZ2j9YaiSLYC2x/uvaXigWnEDYgr+r18a
 ZAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+9T4r0TCi3EB/RVY07CvBs5uobmRjxRJ/NckeQRa2M=;
 b=d7YYVBPy7+81sPKLAQ321iRBuMHG+WwbVJSjVA/8PFE3VvlCq877Yl7Yfyekix949j
 d0X6UzxBdQtmjSKcvI9Xys/dGNqEEhVYMaNqm4fIp6AXVw3RbQB9HL759TpflZZE9QK4
 8IVEXHhq+titbSHcZURIrjsf8hqqaXEHIUwhqbGd/xF9Auqx+YLzecpR6gRzQS8ZYnL6
 d8uoHtT6LfO5UkoLB/9QWUjH43V1MLHWRqCkQsKLWS4KuHvAEJjNwNZFsQUvvMjnz69M
 +Gf1+O6Qc/cy/vSO+O9YjsRWeXZDQhhfO4CfGfFT3HCDuI7cT+YwZ9hSrhdPJvfOV83M
 fkHg==
X-Gm-Message-State: AOAM530rQBJT+y4rkmr8KlDGpMUdF/qh1d/9meSV6bufej+bO+hy1rLC
 UmrkhVaImgtCiM7pV7DcKizvemb1cHrUJw==
X-Google-Smtp-Source: ABdhPJxof+O6/4ovM4NcEL/z0MxCEi9XtWfmM0ofE/O3Lz8RUhxihg+deFd5qlTp7L5TsASEfLr2bw==
X-Received: by 2002:adf:8523:: with SMTP id 32mr6332257wrh.275.1612784251181; 
 Mon, 08 Feb 2021 03:37:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p9sm28649900wrj.11.2021.02.08.03.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:37:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
Date: Mon,  8 Feb 2021 11:37:29 +0000
Message-Id: <20210208113729.25170-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Noticed this because my recent patchset which touched gdbstub.h
didn't cause check-maintainers to add the gdb stub maintainers
automatically.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d8b0bf966d..f5e27502435 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2336,6 +2336,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: gdbstub*
+F: include/exec/gdbstub.h
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
 
-- 
2.20.1


