Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D113F387FE0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:46:52 +0200 (CEST)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4jz-0007dx-KL
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bg-0002wF-S0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bd-0008WU-9b
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mh+awpUaZ2yWuu439ZFMUaH3zSpAqoD7H3lWBxX++40=;
 b=MUwnUmzd08Hdw3c8mjtifwCWuH7l+c5BEHpKrUHXUH1V1gvmTUKcG4+BtO3P4UpW0g7IRq
 0JPgDZv7FbyYmlJCXmu+shMFI63bdrHEWG2mgNmiqHLCF2BoNwvF4X3JHwcIVOEpzrS8qy
 3af5EJLbN2QKb6jgyJUApWHKW0CI0+0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-auqNw0qBPl-_U0RqUhuHOA-1; Tue, 18 May 2021 14:38:10 -0400
X-MC-Unique: auqNw0qBPl-_U0RqUhuHOA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so6254196edd.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mh+awpUaZ2yWuu439ZFMUaH3zSpAqoD7H3lWBxX++40=;
 b=ptwh9QzHOdSi8y/Du9WPEoXjpqRc4yhivWVi6Bg1LxwEP2XKMVxGsAUHK6XLbvk1Lu
 CyVt8jcOo2gCPkLdt6HO+iR/CAFzucGMdQGluNaxkx0Ekfbvx4SpN4Cgl1he9cGwrNa2
 hkX8Swo1VRZIOxD98vwRN0zA7Lrjogpadb5wWC8QTH6Wun/jEeimgiCI4PiwCjQLAv8h
 QBlxDGDzjv7VoLS5tNi6KxDhHNeKNQOBwzcHr+68ToEjLrr4v5O5kKhGdkezdJqH9w1v
 RwecCDbIP8ygaCrzXENjEsplUiK+FpeYCYhKasMGZ+GF77MRf7eQ3Xf7Mh6futBMQF2F
 3c0w==
X-Gm-Message-State: AOAM532IRNp/OQX/xHnOdyJ3yvSU7YF+wAlpFLsEe24Eic+hMZHqy8uT
 D0KonE/E0SR/+uzedvzMYTUR3QOxQnpXaB0tTCQstcH8AkQDW0PDMm8AI4d9HnNqasdAfBE0u/L
 HD5E0x1MMJaKZf/tdmnEQiUfIqlVds+G+r/zCLOZv4/OB6dbOMqVvjD/K3GSk9eg3
X-Received: by 2002:a17:906:fa83:: with SMTP id
 lt3mr7308771ejb.261.1621363088458; 
 Tue, 18 May 2021 11:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1oWMszBWk7GQeRY5gkpfYvVRDrwExWaLKmjYbxQFKdsK8Fq2bTy5KlkIUeUKN/gBvPKxqTw==
X-Received: by 2002:a17:906:fa83:: with SMTP id
 lt3mr7308737ejb.261.1621363088172; 
 Tue, 18 May 2021 11:38:08 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b25sm13715551edv.9.2021.05.18.11.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 14/25] qemu/bswap: Introduce load/store for aligned pointer
Date: Tue, 18 May 2021 20:36:44 +0200
Message-Id: <20210518183655.1711377-15-philmd@redhat.com>
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
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the pointer alignment is known to be safe, we can
directly swap the data in place, without having to rely
on the compiler builtin code.

Load/store methods expecting aligned pointer use the 'a'
infix. For example to read a 16-bit unsigned value stored
in little endianess at an unaligned pointer:

  val = lduw_le_p(&unaligned_ptr);

then to store it in big endianess at an aligned pointer:

  stw_be_ap(&aligned_ptr, val);

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/loads-stores.rst | 27 ++++++++++++++++-----------
 include/qemu/bswap.h        | 22 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 568274baec0..88493ba1293 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -13,20 +13,21 @@ documentation of each API -- for that you should look at the
 documentation comments in the relevant header files.
 
 
-``ld*_p and st*_p``
-~~~~~~~~~~~~~~~~~~~
+``ld*_[a]p and st*_[a]p``
+~~~~~~~~~~~~~~~~~~~~~~~~~
 
 These functions operate on a host pointer, and should be used
 when you already have a pointer into host memory (corresponding
 to guest ram or a local buffer). They deal with doing accesses
 with the desired endianness and with correctly handling
-potentially unaligned pointer values.
+potentially unaligned pointer values. If the pointer alignment
+is known to be safe, then the aligned functions can be used.
 
 Function names follow the pattern:
 
-load: ``ld{sign}{size}_{endian}_p(ptr)``
+load: ``ld{sign}{size}_{endian}_{aligned}p(ptr)``
 
-store: ``st{size}_{endian}_p(ptr, val)``
+store: ``st{size}_{endian}_{aligned}p(ptr, val)``
 
 ``sign``
  - (empty) : for 32 or 64 bit sizes
@@ -49,24 +50,28 @@ The ``_{endian}`` infix is omitted for target-endian accesses.
 The target endian accessors are only available to source
 files which are built per-target.
 
+By using the ``_{aligned}`` infix, unsafe optimizations might be used,
+however unaligned pointer might trigger an exception and abort the
+process.
+
 There are also functions which take the size as an argument:
 
-load: ``ldn{endian}_p(ptr, sz)``
+load: ``ldn{endian}_{aligned}p(ptr, sz)``
 
 which performs an unsigned load of ``sz`` bytes from ``ptr``
 as an ``{endian}`` order value and returns it in a uint64_t.
 
-store: ``stn{endian}_p(ptr, sz, val)``
+store: ``stn{endian}_{aligned}p(ptr, sz, val)``
 
 which stores ``val`` to ``ptr`` as an ``{endian}`` order value
 of size ``sz`` bytes.
 
 
 Regexes for git grep
- - ``\<ld[us]\?[bwlq]\(_[hbl]e\)\?_p\>``
- - ``\<st[bwlq]\(_[hbl]e\)\?_p\>``
- - ``\<ldn_\([hbl]e\)?_p\>``
- - ``\<stn_\([hbl]e\)?_p\>``
+ - ``\<ld[us]\?[bwlq]\(_[hbl]e\)\?_a?p\>``
+ - ``\<st[bwlq]\(_[hbl]e\)\?_a?p\>``
+ - ``\<ldn_\([hbl]e\)?_a?p\>``
+ - ``\<stn_\([hbl]e\)?_a?p\>``
 
 ``cpu_{ld,st}*_mmuidx_ra``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 4cd120ca014..3f272c3cb46 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -350,25 +350,47 @@ static inline void st ## size ## _he_p(void *ptr, vtype v)\
     __builtin_memcpy(ptr, &v, sizeof(v));\
 }
 
+#define LD_CONVERT_ALIGNED(bits, rtype, vtype, size)\
+static inline rtype ld ## size ## _he_ap(const void *ptr)\
+{\
+    return *(vtype *)ptr;\
+}
+
+#define ST_CONVERT_ALIGNED(bits, vtype, size)\
+static inline void st ## size ## _he_ap(void *ptr, vtype v)\
+{\
+    *(vtype *)ptr = v;\
+}
+
 #define LD_CONVERT_END(endian, bits, rtype, vtype, size)\
 static inline rtype ld ## size ## _ ## endian ## _p(const void *ptr)\
 {\
     return (vtype)glue(endian, _bswap)(ld ## size ## _he_p(ptr), bits);\
+}\
+static inline rtype ld ## size ## _ ## endian ## _ap(const void *ptr)\
+{\
+    return (vtype)glue(endian, _bswap)(ld ## size ## _he_ap(ptr), bits);\
 }
 
 #define ST_CONVERT_END(endian, bits, vtype, size)\
 static inline void st ## size ## _ ## endian ## _p(void *ptr, vtype v)\
 {\
     st ## size ## _he_p(ptr, glue(endian, _bswap)(v, bits));\
+}\
+static inline void st ## size ## _ ## endian ## _ap(void *ptr, vtype v)\
+{\
+    st ## size ## _he_ap(ptr, glue(endian, _bswap)(v, bits));\
 }
 
 #define LD_CONVERT(bits, rtype, vtype, size)\
     LD_CONVERT_UNALIGNED(bits, rtype, vtype, size)\
+    LD_CONVERT_ALIGNED(bits, rtype, vtype, size)\
     LD_CONVERT_END(le, bits, rtype, vtype, size)\
     LD_CONVERT_END(be, bits, rtype, vtype, size)
 
 #define ST_CONVERT(bits, vtype, size)\
     ST_CONVERT_UNALIGNED(bits, vtype, size)\
+    ST_CONVERT_ALIGNED(bits, vtype, size)\
     ST_CONVERT_END(le, bits, vtype, size)\
     ST_CONVERT_END(be, bits, vtype, size)
 
-- 
2.26.3


