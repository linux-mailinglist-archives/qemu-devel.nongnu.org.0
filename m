Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E93D387FF2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:51:58 +0200 (CEST)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4ov-0003UK-7A
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bU-0002ZG-Fs
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bS-0008Q9-20
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RP7AdMkdZ70Ntkgoxzrokk0Z/uTSWiTgTaLgWEFB440=;
 b=HPU/Lz5SMRm4o59TzVqaycuNgnR3odGr8+YX5gjyOzPKe2HrT4k29xjtF0iIx2flTahgDT
 DlIZY3RO7Wdf54lkilvWyfgql3qhhjGcRb9YjkdcAvrc8kdplqdAWffhKQTnlD7P9EtedG
 nNfG0AuCH6VqKutyL3Wuv3Uunu6ksGw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-0Y6VyHopO62ffqgNG84FfA-1; Tue, 18 May 2021 14:37:59 -0400
X-MC-Unique: 0Y6VyHopO62ffqgNG84FfA-1
Received: by mail-ej1-f72.google.com with SMTP id
 i8-20020a1709068508b02903d75f46b7aeso2399997ejx.18
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RP7AdMkdZ70Ntkgoxzrokk0Z/uTSWiTgTaLgWEFB440=;
 b=sk7p/Ly7g4sE52PnEp4us7F5zTLL4nDy5kwIGkmwzHErOMxKdMsZrgpFcm3N9nfaGF
 7XmxY9RxQfoAcfEi/njGUutviAqCWpFsYZjxW69H857n/uOWB22RrZ77NlhuHYLPqBiC
 J5qSSKhMRZvpXIqtHjhqWJfTpvscNZyFd2DvAgm1Y9eBKcqEXZBBn2yQpQpSd7/azBK7
 6hVJyP71a8Jpn/wiL9d1wUUuUcO+Szirstkw2hELtCmxCKNZ7rVWagf55YByTZ5d3YnM
 /dTndoBXLBysASh2yyUatpDom/4UEknIvXlrd6TJDVqQf21udDekzY7vEShcn7MbaEBs
 XPPA==
X-Gm-Message-State: AOAM530zO1rW/XCGEfvmuXDXUFjph/p2fbWvwO8j4tuKV/9lKonBza83
 wYHGEb6+F24NY5zbgyY5RgdpjCEJotr6MwMWQP/tkqKurUJoJ22DhXHsctXD4af93mvegqqzEq2
 umTNUtLIninMeuGUxiKGx7RdibrjdXmAd2zxQHXLyhWsdt3YCuZS6YCbDuGuurHGO
X-Received: by 2002:aa7:c84a:: with SMTP id g10mr8552570edt.326.1621363078402; 
 Tue, 18 May 2021 11:37:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMkLhcLHyNK8kf+OFMZwah41t7r0a7CplSH2aIZuBd8oaPijEJmgtyfykPoFOd2FJ9HxHWDA==
X-Received: by 2002:aa7:c84a:: with SMTP id g10mr8552542edt.326.1621363078140; 
 Tue, 18 May 2021 11:37:58 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m19sm8167232edd.12.2021.05.18.11.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/25] qemu/bswap: Use LDST_CONVERT macro to emit 32-bit
 load/store functions
Date: Tue, 18 May 2021 20:36:42 +0200
Message-Id: <20210518183655.1711377-13-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 include/qemu/bswap.h | 37 +++++--------------------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index ee86dc4ed8c..a041be94a7a 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -336,18 +336,6 @@ static inline void stb_p(void *ptr, uint8_t v)
  * of good performance.
  */
 
-static inline int ldl_he_p(const void *ptr)
-{
-    int32_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
-}
-
-static inline void stl_he_p(void *ptr, uint32_t v)
-{
-    __builtin_memcpy(ptr, &v, sizeof(v));
-}
-
 static inline uint64_t ldq_he_p(const void *ptr)
 {
     uint64_t r;
@@ -360,41 +348,21 @@ static inline void stq_he_p(void *ptr, uint64_t v)
     __builtin_memcpy(ptr, &v, sizeof(v));
 }
 
-static inline int ldl_le_p(const void *ptr)
-{
-    return le_bswap(ldl_he_p(ptr), 32);
-}
-
 static inline uint64_t ldq_le_p(const void *ptr)
 {
     return le_bswap(ldq_he_p(ptr), 64);
 }
 
-static inline void stl_le_p(void *ptr, uint32_t v)
-{
-    stl_he_p(ptr, le_bswap(v, 32));
-}
-
 static inline void stq_le_p(void *ptr, uint64_t v)
 {
     stq_he_p(ptr, le_bswap(v, 64));
 }
 
-static inline int ldl_be_p(const void *ptr)
-{
-    return be_bswap(ldl_he_p(ptr), 32);
-}
-
 static inline uint64_t ldq_be_p(const void *ptr)
 {
     return be_bswap(ldq_he_p(ptr), 64);
 }
 
-static inline void stl_be_p(void *ptr, uint32_t v)
-{
-    stl_he_p(ptr, be_bswap(v, 32));
-}
-
 static inline void stq_be_p(void *ptr, uint64_t v)
 {
     stq_he_p(ptr, be_bswap(v, 64));
@@ -436,9 +404,14 @@ static inline void st ## size ## _ ## endian ## _p(void *ptr, vtype v)\
     ST_CONVERT_END(le, bits, vtype, size)\
     ST_CONVERT_END(be, bits, vtype, size)
 
+#define LDST_CONVERT(bits, rtype, vtype, size)\
+    LD_CONVERT(bits, rtype, vtype, size)\
+    ST_CONVERT(bits, vtype, size)
+
 ST_CONVERT(16, uint16_t, w)
 LD_CONVERT(16, int, int16_t, sw)
 LD_CONVERT(16, int, uint16_t, uw)
+LDST_CONVERT(32, int, uint32_t, l)
 
 static inline unsigned long leul_to_cpu(unsigned long v)
 {
-- 
2.26.3


