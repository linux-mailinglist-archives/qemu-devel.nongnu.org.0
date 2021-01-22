Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB25300D9A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:22:04 +0100 (CET)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32wV-0001WK-AX
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mF-0004yy-11
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:27 -0500
Received: from mail-pj1-f48.google.com ([209.85.216.48]:55245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mD-0004cn-Ew
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:26 -0500
Received: by mail-pj1-f48.google.com with SMTP id cq1so4522506pjb.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEwtq74+KSEBVLDQzC0rm5JCviDvE1WzfYDdBlTdUe0=;
 b=fqYj4keDSBHmRkTlgy8N4k8bT6t+y1jBPIr2crTH9CUXK3epBQgbfa9oAk/joVlAVY
 S9zE8UdhuNp+JS5BvACOO7cbD2DWDn7k5/NJ1HeuD+NzjUAv4E3yexuLf0nJYBGb1BV/
 x6J3MZ4tEe4Cx/oXJyNFIXz+tmPhwohzivLD6QKdwxO8g+1RlAFziR+WN1Mmob0bqHEr
 6SqW8AjVwB4cNdLdlK9DWn+yy5op8ojZhCCw8H5UqpTjdagiroddoDD3ZOrXVh82rbVV
 HtoHQVU2P8dLkTedX2BaNox5nHVjuGXfNUaXEW0khE1KU1ci2RnCxZfH58vxi1EkjHSi
 FTNQ==
X-Gm-Message-State: AOAM530ut5Y/v07yMLw2ulDpBqvHZSJy5cZflZh3MsQAskxhWTThB8IJ
 CKEVxhiGdWrdbN2Hfo7KUWTEEKygMcA=
X-Google-Smtp-Source: ABdhPJyQxaHMRlPIqGQ/dDIZg5hnQlu2bqTpwxwHG2rCM2ZyVPbXXLDSI7Oi9lm9lGwOpEdnqX7hBg==
X-Received: by 2002:a17:90b:3892:: with SMTP id
 mu18mr316112pjb.143.1611346283908; 
 Fri, 22 Jan 2021 12:11:23 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:23 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/11] configure: cross compile should use x86_64 cpu_family
Date: Fri, 22 Jan 2021 12:11:10 -0800
Message-Id: <20210122201113.63788-9-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.48; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f48.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 7e5ec7a5a1..f487be3cfe 100755
--- a/configure
+++ b/configure
@@ -6466,9 +6466,12 @@ if test "$cross_compile" = "yes"; then
         echo "system = 'darwin'" >> $cross
     fi
     case "$ARCH" in
-        i386|x86_64)
+        i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
+        x86_64)
+            echo "cpu_family = 'x86_64'" >> $cross
+            ;;
         ppc64le)
             echo "cpu_family = 'ppc64'" >> $cross
             ;;
-- 
2.28.0


