Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B192EA355
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:27:12 +0100 (CET)
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc3z-000739-4W
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyE-0000nI-WF
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:15 -0500
Received: from mail-pf1-f172.google.com ([209.85.210.172]:45442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwby9-000204-E6
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:11 -0500
Received: by mail-pf1-f172.google.com with SMTP id q22so17506140pfk.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 18:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAXoghHf8NZM+SSeWXlvSfABz7ORBxz555YpOU/PWJo=;
 b=MN1NxGJLSyZKD0UhDh94JQyQ/YHQAHWIFYjp9PyYEfYf7qMbIw0GnAHjxX5hvX/OQC
 CM/cL4B2XfTzd6Ikw/pnq7UlmwATvp0WZjoXGVedH0Cgjq/NeCfXqbB1aZjvsSl8e3CL
 YWenTgdPM5f8L+ZHni5wTjDrInqad/zgBask6eboKvlVX9AkaDnFJxn4CNFcPpHUzuyI
 kUFB+raIMwOvVfL0u0D+441zEm1dvg1XCgY/bjMSy9vWGqq8V6Ex/JGqJYWyuOhn0Xsm
 UYqg9z3N7ixMiRHcQPvvhsPu7a79BeU47eVxKgj3G3I5tPM9c7Yydapb3FSjH+ACfKxI
 wu4w==
X-Gm-Message-State: AOAM532JSTTVrHuzdGsn+fsiu5gGa2lhVosADFMPdvB1sWo2WQY4Ib+u
 2xh2w76iustwjkRGjdpNcFkSDgrgEIw=
X-Google-Smtp-Source: ABdhPJzVzSe8hPs2AFgyi8gdTg/IPqNLWNl68c0OIAjIwcQbo86XUnqkcUWvunjYuLxZlUYIYrrw0A==
X-Received: by 2002:a63:d041:: with SMTP id s1mr62739783pgi.249.1609813264315; 
 Mon, 04 Jan 2021 18:21:04 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.186])
 by smtp.gmail.com with ESMTPSA id y27sm57674386pfr.78.2021.01.04.18.21.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:21:04 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/7] configure: cross compile should use x86_64 cpu_family
Date: Mon,  4 Jan 2021 18:20:53 -0800
Message-Id: <20210105022055.12113-6-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210105022055.12113-1-j@getutm.app>
References: <20210105022055.12113-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.172;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f172.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 09dd22ebad..79dc9811e8 100755
--- a/configure
+++ b/configure
@@ -7033,9 +7033,12 @@ if test "$cross_compile" = "yes"; then
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


