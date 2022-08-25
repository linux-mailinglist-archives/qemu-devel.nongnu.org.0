Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4C05A1C4F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:27:30 +0200 (CEST)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLJx-000159-OL
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7d-0008TZ-L3
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7c-0002lH-1u
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ls72lT1cPnoHm9VkJEIUVxVpDLhkizU4FberpVR/l3I=;
 b=Obzmm5oU2EdPcv2LB7GkCJPvO+faFGcHaIkzpSfQKjb/wMjh9O3uWT+IQPFcK/ae7HIvjO
 XrFCO7jlILI1FT4906clomQDQUz0OaH8IPFTrInNIQ51/0RBWVhtzAoBxY+q9lCszCT4XL
 4Ijv5nhqVF9061//AJoUM8mVEdIPxfY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-p5VpbtpQODalaqPxxZJbuA-1; Thu, 25 Aug 2022 18:14:42 -0400
X-MC-Unique: p5VpbtpQODalaqPxxZJbuA-1
Received: by mail-wm1-f69.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so3038264wma.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ls72lT1cPnoHm9VkJEIUVxVpDLhkizU4FberpVR/l3I=;
 b=UZq9dq7gXKKLn87OzNqbeqn5jQd42dvByeXe9xYEYXEFtfT65k7zW/x9n8f+ow+9iF
 ac41IGXUDIefY8gm723aEupsyx0f5RRQu/p6z5LD86Pf4G/S9kgVl8qq+o6I36BE3eM3
 Yd+HSDhY0SUmWWxgqSOrHuJTI2sv/6t3ImBtRsXDTqfdzdhJRzSWxJA/+VQ797h8lWjV
 p2tZz5z5NIEqrJnlKJzp+EFyZjaNQ8fgGCSeokDvnFCgMRdqxpnaURwweYFtteC4PVsP
 OV1o24uxg4PHMogYlj1eLwgqr3dbpo8LSrTWgvderQLr+ccQ8OFySwUV1F2vpQKz6blQ
 BcIg==
X-Gm-Message-State: ACgBeo0Axa7SZmPLm/iZHXinHFBxtOyCJVDdrgSvVa378byF6vGxhCTm
 l+SeIV1anvrcWNihf+dbx511UDIv6iqr2v4qaCy0VrqjYbkIJgHFIEZcOBkLXVzGfO1eg/I9rd2
 7zQ41AAtr2bTLxc4uWq988q5AEWZaCXI8WHawCQO06z4b7dtY/7fYfpXKw+Ti60BVabc=
X-Received: by 2002:a5d:6488:0:b0:225:f99:338b with SMTP id
 o8-20020a5d6488000000b002250f99338bmr3492378wri.638.1661465680937; 
 Thu, 25 Aug 2022 15:14:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6dVIUgKCK57KGeqeEBrTvWzh+tP/C6yw8UM4P2TmpZCSV0KF5s10M+S1Ak2vCBYaD2LAPJsA==
X-Received: by 2002:a5d:6488:0:b0:225:f99:338b with SMTP id
 o8-20020a5d6488000000b002250f99338bmr3492372wri.638.1661465680655; 
 Thu, 25 Aug 2022 15:14:40 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 t2-20020adfe102000000b0022063e5228bsm282297wrz.93.2022.08.25.15.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 17/18] i386: AVX pclmulqdq prep
Date: Fri, 26 Aug 2022 00:14:10 +0200
Message-Id: <20220825221411.35122-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Paul Brook <paul@nowt.org>

Make the pclmulqdq helper AVX ready

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-21-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 1ff3e92331..6b5d076685 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2276,14 +2276,14 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
 
 #endif
 
-void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-                                    uint32_t ctrl)
+#if SHIFT == 1
+static void clmulq(uint64_t *dest_l, uint64_t *dest_h,
+                          uint64_t a, uint64_t b)
 {
-    uint64_t ah, al, b, resh, resl;
+    uint64_t al, ah, resh, resl;
 
     ah = 0;
-    al = d->Q((ctrl & 1) != 0);
-    b = s->Q((ctrl & 16) != 0);
+    al = a;
     resh = resl = 0;
 
     while (b) {
@@ -2296,8 +2296,23 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         b >>= 1;
     }
 
-    d->Q(0) = resl;
-    d->Q(1) = resh;
+    *dest_l = resl;
+    *dest_h = resh;
+}
+#endif
+
+void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                                    uint32_t ctrl)
+{
+    Reg *v = d;
+    uint64_t a, b;
+    int i;
+
+    for (i = 0; i < 1 << SHIFT; i += 2) {
+        a = v->Q(((ctrl & 1) != 0) + i);
+        b = s->Q(((ctrl & 16) != 0) + i);
+        clmulq(&d->Q(i), &d->Q(i + 1), a, b);
+    }
 }
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-- 
2.37.1



