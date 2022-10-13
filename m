Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732085FD9A0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:53:18 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixi9-0007Mf-F4
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixT1-0001Xw-1E
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSz-00046Y-Il
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BK9V7BF4FDWFPbVioi/6hP2ritYONTmY8uKeRXf0/70=;
 b=fVOcmNEd1ffl46Udhl0UMeSq7hSPnE0pPdl/lcNSBsGqToLZ7WC/MG8tGWdC5vYDwdREEZ
 aHBze5Nyi69Zeb4Tat6LuLu6M+ekXaW+Ui4BQSHyIUxRjgEDsaeQk3vIrDVvuWkCZ2jmL4
 PXnndqf5lFvQxdmmqULhyeDec9XIqIA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-AYMd0I9XPziFuCNUJf6iqw-1; Thu, 13 Oct 2022 08:37:36 -0400
X-MC-Unique: AYMd0I9XPziFuCNUJf6iqw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z16-20020a05640235d000b0045c0360bfcfso1407628edc.14
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BK9V7BF4FDWFPbVioi/6hP2ritYONTmY8uKeRXf0/70=;
 b=ljhaOlo7+dgKi0ux2IdD57J4QKA0WuPRK6BKJE7DHMSaM0SBrMGMwQ3cfloGZaME5t
 THVfJgusqF9JAQMRos5joVsI6+vdKVOo+ByLE+bXn24k8dvsNXH7/woLW9aGhLih2nbS
 eXHqkonqE0w54KSw5H99+p9lBSq3dbPc0jRJZ1Y04i2R265xQqmBfuKUr3xKDuIzHnJg
 1hpTHU/d/VUXHKShTz93Rc4JugkE8CzbKKAj0WFa2LYhW9hhzfQAJwP/ercHZS/PQn5R
 k9Q1MMA8qoEFa4mdMIatkXmx+LvMbUuZJ4+L54fnD0813js3vvFSiphApJbuYXUcwSMG
 4BSA==
X-Gm-Message-State: ACrzQf20u9IJUNAGMnSSyqUex1wOYStpVjG8Y7wgGUNxtuRNsP3B+sTr
 xpeFUiwqatTZA8u/GlcifdyP1fLe5SgNHvX27CAvRFyTTi/m6cD7YJZZ8HJR4qhB9NK4+IzZAIs
 /5uzH8z3/iOPcJqzac9QoJxMeyVis4S1FB3CVuPCiTvy1pRO8UGlioFpzNRhrvQxq9gY=
X-Received: by 2002:a05:6402:d5f:b0:458:dc7e:f728 with SMTP id
 ec31-20020a0564020d5f00b00458dc7ef728mr32499910edb.220.1665664654655; 
 Thu, 13 Oct 2022 05:37:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4V4Bx/HddNnBFFCEgOTvvJueRMUhfCw+zOer3WoJLr9dI8xqN47c10lq3w55rUbhr+EGVy1Q==
X-Received: by 2002:a05:6402:d5f:b0:458:dc7e:f728 with SMTP id
 ec31-20020a0564020d5f00b00458dc7ef728mr32499889edb.220.1665664654367; 
 Thu, 13 Oct 2022 05:37:34 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170906304c00b0078afe360800sm2922825ejd.199.2022.10.13.05.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 07/24] coroutine-io: add missing coroutine_fn annotation to
 prototypes
Date: Thu, 13 Oct 2022 14:36:54 +0200
Message-Id: <20221013123711.620631-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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


