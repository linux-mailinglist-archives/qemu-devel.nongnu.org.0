Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0153D7937
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:02:08 +0200 (CEST)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Oat-00053Z-7w
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8OZC-0003cd-3M
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8OZ7-0001yt-ED
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627398014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8A7AmnBM4uFD7e8n9o0MuIUwODPnlyITwkjl8nJ12A=;
 b=ApVhblTGdwJ0JNmTWecxU8yVBkj2dA5PIqDumHHjCjzTwj+KSSMgq7CYHOU5xlvivoMfLK
 wZ9a5qhghwf/1fn6hPOK7KGNlOc//BttT3a/FVg0I2q2Y5Hz0Lp52NDXC/chvdtTeXGoQ2
 Wknwak+f+u3zOyX/jZsRKDyIvT6+U5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-RBiiKOzUNHaTPqORB1KBgQ-1; Tue, 27 Jul 2021 11:00:13 -0400
X-MC-Unique: RBiiKOzUNHaTPqORB1KBgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FF7B802928
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 14:59:43 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-36.ams2.redhat.com
 [10.36.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33A3A19D9D;
 Tue, 27 Jul 2021 14:59:42 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] iothread: rename PollParamInfo to IOThreadParamInfo
Date: Tue, 27 Jul 2021 16:59:35 +0200
Message-Id: <20210727145936.147032-2-sgarzare@redhat.com>
In-Reply-To: <20210727145936.147032-1-sgarzare@redhat.com>
References: <20210727145936.147032-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 1793ad0247 ("iothread: add aio-max-batch parameter") added
a new parameter (aio-max-batch) to IOThread and used PollParamInfo
structure to handle it.

Since it is not a parameter of the polling mechanism, we rename the
structure to a more generic IOThreadParamInfo.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 iothread.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/iothread.c b/iothread.c
index ddbbde61f7..a73e560ba0 100644
--- a/iothread.c
+++ b/iothread.c
@@ -215,18 +215,18 @@ static void iothread_complete(UserCreatable *obj, Error **errp)
 typedef struct {
     const char *name;
     ptrdiff_t offset; /* field's byte offset in IOThread struct */
-} PollParamInfo;
+} IOThreadParamInfo;
 
-static PollParamInfo poll_max_ns_info = {
+static IOThreadParamInfo poll_max_ns_info = {
     "poll-max-ns", offsetof(IOThread, poll_max_ns),
 };
-static PollParamInfo poll_grow_info = {
+static IOThreadParamInfo poll_grow_info = {
     "poll-grow", offsetof(IOThread, poll_grow),
 };
-static PollParamInfo poll_shrink_info = {
+static IOThreadParamInfo poll_shrink_info = {
     "poll-shrink", offsetof(IOThread, poll_shrink),
 };
-static PollParamInfo aio_max_batch_info = {
+static IOThreadParamInfo aio_max_batch_info = {
     "aio-max-batch", offsetof(IOThread, aio_max_batch),
 };
 
@@ -234,7 +234,7 @@ static void iothread_get_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
 {
     IOThread *iothread = IOTHREAD(obj);
-    PollParamInfo *info = opaque;
+    IOThreadParamInfo *info = opaque;
     int64_t *field = (void *)iothread + info->offset;
 
     visit_type_int64(v, name, field, errp);
@@ -244,7 +244,7 @@ static bool iothread_set_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
 {
     IOThread *iothread = IOTHREAD(obj);
-    PollParamInfo *info = opaque;
+    IOThreadParamInfo *info = opaque;
     int64_t *field = (void *)iothread + info->offset;
     int64_t value;
 
-- 
2.31.1


