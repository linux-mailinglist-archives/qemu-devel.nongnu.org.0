Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84D6D8370
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:18:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5pt-000269-Cs; Wed, 05 Apr 2023 12:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk5pj-000250-UN
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk5pi-0007WY-5C
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680711481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZDKX6DN0GycYg9jzgH1X4Sy74NIHEOXcjZ7Jwmyr5s=;
 b=KxJRGphfmNwVzvkSQOCXaEoBSfQMlwtFf0/+H1YGiH8BubzvpmG/rmZK9QVooDvuzFtHCr
 KsSSLnk+/FcTOuK1PW8e6+MX60JUDCrfXe3e8QFCejLj+KqX3Y/IYswizmaN+fPAmO8xTp
 2c4AhgpLv4GG+I6FAnWCvNd/eoES5I8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-gzzqLjpPPgCvQGy8CW_jRg-1; Wed, 05 Apr 2023 12:17:59 -0400
X-MC-Unique: gzzqLjpPPgCvQGy8CW_jRg-1
Received: by mail-ed1-f71.google.com with SMTP id
 x35-20020a50baa6000000b005021d1b1e9eso50790747ede.13
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680711477; x=1683303477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZDKX6DN0GycYg9jzgH1X4Sy74NIHEOXcjZ7Jwmyr5s=;
 b=FWazG+ZLVVXoo+pEtBqZEPqeDwY6DQxUrvOWCrQDi7DUKB6BfA40DzNVf3Qwgl4rS0
 fzp3o/xrwIbRsOIAxXsbSiaAo50QinVsWVopGQQKIc01EFDO87kU8JlXreKs2pT+hMxA
 UiVJuq3XBzic0UvecS5KQuTtKOt0Zw7z1MHKLEFRvHRqNQ6fj7lOuvJ+QH/8WbSLb+oX
 w9YhjTLbi+pekiFaTflN44u0swWkupHr0PP7K0+YULCRRPJz3Nj14FJxNZiCGHXU22ce
 0uxuYdxxrvvumjqwMbaCfNdf0SlY5+x9PWfqRsKNs7b5na3GuCUW6AvYEdVPS4FDqxQw
 mn0A==
X-Gm-Message-State: AAQBX9eVqlC9EA+6o/wbhkzSFMKXN6T1OQC+uy4XFu2Jk8pY2avvodaH
 nibLMSynPm2A0/MgKnCgJCICFZ8RNeupQAGjp1m94zkruEjJdCzwh7Gm3meDtot0OYSh5oW6MUq
 GQYnaXERF4tp4FfuZIyCFKVejRLmRqRIb+AnyyM8Oh2AEVSEQYHqFA+uhAcv4uPf1IS1hb5qw3S
 E=
X-Received: by 2002:a17:907:3d92:b0:93d:1c2b:bd23 with SMTP id
 he18-20020a1709073d9200b0093d1c2bbd23mr4715595ejc.39.1680711477641; 
 Wed, 05 Apr 2023 09:17:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZPGbyFFfvGzxr0u4A753S0cbXqIZXFVa5F7SCn+VD4UXBUTXzD0bmfRYlzFRwxazfFJsqFHg==
X-Received: by 2002:a17:907:3d92:b0:93d:1c2b:bd23 with SMTP id
 he18-20020a1709073d9200b0093d1c2bbd23mr4715571ejc.39.1680711477400; 
 Wed, 05 Apr 2023 09:17:57 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906c00700b0093f83562f09sm7551627ejz.87.2023.04.05.09.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:17:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 f.ebner@proxmox.com
Subject: [PATCH 1/3] aio-posix: disable polling after aio_disable_external()
Date: Wed,  5 Apr 2023 18:17:50 +0200
Message-Id: <20230405161752.194727-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405161752.194727-1-pbonzini@redhat.com>
References: <20230405161752.194727-1-pbonzini@redhat.com>
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

Polling can cause external requests to be picked up even if the AioContext
is not looking at external file descriptors.  Disable all polling between
aio_disable_external() and aio_enable_external(), since aio_set_fd_poll()
does not distinguish external handlers from those that in principle could
run.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/aio-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index a8be940f760d..0d22e3d6d37c 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -29,7 +29,7 @@
 
 bool aio_poll_disabled(AioContext *ctx)
 {
-    return qatomic_read(&ctx->poll_disable_cnt);
+    return qatomic_read(&ctx->poll_disable_cnt) || qatomic_read(&ctx->external_disable_cnt);
 }
 
 void aio_add_ready_handler(AioHandlerList *ready_list,
-- 
2.39.2


