Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5BB37673C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:51:20 +0200 (CEST)
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1p1-0005Y2-AK
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1ht-0007jF-R4
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hn-0000jC-6d
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2L5mr2b7hhw5EkGSTWl47QqXXqBmVyFmMYU/e54ubTE=;
 b=SorAX5dc2LcT4RbwUVVxlDFS3JFsyE7ZGfeLCAt6dgaG16f21fb8ociBNSiMy1ws2ImotF
 uFiXdzPZXVwcEVkVOzF7GeuJWsqxuqTh9Usx7hcBLZSPu65iXNmunNSoAoH1KyTCEy0S6v
 3sCpu08MnZkh8cwH4ZCZkBGgstgSZ8U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-vO9o92F_MKaqPCSSjIe2RQ-1; Fri, 07 May 2021 10:43:47 -0400
X-MC-Unique: vO9o92F_MKaqPCSSjIe2RQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so3647576wrs.19
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2L5mr2b7hhw5EkGSTWl47QqXXqBmVyFmMYU/e54ubTE=;
 b=b35c0JsA5r4nZcrGhLn86snbtb9npBi4hL3KJTQf+BmH9F56USczddbjgSVALDY20y
 khU2xTcdBBHATM2XngwqD7CVHSgmLjAhx+7Is4xw3X19XrmJ6dAvlmWYcftYemLBpns1
 pzQxP7Cn1dVVNPUTJ+mdsAWez4w6GW528wWWTuMt+eJcDdGom3sa8DF7edQ6F5g/4Bmv
 j4DUVxssyzx3ND9SfFql1isBjnNkVdCNF8AeWzV11R+op+rFSv8yrPAJilrSlsCeBtaD
 rmohBfg46RGSVoU1ltYSm2/uztFH6GAxPxoiAU1DwK96ZKGb62Hdq4rh3DiigtIEQJSJ
 2wLw==
X-Gm-Message-State: AOAM5311y0mUJLI+v5MtVgyquxQQ8MSrGitu7g0s1X5ArgtNWd8OKYKu
 jMY7GOPEyBCGZkmRFCx4MbdaeT55N1QWF/vz2se0g9+UVqxXMRp18LPSiIGtTutVjd/wNjEeOi2
 dB8R08zrUAQ46jrFTFethfJuZUzcmHIOeF2NHrV7azrOqeUmY1jGWSTs8CZu7Ur5u
X-Received: by 2002:a5d:6682:: with SMTP id l2mr12867725wru.15.1620398626421; 
 Fri, 07 May 2021 07:43:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9DMJA8+x/NYI0yJJsbEcLCTwgBtgsQmZh7JNyu0BIiNXSApGIllKxUmvSifBrFhmtnMgQDw==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr12867692wru.15.1620398626166; 
 Fri, 07 May 2021 07:43:46 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id f4sm9261707wrz.33.2021.05.07.07.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/17] linux-user: Replace alloca() by g_try_malloc() in
 setsockopt() syscall
Date: Fri,  7 May 2021 16:43:04 +0200
Message-Id: <20210507144315.1994337-7-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 linux-user/syscall.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0bf4273fc7a..a263aea85ff 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2191,7 +2191,6 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
 {
     abi_long ret;
     int val;
-    struct ip_mreqn *ip_mreq;
     struct ip_mreq_source *ip_mreq_source;
 
     switch(level) {
@@ -2235,15 +2234,21 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
             break;
         case IP_ADD_MEMBERSHIP:
         case IP_DROP_MEMBERSHIP:
+        {
+            g_autofree struct ip_mreqn *ip_mreq = NULL;
+
             if (optlen < sizeof (struct target_ip_mreq) ||
                 optlen > sizeof (struct target_ip_mreqn))
                 return -TARGET_EINVAL;
 
-            ip_mreq = (struct ip_mreqn *) alloca(optlen);
+            ip_mreq = g_try_malloc(optlen);
+            if (!ip_mreq) {
+                return -TARGET_ENOMEM;
+            }
             target_to_host_ip_mreq(ip_mreq, optval_addr, optlen);
             ret = get_errno(setsockopt(sockfd, level, optname, ip_mreq, optlen));
             break;
-
+        }
         case IP_BLOCK_SOURCE:
         case IP_UNBLOCK_SOURCE:
         case IP_ADD_SOURCE_MEMBERSHIP:
@@ -2492,7 +2497,8 @@ set_timeout:
         }
 	case TARGET_SO_BINDTODEVICE:
 	{
-		char *dev_ifname, *addr_ifname;
+                char *dev_ifname;
+                g_autofree char *addr_ifname = NULL;
 
 		if (optlen > IFNAMSIZ - 1) {
 		    optlen = IFNAMSIZ - 1;
@@ -2502,7 +2508,10 @@ set_timeout:
 		    return -TARGET_EFAULT;
 		}
 		optname = SO_BINDTODEVICE;
-		addr_ifname = alloca(IFNAMSIZ);
+                addr_ifname = g_try_malloc(IFNAMSIZ);
+                if (!addr_ifname) {
+                    return -TARGET_ENOMEM;
+                }
 		memcpy(addr_ifname, dev_ifname, optlen);
 		addr_ifname[optlen] = 0;
 		ret = get_errno(setsockopt(sockfd, SOL_SOCKET, optname,
-- 
2.26.3


