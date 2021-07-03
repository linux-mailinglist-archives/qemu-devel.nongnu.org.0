Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB93BA975
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:21:20 +0200 (CEST)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lziON-0003JA-2Z
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lziNC-0002Xr-3I
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:20:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lziNA-0002w2-GV
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:20:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id a8so4696464wrp.5
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+CJjlaWy3umkiWBJh77T6SyErpf5VBBzCTyX00pW2AY=;
 b=aAJ6jPJTFIIX8c6Qw1/nqbJpG90X4/cfe+a0gI02HlvB3/5BPFRCnKQX8VtVfUO3dG
 q7F6B3rqtir00QTX2ShLdOz5wD4iu+X1DwxDt67ydAuLevyyoxVfHzOv/zi3urJvKkTJ
 GHMIEaEe7NnqwP8MhglnG/oX1TYMPVVL7InrigSGIQiSyqB0W6W4ZeP8D9TvYXnBS5Bs
 BNV8r22ggL8jkOJHBFohKfh7eRKqhVveKPww+Rt+vnIZL0aEAo9IVOJimBQVb2pULKmW
 WnZiDr6prP/z2wjp0HKiG0i5DOpiAK+gx1H7fd1+3p0E8fO+h81hT243EnB56AgZRh/h
 50aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+CJjlaWy3umkiWBJh77T6SyErpf5VBBzCTyX00pW2AY=;
 b=EQ9S6izcbyjXEa9k0p34VZb9vCK0a7uGy6eaYWyi7n3tYn4s3YGi+Y8wQ5cVeW7SA3
 y1EPSQA2ZAktXcondyGMVsMbxRFakuqJThKHNmHEfSGv83nvLfK/on77VxOehGFSK2qU
 mdAw7vez6tDDv8KvwLiKTp2z4oiFxxnoMbSpPTgtGgK3oKuSzk210Le7ZaLP32ZWXpxy
 GpnOheZdRGTDErYcYvsClGkX+TCp2D/+ZtBz46Bd7qmymfj0Dpk81+jxyAorDpKKC55l
 Wg2mjN4rhX0lQqlUdrok0RCj5xmsQa8FKIZF5+9Kxg8Gr2//vzuQOaSQGjhaSB96V6EE
 vtuA==
X-Gm-Message-State: AOAM531nJiB65fpDQcerFT+ZqR2OAuUDKQminPhj1epb9GuV4uv+yKtw
 O4D6CGWjwW42nqZOJFqM4VPUKYHYXh/Y5g==
X-Google-Smtp-Source: ABdhPJyYpvN1qhZsMZnK90D7dYK3UaNOL8S6S0jepdxEA9vSYKaDQuVBu08qf7fkBmitzQ7PlXZjoA==
X-Received: by 2002:adf:decf:: with SMTP id i15mr3690813wrn.197.1625329202541; 
 Sat, 03 Jul 2021 09:20:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g15sm6842102wrs.50.2021.07.03.09.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 09:20:01 -0700 (PDT)
Subject: Re: clang build error on i686
To: Cole Robinson <crobinso@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b969e4eb-c39d-636c-4bc6-8eeb63c971cb@amsat.org>
Date: Sat, 3 Jul 2021 18:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 4:34 PM, Cole Robinson wrote:
> Hi, I'm hitting build errors with clang on i686 userspace on x86_64
> kernel. Affects both qemu 6.0.0 and qemu.git, tested with fedora
> clang-12.0.1~rc3-1.fc35.i686.

> /builddir/build/BUILD/qemu-6.0.0/include/qemu/stats64.h:58:21: warning:
> misaligned atomic operation may incur significant performance penalty;
> the expected alignment (8 bytes) exceeds the actual alignment (4 bytes)
> [-Watomic-alignment]
>     uint64_t orig = qatomic_read__nocheck(&s->value);
>                     ^
> /builddir/build/BUILD/qemu-6.0.0/include/qemu/atomic.h:129:5: note:
> expanded from macro 'qatomic_read__nocheck'
>     __atomic_load_n(ptr, __ATOMIC_RELAXED)

Ah I hit this one few months ago using Clang10 to build i386 guest
on mips64el host.

In my notes I see I tried:

-- >8 --
diff --git a/include/qemu/stats64.h b/include/qemu/stats64.h
index fdd3d1b8f98..df9962add4e 100644
--- a/include/qemu/stats64.h
+++ b/include/qemu/stats64.h
@@ -37,7 +37,7 @@ static inline void stat64_init(Stat64 *s, uint64_t value)

 static inline uint64_t stat64_get(const Stat64 *s)
 {
-    return qatomic_read__nocheck(&s->value);
+    return qatomic_read_u64(&s->value);
 }

 static inline void stat64_add(Stat64 *s, uint64_t value)
@@ -47,7 +47,7 @@ static inline void stat64_add(Stat64 *s, uint64_t value)

 static inline void stat64_min(Stat64 *s, uint64_t value)
 {
-    uint64_t orig = qatomic_read__nocheck(&s->value);
+    uint64_t orig = qatomic_read_u64(&s->value);
     while (orig > value) {
         orig = qatomic_cmpxchg__nocheck(&s->value, orig, value);
     }
@@ -55,7 +55,7 @@ static inline void stat64_min(Stat64 *s, uint64_t value)

 static inline void stat64_max(Stat64 *s, uint64_t value)
 {
-    uint64_t orig = qatomic_read__nocheck(&s->value);
+    uint64_t orig = qatomic_read_u64(&s->value);
     while (orig < value) {
         orig = qatomic_cmpxchg__nocheck(&s->value, orig, value);
     }
---

TBH today I don't remember much, I think the change wasn't making much
sense, then I stopped using Clang there.

Ah wait, there is also another one (which I reverted later):

-- >8 --
diff --git a/meson.build b/meson.build
index 372576f82c5..1a5da5ee56b 100644
--- a/meson.build
+++ b/meson.build
@@ -161,6 +161,9 @@
   error('Multipath is supported only on Linux')
 endif

+if 'CONFIG_ATOMIC64' in config_host
+  atomic = cc.find_library('atomic', required: config_host['ARCH'] in
['i386', 'arm', 'riscv32'])
+endif
 m = cc.find_library('m', required: false)
 util = cc.find_library('util', required: false)
 winmm = []
@@ -1534,7 +1537,7 @@
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() +
stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), m,
glib, socket, malloc])
+                             dependencies: [util_ss.dependencies(),
atomic, m, glib, socket, malloc])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)

---

No clue neither. Posting in case it ring a bell to someone.

