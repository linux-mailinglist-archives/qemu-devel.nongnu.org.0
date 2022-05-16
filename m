Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71992528BB2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:14:04 +0200 (CEST)
Received: from localhost ([::1]:33862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeIF-0004kO-0H
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5S-0002q2-D2
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5Q-0003Q9-Fj
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lw2i3zBYqODw1azDWWx+BDtCSLGMBU4VmzNLOJxP3OA=;
 b=ZhTP/P/8Y7zANBw/gcVwc7D7+JqXp3GG/3Bekc5rm5KEl6HV2Hs5Yg4uD/irnRy2EANo5D
 qiIe/EMePXPEm786BML5rMyfXGSrnhsb9m2Kle9C3gLzRAsINy7OvcpZBo1bo2leTPaMfA
 9orfrZbIf1O/xzMlG31Q1WQyUs776Xo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-ScdsVJfbOAWD1i5BsMNPSg-1; Mon, 16 May 2022 11:56:42 -0400
X-MC-Unique: ScdsVJfbOAWD1i5BsMNPSg-1
Received: by mail-ed1-f69.google.com with SMTP id
 i22-20020aa7dd16000000b0042a9f9e2272so3732543edv.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lw2i3zBYqODw1azDWWx+BDtCSLGMBU4VmzNLOJxP3OA=;
 b=tvRJulbZ2B6qlDBY0am+OZM2w3HmD5eVIDQGq+Z4VvD2hZLvJCD1U5mPrenxn41OmX
 NWanxsFTVW8hcYE2UuBj9Df5d1HFh11irDpT1dAEGl6tz8Zx80ZlIMC5pACi08RxjC4+
 BSpsPTRtalapaEalZ2DtokYJMVKU0QgSQT/1bye8w/FwHDGyqbUhWVHJtyQSKh058Px7
 i0IVvN47j3RYPRyM+PEUu95FiX0YCzagQvD3twsdDybpwT6fa3/StkMvXd9QyTFyytBH
 pzfkg9fAUqiQI4lmmt6CvFmLGPvMzxaFKDO40ATv/25cm0LHOYGxrIMzu6o+w65rwaLl
 JPcw==
X-Gm-Message-State: AOAM532y6g348KuNAh4Hk2b/S8bZlcknZP1Csj5AcqI4WGGukWGpkfWF
 aDp++O3xlM/VEv+a0BRc7+c+0KhC7sRxXt7YQEdXQ2eteqNJ8UiyxS6oNgDTWPrM7t3vYW1UVJY
 8iWt+izZqyQQ8ghYfLspQ78mp8O5Pl7Qe4GkTqsUxDyVFLXoY4gJlOzYJ7xS/Z2wz7oE=
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr16144325ejc.631.1652716600938; 
 Mon, 16 May 2022 08:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUPBbC7C17yVWGNfcQEZ4IRnL4lVNfy05tqhnZaIVYj3M0Fv76JESUmuOW6uW7HMTcJ3UkNg==
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr16144311ejc.631.1652716600602; 
 Mon, 16 May 2022 08:56:40 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a056402115900b0042aaacd4edasm2687745edw.26.2022.05.16.08.56.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] soundhw: move help handling to vl.c
Date: Mon, 16 May 2022 17:55:59 +0200
Message-Id: <20220516155603.1234712-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow processing "-audio model=help" even if the backend
part of the option is missing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/soundhw.c | 24 +++++++++---------------
 softmmu/vl.c       |  4 ++++
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index a1558dab3a..ebbd0958ba 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -89,23 +89,17 @@ void select_soundhw(const char *optarg)
         error_setg(&error_fatal, "only one -soundhw option is allowed");
     }
 
-    if (is_help_option(optarg)) {
-        show_valid_soundhw();
-        exit(0);
+    for (c = soundhw; c->name; ++c) {
+        if (g_str_equal(c->name, optarg)) {
+            selected = c;
+            break;
+        }
     }
-    else {
-        for (c = soundhw; c->name; ++c) {
-            if (g_str_equal(c->name, optarg)) {
-                selected = c;
-                break;
-            }
-        }
 
-        if (!c->name) {
-            error_report("Unknown sound card name `%s'", optarg);
-            show_valid_soundhw();
-            exit(1);
-        }
+    if (!c->name) {
+        error_report("Unknown sound card name `%s'", optarg);
+        show_valid_soundhw();
+        exit(1);
     }
 }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 817d515783..0363cbd9b4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2931,6 +2931,10 @@ void qemu_init(int argc, char **argv, char **envp)
                 audio_parse_option(optarg);
                 break;
             case QEMU_OPTION_soundhw:
+                if (is_help_option(optarg)) {
+                    show_valid_soundhw();
+                    exit(0);
+                }
                 select_soundhw (optarg);
                 break;
             case QEMU_OPTION_h:
-- 
2.36.0


