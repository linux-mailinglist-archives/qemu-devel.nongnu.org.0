Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00419300D95
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:20:34 +0100 (CET)
Received: from localhost ([::1]:41130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32v4-0007Wp-1U
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mD-0004ud-1l
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:25 -0500
Received: from mail-pj1-f47.google.com ([209.85.216.47]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mB-0004bB-HW
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:24 -0500
Received: by mail-pj1-f47.google.com with SMTP id my11so6857081pjb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZTqB4ZeZsgg10vvjHd/dHMK/cst2I6BNOY0xcUjrQ/0=;
 b=tHyQ7TkYHSPynZ31t+9yJr7FOe5W16FuItLqpBqL/+T6CHcSEYY8hEBN6b9g/nbBP6
 3Jd+e+k+txd/RAsJ2ASboSeebQIMiEa2V2fC+fAjTUYoJgN7jzVQKy9JLgJ4YO/kyArH
 64ySiSr6ag8+ENX52pbvv3V/1+7P4v+t51KawaaOkEPDI8ViVJOTAnC0PQJ0QaJKgaeJ
 W06s1sUD1kLA7PdkoFESvQWXe+ritCB9v+5VsOpoLRX1XGEXQXqUifFFZX7asU/zmaTo
 2yXYN7PGDxtAZ8VBmQc30N1aFSDdDXI1lbrM8K5OtAKuL+M13D0ZBw8UiMTdZ5aGkpT6
 MQEA==
X-Gm-Message-State: AOAM530bbbhf+Ysw0DSE4tfAWw+OhdIfOiPLv3RByq54eeGN9usExYcT
 kkyh4slE3b9L/tLf90aYZIayMpO1ds4=
X-Google-Smtp-Source: ABdhPJzIkz6LJLGXd4szxF7PRQbC5oquLFv7yLgR8H1l7kHspeLWU9Al7V5SRO4XWHJf8aHhmw30+w==
X-Received: by 2002:a17:90a:b296:: with SMTP id
 c22mr7621321pjr.142.1611346282050; 
 Fri, 22 Jan 2021 12:11:22 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:21 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/11] darwin: remove redundant dependency declaration
Date: Fri, 22 Jan 2021 12:11:08 -0800
Message-Id: <20210122201113.63788-7-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.47; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson will find CoreFoundation, IOKit, and Cocoa as needed.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 82ce28c660..4c485dd962 100755
--- a/configure
+++ b/configure
@@ -781,7 +781,6 @@ Darwin)
   fi
   audio_drv_list="coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
-  QEMU_LDFLAGS="-framework CoreFoundation -framework IOKit $QEMU_LDFLAGS"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
-- 
2.28.0


