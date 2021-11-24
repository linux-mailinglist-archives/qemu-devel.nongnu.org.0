Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B233A45B7DC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:58:20 +0100 (CET)
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp2h-0005O0-Re
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp01-0002nA-RJ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpozz-0004Us-78
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wKjbCKx6KWbCQkGZiOp80kwA296KWgFK4fMiq7yOmg=;
 b=f0JxzKSfIgSRjn1b3jKlHiFBQQ3rfEZnj+tH9ViHJgYUib34qMo0+CjQS1d60BW3ar4PsZ
 DSDpOe5JAgr7iaoEOR0xrOOA97OL23Cueu3lBx8oadgPJx+ZMr/lu+EhzbTQgxB6D+TnqX
 fDuxRmNKfnmEiUP6dcehRjC4Shhxb5U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-RQOgVIa8MEaQKBG7aEEZ4g-1; Wed, 24 Nov 2021 04:55:29 -0500
X-MC-Unique: RQOgVIa8MEaQKBG7aEEZ4g-1
Received: by mail-wm1-f72.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so1047193wmj.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4wKjbCKx6KWbCQkGZiOp80kwA296KWgFK4fMiq7yOmg=;
 b=xLJz36YyZiDydR/M+oM7usuLjgCi1dit+farDD5v76uPbP5Ae/nUrB9PF0x1rfSwVI
 8XlEXIMUPM5ifr74IfgjXmfMRRBKFQLiUOxgKuv2WQdYXYaHiZBXGxwG4TQAhX/s7Bse
 gneUWMZXNXEDU+sL2p2RsR5Xpp2dBeoeFO/MpP03rlTwfLyjmIf1JLTyi/GMap9Lf6Qk
 is6q9UIpiKacXeewUWpcjtpAVqAzsqEBwhjJPr/WfKnWatRtZmyLNNJshCMG+OXb/DMO
 J9+Oa6LkVVRNDupzs2R2RKLFQUNwUF4tZaXIZE8Q73KObojXe2TU8nF4VNQKWJtSzmnn
 11yw==
X-Gm-Message-State: AOAM532Nfs6aLlTk8e8mPuZIpoXgCH4000PwIKm0y9UEbd0MWoxA/l/y
 8FlkVYbJ55f5uvUORcjpqIIXa5YqvktuCb8zO05WWoP71fg6/izu09xDe8j3OlGzQBgOLHNFMxs
 y6mzZvyM2etSvbwkWJM2IWLHt4TBGPQ9F4CABgpu6ne45nkvZd2leWHS4HUU3rZV2AR8=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr13370557wmh.140.1637747728172; 
 Wed, 24 Nov 2021 01:55:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRoQo694PydnmrV8dmdHDqhq5l2F4MJ+8Afc2W8QBGS5qWDaba7qhZfCxyuDAYq7c11ddQNw==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr13370519wmh.140.1637747727871; 
 Wed, 24 Nov 2021 01:55:27 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id l3sm3830146wmq.46.2021.11.24.01.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/23] multifd: The variable is only used inside the loop
Date: Wed, 24 Nov 2021 10:54:42 +0100
Message-Id: <20211124095500.42078-6-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com>
References: <20211124095500.42078-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cdeffdc4c5..ce7101cf9d 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -629,7 +629,6 @@ static void *multifd_send_thread(void *opaque)
     MultiFDSendParams *p = opaque;
     Error *local_err = NULL;
     int ret = 0;
-    uint32_t flags = 0;
 
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
@@ -652,7 +651,7 @@ static void *multifd_send_thread(void *opaque)
         if (p->pending_job) {
             uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
-            flags = p->flags;
+            uint32_t flags = p->flags;
 
             if (used) {
                 ret = multifd_send_state->ops->send_prepare(p, used,
-- 
2.33.1


