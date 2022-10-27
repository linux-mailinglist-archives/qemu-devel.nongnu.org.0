Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE3610090
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:44:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7ic-0006c5-Bp; Thu, 27 Oct 2022 14:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7ga-0001tK-1C
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gT-0002YD-41
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndferuitb2trbz54QVco1eBmplrgVGbMTaTZFNNxu7s=;
 b=IxselgFFzneDOX+9wGRef8yfWig42PYHBtkS/T0HMQicwo8Iy2xpEJ7Erkd+p2sfj0PbOB
 qWVT2Pj3+qPlcXs992uEHYqhqn0/BQ/aZtzluctolNEHbaWyWseNqLxKPttF8laZo1S3qb
 I2eX3+MlgRQeBnL/hhHHjLSeislHrnk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-xoE9WiBZMGSrowuKZl7h_w-1; Thu, 27 Oct 2022 14:32:50 -0400
X-MC-Unique: xoE9WiBZMGSrowuKZl7h_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8173385A583;
 Thu, 27 Oct 2022 18:32:50 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C00101121320;
 Thu, 27 Oct 2022 18:32:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 40/58] coroutine-io: add missing coroutine_fn annotation to
 prototypes
Date: Thu, 27 Oct 2022 20:31:28 +0200
Message-Id: <20221027183146.463129-41-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-8-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/coroutine.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index d848489b65..06d323143c 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -378,8 +378,9 @@ void qemu_coroutine_dec_pool_size(unsigned int additional_pool_size);
  * The same interface as qemu_sendv_recvv(), with added yielding.
  * XXX should mark these as coroutine_fn
  */
-ssize_t qemu_co_sendv_recvv(int sockfd, struct iovec *iov, unsigned iov_cnt,
-                            size_t offset, size_t bytes, bool do_send);
+ssize_t coroutine_fn qemu_co_sendv_recvv(int sockfd, struct iovec *iov,
+                                         unsigned iov_cnt, size_t offset,
+                                         size_t bytes, bool do_send);
 #define qemu_co_recvv(sockfd, iov, iov_cnt, offset, bytes) \
   qemu_co_sendv_recvv(sockfd, iov, iov_cnt, offset, bytes, false)
 #define qemu_co_sendv(sockfd, iov, iov_cnt, offset, bytes) \
@@ -388,7 +389,8 @@ ssize_t qemu_co_sendv_recvv(int sockfd, struct iovec *iov, unsigned iov_cnt,
 /**
  * The same as above, but with just a single buffer
  */
-ssize_t qemu_co_send_recv(int sockfd, void *buf, size_t bytes, bool do_send);
+ssize_t coroutine_fn qemu_co_send_recv(int sockfd, void *buf, size_t bytes,
+                                       bool do_send);
 #define qemu_co_recv(sockfd, buf, bytes) \
   qemu_co_send_recv(sockfd, buf, bytes, false)
 #define qemu_co_send(sockfd, buf, bytes) \
-- 
2.37.3


