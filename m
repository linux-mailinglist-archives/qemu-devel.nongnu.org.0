Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A86161E1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:43:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqC8S-0005HK-Bk; Wed, 02 Nov 2022 07:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7t-00059I-Jy
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7r-0005Kf-7T
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667389302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rn09GQMUOF2ydOhkJImYso5UybJw5X/9JLC4pgsyc8=;
 b=e+2tKXrLBtLxBGjhaEvlzi79DO2XjbHhI+DxwjXP1GDxznQug7ySilFfvXwdbXrMpNQNhn
 u2JBMz/m2T9P+s3pCrqCGPUBXjoM1JD4AR8kiSsu7GCwuqQ7gnN6/hmeO/O1pX0J9jSVE9
 /mzJuh1GEYwmcmf6b2TGAWNeD+EoiwE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-SltbX5WxOzCZyo6AzfMn3w-1; Wed, 02 Nov 2022 07:41:41 -0400
X-MC-Unique: SltbX5WxOzCZyo6AzfMn3w-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq18-20020a1709073f1200b007ade8dd3494so3477498ejc.2
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 04:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rn09GQMUOF2ydOhkJImYso5UybJw5X/9JLC4pgsyc8=;
 b=6jBxixp7eeCfJ0daRGkV4EzjiEz8z1BmC5gwkasewQ+MLd4WJyE0UFcVEgIrfWV0DF
 yHFj2h4V6mhjitLQZfBuUVJT0us2mEWLphQNEoJ2Rq9JCExdkB0W5aqMZ2pRQqsjVgW+
 FcT5h8pj73f5lCHxBTcZIZXErQ4J7e8WR2BYS3gVrrJCCJsWM6wdXJ2TDQFIx1o9KZIV
 3JbGKWgKJwCP7RkN91jkMXMMe/vRysJ5on72ZE0Ip4csSCrWa99slKAQRoMn+Yl7zF5J
 nFZ5QyXONiF9Oltai10lp/9gFOnQkghVM1kVvkegH0ZK5z36SY7uW49s56FEPQPkTDyO
 MiBA==
X-Gm-Message-State: ACrzQf0N60WrbqWwz2o6Vhik4YhYDp6sUXbzdG06ccif04HSm7Hwq3pf
 pqs4i+7iAVTlm8NWqXU8uo/ZsDNPN21zC0Zvn6xKqzScNOC09Y7aVg/+2bmoVJb9Tmw7DNMZeGE
 AQed/L83PtG2QnDui7eYgA/4SQ6DcywQ7izulsRpr3hzBAGLFfVRSUL64OURV7j+BLAA=
X-Received: by 2002:a17:907:b16:b0:7ad:855b:c08c with SMTP id
 h22-20020a1709070b1600b007ad855bc08cmr23565671ejl.667.1667389299510; 
 Wed, 02 Nov 2022 04:41:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5EBYlLU0PEqjhSZ0gRiOuYy2bH/tA7NBwtPf8185P3mXcxH04ZaA5ayzLJMC5nYH771SezQA==
X-Received: by 2002:a17:907:b16:b0:7ad:855b:c08c with SMTP id
 h22-20020a1709070b1600b007ad855bc08cmr23565652ejl.667.1667389299273; 
 Wed, 02 Nov 2022 04:41:39 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a170906259b00b0077016f4c6d4sm5329879ejb.55.2022.11.02.04.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 04:41:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	richard.henderson@linaro.org
Subject: [PULL 4/5] util/log: Close per-thread log file on thread termination
Date: Wed,  2 Nov 2022 12:41:24 +0100
Message-Id: <20221102114125.58902-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102114125.58902-1-pbonzini@redhat.com>
References: <20221102114125.58902-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Greg Kurz <groug@kaod.org>

When `-D ${logfile} -d tid` is passed, qemu_log_trylock() creates
a dedicated log file for the current thread and opens it. The
corresponding file descriptor is cached in a __thread variable.
Nothing is done to close the corresponding file descriptor when the
thread terminates though and the file descriptor is leaked.

The issue was found during code inspection and reproduced manually.

Fix that with an atexit notifier.

Fixes: 4e51069d6793 ("util/log: Support per-thread log files")
Cc: richard.henderson@linaro.org
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20221021105734.555797-1-groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/log.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/util/log.c b/util/log.c
index d6eb0378c3a3..39866bdaf2fa 100644
--- a/util/log.c
+++ b/util/log.c
@@ -42,6 +42,7 @@ static QemuMutex global_mutex;
 static char *global_filename;
 static FILE *global_file;
 static __thread FILE *thread_file;
+static __thread Notifier qemu_log_thread_cleanup_notifier;
 
 int qemu_loglevel;
 static bool log_append;
@@ -77,6 +78,12 @@ static int log_thread_id(void)
 #endif
 }
 
+static void qemu_log_thread_cleanup(Notifier *n, void *unused)
+{
+    fclose(thread_file);
+    thread_file = NULL;
+}
+
 /* Lock/unlock output. */
 
 FILE *qemu_log_trylock(void)
@@ -93,6 +100,8 @@ FILE *qemu_log_trylock(void)
                 return NULL;
             }
             thread_file = logfile;
+            qemu_log_thread_cleanup_notifier.notify = qemu_log_thread_cleanup;
+            qemu_thread_atexit_add(&qemu_log_thread_cleanup_notifier);
         } else {
             rcu_read_lock();
             /*
-- 
2.38.1


