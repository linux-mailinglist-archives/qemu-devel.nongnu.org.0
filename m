Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB086BAE31
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 11:52:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOjk-0006uc-4Q; Wed, 15 Mar 2023 06:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOjg-0006u6-H8
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOje-0000yX-QD
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678877518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=be4dr73QVvNek1LJE5rO0lMLUnb9rLQsctGIME0sdKQ=;
 b=DAv8CJv+OBFlkWIbVRN8dkYHGF6MWEzEVFqjH+4T606fJcAP3AyHSI35ybD2DCgc9b4iSa
 ncZ6sPlDRzxe626p21xzG73qSLpT2MtjcU1fu1AYKOjPvSTjS9fm2kmIcAwopK4GOZeuGY
 rcOf6f8TI7MRJpkwqK3cZiXTwtEG7Uw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-yy_-Rk1HOMCTnvvO5CENig-1; Wed, 15 Mar 2023 06:51:57 -0400
X-MC-Unique: yy_-Rk1HOMCTnvvO5CENig-1
Received: by mail-wr1-f71.google.com with SMTP id
 g7-20020a5d6987000000b002cea7acd26fso1678508wru.5
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 03:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=be4dr73QVvNek1LJE5rO0lMLUnb9rLQsctGIME0sdKQ=;
 b=h0NtAagZiDBmpv4ndFkyzsUqRPe5KAXyrPaIQNMApju7FOZbVbJ9AbbWVXDmX4OZj8
 gHHV3IQBdu1zUIGIZYFBlGvaS6j4hkjhXX1B+5wxKLLM39U2wovCkKoMM5Zjv1xjFrZ/
 3LSKOvLCZo4GZ5W+Ha0b4TTvp2DMPLyV1VuCjpROgt19nl+/LKx2L4UZLW2Fpiz8v4nL
 2dsdYDs0ENICVoICC3xUjaf1C8sCZFOPiy/y16jes96DELTI+NrAZop4StmjHXXaTpnb
 akx5K0VMsVbVpM/v9vwpjf8x3c+dQ5IyR7Q6gJY2C5Brzr/ysshH0Sre4lFll9kqJA0A
 cFSQ==
X-Gm-Message-State: AO0yUKW+FhXGJ5ltrWuowOMsxpwKkSgmCQDCMR9n9D+BRYbA/vAWu3pL
 VgQsfb4j8gwziFrk+JFEJ9Jzk2LbQphNyjAMpIINroymalqfPEuVOFDarFemFxjPzpOROqRZdJR
 SN9zYN+uiIcNuoJ/2T9UMbxnWoLDkf+4baboOKm3MrtOAC2aqxxO+9/KllwlxMx/Oct0OWFuqj/
 g=
X-Received: by 2002:adf:f60f:0:b0:2cf:f061:4913 with SMTP id
 t15-20020adff60f000000b002cff0614913mr1524305wrp.49.1678877515748; 
 Wed, 15 Mar 2023 03:51:55 -0700 (PDT)
X-Google-Smtp-Source: AK7set912jRfgkIgJgq7dTqw6JUy0W3YTNV9CaCUp63qPX8QIlaoaiVDA8tk8cj/DoX6LLuwhMGP8Q==
X-Received: by 2002:adf:f60f:0:b0:2cf:f061:4913 with SMTP id
 t15-20020adff60f000000b002cff0614913mr1524293wrp.49.1678877515460; 
 Wed, 15 Mar 2023 03:51:55 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5d55c2000000b002c53f6c7599sm4237836wrw.29.2023.03.15.03.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 03:51:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fiona Ebner <f.ebner@proxmox.com>, Dominik Csapak <d.csapak@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 4/4] vl: defuse PID file path resolve error
Date: Wed, 15 Mar 2023 11:51:48 +0100
Message-Id: <20230315105148.611544-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315105148.611544-1-pbonzini@redhat.com>
References: <20230315105148.611544-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fiona Ebner <f.ebner@proxmox.com>

Commit 85c4bf8aa6 ("vl: Unlink absolute PID file path") introduced a
critical error when the PID file path cannot be resolved. Before this
commit, it was possible to invoke QEMU when the PID file was a file
created with mkstemp that was already unlinked at the time of the
invocation. There might be other similar scenarios.

It should not be a critical error when the PID file unlink notifier
can't be registered, because the path can't be resolved. If the file
is already gone from QEMU's perspective, silently ignore the error.
Otherwise, only print a warning.

Fixes: 85c4bf8aa6 ("vl: Unlink absolute PID file path")
Reported-by: Dominik Csapak <d.csapak@proxmox.com>
Suggested-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221031094716.39786-1-f.ebner@proxmox.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3340f63c3764..ea20b23e4c84 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2465,10 +2465,11 @@ static void qemu_maybe_daemonize(const char *pid_file)
 
         pid_file_realpath = g_malloc0(PATH_MAX);
         if (!realpath(pid_file, pid_file_realpath)) {
-            error_report("cannot resolve PID file path: %s: %s",
-                         pid_file, strerror(errno));
-            unlink(pid_file);
-            exit(1);
+            if (errno != ENOENT) {
+                warn_report("not removing PID file on exit: cannot resolve PID "
+                            "file path: %s: %s", pid_file, strerror(errno));
+            }
+            return;
         }
 
         qemu_unlink_pidfile_notifier = (struct UnlinkPidfileNotifier) {
-- 
2.39.2


