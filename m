Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6B5BF1AC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:03:58 +0200 (CEST)
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanDZ-0000Mx-Lh
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsq-0007NN-9j
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsW-00083F-Bn
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663713486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4d6wNdJVnWaHfunZXTn5EfI6vsKLdU6f2hPjDDIoWd0=;
 b=faJ3ZTdl5t0z+Zb+UdMF8L+msdXfb5CkOOqOnl5VI3KccwSv1mZ2shoc5r7n3iAc1cH47O
 LaiWpHswOGNZDlp7JUI5ZR3APxOug30DIqGoZ2qsD8RmS6i/qNrLfQPc49Dff8TbZjthmq
 ghhaU+gPH62vMk9y08uPPLxXDLtLXDE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-Zj1UQ1TaOxu4-h_cviH2Vw-1; Tue, 20 Sep 2022 18:38:05 -0400
X-MC-Unique: Zj1UQ1TaOxu4-h_cviH2Vw-1
Received: by mail-qk1-f200.google.com with SMTP id
 k2-20020a05620a414200b006ceec443c8bso3088497qko.14
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4d6wNdJVnWaHfunZXTn5EfI6vsKLdU6f2hPjDDIoWd0=;
 b=QpCyt22FM+8mYGM1robw+jHirIpE6lossn2gVROQhgHXzjsaGaOUQ6TXHPw59GckiL
 uaxNwrydiSMHnJjO6jZ11oNKqP/kumU6Aa6rLWpAqqfwOLr2wqZQ5WTem4Sq97EbZ6Q3
 BoGJRasO+mfn9VkPoqyJZwCjYiGflnoJI/9TGAzf5ZTa/dTdxbwt4ockGBxnJhJjCGOF
 BGfBgv9/D3b5Y/5IZwh233T1QW7N0VpX0KJrFsZnyNzVRhOYb2Yz9/iZAcjhEyL2lx7M
 8j8bflBCsrdJQTQMfFk2TWjE8ExmDQ1ruCRMXzaGEhGedR4KBaALg81OEokRDXINAHu0
 A17Q==
X-Gm-Message-State: ACrzQf2II1g75oKvWc6xrljqghZZt8YuY7SIMkxsee3fHqokA/g4dFdC
 fJyafw3owIa8wjxQmpnfK0kt8WEOke/LUuM+wED3lQOC7HciBiOxMgBcWLT/2Txq09/VdFHb9Gw
 txG4VPmepIgZnEWlqpSeGvQhRzS8PbgKuwS285jgttF3J6iZTfMO6tAohNUGjpGri
X-Received: by 2002:a05:620a:998:b0:6ce:6069:c713 with SMTP id
 x24-20020a05620a099800b006ce6069c713mr18450220qkx.181.1663713484840; 
 Tue, 20 Sep 2022 15:38:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5QkQ8sjWqg9fUDYjfjNGxQ32orDz0f8uEicE/gMXokI/sr2525d/YshZmRh/Db9W1Fweik/g==
X-Received: by 2002:a05:620a:998:b0:6ce:6069:c713 with SMTP id
 x24-20020a05620a099800b006ce6069c713mr18450201qkx.181.1663713484564; 
 Tue, 20 Sep 2022 15:38:04 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006bbb07ebd83sm697499qkb.108.2022.09.20.15.38.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:38:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 2/5] migration: Fix race on qemu_file_shutdown()
Date: Tue, 20 Sep 2022 18:37:57 -0400
Message-Id: <20220920223800.47467-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920223800.47467-1-peterx@redhat.com>
References: <20220920223800.47467-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In qemu_file_shutdown(), there's a possible race if with current order of
operation.  There're two major things to do:

  (1) Do real shutdown() (e.g. shutdown() syscall on socket)
  (2) Update qemufile's last_error

We must do (2) before (1) otherwise there can be a race condition like:

      page receiver                     other thread
      -------------                     ------------
      qemu_get_buffer()
                                        do shutdown()
        returns 0 (buffer all zero)
        (meanwhile we didn't check this retcode)
      try to detect IO error
        last_error==NULL, IO okay
      install ALL-ZERO page
                                        set last_error
      --> guest crash!

To fix this, we can also check retval of qemu_get_buffer(), but not all
APIs can be properly checked and ultimately we still need to go back to
qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.

Maybe some day a rework of qemufile API is really needed, but for now keep
using qemu_file_get_error() and fix it by not allowing that race condition
to happen.  Here shutdown() is indeed special because the last_error was
emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
error triggers so we won't miss those ones, only shutdown() is a bit tricky
here.

Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/qemu-file.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 4f400c2e52..2d5f74ffc2 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -79,6 +79,30 @@ int qemu_file_shutdown(QEMUFile *f)
     int ret = 0;
 
     f->shutdown = true;
+
+    /*
+     * We must set qemufile error before the real shutdown(), otherwise
+     * there can be a race window where we thought IO all went though
+     * (because last_error==NULL) but actually IO has already stopped.
+     *
+     * If without correct ordering, the race can happen like this:
+     *
+     *      page receiver                     other thread
+     *      -------------                     ------------
+     *      qemu_get_buffer()
+     *                                        do shutdown()
+     *        returns 0 (buffer all zero)
+     *        (we didn't check this retcode)
+     *      try to detect IO error
+     *        last_error==NULL, IO okay
+     *      install ALL-ZERO page
+     *                                        set last_error
+     *      --> guest crash!
+     */
+    if (!f->last_error) {
+        qemu_file_set_error(f, -EIO);
+    }
+
     if (!qio_channel_has_feature(f->ioc,
                                  QIO_CHANNEL_FEATURE_SHUTDOWN)) {
         return -ENOSYS;
@@ -88,9 +112,6 @@ int qemu_file_shutdown(QEMUFile *f)
         ret = -EIO;
     }
 
-    if (!f->last_error) {
-        qemu_file_set_error(f, -EIO);
-    }
     return ret;
 }
 
-- 
2.32.0


