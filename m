Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CD5FBDE5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:44:28 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNz9-0006Dq-Ua
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNwo-0001os-U3
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNwm-0001ch-Hb
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665528119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zG8XGUOfSRlv2X70Eucq0e5jnKWC6PhB0Zvcn9WGzqg=;
 b=BtkIgqQdJ2AG0GbAZTyUAqplVQMn2HyuSpAmfwLnqM2KrEJiTUNst9WqhVBkNw+J+CBzwM
 TXCF4pErWkNyahC/BsJ1UhjdT8pfjx1dE9MSuXb9NPlQMekRvAVOPrLKgRwsNINqAr4U+r
 P6zkFNKH8X6ulbZGhHHRg0Z+JbMp1Sg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-CnAUp47QNNuqVFPSCIGfMg-1; Tue, 11 Oct 2022 18:41:58 -0400
X-MC-Unique: CnAUp47QNNuqVFPSCIGfMg-1
Received: by mail-qv1-f70.google.com with SMTP id
 dn14-20020a056214094e00b004b1a231394eso8839819qvb.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 15:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zG8XGUOfSRlv2X70Eucq0e5jnKWC6PhB0Zvcn9WGzqg=;
 b=sSi8sPUI5v1YfjzPhsPvyOWf2rCnN55RgyeppkvwlVjO8rL3wmkoZTQbIHJf6bgS6w
 TN/L+8Dc9wfmhJ6LbCPxglt6fKqIoPpygBKWgM6vkGKALZlR4nbPnN/ml1H5f8j9DP5N
 srIbhAJT30XGR/CqBN2nJTOqRWwr33n2T5lKSXVw85WJNT+ItmqtZ5Z7wdqGLqwhhazO
 sMGB531mgTRM2vwiNRWo5B5F5csNqmPk5D3rvK2sgwmYuRSNIW/ZRprKrk6c3PpCPtEk
 rIig2O6pS7LQLm3qESux2tfiJUPWio0O26SEhxlSAA2J0kcmw7jma0yhArOaub3w2b19
 O0Jg==
X-Gm-Message-State: ACrzQf0TdM+ZyaSGOJWQEAnWlnATL38rNuvOcE/v6Fhf9BQz18IA5TOo
 ZPKYblUPfIDU5EOOCnm74+OW36gPq5EZ0qMWyMsF0dWCO/2PLEyytHHWKjwmKhGpdT3tVETHfr0
 h0h1u/e+ET3iT7vSxXXyNwNYTM5MgQkWG+O9wsKydnoz1LR5i50PaalylD9f3YS+g
X-Received: by 2002:a05:622a:174b:b0:35d:1be5:c65e with SMTP id
 l11-20020a05622a174b00b0035d1be5c65emr20946953qtk.422.1665528117810; 
 Tue, 11 Oct 2022 15:41:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DEp8uKbDcSsssacVQByOntMAEaJ06/MzsLxIuyb6BzYl6fpH2IpHNR+dEpbuYOLLUznBnIg==
X-Received: by 2002:a05:622a:174b:b0:35d:1be5:c65e with SMTP id
 l11-20020a05622a174b00b0035d1be5c65emr20946929qtk.422.1665528117559; 
 Tue, 11 Oct 2022 15:41:57 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 h17-20020ac87771000000b0039ad65104fasm4258660qtu.12.2022.10.11.15.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 15:41:57 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yury Kotov <yury-kotov@yandex-team.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 1/2] qemu-thread: Enable the new timedwait to use
 DEBUG_MUTEX too
Date: Tue, 11 Oct 2022 18:41:53 -0400
Message-Id: <20221011224154.644379-2-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011224154.644379-1-peterx@redhat.com>
References: <20221011224154.644379-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new _timedwait() version of qemu cond/mutex doesn't trigger the
DEBUG_MUTEX paths; enable it too.

Cc: Yury Kotov <yury-kotov@yandex-team.ru>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 util/qemu-thread-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index ac1d56e673..5840f6e6f5 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -229,9 +229,9 @@ qemu_cond_timedwait_ts(QemuCond *cond, QemuMutex *mutex, struct timespec *ts,
     int err;
 
     assert(cond->initialized);
-    trace_qemu_mutex_unlock(mutex, file, line);
+    qemu_mutex_pre_unlock(mutex, file, line);
     err = pthread_cond_timedwait(&cond->cond, &mutex->lock, ts);
-    trace_qemu_mutex_locked(mutex, file, line);
+    qemu_mutex_post_lock(mutex, file, line);
     if (err && err != ETIMEDOUT) {
         error_exit(err, __func__);
     }
-- 
2.37.3


