Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FA330132A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 06:03:10 +0100 (CET)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B4n-0006zX-PA
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 00:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayh-0006zO-69
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:52 -0500
Received: from mail-pj1-f44.google.com ([209.85.216.44]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayf-0005sg-0Q
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:50 -0500
Received: by mail-pj1-f44.google.com with SMTP id e6so5162144pjj.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+5VyG67cg0m7jFdStswHbTchlQ/RRRnpxZ5acd1A248=;
 b=XrvZquNWnRwxclfXhFSEV+U2ePHcvLu6zdgVy/BzTR5vwFbaKf9lgkaL0Tna8OuUqR
 rV+g9zCz8fRrHsVqfKJu30YdOYqKKwSA/o/fIYv0ED7B67L89tYm3zA8WEK1XaZMUPLN
 hd+R8Ub2gSBSwbMXHo5x5B8x3ptAbz36k5ZDZCwNlKVquyzPvb+3eYFr4PjR1gPpplMp
 49UVXlJUVwIFuoffmNMLJN27Htnvgscqp7SURSQTgxcpeUDbr7Iv1TnHp/9r5MhXKj6r
 UoDbsx+RlJCT1bR+7ExW6KFCehNlsud/h2lufPMM9d6ZvTtr1Bus1CkL986YCxVlV/4v
 g3rQ==
X-Gm-Message-State: AOAM531SkVQjaDlXGhs5JZU3BMyPkm/5SbaXPfZkVA2KBhaUcNniCxNX
 R8nesjq6DmUJaVcr391x9j+N1q0LNfo=
X-Google-Smtp-Source: ABdhPJwek/iojpGjShO/TdNXS99YkAE+ZnCkkeDAr3GHa/nQdDh3gTDlSDVuN+v4D0bsPlVBzyb+Lw==
X-Received: by 2002:a17:902:44d:b029:de:c063:85c9 with SMTP id
 71-20020a170902044db02900dec06385c9mr1109533ple.35.1611377806061; 
 Fri, 22 Jan 2021 20:56:46 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:45 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/11] configure: cross compile should use x86_64 cpu_family
Date: Fri, 22 Jan 2021 20:56:29 -0800
Message-Id: <20210123045632.18482-9-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.44; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f44.google.com
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
index d4588ed892..b8ae4609fd 100755
--- a/configure
+++ b/configure
@@ -6445,9 +6445,12 @@ if test "$cross_compile" = "yes"; then
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


