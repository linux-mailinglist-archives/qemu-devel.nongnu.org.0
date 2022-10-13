Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521C5FD7A4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:12:24 +0200 (CEST)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivCR-0004Ci-1V
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiud2-0003Ua-B9
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiucn-0006lI-K4
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665653732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=szZDh2M7i1pg4Zrcn5keg4VIQiRvx/sk113bWie3Fis=;
 b=cQYtkbmqAsQWV/EA33WMFZNupQJ3srct4oY0LiGlP/N/T8IBqZhThM2/YZpSMsKJGYQuZ6
 5J7TRizkrfZiBDMfA/aZtbJKvwv/bpGQu6E2JNwDDvzQA/4EYF7Ko2mYAKvRKu5fQCuu6K
 roDau9FTUHWcHTsJrW5Lz6Gv1lTJ/Ig=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-YtgLw6dxMeaAy2AxOWELZA-1; Thu, 13 Oct 2022 05:35:28 -0400
X-MC-Unique: YtgLw6dxMeaAy2AxOWELZA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640240d400b0045cec07c3dcso894563edb.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 02:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=szZDh2M7i1pg4Zrcn5keg4VIQiRvx/sk113bWie3Fis=;
 b=8MDHuS7jLe+9Cw4MeHI3lWxAyyTdV4NiekIaiLtUVHcrnbbIniI+1n7VmVrLQsm8yl
 rhsPEi3vldJHWagS9zIdgEyuGBuF3kLkNUL/IyZBCsvxhLmMp9yPcZ3Y0CzqOZkZrgHU
 u4Nty1eYrqXyB/SDxaZLCHwrlNrsRSSk3oexupLP/A5Wj56EkJx6Eux5dZpoVwsaenwp
 XbNhoNQNY3As7Kw69hNLNYfJPTEuscnIqw9pzns1pEwik0FCoi6MBe1pGerED2HpHNLE
 k7/S3rPpyFtThirEU279YASAtKdqaOpuiPBeK+6YVlDX6rCwN0yo59rncQ//EVjwvm00
 Fqeg==
X-Gm-Message-State: ACrzQf0ygcz5txB0JsMw2D7Ni0IHIRXc6F20ykuS+ltzGxY4uUXjK53Z
 +n0tmAaHhZgLQ1CUr9GOU7S71k7D17G3Lc7TWBXHR9l11bJqVGoVRgkSKPSmxDH83oXsYa7/Q4m
 T2gCt8nQU3V8yq8iksTg8kg60JoEBh+Owcpam8CnidfA5P2KwBsT+bFO3O9Ebf0IwMi0=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr25574671ejb.80.1665653727249; 
 Thu, 13 Oct 2022 02:35:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4cmJsrq/Xc1aDc0DOYSft6xH6rrEkteM748CRTxuO1vu8SIkEZl43FTeCqkcPqJW0wceN+AQ==
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr25574655ejb.80.1665653727023; 
 Thu, 13 Oct 2022 02:35:27 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a05640217d600b0045af1e70137sm11154855edy.14.2022.10.13.02.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 02:35:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH] blkdebug: ignore invalid rules in non-coroutine context
Date: Thu, 13 Oct 2022 11:35:23 +0200
Message-Id: <20221013093523.586361-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

blkdebug events can be called from either non-coroutine or coroutine
contexts.  However, some actions (specifically suspend actions and
errors reported with immediately=off) only make sense from within
a coroutine.

Currently, using those action would lead to an abort() in
qemu_coroutine_yield() ("Co-routine is yielding to no one").
Catch them and print an error instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..bf0aedb17d 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -31,6 +31,7 @@
 #include "block/qdict.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/error-report.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
@@ -623,8 +624,13 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 
     qemu_mutex_unlock(&s->lock);
     if (!immediately) {
-        aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
-        qemu_coroutine_yield();
+        if (qemu_in_coroutine()) {
+            aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
+            qemu_coroutine_yield();
+        } else {
+            error_report("Non-coroutine event %s needs immediately = off\n",
+                         BlkdebugEvent_lookup.array[rule->event]);
+        }
     }
 
     return -error;
@@ -858,7 +864,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
     }
 
     while (actions_count[ACTION_SUSPEND] > 0) {
-        qemu_coroutine_yield();
+        if (qemu_in_coroutine()) {
+            qemu_coroutine_yield();
+        } else {
+            error_report("Non-coroutine event %s cannot suspend\n",
+                         BlkdebugEvent_lookup.array[event]);
+        }
         actions_count[ACTION_SUSPEND]--;
     }
 }
-- 
2.37.3


