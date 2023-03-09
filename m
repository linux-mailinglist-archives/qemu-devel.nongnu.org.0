Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1C6B1E86
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:46:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBtk-0000Km-Mn; Thu, 09 Mar 2023 03:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBth-0000JI-C5
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBte-00009L-FP
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzy0Dnxaju2oWytg1k07H+qcLnm0fKz+h4olkD7NQWM=;
 b=AOTFxtXstemaQZ3/r0zRXy1bdY9y3yoBKkagVWA9LLqO3QGJgf0ATsBuYhfPxvee5pB2a2
 q5HcES67lzai031EOZ5C0Ecly9z0XsIgyZVUNXzNaD1D5+uab2Hez4FQ5VuIm5sHQA8M4V
 3hWSWfBf0qb9xtp3QHIt/Z+zKvG4oqc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-iYhuMnzmODuqVK-ebBOdwg-1; Thu, 09 Mar 2023 03:45:07 -0500
X-MC-Unique: iYhuMnzmODuqVK-ebBOdwg-1
Received: by mail-ed1-f70.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so1916412ede.11
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzy0Dnxaju2oWytg1k07H+qcLnm0fKz+h4olkD7NQWM=;
 b=Qq/fMaeaQDAhN0GR3foyb4S1c317DJFTUFSrICsqCFEYap/pl0dbDpc+bHFapleLjo
 A4H+uFIYQCzoWCbWE9CqAg+EYJ5HBUVwvpo3x1xT9ioR6iahVvwelT2MHrBDHLqP81zt
 iNg755m/3UlNqC8lQ0wPyBKnBm/cUMx3XcBMNOvd0hJNZUQdEqvczE5x2wIuqNaIytE4
 OzwliOmtLTVufyJg0X01VXVbwqndwk7vtahxZpBe1NnwyLl/recHwKOCMkXR8m8fjAvK
 U0oANkcpy9kzTD3QupFBFWqQXT9+sXnxnN4hfRunRJhBmdpLUKj9Z7IubTzS5S2uhgh1
 yvWQ==
X-Gm-Message-State: AO0yUKVCuDzG0TMsIzCEQTzzKxL5o1tm92VaJf+zyOYkbvs4w2SaLT5r
 nLvAQg5Qi2RtzzAr91pBNkzSFuuz2sWJepCpmjJFSsljQuczu4jipH6sYArJYc7C/luVdKpRBxa
 lDE/bzMr6ksmoaza6/JJ4AaTwSdyI+hSslTSi04NkD88sKp7szXKKR2NQ/Hgq1/PPZogmzxaYYj
 k=
X-Received: by 2002:a05:6402:70f:b0:4af:7390:b488 with SMTP id
 w15-20020a056402070f00b004af7390b488mr20083986edx.40.1678351506187; 
 Thu, 09 Mar 2023 00:45:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/3Q4Xo/vuRZw5/6S7LNvs+Cp2yRE1+6+9hc2ZXEazkiQLiqe2IXi9scSX6IDQ9gnRPYLhUjg==
X-Received: by 2002:a05:6402:70f:b0:4af:7390:b488 with SMTP id
 w15-20020a056402070f00b004af7390b488mr20083974edx.40.1678351505912; 
 Thu, 09 Mar 2023 00:45:05 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a509358000000b004af5001c7ecsm9218807eda.12.2023.03.09.00.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:45:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 5/9] 9pfs: mark more coroutine_fns
Date: Thu,  9 Mar 2023 09:44:52 +0100
Message-Id: <20230309084456.304669-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/9pfs/9p.h    | 4 ++--
 hw/9pfs/codir.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 2fce4140d1e9..1b0d805b9c12 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -203,7 +203,7 @@ typedef struct V9fsDir {
     QemuMutex readdir_mutex_L;
 } V9fsDir;
 
-static inline void v9fs_readdir_lock(V9fsDir *dir)
+static inline void coroutine_fn v9fs_readdir_lock(V9fsDir *dir)
 {
     if (dir->proto_version == V9FS_PROTO_2000U) {
         qemu_co_mutex_lock(&dir->readdir_mutex_u);
@@ -212,7 +212,7 @@ static inline void v9fs_readdir_lock(V9fsDir *dir)
     }
 }
 
-static inline void v9fs_readdir_unlock(V9fsDir *dir)
+static inline void coroutine_fn v9fs_readdir_unlock(V9fsDir *dir)
 {
     if (dir->proto_version == V9FS_PROTO_2000U) {
         qemu_co_mutex_unlock(&dir->readdir_mutex_u);
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 7ba63be489e7..0d0ffa1d2ba8 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -68,9 +68,9 @@ int coroutine_fn v9fs_co_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
  *
  * See v9fs_co_readdir_many() (as its only user) below for details.
  */
-static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
-                           struct V9fsDirEnt **entries, off_t offset,
-                           int32_t maxsize, bool dostat)
+static int coroutine_fn do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
+                                        struct V9fsDirEnt **entries, off_t offset,
+                                        int32_t maxsize, bool dostat)
 {
     V9fsState *s = pdu->s;
     V9fsString name;
-- 
2.39.2


