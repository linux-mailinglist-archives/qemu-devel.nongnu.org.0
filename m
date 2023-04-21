Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA2A6EA708
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:34:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9P-0008TW-Pn; Fri, 21 Apr 2023 05:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9J-0008LM-DL
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9I-00034Z-2x
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYlTiTgp+ce3V9rnKNZfaOq5gwkISE66nwZwyLssxLg=;
 b=QZbuozmSw5eqz498Dmw0vL8s8P7AXMDIR3pX7SpwkaZ9lILBAxeHKvb/jAVviP3OMV/Pwu
 AIEa6tegafwkk95CyL+5mwWgQAONmARuTycmKig/7tuLos6v3lC5rsJbEtwISWjU+bJmPD
 WVGUtxGiDqX/eUv2x3UwblARj+qher0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-8qjNPkTyOV61xj5NcN9kyw-1; Fri, 21 Apr 2023 05:33:45 -0400
X-MC-Unique: 8qjNPkTyOV61xj5NcN9kyw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a342f6516so144204166b.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069624; x=1684661624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYlTiTgp+ce3V9rnKNZfaOq5gwkISE66nwZwyLssxLg=;
 b=LdTTC3qNZKmeQFoOT9skPjvpLPjK2dxZnnvB5Hp6Y7o2MKIEPEtM/8FJKRn9vlGLEI
 8w+CWLXN/U2W/rtSBCXDJCbr8qn7hqhqvelTEG5B6L09GBlFPaeMU0ea9hkdM+PdYFj1
 IvhlmOrDw1aUqUNk9CH6IvAm5DcyLEcgZN566BDOwsvwSOjj094yR4ZBiw+IjtZxIfMK
 oAQUfK1MwONCVOJdYv9Pq3aPm0s/o0sW0QyToQYbbprel/O4DI+MWCOz6am+Zc0eVglB
 yUcTeg7yIgOlOMGaAw5B1yfJIR8dhTMySA7+fjrF8JMYklwVW4Y9SEMtY3V9I/cjCedl
 fWng==
X-Gm-Message-State: AAQBX9dWRpaJJkSGtX4fZanjVtqXUyVa1i5ZFPcb9nD3NWHxiXPCKm0h
 hoOlX9D35UcGF+CuLKzxjn5kN7DzfZ57UZUDJrUYt4gKq6R7KEWA5iyoWqCsuzvjyJ3EF6RivQT
 Wof+UZVUynuC63eoTsdgKjg93laODwiUhrIeCn/IHNwgq4AomKyTs3Ed5Sh7gzskEzuGYFYbstG
 AI6A==
X-Received: by 2002:a17:906:488b:b0:94e:56c4:59f2 with SMTP id
 v11-20020a170906488b00b0094e56c459f2mr1637565ejq.26.1682069624262; 
 Fri, 21 Apr 2023 02:33:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350aiB6PKt5Apr6zvKUWLYjAMElWsrQ5f4ElFyzXlZsukpkSNihc29vqtxgqQ0RhcKwR+g0UFYA==
X-Received: by 2002:a17:906:488b:b0:94e:56c4:59f2 with SMTP id
 v11-20020a170906488b00b0094e56c459f2mr1637549ejq.26.1682069623894; 
 Fri, 21 Apr 2023 02:33:43 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 qf19-20020a1709077f1300b0094ef923a6ccsm1794758ejc.219.2023.04.21.02.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 19/25] qemu-coroutine: remove qatomic_mb_read()
Date: Fri, 21 Apr 2023 11:33:10 +0200
Message-Id: <20230421093316.17941-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace with an explicit barrier and a comment.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 849452369201..17a88f65053e 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -127,9 +127,13 @@ void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co)
         Coroutine *to = QSIMPLEQ_FIRST(&pending);
         CoroutineAction ret;
 
-        /* Cannot rely on the read barrier for to in aio_co_wake(), as there are
-         * callers outside of aio_co_wake() */
-        const char *scheduled = qatomic_mb_read(&to->scheduled);
+        /*
+         * Read to before to->scheduled; pairs with qatomic_cmpxchg in
+         * qemu_co_sleep(), aio_co_schedule() etc.
+         */
+        smp_read_barrier_depends();
+
+        const char *scheduled = qatomic_read(&to->scheduled);
 
         QSIMPLEQ_REMOVE_HEAD(&pending, co_queue_next);
 
-- 
2.40.0


