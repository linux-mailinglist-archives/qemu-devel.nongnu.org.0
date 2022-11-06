Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9F61E113
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:52:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbNQ-0007M5-E2; Sun, 06 Nov 2022 03:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNO-0007LJ-0r
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNM-0002ri-Ij
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkGtGELGFp15mzI/uIt32Qqrp0h+KlVWMEJ0hk1PfEk=;
 b=A1NG1uqCJTf9obHUp2qhy1Fmkk5wE7eVuoOMc1R3gwCYj395O5Ncdi4hTg452uhNFnfGLz
 F/BNDaPMKmXsdiYO/Ygl5dFmW9SV/MwVUmKirmhMRvwVX2Ydv6FAfZ6nphP0k0VNYOuenL
 U/0NqDr1a0btDXVffp2euTNlI1RyuNU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-3VOT2ZxHM8amGvfnd4GrCQ-1; Sun, 06 Nov 2022 03:51:27 -0500
X-MC-Unique: 3VOT2ZxHM8amGvfnd4GrCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so2006311wra.15
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkGtGELGFp15mzI/uIt32Qqrp0h+KlVWMEJ0hk1PfEk=;
 b=0pSbzFzneL4fyEZJnRyN4yLSc/hhs9P+U32maVtjhC/QXg4gFgIksRNiT5mSbdrQ8H
 /ltSJHHXgiBlvY2dQmqYxjEQ/H+HeHXdPn5WjGXmnDoEWcisgNbhhCa1Lo4nGaiKRARa
 5MbwKc3U/zut6HiB1C/5NkUgB8Tw4XP4Um6n8zOgRATwaH4dKAxw2zmWoIeH4ksaJmE1
 OYXR6ynkj+IjV7REmegrIVvi7xy/jQqGHiONYNSeT9AjvQ19hdbigGCBUCYnLYt+wBcW
 YnnYTYozbShyMQCubyJnfzhDATztO6dXWJnugSDce/QsumEhbhwREqpLM6hPd1+HGXkw
 IKbQ==
X-Gm-Message-State: ACrzQf1VBh52MKb872rovArGfYkYDZsd1aQbJVWxNYM8SiB720zbaGh+
 ICMRXpZu3SNDD7S+IlaQuvQuKorypaEg2rJwby7Pxr1JmtumyB8/1Q6H64Sck0fwaIqj/UmhZnx
 KCIXiJLcU0elvPjZ8dPYTMC7mLMhcsgPTZsIgahxcMBk9IbfsiBgBb1Jx4YnovQaWFqM=
X-Received: by 2002:adf:e6c3:0:b0:236:acdb:4d9b with SMTP id
 y3-20020adfe6c3000000b00236acdb4d9bmr26982136wrm.528.1667724686129; 
 Sun, 06 Nov 2022 01:51:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/dLHPvqvOvZeF36CxtpS70eNgTpS2qkFss4fbEDUW5eIFMcBdFQgaD3vVIxVSL6D2yvlC3w==
X-Received: by 2002:adf:e6c3:0:b0:236:acdb:4d9b with SMTP id
 y3-20020adfe6c3000000b00236acdb4d9bmr26982123wrm.528.1667724685871; 
 Sun, 06 Nov 2022 01:51:25 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adff20e000000b0022e344a63c7sm4169466wro.92.2022.11.06.01.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:51:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 03/12] util/aio-win32: Correct the event array size in
 aio_poll()
Date: Sun,  6 Nov 2022 09:51:06 +0100
Message-Id: <20221106085115.257018-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
object handles. Correct the event array size in aio_poll() and
add a assert() to ensure it does not cause out of bound access.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221019102015.2441622-3-bmeng.cn@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/aio-win32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/aio-win32.c b/util/aio-win32.c
index 44003d645ecd..80cfe012ad8f 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -326,9 +326,9 @@ void aio_dispatch(AioContext *ctx)
 bool aio_poll(AioContext *ctx, bool blocking)
 {
     AioHandler *node;
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
     bool progress, have_select_revents, first;
-    int count;
+    unsigned count;
     int timeout;
 
     /*
@@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
     QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
         if (!node->deleted && node->io_notify
             && aio_node_check(ctx, node->is_external)) {
+            assert(count < MAXIMUM_WAIT_OBJECTS);
             events[count++] = event_notifier_get_handle(node->e);
         }
     }
-- 
2.38.1


