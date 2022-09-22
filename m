Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85255E6479
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:58:42 +0200 (CEST)
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMiv-0004Eg-Pj
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obLvI-0000vN-Lo
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obLvE-0007xx-1s
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663852038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVWODGal6MGQ4Iq0Snb4ANb8aSk5BV0AwZjOoUfuVOc=;
 b=deLPWP8lw1tRlGkPuUMeJE1o+dMkc0h5R8DF2eq3LAkRlIWIZ7ajOWqXJ6/hrf6paUJndS
 UETVkbqRV+ke1TpRDWN18S8Beb4sPWGE0aaJZYKk5NakxByqb0AAXQmdHqb23IA9F+bmiS
 uzvE+DzjroxI+4EhUJhgYvZNmBS/R4E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-JCr9klHTMkioHuqn0GBLhw-1; Thu, 22 Sep 2022 09:07:17 -0400
X-MC-Unique: JCr9klHTMkioHuqn0GBLhw-1
Received: by mail-wr1-f70.google.com with SMTP id
 e18-20020adfa452000000b00228a420c389so3243510wra.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 06:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=BVWODGal6MGQ4Iq0Snb4ANb8aSk5BV0AwZjOoUfuVOc=;
 b=ue9m6+thIDMvxAvCIuG3MeR1G4N5fU7oOqblSXrY4XaOEiVQ08j/oAVpaTWFF6EqzT
 Y+JR8YFcfzQDNMmp4ghXr43uxKQ0Nr11Q8L6xE9SI/h1G2SHNXcHhg5rY8M2AYqCqxiL
 0ob2GsIXYtc/93iRgg4xMxAo1FwTLh8djW4xaHnZenNq9PtNo26OY62tgKcDa9m+K0cQ
 K4pOMDf/wbLezC1UyUnrlMDOLYRh1Pwev+nMaC7XZx3pzZ8bkvNq4v2UefvJ3yQEXxer
 qSVMQfx+ovXY9QMP9LxBUbUzTqiTZP7ae/0N3dHI0T47aqv7ur1az8it/nUYreyuazoX
 a9pw==
X-Gm-Message-State: ACrzQf350/Whj34FInftt63MzQNN/1wyUh+hIZ7Uo4RwVUr6IexsJ5/R
 YCzMEcDWJGZU/3/Duky5G0WbQAS7vr81/CgxbncB9fAf3bh8ux4o47y26NTLhEOkxjqA504UH2J
 qWpNmie+wUoXkGFQ=
X-Received: by 2002:adf:eb84:0:b0:22a:917e:1c20 with SMTP id
 t4-20020adfeb84000000b0022a917e1c20mr1986523wrn.223.1663852035704; 
 Thu, 22 Sep 2022 06:07:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4GBsPPyhFMNXnoO2uCa2h25pkbgboz3GL83mpkBfdU4BZNYUEy7mAXc3gIgKijB6uBuTkB/w==
X-Received: by 2002:adf:eb84:0:b0:22a:917e:1c20 with SMTP id
 t4-20020adfeb84000000b0022a917e1c20mr1986498wrn.223.1663852035363; 
 Thu, 22 Sep 2022 06:07:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f?
 (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de.
 [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4e43000000b00228dc1c7063sm4985748wrt.85.2022.09.22.06.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 06:07:14 -0700 (PDT)
Message-ID: <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
Date: Thu, 22 Sep 2022 15:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v8 1/2] target/s390x: support SHA-512 extensions
In-Reply-To: <20220921100729.2942008-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 21.09.22 12:07, Jason A. Donenfeld wrote:
> In order to fully support MSA_EXT_5, we have to support the SHA-512
> special instructions. So implement those.
> 
> The implementation began as something TweetNacl-like, and then was
> adjusted to be useful here. It's not very beautiful, but it is quite
> short and compact, which is what we're going for.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---

As discussed offline, I'd restructure the code a bit to make it easier to
grasp/review. But of course, readability is subjective. I think there was one
specification check for kimd missing (length not aligned). It's a bit buried:

"
A specification exception is recognized and no other
action is taken if any of the following occurs:
...
4. The second-operand length is not a multiple of
the data block size of the designated function
(see Figure 7-207 on page 7-187 for COMPUTE
INTERMEDIATE MESSAGE DIGEST functions).
"

The biggest change is probably that we will now end up writing memory only
once (storing the ocv) after all inputs were read for KLMD. There is
still a rare chance of failing halfway through the single write, but that
could be tackled in the future comparatively easily by doing a
pre-translation.

This passes the Linux boot test, but I'm pretty sure I messed up some
corner case.


Interestingly, I discovered tests/tcg/multiarch/sha512.c.

I feel like we could write it up fairly easily at least for kimd, but
I'm a bit lost if klmd would still need special treatment. I'm fine with
keeping it like that for now, as it's not that much code, and we're doing
the bew64<->conversion upfront instead of inside the algorithm.



 From 90de57150134d56d31ee64748d929117f87a71a6 Mon Sep 17 00:00:00 2001
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Sep 2022 12:07:28 +0200
Subject: [PATCH] target/s390x: support SHA-512 extensions

In order to fully support MSA_EXT_5, we have to support the SHA-512
special instructions. So implement those.

The implementation began as something TweetNacl-like, and then was
adjusted to be useful here. It's not very beautiful, but it is quite
short and compact, which is what we're going for.

Cc: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Harald Freudenberger <freude@linux.ibm.com>
Cc: Holger Dengler <dengler@linux.ibm.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
[ restructure code, add missing specification exception, add comments ]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
  target/s390x/gen-features.c      |   3 +
  target/s390x/tcg/crypto_helper.c | 232 +++++++++++++++++++++++++++++++
  2 files changed, 235 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 1558c52626..14a7f2ae90 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -751,6 +751,9 @@ static uint16_t qemu_V7_0[] = {
   */
  static uint16_t qemu_MAX[] = {
      S390_FEAT_VECTOR_ENH2,
+    S390_FEAT_MSA_EXT_5,
+    S390_FEAT_KIMD_SHA_512,
+    S390_FEAT_KLMD_SHA_512,
  };
  
  /****** END FEATURE DEFS ******/
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 138d9e7ad9..98f628561e 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -1,10 +1,12 @@
  /*
   *  s390x crypto helpers
   *
+ *  Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
   *  Copyright (c) 2017 Red Hat Inc
   *
   *  Authors:
   *   David Hildenbrand <david@redhat.com>
+ *   Jason A. Donenfeld <Jason@zx2c4.com>
   *
   * This work is licensed under the terms of the GNU GPL, version 2 or later.
   * See the COPYING file in the top-level directory.
@@ -18,6 +20,233 @@
  #include "exec/exec-all.h"
  #include "exec/cpu_ldst.h"
  
+static uint64_t R(uint64_t x, int c)
+{
+    return (x >> c) | (x << (64 - c));
+}
+static uint64_t Ch(uint64_t x, uint64_t y, uint64_t z)
+{
+    return (x & y) ^ (~x & z);
+}
+static uint64_t Maj(uint64_t x, uint64_t y, uint64_t z)
+{
+    return (x & y) ^ (x & z) ^ (y & z);
+}
+static uint64_t Sigma0(uint64_t x)
+{
+    return R(x, 28) ^ R(x, 34) ^ R(x, 39);
+}
+static uint64_t Sigma1(uint64_t x)
+{
+    return R(x, 14) ^ R(x, 18) ^ R(x, 41);
+}
+static uint64_t sigma0(uint64_t x)
+{
+    return R(x, 1) ^ R(x, 8) ^ (x >> 7);
+}
+static uint64_t sigma1(uint64_t x)
+{
+    return R(x, 19) ^ R(x, 61) ^ (x >> 6);
+}
+
+static const uint64_t K[80] = {
+    0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
+    0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
+    0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
+    0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
+    0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL,
+    0xc19bf174cf692694ULL, 0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL,
+    0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL, 0x2de92c6f592b0275ULL,
+    0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
+    0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL,
+    0xbf597fc7beef0ee4ULL, 0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL,
+    0x06ca6351e003826fULL, 0x142929670a0e6e70ULL, 0x27b70a8546d22ffcULL,
+    0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
+    0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL,
+    0x92722c851482353bULL, 0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL,
+    0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL, 0xd192e819d6ef5218ULL,
+    0xd69906245565a910ULL, 0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
+    0x19a4c116b8d2d0c8ULL, 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL,
+    0x34b0bcb5e19b48a8ULL, 0x391c0cb3c5c95a63ULL, 0x4ed8aa4ae3418acbULL,
+    0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL, 0x748f82ee5defb2fcULL,
+    0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
+    0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL,
+    0xc67178f2e372532bULL, 0xca273eceea26619cULL, 0xd186b8c721c0c207ULL,
+    0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL, 0x06f067aa72176fbaULL,
+    0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
+    0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
+    0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
+    0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL
+};
+
+/* a is icv/ocv, w is a single message block. w will get reused internally. */
+static void sha512_bda(uint64_t a[8], uint64_t w[16])
+{
+    uint64_t t, z[8], b[8];
+    int i, j;
+
+    memcpy(z, a, sizeof(z));
+    for (i = 0; i < 80; i++) {
+        memcpy(b, a, sizeof(b));
+
+        t = a[7] + Sigma1(a[4]) + Ch(a[4], a[5], a[6]) + K[i] + w[i % 16];
+        b[7] = t + Sigma0(a[0]) + Maj(a[0], a[1], a[2]);
+        b[3] += t;
+        for (j = 0; j < 8; ++j) {
+            a[(j + 1) % 8] = b[j];
+        }
+        if (i % 16 == 15) {
+            for (j = 0; j < 16; ++j) {
+                w[j] += w[(j + 9) % 16] + sigma0(w[(j + 1) % 16]) +
+                        sigma1(w[(j + 14) % 16]);
+            }
+        }
+    }
+
+    for (i = 0; i < 8; i++) {
+        a[i] += z[i];
+    }
+}
+
+/* a is icv/ocv, w is a single message block that needs be64 conversion. */
+static void sha512_be64(uint64_t a[8], uint64_t w[16])
+{
+    uint64_t t[16];
+    int i;
+
+    for (i = 0; i < 16; i++) {
+        t[i] = be64_to_cpu(w[i]);
+    }
+    sha512_bda(a, t);
+}
+
+static void sha512_read_icv(CPUS390XState *env, uint64_t addr,
+                            uint64_t a[8], uintptr_t ra)
+{
+    int i;
+
+    for (i = 0; i < 8; i++, addr += 8) {
+        addr = wrap_address(env, addr);
+        a[i] = cpu_ldq_be_data_ra(env, addr, ra);
+    }
+}
+
+static void sha512_write_ocv(CPUS390XState *env, uint64_t addr,
+                             uint64_t a[8], uintptr_t ra)
+{
+    int i;
+
+    for (i = 0; i < 8; i++, addr += 8) {
+        addr = wrap_address(env, addr);
+        cpu_stq_be_data_ra(env, addr, a[i], ra);
+    }
+}
+
+static void sha512_read_block(CPUS390XState *env, uint64_t addr,
+                              uint64_t a[16], uintptr_t ra)
+{
+    int i;
+
+    for (i = 0; i < 16; i++, addr += 8) {
+        addr = wrap_address(env, addr);
+        a[i] = cpu_ldq_be_data_ra(env, addr, ra);
+    }
+}
+
+static void sha512_read_mbl_be64(CPUS390XState *env, uint64_t addr,
+                                 uint8_t a[16], uintptr_t ra)
+{
+    int i;
+
+    for (i = 0; i < 16; i++, addr += 1) {
+        addr = wrap_address(env, addr);
+        a[i] = cpu_ldub_data_ra(env, addr, ra);
+    }
+}
+
+static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
+                      uint64_t *message_reg, uint64_t *len_reg, uint32_t type)
+{
+    enum { MAX_BLOCKS_PER_RUN = 64 }; /* Arbitrary: keep interactivity. */
+    uint64_t len = *len_reg, a[8], processed = 0;
+    int i, message_reg_len = 64;
+
+    g_assert(type == S390_FEAT_TYPE_KIMD || type == S390_FEAT_TYPE_KLMD);
+
+    if (!(env->psw.mask & PSW_MASK_64)) {
+        len = (uint32_t)len;
+        message_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
+    }
+
+    /* KIMD: length has to be properly aligned. */
+    if (type == S390_FEAT_TYPE_KIMD && !QEMU_IS_ALIGNED(len, 128)) {
+        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+    }
+
+    sha512_read_icv(env, param_addr, a, ra);
+
+    /* Process full blocks first. */
+    for (; len >= 128; len -= 128, processed += 128) {
+        uint64_t w[16];
+
+        if (processed >= MAX_BLOCKS_PER_RUN * 128) {
+            break;
+        }
+
+        sha512_read_block(env, *message_reg + processed, w, ra);
+        sha512_bda(a, w);
+    }
+
+    /* KLMD: Process partial/empty block last. */
+    if (type == S390_FEAT_TYPE_KLMD && len < 128) {
+        uint8_t x[128];
+
+        /* Read the remainder of the message byte-per-byte. */
+        for (i = 0; i < len; i++) {
+            uint64_t addr = wrap_address(env, *message_reg + processed + i);
+
+            x[i] = cpu_ldub_data_ra(env, addr, ra);
+        }
+        /*
+         * Pad the remainder with zero and place magic value 128 after the
+         * message.
+         */
+        memset(x + len, 0, 128 - len);
+        x[len] = 128;
+
+        /*
+         * Place the MBL either into this block (if there is space left),
+         * or use an additional one.
+         */
+        if (len < 112) {
+            sha512_read_mbl_be64(env, param_addr + 64, x + 112, ra);
+        }
+        sha512_be64(a, (uint64_t *)x);
+
+        if (len >= 112) {
+            memset(x, 0, 112);
+            sha512_read_mbl_be64(env, param_addr + 64, x + 112, ra);
+            sha512_be64(a, (uint64_t *)x);
+        }
+
+        processed += len;
+        len = 0;
+    }
+
+    /*
+     * Modify memory after we read all inputs and modify registers only after
+     * writing memory succeeded.
+     *
+     * TODO: if writing fails halfway through (e.g., when crossing page
+     * boundaries), we're in trouble. We'd need something like acces_prepare().
+     */
+    sha512_write_ocv(env, param_addr, a, ra);
+    *message_reg = deposit64(*message_reg, 0, message_reg_len,
+                             *message_reg + processed);
+    *len_reg -= processed;
+    return !len ? 0 : 3;
+}
+
  uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
                       uint32_t type)
  {
@@ -52,6 +281,9 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
              cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
          }
          break;
+    case 3: /* CPACF_*_SHA_512 */
+        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
+                            &env->regs[r2 + 1], type);
      default:
          /* we don't implement any other subfunction yet */
          g_assert_not_reached();
-- 
2.37.3


-- 
Thanks,

David / dhildenb


