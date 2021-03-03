Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3990732BA03
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:51:17 +0100 (CET)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWaa-0002KH-5I
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWh-0005Sm-JB
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWe-000807-G1
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OrF+E+zCequnzlZnWp4hjwf+NwYf8uUkBRCyiILemeQ=;
 b=VumwdGrvvxw1/Ref0yhnf6fqgQd9VaWb8aRL5JQE7VV8g86ddrWzK2Aua6LrlSnf+uBzdc
 MZg297kjMKfQJhFHvoYiuQaqfNCkCNtIegO5oLjX0vfEI6yOxxEVT4+gsR0WjPiyOGgVLw
 1EghhOkj9o7YPE4Q1msfWppMUYxIabI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-2kH-glYSOHOmRTBpBzBi0w-1; Wed, 03 Mar 2021 13:47:08 -0500
X-MC-Unique: 2kH-glYSOHOmRTBpBzBi0w-1
Received: by mail-wr1-f70.google.com with SMTP id n17so1024193wrq.5
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OrF+E+zCequnzlZnWp4hjwf+NwYf8uUkBRCyiILemeQ=;
 b=UzABvt6vcA+LdWD+u44sqWR7+JlzcWeotr+YLKMA6UY6uRIpLDtnPeIbvLqY4dtHKV
 YhplKBXWwrVEq92LXgfj4Kpa6jFZMYlarnuhzL4eVAo3Cmwa7NhRNMEIBqh+5Fhe0izw
 2fbpjbswf0RGNSNS1oSF6MsWfGMBS8NAdE+xdeWnE7LQWq4Kd43pLp35xlRskt6W7iy5
 tmkAWdeZgSJ0c48IYe+zUG199xIoavDaV8qnKwuf+De2lrjG6sduYZDciZkVzTcQqtue
 ujEvs6ONbDfxGBntS1kOLT8QAQiiGsra0SwXO09zZtt1x1uPoB8ldV8NZfuJgl0TpXKg
 ETvQ==
X-Gm-Message-State: AOAM533bU1F2TNxI5MRJS3KfoGEnEBJ6pituA+3eVkxW2WfhPSXSFcVu
 I8TFfKcHPC+77W3a/QJnVSNJScOoVO277my+pg5mMpVtSBHoDKmWrAh4K97CR5T8ra3bVcFZ3RC
 Lk+LUoxFM7TFpO3gyCBO+YVHszpRUecfRGoNkCZMk3V4mcXf3BjUf884Rx23Dmy79
X-Received: by 2002:adf:ecca:: with SMTP id s10mr99443wro.324.1614797227135;
 Wed, 03 Mar 2021 10:47:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycHxQvlOnM6FizoZ5rxZXTKjf0vtyPdQkxbbHaBtg6FZ0jWTbXMMadH/C/uhtJJbVK69mS1g==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr99413wro.324.1614797226889;
 Wed, 03 Mar 2021 10:47:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e1sm5848347wrw.85.2021.03.03.10.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:47:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] seccomp: Replace the word 'blacklist'
Date: Wed,  3 Mar 2021 19:46:42 +0100
Message-Id: <20210303184644.1639691-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303184644.1639691-1-philmd@redhat.com>
References: <20210303184644.1639691-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Eduardo Otubo <otubo@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Reworded comment (thuth)
---
 softmmu/qemu-seccomp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 377ef6937ca..9c29d9cf007 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -45,8 +45,8 @@ const struct scmp_arg_cmp sched_setscheduler_arg[] = {
     { .arg = 1, .op = SCMP_CMP_NE, .datum_a = SCHED_IDLE }
 };
 
-static const struct QemuSeccompSyscall blacklist[] = {
-    /* default set of syscalls to blacklist */
+static const struct QemuSeccompSyscall denylist[] = {
+    /* default set of syscalls that should get blocked */
     { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT },
     { SCMP_SYS(swapon),                 QEMU_SECCOMP_SET_DEFAULT },
     { SCMP_SYS(swapoff),                QEMU_SECCOMP_SET_DEFAULT },
@@ -175,18 +175,18 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
         goto seccomp_return;
     }
 
-    for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
+    for (i = 0; i < ARRAY_SIZE(denylist); i++) {
         uint32_t action;
-        if (!(seccomp_opts & blacklist[i].set)) {
+        if (!(seccomp_opts & denylist[i].set)) {
             continue;
         }
 
-        action = qemu_seccomp_get_action(blacklist[i].set);
-        rc = seccomp_rule_add_array(ctx, action, blacklist[i].num,
-                                    blacklist[i].narg, blacklist[i].arg_cmp);
+        action = qemu_seccomp_get_action(denylist[i].set);
+        rc = seccomp_rule_add_array(ctx, action, denylist[i].num,
+                                    denylist[i].narg, denylist[i].arg_cmp);
         if (rc < 0) {
             error_setg_errno(errp, -rc,
-                             "failed to add seccomp blacklist rules");
+                             "failed to add seccomp denylist rules");
             goto seccomp_return;
         }
     }
-- 
2.26.2


