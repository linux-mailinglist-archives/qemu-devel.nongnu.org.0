Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCADA387FEA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:49:42 +0200 (CEST)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4mj-00063J-St
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bD-0001rE-8Z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bA-0008F7-U7
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZKslzViTqwpl3Hg6nYmowKHUbwLNEE55VzLOcIM+9Y=;
 b=jAAPRPN0ctOp5BaW7FsENFys37g9YCCMFJB3DDs1K1jZjVwcjIBmakF1JVeZpQ2ov+u/Qz
 IBn061nETefSY4/ppvGvc8/GBsO0ZwHVYQkxz3jKu1pjNwFZdwZwJRQs/g1CM4F6OOGOFs
 sMCZEXeNBsfyrc9waiUbDrAbxez670g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-_0zIPIXUPuOYFFzEEeWfBQ-1; Tue, 18 May 2021 14:37:39 -0400
X-MC-Unique: _0zIPIXUPuOYFFzEEeWfBQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x3-20020a50ba830000b029038caed0dd2eso6275550ede.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZKslzViTqwpl3Hg6nYmowKHUbwLNEE55VzLOcIM+9Y=;
 b=Wdd+PmrwwLsmrBuglClgAFw0W0OGQsjN6ycSoUc9Deu79AMPCPA+VFcjrrL06nmKkA
 64WhSrEEKJN4p4V3siKoIPOxyyjbFiq2jhLRKCYe9YV6BPFExxWCrSWWNRBslKUCsOkB
 5fIuSLTmJeROV+AsOsTHGz0IqZPpi4a48iu5de7wWlSjN5pWXww8/Mi9UVBd651KHuQ9
 h8uVy0kYQwgNxX/ZEfYkIelpAGuiolg/Us1vwC3vbRZu5klhFh98C3qwGKUuNZ/0xHmw
 7v+6C+f0+RR8r4dUSFVvpgImTSfpxm0aut/Ponmu809DwuSOtfW1UGlMy5rq5XjAlWJ/
 zrnw==
X-Gm-Message-State: AOAM530s7mmT5xOgbJ/bAclUxzzfJI90401brrW9DciKcIkn5xbW9C+t
 pKnlXXDK61Z4Ug7WrUlKWlaldqZj2Rm0VjbQ/VaOrWdovC201K90m8ISj5dIt8RCig3Igj4V66w
 IYZF5gpKx/10WKCh8rXHpzqbZ/xUJOh/D9R8f1I0TwyWsR5KdQWlsLfvGxjuxlHcO
X-Received: by 2002:aa7:de99:: with SMTP id j25mr8741062edv.91.1621363058332; 
 Tue, 18 May 2021 11:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw22sGT9sfU4WZUXNOE8AwUGz52Mh9LYDbMwF3CVppfHR+Bv/jH3aNbQFjgG0UOeCVDDZ4lQw==
X-Received: by 2002:aa7:de99:: with SMTP id j25mr8741040edv.91.1621363058099; 
 Tue, 18 May 2021 11:37:38 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id dj17sm13468997edb.7.2021.05.18.11.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/25] qemu/bswap: Use ST_CONVERT() macro to emit 16-bit
 load/store functions
Date: Tue, 18 May 2021 20:36:38 +0200
Message-Id: <20210518183655.1711377-9-philmd@redhat.com>
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
 include/qemu/bswap.h | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 86f5ded6acf..4e2bd2e97ee 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -350,11 +350,6 @@ static inline int ldsw_he_p(const void *ptr)
     return r;
 }
 
-static inline void stw_he_p(void *ptr, uint16_t v)
-{
-    __builtin_memcpy(ptr, &v, sizeof(v));
-}
-
 static inline int ldl_he_p(const void *ptr)
 {
     int32_t r;
@@ -399,11 +394,6 @@ static inline uint64_t ldq_le_p(const void *ptr)
     return le_bswap(ldq_he_p(ptr), 64);
 }
 
-static inline void stw_le_p(void *ptr, uint16_t v)
-{
-    stw_he_p(ptr, le_bswap(v, 16));
-}
-
 static inline void stl_le_p(void *ptr, uint32_t v)
 {
     stl_he_p(ptr, le_bswap(v, 32));
@@ -434,11 +424,6 @@ static inline uint64_t ldq_be_p(const void *ptr)
     return be_bswap(ldq_he_p(ptr), 64);
 }
 
-static inline void stw_be_p(void *ptr, uint16_t v)
-{
-    stw_he_p(ptr, be_bswap(v, 16));
-}
-
 static inline void stl_be_p(void *ptr, uint32_t v)
 {
     stl_he_p(ptr, be_bswap(v, 32));
@@ -466,6 +451,8 @@ static inline void st ## size ## _ ## endian ## _p(void *ptr, vtype v)\
     ST_CONVERT_END(le, bits, vtype, size)\
     ST_CONVERT_END(be, bits, vtype, size)
 
+ST_CONVERT(16, uint16_t, w)
+
 static inline unsigned long leul_to_cpu(unsigned long v)
 {
 #if HOST_LONG_BITS == 32
-- 
2.26.3


