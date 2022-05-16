Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB63528A0F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:16:00 +0200 (CEST)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdO3-0000dr-F1
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5Q-0002o5-NM
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5N-0003Pt-Cj
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlNcC4Y37dCnjdIJcK87NW2WaANvbQhaq8YL05jIONI=;
 b=DJpf0GGVgr+RYQar3kGeNmBlUdbxUEuia1XDqA0jgY0G1bIyv7TDFH8NkdmBw0PqR8aPxS
 Z5GuM1eyOo1vwy+hBjdfSlxDd7aA/zQdjXegmv8IvNBJMZfaWf7jFp8rncrqm30DDA3+1w
 4ZwqG9AeyYpUntte6djYQS3HCy8nSic=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-LGSYh0ntOeS3vkpHFM7tVw-1; Mon, 16 May 2022 11:56:39 -0400
X-MC-Unique: LGSYh0ntOeS3vkpHFM7tVw-1
Received: by mail-ed1-f69.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so9974847edr.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KlNcC4Y37dCnjdIJcK87NW2WaANvbQhaq8YL05jIONI=;
 b=5/JVtFNRZvhMBD8nPWtL+63uCdh8EouCz/8NJjINgqnRXkQeCzhbcVUUPtsWZ6+lk5
 BxJzFtsi7fi+R7MTbhsOTXQtvaKN1EGBHqd2AoY/HeviCQFkbf25S6wk5ykG2AApDOYH
 b2mk4Z+kgkF3a6A3ZnjHb13OEu4nxJLC/2rjYN0Pa9mi65VVto1kbhw6LlYZoihOBsY8
 n4e6aUov4/VdSg1dUCq5MVjmoaqkcncalaTP37qgPd637gQeqg6parJuSPSynOoL6DEn
 45Den+L8vWVH5N4O2gsiivka8Bj8k0IYvdwGEkAJCoCvnayjbkNMNgxiEZfFjWz194B3
 pSTw==
X-Gm-Message-State: AOAM530iKTx0hQG+G6vpJhEzF0m2SPr8fFKy9lobfaKoCjz2f8QE3C/y
 DCtXx+o92zjFlp8mQa1hL5my7n/qIo9zuBRhZo12+V2AAl/LebPBy3Se69Ot1CZV5WwLNefBNA2
 2FI1IcevWhTFclzEsB7qYmY4UqUQvk0QDi1b3sCzU2CwNALVBqpFFSnHsp+F8IstOXO0=
X-Received: by 2002:a17:907:1c82:b0:6f4:d2ee:2f8e with SMTP id
 nb2-20020a1709071c8200b006f4d2ee2f8emr16371783ejc.714.1652716598043; 
 Mon, 16 May 2022 08:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdkwSgzmMPFdmGKeIG9ITtYfX+AiJYb1cvnmxF+3eXw0wU7Fb9pzirrGf0Hd4fPlGzOA+3PQ==
X-Received: by 2002:a17:907:1c82:b0:6f4:d2ee:2f8e with SMTP id
 nb2-20020a1709071c8200b006f4d2ee2f8emr16371759ejc.714.1652716597719; 
 Mon, 16 May 2022 08:56:37 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 eb10-20020a170907280a00b006f3ef214dcfsm50556ejc.53.2022.05.16.08.56.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] soundhw: extract soundhw help to a separate function
Date: Mon, 16 May 2022 17:55:57 +0200
Message-Id: <20220516155603.1234712-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/soundhw.c         | 33 +++++++++++++++++++--------------
 include/hw/audio/soundhw.h |  1 +
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index 097501fee1..0fb64bdc8f 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -64,6 +64,21 @@ void deprecated_register_soundhw(const char *name, const char *descr,
     soundhw_count++;
 }
 
+void show_valid_soundhw(void)
+{
+    struct soundhw *c;
+
+    if (soundhw_count) {
+         printf("Valid sound card names (comma separated):\n");
+         for (c = soundhw; c->name; ++c) {
+             printf ("%-11s %s\n", c->name, c->descr);
+         }
+    } else {
+         printf("Machine has no user-selectable audio hardware "
+                "(it may or may not have always-present audio hardware).\n");
+    }
+}
+
 static struct soundhw *selected = NULL;
 
 void select_soundhw(const char *optarg)
@@ -75,19 +90,8 @@ void select_soundhw(const char *optarg)
     }
 
     if (is_help_option(optarg)) {
-    show_valid_cards:
-
-        if (soundhw_count) {
-             printf("Valid sound card names (comma separated):\n");
-             for (c = soundhw; c->name; ++c) {
-                 printf ("%-11s %s\n", c->name, c->descr);
-             }
-             printf("\n-soundhw all will enable all of the above\n");
-        } else {
-             printf("Machine has no user-selectable audio hardware "
-                    "(it may or may not have always-present audio hardware).\n");
-        }
-        exit(!is_help_option(optarg));
+        show_valid_soundhw();
+        exit(0);
     }
     else {
         for (c = soundhw; c->name; ++c) {
@@ -99,7 +103,8 @@ void select_soundhw(const char *optarg)
 
         if (!c->name) {
             error_report("Unknown sound card name `%s'", optarg);
-            goto show_valid_cards;
+            show_valid_soundhw();
+            exit(1);
         }
     }
 }
diff --git a/include/hw/audio/soundhw.h b/include/hw/audio/soundhw.h
index e68685fcda..dec5c0cdca 100644
--- a/include/hw/audio/soundhw.h
+++ b/include/hw/audio/soundhw.h
@@ -7,6 +7,7 @@ void deprecated_register_soundhw(const char *name, const char *descr,
                                  int isa, const char *typename);
 
 void soundhw_init(void);
+void show_valid_soundhw(void);
 void select_soundhw(const char *optarg);
 
 #endif
-- 
2.36.0


