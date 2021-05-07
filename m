Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B930837673E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:51:40 +0200 (CEST)
Received: from localhost ([::1]:51632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1pL-00062X-PC
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1i3-0007ku-Tr
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hr-0000jV-KD
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UwtNiSXhDRvxxEBq2bA0+BsvH/APBPHI+6JmS4Uqh4=;
 b=Z3tUKWZ9TUSCHr0eJ+j0Joj1SNoMTA+JHbfKMN0oFp3bUgrueeCIuWmxwUqUhNHuqrz/tl
 o0pWiut8HlVTx5rFWVUu5ydsE4wnJZZFa7AzpGBLTWarFwhvt7y7gqA0sjPOTwEUxm1H4z
 gpyXmHOd14+hqFQ/Mtimm89lNxpl644=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-L2JHnGSXNYmVyKjz2IoFKA-1; Fri, 07 May 2021 10:43:52 -0400
X-MC-Unique: L2JHnGSXNYmVyKjz2IoFKA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so3663105wre.22
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9UwtNiSXhDRvxxEBq2bA0+BsvH/APBPHI+6JmS4Uqh4=;
 b=rFhW0WtVBkGhC0/Ue36cJPmhjaL6NJimiUXLmiZxlGIjtIfuNH+7vYoFf7iLkTd8yL
 EGtzy5PRd1+0WwxeN6GwJvyZx3x61OIA54g/edujQnGGjlRrPvOLz0pRSW8w43uBADE5
 n4L0Rw5h16USt/y7F5aBXVh6sJOm85TIPI+fJ2cT+eLkfRkOFN+Mu+LMZ2wWW7nRUq7G
 nQOAz8qdr4UkixmXae1nRy6y48hrdfXNTrTLFis2E30bGyj6ju8zOzRK7m1oIVp6ZnIb
 iFEJvH8H5erpCRpVq9mQw/wHwsvqCcbaxlHcNVzaGXuvLBROwamfqHml+eC5t9ExUsCj
 FMtg==
X-Gm-Message-State: AOAM5300zklv4Kk4Jer8/T+bBCbKm++iR1rxdUJ/2XlROwOAWbFld7O1
 cDUl/amHr4+mrTHgHIQQVekZg+sYlgA1kMs87EABEh++l4/1xXtG8I7Uk7c65ycKUzpj9gKH/r/
 rePqGVrgeO9/hKgvzZG4KnO84Blx+uYZbcZBwhEqGi0R+sKbsFjG5Vw9GJInKCXuW
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr12640296wrs.233.1620398631138; 
 Fri, 07 May 2021 07:43:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpO9HD46hd1zWh+qoigRuizkz+et7j2kyahnyJH43scB9tmRKhQTHHgYM62Qg0Bn5FVKcPCg==
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr12640261wrs.233.1620398630869; 
 Fri, 07 May 2021 07:43:50 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id d3sm8221624wri.75.2021.05.07.07.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/17] linux-user: Replace alloca() by g_try_malloc() in
 various socket syscall
Date: Fri,  7 May 2021 16:43:05 +0200
Message-Id: <20210507144315.1994337-8-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 linux-user/syscall.c | 50 +++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a263aea85ff..7c5c821f48d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3307,14 +3307,17 @@ static abi_long do_socket(int domain, int type, int protocol)
 static abi_long do_bind(int sockfd, abi_ulong target_addr,
                         socklen_t addrlen)
 {
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
 
     if ((int)addrlen < 0) {
         return -TARGET_EINVAL;
     }
 
-    addr = alloca(addrlen+1);
+    addr = g_try_malloc(addrlen + 1);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret = target_to_host_sockaddr(sockfd, addr, target_addr, addrlen);
     if (ret)
@@ -3327,14 +3330,17 @@ static abi_long do_bind(int sockfd, abi_ulong target_addr,
 static abi_long do_connect(int sockfd, abi_ulong target_addr,
                            socklen_t addrlen)
 {
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
 
     if ((int)addrlen < 0) {
         return -TARGET_EINVAL;
     }
 
-    addr = alloca(addrlen+1);
+    addr = g_try_malloc(addrlen + 1);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret = target_to_host_sockaddr(sockfd, addr, target_addr, addrlen);
     if (ret)
@@ -3519,7 +3525,7 @@ static abi_long do_accept4(int fd, abi_ulong target_addr,
                            abi_ulong target_addrlen_addr, int flags)
 {
     socklen_t addrlen, ret_addrlen;
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
     int host_flags;
 
@@ -3541,7 +3547,10 @@ static abi_long do_accept4(int fd, abi_ulong target_addr,
         return -TARGET_EFAULT;
     }
 
-    addr = alloca(addrlen);
+    addr = g_try_malloc(addrlen);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret_addrlen = addrlen;
     ret = get_errno(safe_accept4(fd, addr, &ret_addrlen, host_flags));
@@ -3559,7 +3568,7 @@ static abi_long do_getpeername(int fd, abi_ulong target_addr,
                                abi_ulong target_addrlen_addr)
 {
     socklen_t addrlen, ret_addrlen;
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
 
     if (get_user_u32(addrlen, target_addrlen_addr))
@@ -3573,7 +3582,10 @@ static abi_long do_getpeername(int fd, abi_ulong target_addr,
         return -TARGET_EFAULT;
     }
 
-    addr = alloca(addrlen);
+    addr = g_try_malloc(addrlen);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret_addrlen = addrlen;
     ret = get_errno(getpeername(fd, addr, &ret_addrlen));
@@ -3591,7 +3603,7 @@ static abi_long do_getsockname(int fd, abi_ulong target_addr,
                                abi_ulong target_addrlen_addr)
 {
     socklen_t addrlen, ret_addrlen;
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
 
     if (get_user_u32(addrlen, target_addrlen_addr))
@@ -3605,7 +3617,10 @@ static abi_long do_getsockname(int fd, abi_ulong target_addr,
         return -TARGET_EFAULT;
     }
 
-    addr = alloca(addrlen);
+    addr = g_try_malloc(addrlen);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret_addrlen = addrlen;
     ret = get_errno(getsockname(fd, addr, &ret_addrlen));
@@ -3640,7 +3655,6 @@ static abi_long do_socketpair(int domain, int type, int protocol,
 static abi_long do_sendto(int fd, abi_ulong msg, size_t len, int flags,
                           abi_ulong target_addr, socklen_t addrlen)
 {
-    void *addr;
     void *host_msg;
     void *copy_msg = NULL;
     abi_long ret;
@@ -3662,7 +3676,11 @@ static abi_long do_sendto(int fd, abi_ulong msg, size_t len, int flags,
         }
     }
     if (target_addr) {
-        addr = alloca(addrlen+1);
+        g_autofree void *addr = g_try_malloc(addrlen + 1);
+
+        if (!addr) {
+            return -TARGET_ENOMEM;
+        }
         ret = target_to_host_sockaddr(fd, addr, target_addr, addrlen);
         if (ret) {
             goto fail;
@@ -3686,7 +3704,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
                             abi_ulong target_addrlen)
 {
     socklen_t addrlen, ret_addrlen;
-    void *addr;
+    g_autofree void *addr = NULL;
     void *host_msg;
     abi_long ret;
 
@@ -3707,12 +3725,14 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
             ret = -TARGET_EINVAL;
             goto fail;
         }
-        addr = alloca(addrlen);
+        addr = g_try_malloc(addrlen);
+        if (!addr) {
+            return -TARGET_ENOMEM;
+        }
         ret_addrlen = addrlen;
         ret = get_errno(safe_recvfrom(fd, host_msg, len, flags,
                                       addr, &ret_addrlen));
     } else {
-        addr = NULL; /* To keep compiler quiet.  */
         addrlen = 0; /* To keep compiler quiet.  */
         ret = get_errno(safe_recvfrom(fd, host_msg, len, flags, NULL, 0));
     }
-- 
2.26.3


