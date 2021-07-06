Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4A83BC96B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:19:38 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iAz-0006Zq-R7
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htr-0000mk-L1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hti-0002CJ-Gd
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so1822660wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RLB71cALHzaVGNk6QtPugAUl4gfKx/zT8Th8yldtu5Q=;
 b=tThiL1v5NqZ+a68FATmOeJ2nZR6CMHZD0tCrjcj0Co9FGEE4OHJgBqIFbvxMEu82cc
 aN15VzDrUC3wQr/Xu6SH8nw7Nbw/EYs4LrCZjqnz6PE57xgrbR+2usZE3uFsvKXQEOyB
 r2UdiW6+x25CeqdCZq16Wet4sLKBNQe787b0BJxr/XinAhhlb9p0472U4KC2Rkw2Mihm
 9A1vYXuRDRf86Z1J8E7ombHd9kTNUTsYqESajFz6lEm8WGMJUEHckqkzbkfclX2oVUfd
 cyT9s/BxkI3HkPwHazhvZZn0F3Ja+lST2dS4uum697C59QUAZUfk78Su5lIG75r46sT5
 cI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RLB71cALHzaVGNk6QtPugAUl4gfKx/zT8Th8yldtu5Q=;
 b=lyn2YTuN7LwR8eDGTvzEq0IloVJoq2diOlK2CxQQWrMEGME/sAiwL1Qt7GADZtjSDi
 q4WbjkSir9wo4ClfsNThUhdZEwujEtunV7iOERHGOxc0OKD2E0J8kUVUD8xp6pdua8j6
 PTdWpQAKy/nllzdLZFvyjOQtWH9bBp4gDEZmDbRLpCjBOD8lBdif+zJUvQLJpvRZGiYg
 l0DthKw+AUHFvaqMQ48HE8Am6C7HF1Y7z9V72+SVGl+rhMdDyiUcZqDrIGmgfeRrxBtn
 OAOysakeB/eZx6tAbvOmqv+6p7zXOjiCIkJ3/rC5Ie6f6SUR3MTzo8gpk25YysFOGcz1
 NC4g==
X-Gm-Message-State: AOAM533hCy1TT9D5YpNszQL7Sw31IVHVPhaTU5u4kebNB1y/NA84wAlF
 fpaKOYjRA3GaDnCDVkYxXhePfvf9/Do=
X-Google-Smtp-Source: ABdhPJzlbvbSS9z7mC+qruyDH2fy7FE0riZAAAXq3mziLBCbM3TuvJm/p5j/DNymmikTeHF3E1eWQw==
X-Received: by 2002:a05:600c:19d2:: with SMTP id
 u18mr3361583wmq.21.1625565703727; 
 Tue, 06 Jul 2021 03:01:43 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/40] Makefile: Remove /usr/bin/env wrapper from the SHELL
 variable
Date: Tue,  6 Jul 2021 12:01:02 +0200
Message-Id: <20210706100141.303960-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Richard Zak <richard.j.zak@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The wrapper should not be needed here (it's not the shebang line of
a shell script), and it is causing trouble on Haiku where "env"
resides in a different directory.

Reported-by: Richard Zak <richard.j.zak@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210705082542.936856-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 30f19d33bb..6c36330eef 100644
--- a/Makefile
+++ b/Makefile
@@ -14,7 +14,7 @@ SRC_PATH=.
 # we have explicit rules for everything
 MAKEFLAGS += -rR
 
-SHELL = /usr/bin/env bash -o pipefail
+SHELL = bash -o pipefail
 
 # Usage: $(call quiet-command,command and args,"NAME","args to print")
 # This will run "command and args", and either:
-- 
2.31.1



