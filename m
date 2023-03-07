Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B516ADDCF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjm-0007jG-4E; Tue, 07 Mar 2023 06:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjc-00074A-BH
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVja-0008Hd-MT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6XR/lXlciUn+TXMfpyWYEJEroqom4bxx+aRXcNtP9o=;
 b=f9MLkKV8vUQaRqcmXfHfLscpeudUsp5nLf3S5pFYq2JZ2U9wDEOOr0TTL61kdkBtt/7qJG
 C9oXTUzky+sq43Z49V3RMkWZo+s1YlZYzZRmQmi/vb4Nesn5KauoN95Jv71QbrdtY8bOZJ
 cfe/rT9BcFAiaGvR7ozHebF6oGn7HzE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-UepdRbDRPvG89-eXWrroPA-1; Tue, 07 Mar 2023 06:43:57 -0500
X-MC-Unique: UepdRbDRPvG89-eXWrroPA-1
Received: by mail-ed1-f70.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so18734024ede.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6XR/lXlciUn+TXMfpyWYEJEroqom4bxx+aRXcNtP9o=;
 b=2fPikxG21AO90WyOPIB+ixFEgJCtmZk7vdvC1u4OExB4fhkDjhxPmKpXsUNg4LY3ZT
 aPBHwh0v5YI+JJu2hehKtn6lnzTFgts5Q2ArPKCEgEb50qacSNIQWDN37X7gQ7CXVR3P
 7Jrk2W9lcKdBFuufpm6E69O2/8nrfZkBTaWLPN+gb6zIH2gX+N2E58qPWXBojhFL1IBz
 qIoGiFAspneUWdA6vxcJ9FQQJHX3egH6LJTQ6ga78UJ6z2DWN0M3hLu896G+g9UoqVuJ
 CV8jyqNm88REsx/I50+U83y/oqj0xsPhrn0zPD31+sEWHV8qW4H5Y9nVbX8sizPNap4R
 AK5A==
X-Gm-Message-State: AO0yUKUmHOK61WXNMYwnEnCg1jnsGZ4J95ZtCv6omuq6p6qn+GDQHeGG
 7wPV8dXSBtnwW0XT6R77mQvrzpOGIWx7VUYVHtp3K6U+dJxqnTQuE3Pki2/wLVaeft467fca3jS
 T3HTK0xM8cikpMQqLNSHRQpqybqbjeHoabCeJZn5mfVksZcR9WzX9kR4Ny7kSrIba/xqdjb7cxV
 8=
X-Received: by 2002:a17:906:6c84:b0:8b1:32b0:2a24 with SMTP id
 s4-20020a1709066c8400b008b132b02a24mr14549847ejr.47.1678189435500; 
 Tue, 07 Mar 2023 03:43:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9yjiFPOIggOZx9HcDXc8Uc/j7pzIRegSuIOvH9R7CIgR8fXXs/zNAZwUbswLdq7xrGciGgog==
X-Received: by 2002:a17:906:6c84:b0:8b1:32b0:2a24 with SMTP id
 s4-20020a1709066c8400b008b132b02a24mr14549831ejr.47.1678189435210; 
 Tue, 07 Mar 2023 03:43:55 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a170906289500b008ef42f9cf48sm5936743ejd.82.2023.03.07.03.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 9/9] async: clarify usage of barriers in the polling case
Date: Tue,  7 Mar 2023 12:43:29 +0100
Message-Id: <20230307114329.158094-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307114329.158094-1-pbonzini@redhat.com>
References: <20230307114329.158094-1-pbonzini@redhat.com>
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

Explain that aio_context_notifier_poll() relies on
aio_notify_accept() to catch all the memory writes that were
done before ctx->notified was set to true.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/async.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/util/async.c b/util/async.c
index e4b494150e7d..21016a1ac7c1 100644
--- a/util/async.c
+++ b/util/async.c
@@ -474,8 +474,9 @@ void aio_notify_accept(AioContext *ctx)
     qatomic_set(&ctx->notified, false);
 
     /*
-     * Write ctx->notified before reading e.g. bh->flags.  Pairs with smp_wmb
-     * in aio_notify.
+     * Order reads of ctx->notified (in aio_context_notifier_poll()) and the
+     * above clearing of ctx->notified before reads of e.g. bh->flags.  Pairs
+     * with smp_wmb() in aio_notify.
      */
     smp_mb();
 }
@@ -498,6 +499,11 @@ static bool aio_context_notifier_poll(void *opaque)
     EventNotifier *e = opaque;
     AioContext *ctx = container_of(e, AioContext, notifier);
 
+    /*
+     * No need for load-acquire because we just want to kick the
+     * event loop.  aio_notify_accept() takes care of synchronizing
+     * the event loop with the producers.
+     */
     return qatomic_read(&ctx->notified);
 }
 
-- 
2.39.1


