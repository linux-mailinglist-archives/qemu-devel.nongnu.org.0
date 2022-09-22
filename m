Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E695E5E40
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:16:58 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIKI-00012R-1b
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtz-0004MM-SX
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHty-0003Bh-1H
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W3MW9mE1BsL5Mv0gGMFT3yEiQ6jzCGv4PL3FWaPSfgc=;
 b=g73EZTINMp1CeoYWkiO6rn6WwkBvWrIhMs1CikNsDVRNVpWuE2EUpR3wKJrekPD54jjlQS
 9TwuN3l6RIKEvnv3WylO3I3JzGaUQebgN/rH1TOgNLVLLZuxjGiJaIOiH/He+hTAlodB60
 frJbwP3ID532FbA5pEe7EXfgj/nz6JY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-SJQnTElhMRK9OYElqSJZyA-1; Thu, 22 Sep 2022 04:49:44 -0400
X-MC-Unique: SJQnTElhMRK9OYElqSJZyA-1
Received: by mail-ed1-f70.google.com with SMTP id
 w17-20020a056402269100b0045249bc17a9so6161709edd.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=W3MW9mE1BsL5Mv0gGMFT3yEiQ6jzCGv4PL3FWaPSfgc=;
 b=g+7Y8pfVAKoQ1UDgcN78VBcI8pWYSMqAT+LCn7Wc2F4jlEeZ0WiIU03A+6Sb6mCJjd
 8F3pqfMvlUYVBkc78y48VVYY+cs8y7WmuqxHXciUz6ICtGjeSfJq0QifotHRhUZ4Q33U
 icacpfWm+nqYey6GMVjm0bVLHnxi2SDEr5uedpbBzkInMFKZiP2KMpH01BHBMix1dT2i
 C/VTEj83zjhJn1cruEgodOKLK/gtAz0OzJFQgq813RG6UbGkdN6P9Wm0QNQ/EQDvXWcT
 1kDGX7HaH53POW2gAhjUEvPzX+3NVzOIdL9jU/5Sv3c4GVmCTg1ZgBl++8C6Thda3i1w
 EJXw==
X-Gm-Message-State: ACrzQf3J08nKFc6N+zbqQ9Vr7MnUco6CNpLfxaZrWhTCjWzWOXuDVVo+
 197FEpm4sI/64+b8LmS6OyMdRgSK2CrVdactNd9wrzOXFmIiuQOeGPGhcwKFq8vk0GnJqsz+Ga8
 OVYFSWRMcOAN/RxHWZajmjBcRxeHwqYNuoX4of0vTsbnnpr0ep1gHHdcBFZw3/1762BQ=
X-Received: by 2002:a17:907:5c5:b0:77d:ea1:44c with SMTP id
 wg5-20020a17090705c500b0077d0ea1044cmr1841987ejb.305.1663836582982; 
 Thu, 22 Sep 2022 01:49:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DgKX8CxTLbRutSjzj29qCiCti05pgQ74vQokN5is5cNGoB9K7wDFDnXOQzRRyWJvN15F+bQ==
X-Received: by 2002:a17:907:5c5:b0:77d:ea1:44c with SMTP id
 wg5-20020a17090705c500b0077d0ea1044cmr1841974ejb.305.1663836582700; 
 Thu, 22 Sep 2022 01:49:42 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jt2-20020a170906dfc200b007417041fb2bsm2296185ejc.116.2022.09.22.01.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 11/26] nfs: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:09 +0200
Message-Id: <20220922084924.201610-12-pbonzini@redhat.com>
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nfs.c b/block/nfs.c
index 444c40b458..596ebe98cb 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -223,7 +223,7 @@ static void nfs_process_write(void *arg)
     qemu_mutex_unlock(&client->mutex);
 }
 
-static void nfs_co_init_task(BlockDriverState *bs, NFSRPC *task)
+static void coroutine_fn nfs_co_init_task(BlockDriverState *bs, NFSRPC *task)
 {
     *task = (NFSRPC) {
         .co             = qemu_coroutine_self(),
-- 
2.37.3


