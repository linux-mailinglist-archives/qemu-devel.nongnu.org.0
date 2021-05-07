Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB1537673A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:50:39 +0200 (CEST)
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1oM-00059X-5h
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hj-0007gR-6N
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hc-0000g9-52
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vgjfb8PbNnIcn3GQZwYI0ZjOYyIxocLAAFSxTQwWgvo=;
 b=S3JiuQIspYj4SnOncLaO6snj3w8sWw0rorrWs8bxm+oApEGx5mhkuIKxu3/H6nvbIOl6wL
 /x2M5SU37TG0hb0R1sB5sEeO9FUWbeyHdL78gnwRawmcaCWzdHgGTq/Dwf2eusfZZpJdtv
 klLJmlrSfGgh/0d+2xTf8MM9DUn7M2U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-A8SUl6lAMlm0GGDO-8lAqw-1; Fri, 07 May 2021 10:43:38 -0400
X-MC-Unique: A8SUl6lAMlm0GGDO-8lAqw-1
Received: by mail-wr1-f70.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so3707352wri.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vgjfb8PbNnIcn3GQZwYI0ZjOYyIxocLAAFSxTQwWgvo=;
 b=Cl0Gs11gDJCG4NxdQkTj5l09RjH5lzQppu6Wkvfc2BVh3BDqVoY4lfUE2eNFzXsQLd
 5mFp3YBQa2Wy1jnmcutSwWqtf4I505dZ/AlIO1rr1iPtFkZ2Ub42q5qd8HfxoBS8ktQm
 TtiQ72GsYmTItq/O6irO+yc7AgY9kSGGb31A8cJSIZMzOj7yov0gwL05lGJU8zAHpX9p
 sH1nju0C27J39KxLcCVzhataw/eurZmtaleTITQeD3MkAdHElFNv4XEP7mLDBuFudgba
 KwJSeFy0n2VOErt0krHGQ0zQROutNG5hYT/RFHbKDxeBsG/kdz/COAd5tipsdX1DAPDv
 rpcA==
X-Gm-Message-State: AOAM532XQ1epJLviJDMqTVWaqfy8bLDmPPn5WvuoRfo7bhsAUcKL7iGg
 jgMH31EvVQQs+l4AoinxsExgpLelLRvYChfyxYLCWymoXmWJ1a3Gov1PCaJyN2hY9NAeOxNs10z
 XVdfllmgq7ouNjjAyyjUFh7IhvmXV2oQQNhir2lzCfP/T5oq+tJ0n5hrsQy/B3s5s
X-Received: by 2002:a05:6000:188b:: with SMTP id
 a11mr12357190wri.275.1620398616937; 
 Fri, 07 May 2021 07:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8z6+nLnCBt+Vj4iXQ1ZSB8G5e+MxGMDopF4RIQpyJSA59dPldQXb0CcFy166g96XArEjxog==
X-Received: by 2002:a05:6000:188b:: with SMTP id
 a11mr12357169wri.275.1620398616770; 
 Fri, 07 May 2021 07:43:36 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id z7sm8704053wrl.11.2021.05.07.07.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/17] linux-user/syscall: Replace alloca() by
 g_try_malloc()
Date: Fri,  7 May 2021 16:43:02 +0200
Message-Id: <20210507144315.1994337-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 08ab4cee805..2fa6b89b3de 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10630,7 +10630,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_sched_getaffinity:
         {
             unsigned int mask_size;
-            unsigned long *mask;
+            g_autofree unsigned long *mask = NULL;
 
             /*
              * sched_getaffinity needs multiples of ulong, so need to take
@@ -10641,8 +10641,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
             mask_size = (arg2 + (sizeof(*mask) - 1)) & ~(sizeof(*mask) - 1);
 
-            mask = alloca(mask_size);
-            memset(mask, 0, mask_size);
+            mask = g_try_malloc0(mask_size);
+            if (!mask) {
+                return -TARGET_ENOMEM;
+            }
             ret = get_errno(sys_sched_getaffinity(arg1, mask_size, mask));
 
             if (!is_error(ret)) {
@@ -10670,7 +10672,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_sched_setaffinity:
         {
             unsigned int mask_size;
-            unsigned long *mask;
+            g_autofree unsigned long *mask = NULL;
 
             /*
              * sched_setaffinity needs multiples of ulong, so need to take
@@ -10680,7 +10682,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 return -TARGET_EINVAL;
             }
             mask_size = (arg2 + (sizeof(*mask) - 1)) & ~(sizeof(*mask) - 1);
-            mask = alloca(mask_size);
+            mask = g_try_malloc(mask_size);
+            if (!mask) {
+                return -TARGET_ENOMEM;
+            }
 
             ret = target_to_host_cpu_mask(mask, mask_size, arg3, arg2);
             if (ret) {
-- 
2.26.3


