Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB01F5E5E11
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:00:18 +0200 (CEST)
Received: from localhost ([::1]:49874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obI48-0004nH-9f
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtt-0004Hn-FD
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtr-0003A5-18
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbIXLc2gbhI5SakGYPZOv4I8pwxGWkpOB2ebhFwo8P0=;
 b=i4VhH76yoMhUXgbgjlOQNXA1/VB9LQcf8Y97gC8PGh8eMcbERUrhj+6ehPVdaqs4NuEqXe
 /Onxct02M49IOlx8Nsqtr1o4kYZCHd7NK2EHXHU5e9rxZlK2qisxDjc9eP+QD2Zuo1VXku
 KQbtKL1wpZvOeHg1rXPzUaZrdqJk5/c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-NVe6_G5HObW5W9_mZHVp7g-1; Thu, 22 Sep 2022 04:49:37 -0400
X-MC-Unique: NVe6_G5HObW5W9_mZHVp7g-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a05640226c500b00451ec193793so6219285edd.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CbIXLc2gbhI5SakGYPZOv4I8pwxGWkpOB2ebhFwo8P0=;
 b=HGJN4CjP+GIGmz1/6uiH5J2z9PiMQTQHvp/o+Vy5fT6oTv/DscMiPPkCclYVkWgzxP
 75fJULladVCe90C5ZO8d7l4L5DCXfJRw9Qo6KAUB6WzBoLk1Qz5FGt06RvKa4USyDq8p
 FyBWhudLFI9GXEBGdkgWWrFLTKBvkQVDc+FeRoJz3iENIdnKVre45tYJAvW1Hfz1g/Oj
 BQadq43Fw094asoNIQ2fR9JiwS8YUBLFq/Gq9o5C4yTD/9OFVCFU1nSdeLN5MKjqAGPD
 ocVlh1rDDtx7hQQp7lFwIsjEb/Q8yBQdlrXzTE0baxmdu0K1z5ogj2xkk9NWU0LkiLf0
 HUYw==
X-Gm-Message-State: ACrzQf0zAFvHyYYb/0QlJju8wobWYrga6TrHHH1jZ8i38FtAcoDke/Ce
 I9kcHlNLY4/m4nfKC4QLtIAZRN106UEWfxcvrQM+zm5j8WVnZSqpHPwjXC3A45YJu+cOfaRMOv0
 /79wHlHe1OvJiMls2MKpYn49yvbuGFuD8aHipMiDo1pPX/LuxCBFoL5Q26pWrZBEhrj8=
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr1938594ejm.182.1663836575373; 
 Thu, 22 Sep 2022 01:49:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4h65sWl7ToWExHb8IoVZPASibg/h6cFbiQitlPwYuFVQ+Cx2FbOJEZ70LP/REF4+GRoG5Kaw==
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr1938576ejm.182.1663836575135; 
 Thu, 22 Sep 2022 01:49:35 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 fu32-20020a170907b02000b0073d8ad7feeasm2279775ejc.213.2022.09.22.01.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 06/26] blkdebug: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:04 +0200
Message-Id: <20220922084924.201610-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..a93ba61487 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -587,8 +587,8 @@ out:
     return ret;
 }
 
-static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                      BlkdebugIOType iotype)
+static int coroutine_fn rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
+                                   BlkdebugIOType iotype)
 {
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugRule *rule = NULL;
@@ -672,7 +672,7 @@ blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
-static int blkdebug_co_flush(BlockDriverState *bs)
+static int coroutine_fn blkdebug_co_flush(BlockDriverState *bs)
 {
     int err = rule_check(bs, 0, 0, BLKDEBUG_IO_TYPE_FLUSH);
 
@@ -791,7 +791,7 @@ static void blkdebug_close(BlockDriverState *bs)
 }
 
 /* Called with lock held.  */
-static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
+static void coroutine_fn suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 {
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugSuspendedReq *r;
@@ -810,8 +810,8 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 }
 
 /* Called with lock held.  */
-static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
-                         int *action_count, int *new_state)
+static void coroutine_fn process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
+                                      int *action_count, int *new_state)
 {
     BDRVBlkdebugState *s = bs->opaque;
 
@@ -840,7 +840,7 @@ static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
     }
 }
 
-static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
+static void coroutine_fn blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     BDRVBlkdebugState *s = bs->opaque;
     struct BlkdebugRule *rule, *next;
-- 
2.37.3


