Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1935E5E85
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:26:35 +0200 (CEST)
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obITa-0000aB-Mr
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu6-0004Rq-Iq
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu4-0003De-1S
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y70IF9zLzzuGZH6c3R4J73YdmxCLis2lJBd3y27tBwU=;
 b=FC143fycPaXgoG/E5kUO6hutiodyaSD4QWSCdlhAQIBbFF0uZ4mby6lPf2HYwfy4XkvxF4
 NSwglsj9Og2PeWgw2FF211NXXeH1CiiT8V0YUzU5ohzk17NBvw30xuEyy1yo8877UTMQlk
 gqZYmzwPbXO42RgXRoJIeii0Qq40K68=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-eHjPYJbcMZKXHT1_LS83DQ-1; Thu, 22 Sep 2022 04:49:42 -0400
X-MC-Unique: eHjPYJbcMZKXHT1_LS83DQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w17-20020a056402269100b0045249bc17a9so6161657edd.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=y70IF9zLzzuGZH6c3R4J73YdmxCLis2lJBd3y27tBwU=;
 b=jurVEagAL26zxd12FD/9amK4Kq/zLOg9CmmW6E2FMOlXtES+uKBhFiBCM3Tw0kbPfN
 8S+zv7Qmx53y55szSpCh+rETbfDWQxpQLDTP9bHp2rawEUhU31qb0DijnZyE/tqaAu5n
 G+dS0s5hNnUiSQucnyxMC3j9shFkUssV9zpEksAmO29JA6+96x/h7v5bl6LJW+bnAst9
 Pa1PDcfIJdZ7/SpX6GRn+DumFnY1mR9ZQSeLEoMzR6N4qrkDtxhDNr0L+K1Qj77rm04s
 UMRBKK2LTJvaehZLrP6FMpH+RYHMZ+DRRehXuHxzMVpfZUniRqy9OhJQNjdf2R6anOlu
 XmJw==
X-Gm-Message-State: ACrzQf0WL5eh7865XyO7o1a6h42cs7yqsU2XSHQUwUI8kDl9veGPe9gt
 YMTsg/0Irbe9hk6cvMkWUJ7YnZHxNXRu8kRLSCsrNKfl8uzbFJoJIyE7Ed815idUw72aJQeQ2ae
 FPeAX9SY26hiTmWh8XkwBcTEvfwQoknIacWU5kKhrkAqMeBJ91zZVIU45Tq8P2RuemYs=
X-Received: by 2002:aa7:d054:0:b0:450:f6b9:bc2e with SMTP id
 n20-20020aa7d054000000b00450f6b9bc2emr2081750edo.413.1663836581433; 
 Thu, 22 Sep 2022 01:49:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oDkiaTM/8Y7Ykdxo68g/7KEbaW3RG3IVvewCTa+0eAcVz1ZLn/0anMDGjewZQr7GhPP5Ahw==
X-Received: by 2002:aa7:d054:0:b0:450:f6b9:bc2e with SMTP id
 n20-20020aa7d054000000b00450f6b9bc2emr2081732edo.413.1663836581168; 
 Thu, 22 Sep 2022 01:49:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ay21-20020a056402203500b0044e9601e53fsm3244928edb.19.2022.09.22.01.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 10/26] nbd: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:08 +0200
Message-Id: <20220922084924.201610-11-pbonzini@redhat.com>
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
 block/nbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 97683cce27..786ee79013 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -983,11 +983,11 @@ static void nbd_iter_request_error(NBDReplyChunkIter *iter, int ret)
  * nbd_reply_chunk_iter_receive
  * The pointer stored in @payload requires g_free() to free it.
  */
-static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
-                                         NBDReplyChunkIter *iter,
-                                         uint64_t handle,
-                                         QEMUIOVector *qiov, NBDReply *reply,
-                                         void **payload)
+static bool coroutine_fn nbd_reply_chunk_iter_receive(BDRVNBDState *s,
+                                                      NBDReplyChunkIter *iter,
+                                                      uint64_t handle,
+                                                      QEMUIOVector *qiov, NBDReply *reply,
+                                                      void **payload)
 {
     int ret, request_ret;
     NBDReply local_reply;
-- 
2.37.3


