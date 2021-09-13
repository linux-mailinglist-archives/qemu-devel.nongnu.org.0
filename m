Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969644088CE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:11:58 +0200 (CEST)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPiwP-0005oG-Ka
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPijs-0006vK-4Z
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:59:00 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPije-0005Qd-3F
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:58:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id w29so12942248wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEe/Y9OF0T4FqAfYAqNQPq9BLFVhezqwi+Xt4KbESM4=;
 b=J3pgU9UozmUITGp+sShHWK7a7l6fpviwxyFKs56hu88vFUFdlf/7UsYyEznevrx2S1
 /zb4MfnoIDPSizbONSAhZVjUpYNmrS4ZzxA9D8KBlmQM1ZTnP8X4mpV5d/zjwYzbvKs2
 gI6apFXm5SJ9AbT4UZKaUvjsn5E45Tpk7R7lPFjA741OhlR9qSaJNMe9CuC9wdztOwTL
 /Dn16Hk6zUDMeWxAm5tYop7Emuh+ubIWwuZScw5ijxSoCSzMsw5c05X1ralsjl03cLpi
 3r70p1v0OlEx/9wsdXD7wDS3DeD10j/VcumO1OkcJKBDkXeUbSQ19dHnFq34UMivkp2l
 uNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEe/Y9OF0T4FqAfYAqNQPq9BLFVhezqwi+Xt4KbESM4=;
 b=ngcH7W80HUQ8VDNt+yLFacmr9EXTg9rPHEQI/Xlk+dhwEqQISzP3GEwKqTMar2hCdw
 9UvpVRSJq9u4k9Y8l5SrYVpRGIg5MVrHQZOGiMNaZk8Q+0AjOKhc2j3lFkabz4OhnZXe
 zsDZhp0TTYIcMOfRvDPcDbHkBTWLwplafQxEb56rUfnni8Z8dg6kIvs5rblQn/50SalC
 fDGZ0w5JPg2/3DvOV8aZ6ZZLsWWH/6puDpOZNmH1qmwp6npTuDypUrWB+nge5cOzgy63
 1SaEWW0Ku8R0b7htHGQeuJiZ1caeCu9xaoFD5oAxaPkAYyxib1d+LRZvqRSsb2G6LT/J
 dhuw==
X-Gm-Message-State: AOAM530WPYTX1bdPsZO7W2U6o2L9inl3KRYOGTY9PN9nCxLzldlQVC/E
 JkXgTqoVPg0fUJ1fY/aGLbLLDCwD/YTLvNluqvYIPCsoX2pHBw==
X-Google-Smtp-Source: ABdhPJxL73tyBVuXIc87JI1BwkqWSPjSL3+5dXXf/s9XuSxCw/+i+4q/AMYMH/vgI6qIFYdpd7TYPioiQP2uKG4bgls=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr11282901wrq.263.1631527124385; 
 Mon, 13 Sep 2021 02:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210912155809.196236-1-richard.henderson@linaro.org>
In-Reply-To: <20210912155809.196236-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 10:57:54 +0100
Message-ID: <CAFEAcA-jnCxp5K3CEW8Z6pvUcHyxR3MUZA0mH1r=zUzRmF3k5Q@mail.gmail.com>
Subject: Re: [PULL 0/9] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 12 Sept 2021 at 16:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that I've extended the expiration date of my gpg key
> and have uploaded it to keyserver.ubuntu.com.
>
>
> r~
>
>
> The following changes since commit 99c44988d5ba1866a411450c877ed818b1b70081:
>
>   Merge remote-tracking branch 'remotes/bsdimp/tags/pull-bsd-user-20210910' into staging (2021-09-11 14:00:39 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210912
>
> for you to fetch changes up to 267a3ec3e2a8fb3e06a9d46d09fcfc57dfefd118:
>
>   tcg/arm: Fix tcg_out_vec_op function signature (2021-09-12 05:07:36 -0700)
>
> ----------------------------------------------------------------
> Fix translation race condition for user-only.
> Fix tcg/i386 encoding for VPSLLVQ, VPSRLVQ.
> Fix tcg/arm tcg_out_vec_op signature.
> Fix tcg/ppc (32bit) build with clang.
> Remove dupluate TCG_KICK_PERIOD definition.
> Remove unused tcg_global_reg_new.
> Use __builtin_bswap*.
>

Hi; this fails to build on NetBSD:

In file included from /usr/include/stdarg.h:37:0,
                 from /home/qemu/qemu-test.X505HZ/src/include/qemu/osdep.h:79,
                 from ../src/tests/qtest/test-arm-mptimer.c:10:
/home/qemu/qemu-test.X505HZ/src/include/qemu/bswap.h:10:24: error:
expected declaration specifiers or '...' before '__builtin_constant_p'
 static inline uint16_t bswap16(uint16_t x)
                        ^
/home/qemu/qemu-test.X505HZ/src/include/qemu/bswap.h:15:24: error:
expected declaration specifiers or '...' before '__builtin_constant_p'
 static inline uint32_t bswap32(uint32_t x)
                        ^
/home/qemu/qemu-test.X505HZ/src/include/qemu/bswap.h:20:24: error:
expected declaration specifiers or '...' before '__builtin_constant_p'
 static inline uint64_t bswap64(uint64_t x)
                        ^

and on FreeBSD:

In file included from ../src/disas/nanomips.cpp:31:
In file included from
/usr/home/qemu/qemu-test.UUfQa1/src/include/disas/dis-asm.h:12:
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:10:24: error:
unknown type name '__builtin_constant_p'
static inline uint16_t bswap16(uint16_t x)
                       ^
/usr/include/sys/endian.h:61:20: note: expanded from macro 'bswap16'
#define bswap16(x)      __bswap16(x)
                        ^
/usr/include/x86/endian.h:76:16: note: expanded from macro '__bswap16'
        ((__uint16_t)(__builtin_constant_p(x) ? \
                      ^
In file included from ../src/disas/nanomips.cpp:31:
In file included from
/usr/home/qemu/qemu-test.UUfQa1/src/include/disas/dis-asm.h:12:
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:10:24: error:
expected ')'
/usr/include/sys/endian.h:61:20: note: expanded from macro 'bswap16'
#define bswap16(x)      __bswap16(x)
                        ^
/usr/include/x86/endian.h:76:40: note: expanded from macro '__bswap16'
        ((__uint16_t)(__builtin_constant_p(x) ? \
                                              ^
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:10:24: note:
to match this '('
/usr/include/sys/endian.h:61:20: note: expanded from macro 'bswap16'
#define bswap16(x)      __bswap16(x)
                        ^
/usr/include/x86/endian.h:76:15: note: expanded from macro '__bswap16'
        ((__uint16_t)(__builtin_constant_p(x) ? \
                     ^
In file included from ../src/disas/nanomips.cpp:31:
In file included from
/usr/home/qemu/qemu-test.UUfQa1/src/include/disas/dis-asm.h:12:
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:12:30: error:
use of undeclared identifier 'x'
    return __builtin_bswap16(x);
                             ^
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:15:24: error:
expected ')'
static inline uint32_t bswap32(uint32_t x)
                       ^
/usr/include/sys/endian.h:62:20: note: expanded from macro 'bswap32'
#define bswap32(x)      __bswap32(x)
                        ^
/usr/include/x86/endian.h:79:27: note: expanded from macro '__bswap32'
        (__builtin_constant_p(x) ?      \
                                 ^
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:15:24: note:
to match this '('
/usr/include/sys/endian.h:62:20: note: expanded from macro 'bswap32'
#define bswap32(x)      __bswap32(x)
                        ^
/usr/include/x86/endian.h:79:2: note: expanded from macro '__bswap32'
        (__builtin_constant_p(x) ?      \
        ^
In file included from ../src/disas/nanomips.cpp:31:
In file included from
/usr/home/qemu/qemu-test.UUfQa1/src/include/disas/dis-asm.h:12:
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:15:24: error:
cannot redeclare builtin function '__builtin_constant_p'
static inline uint32_t bswap32(uint32_t x)
                       ^
/usr/include/sys/endian.h:62:20: note: expanded from macro 'bswap32'
#define bswap32(x)      __bswap32(x)
                        ^
/usr/include/x86/endian.h:79:3: note: expanded from macro '__bswap32'
        (__builtin_constant_p(x) ?      \
         ^
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:10:24: note:
'__builtin_constant_p' is a builtin with type 'int (...) noexcept'
static inline uint16_t bswap16(uint16_t x)
                       ^
/usr/include/sys/endian.h:61:20: note: expanded from macro 'bswap16'
#define bswap16(x)      __bswap16(x)
                        ^
/usr/include/x86/endian.h:76:16: note: expanded from macro '__bswap16'
        ((__uint16_t)(__builtin_constant_p(x) ? \
                      ^
In file included from ../src/disas/nanomips.cpp:31:
In file included from
/usr/home/qemu/qemu-test.UUfQa1/src/include/disas/dis-asm.h:12:
/usr/home/qemu/qemu-test.UUfQa1/src/include/qemu/bswap.h:15:24: error:
definition of builtin function '__builtin_constant_p'
static inline uint32_t bswap32(uint32_t x)
                       ^
/usr/include/sys/endian.h:62:20: note: expanded from macro 'bswap32'
#define bswap32(x)      __bswap32(x)
                        ^
/usr/include/x86/endian.h:79:3: note: expanded from macro '__bswap32'
        (__builtin_constant_p(x) ?      \
         ^

[etc etc]

thanks
-- PMM

