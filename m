Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC1D3193C7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:01:53 +0100 (CET)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAI9w-00009Z-St
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAHvG-0006R1-ID
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:46:42 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAHvE-00089l-NT
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:46:42 -0500
Received: by mail-ej1-x62c.google.com with SMTP id f14so11860437ejc.8
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 11:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8eVQpXIkznPjoBZKUWSSkLXNDu8KVGQ2vE3NOPTNx/4=;
 b=SOdDwjb/IfqHPs4ThOgKz3bbNSCc7CirOIXNQsmObC/AXFcRR9LraXClEONZkykmnJ
 xWypz4dtIFngkzn+bxy/cNv10pvdJ7SD/VO/69MZbvq+x5H5A7zMB4r0IBlK2hSw0YeV
 zMeRZCb3XQaIHJW2g+rPXi57uniiVTiKncEP73L7CCPNbTmzspeUJVB1hR5qvNReN2So
 MhwcB67ztSC/kQQ445BtEt60kmCmzN+UxMquAxY8G43iw9wfjzZPz37noahSAwx75WMK
 GpfOi7kkjQAKyytB5HLhsNoWVutxRPtUuuDP0Zva8uLmT+9BFNKxNviQ/0U0awKwhd9O
 AHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8eVQpXIkznPjoBZKUWSSkLXNDu8KVGQ2vE3NOPTNx/4=;
 b=rbYHqUvjqklW1QQYFETcoNE2E1V5nHCgEh9stqST+AAUh2ACdPc5bXsgutFqKetVEf
 Eso9rw6EA0DoqcuYH5t0ZgG3zFtR1d3TmiXwuOWE/zs5ZNKeE9+82QIoSIWoXs3ItoKK
 H3JTZ1NowjxTqgUjdgJgfnooY0CHRZeYqpyxaImLRI4mqa3HUDS5umfrNoDYW2ibcGIr
 okILzry+vMXo886YulSB2AUJ07m8+Z42AnLA7BSsBCvPCsdM+66U+cEAjiZD5rtUdbgf
 epMMHEDAhWeucSkGrPmv7jnq3n7jOnzjYyK9DdNdH+a7P/t+p5DyeyhY6wbp2u1pOYiB
 5JSA==
X-Gm-Message-State: AOAM532gQ165I5d59454ok4iqVly6B3ZmSjfVMLxxlHMGbKesNU/v54t
 nnqKBu4ii8Ekjsi6SUUBj4IOL+nd8whkJy/sMYkaYTXuhe+ZHA==
X-Google-Smtp-Source: ABdhPJynRL5aF+T2kI0Uo8FNPt6T+mo6H/+v3r8ymWkVVhaD0aPrnwe0srLMlxGVegDRI3CtQtAFtKHfqC+qRsqOcpY=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr9998386ejh.85.1613072799415; 
 Thu, 11 Feb 2021 11:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20210210000223.884088-1-richard.henderson@linaro.org>
 <CAFEAcA94uj2=mr4bq2Z_QpgqpLRqpHBxg8yX9m=E8P0mPWW23Q@mail.gmail.com>
In-Reply-To: <CAFEAcA94uj2=mr4bq2Z_QpgqpLRqpHBxg8yX9m=E8P0mPWW23Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 19:46:28 +0000
Message-ID: <CAFEAcA9W7LgRzCK6JSSAX7CfUDvnt=O2LEPEeL6bzmvwjTf87A@mail.gmail.com>
Subject: Re: [PATCH v6 00/31] target-arm: Implement ARMv8.5-MemTag, user mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Thu, 11 Feb 2021 at 10:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 10 Feb 2021 at 00:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Changes for v6:
> >   * Drop the change to probe_access.  The cpu_untagged_addr function
> >     isn't correct, since that's specifically for syscalls.  The uses
> >     of probe_access in target/arm/ are already done with clean addresses.
> >   * Move unlock_user comparison change from p19 to p18.
> >
> > The only unreviewed patch is 19.

> Applied to target-arm.next, thanks.

...dropped again, it breaks bsd-user:


NetBSD:

In file included from ../src/bsd-user/strace.c:25:0:
../src/bsd-user/qemu.h: In function 'lock_user':
../src/bsd-user/qemu.h:365:16: warning: passing argument 1 of 'g2h'
makes pointer from integer without a cast [-Wint-conversion]
     return g2h(guest_addr);
                ^~~~~~~~~~
In file included from ../src/bsd-user/qemu.h:22:0,
                 from ../src/bsd-user/strace.c:25:
/home/qemu/qemu-test.aZ6xMm/src/include/exec/cpu_ldst.h:85:21: note:
expected 'CPUState * {aka struct CPUState *}' but argument is of type
'abi_ulong {aka unsigned int}'
 static inline void *g2h(CPUState *cs, abi_ptr x)
                     ^~~
In file included from ../src/bsd-user/strace.c:25:0:
../src/bsd-user/qemu.h:365:12: error: too few arguments to function 'g2h'
     return g2h(guest_addr);
            ^~~
In file included from ../src/bsd-user/qemu.h:22:0,
                 from ../src/bsd-user/strace.c:25:
/home/qemu/qemu-test.aZ6xMm/src/include/exec/cpu_ldst.h:85:21: note:
declared here
 static inline void *g2h(CPUState *cs, abi_ptr x)
                     ^~~
In file included from ../src/bsd-user/strace.c:25:0:
../src/bsd-user/qemu.h:367:1: warning: control reaches end of non-void
function [-Wreturn-type]
 }
 ^

FreeBSD:

In file included from ../src/bsd-user/main.c:29:
../src/bsd-user/qemu.h:365:26: error: too few arguments to function
call, expected 2, have 1
    return g2h(guest_addr);
           ~~~           ^
/usr/home/qemu/qemu-test.FJ7zNo/src/include/exec/cpu_ldst.h:85:1:
note: 'g2h' declared here
static inline void *g2h(CPUState *cs, abi_ptr x)
^
../src/bsd-user/main.c:1058:34: error: too few arguments to function
call, expected 2, have 1
    idt_table = g2h(env->idt.base);
                ~~~              ^
/usr/home/qemu/qemu-test.FJ7zNo/src/include/exec/cpu_ldst.h:85:1:
note: 'g2h' declared here
static inline void *g2h(CPUState *cs, abi_ptr x)
^
../src/bsd-user/main.c:1088:38: error: too few arguments to function
call, expected 2, have 1
        gdt_table = g2h(env->gdt.base);
                    ~~~              ^
/usr/home/qemu/qemu-test.FJ7zNo/src/include/exec/cpu_ldst.h:85:1:
note: 'g2h' declared here
static inline void *g2h(CPUState *cs, abi_ptr x)
^

And also

../src/accel/tcg/translate-all.c:2812:41: warning: shift count >=
width of type [-Wshift-count-overflow]
        assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/include/assert.h:56:21: note: expanded from macro 'assert'
#define assert(e)       ((e) ? (void)0 : __assert(__func__, __FILE__, \
                          ^


OpenBSD:

In file included from ../src/cpu.c:30:
../src/bsd-user/qemu.h:365:26: error: too few arguments to function
call, expected 2, have 1
    return g2h(guest_addr);
           ~~~           ^
/home/qemu/qemu-test.UlUP2w/src/include/exec/cpu_ldst.h:85:1: note:
'g2h' declared here
static inline void *g2h(CPUState *cs, abi_ptr x)
^


thanks
-- PMM

