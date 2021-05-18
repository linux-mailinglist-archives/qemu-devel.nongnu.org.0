Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569E387FE3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:48:57 +0200 (CEST)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4m0-00044A-Ir
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bf-0002vM-Ji
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bb-0008WS-TA
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0wXwlzDDQ89KUu5WsVCB5zLKl6e1qLqqM9KpCrBAHaI=;
 b=gFIxq56qgixps80V2PdB0JN4pHrTkJGCZ05938FmxxGf1ndaNUsPo7Qj3Q4qCPhHHrbxQl
 cxIcUatvIxHvifNXFmD+GyuzDSOmFaXWvpkiUIbN8s0nma9VTvki5kayrm2c5iVs14ng+t
 Bi+x5yJtup1XOdsn5tIxw1A/1lBP3cU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-CrRYyfuZPe-Vk9kkmhUHLg-1; Tue, 18 May 2021 14:38:04 -0400
X-MC-Unique: CrRYyfuZPe-Vk9kkmhUHLg-1
Received: by mail-ej1-f70.google.com with SMTP id
 16-20020a1709063010b029037417ca2d43so2754233ejz.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0wXwlzDDQ89KUu5WsVCB5zLKl6e1qLqqM9KpCrBAHaI=;
 b=R1YRO9Zk/vPMFk9gdWDrHa9s6UY0WOGQ37FadDTAr8JCQDvQXRAJYG7QpajmjmmRBA
 lYBjmQtXtGyqG+cbbV5u0+lfUb0SZfD9HD/oTPE5WS3bvL7P0iIw4o/eHA2dBTW+gzwi
 02i93tMP1yFFyh5sLnJ9D12IPj2Ep6w/c5VUOFa7+dS54vt+mIKbsGOKdh2O0BMd2ebr
 9ne96V+EkbWpEfneq/zXmVsOjgtL8Ph2DY1EdKsVVA36ipHrRzYwiYIQy+WPNIUlUs3K
 gexqU25ndvSZqYoyOlQEryfMvmyXmoiBzLDzJjGrQBCpO1XcG+UkaU18NTn0jkL4HmAu
 3YMg==
X-Gm-Message-State: AOAM532i+Xlc2NE2iAQfFrHKqmRpZM+7LGOFjPIPKv/qziBlIzoV5l88
 YbFokgSV6sVlHCKMc5jMs+I1K0Q7gTilEd8lCQBPYXb1JS9QUx0AXxaTGk2ArCaYzUkub7UpsP0
 XwPjhXPYl6I7yc9zkhD39mr/6V2d7jgGwpaZ49/5FFHpzJ1U8HXELwQjEadRBS3ix
X-Received: by 2002:a05:6402:1649:: with SMTP id
 s9mr8675727edx.35.1621363083336; 
 Tue, 18 May 2021 11:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgRTXsf+cKDK5z8wqE3Gd+E2Y63IhZly/v782HEuH8Vskk3Z0AfyPw1nw1WE46Fp6CW6qB3Q==
X-Received: by 2002:a05:6402:1649:: with SMTP id
 s9mr8675697edx.35.1621363083131; 
 Tue, 18 May 2021 11:38:03 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m13sm8130299eds.21.2021.05.18.11.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/25] qemu/bswap: Use LDST_CONVERT macro to emit 64-bit
 load/store functions
Date: Tue, 18 May 2021 20:36:43 +0200
Message-Id: <20210518183655.1711377-14-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index a041be94a7a..4cd120ca014 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -336,38 +336,6 @@ static inline void stb_p(void *ptr, uint8_t v)
  * of good performance.
  */
 
-static inline uint64_t ldq_he_p(const void *ptr)
-{
-    uint64_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
-}
-
-static inline void stq_he_p(void *ptr, uint64_t v)
-{
-    __builtin_memcpy(ptr, &v, sizeof(v));
-}
-
-static inline uint64_t ldq_le_p(const void *ptr)
-{
-    return le_bswap(ldq_he_p(ptr), 64);
-}
-
-static inline void stq_le_p(void *ptr, uint64_t v)
-{
-    stq_he_p(ptr, le_bswap(v, 64));
-}
-
-static inline uint64_t ldq_be_p(const void *ptr)
-{
-    return be_bswap(ldq_he_p(ptr), 64);
-}
-
-static inline void stq_be_p(void *ptr, uint64_t v)
-{
-    stq_he_p(ptr, be_bswap(v, 64));
-}
-
 #define LD_CONVERT_UNALIGNED(bits, rtype, vtype, size)\
 static inline rtype ld ## size ## _he_p(const void *ptr)\
 {\
@@ -412,6 +380,7 @@ ST_CONVERT(16, uint16_t, w)
 LD_CONVERT(16, int, int16_t, sw)
 LD_CONVERT(16, int, uint16_t, uw)
 LDST_CONVERT(32, int, uint32_t, l)
+LDST_CONVERT(64, uint64_t, uint64_t, q)
 
 static inline unsigned long leul_to_cpu(unsigned long v)
 {
-- 
2.26.3


