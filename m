Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCC43AC59
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:39:36 +0200 (CEST)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfG7T-0006jR-0G
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFcR-0004Hh-K3; Tue, 26 Oct 2021 02:07:31 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:47127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFcI-0001vY-CO; Tue, 26 Oct 2021 02:07:31 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 12C9E7A5D9;
 Tue, 26 Oct 2021 06:07:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdhDh6qlyz3Lpb;
 Tue, 26 Oct 2021 06:07:16 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id C2C98D403;
 Tue, 26 Oct 2021 06:07:16 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f173.google.com with SMTP id h20so13995389qko.13;
 Mon, 25 Oct 2021 23:07:16 -0700 (PDT)
X-Gm-Message-State: AOAM532hM2fBlZaUNAQLjcbNJRqsld3UONZTyp4BghJWNe/f6Oim0m9K
 808EQcqvuvzWYHR7dpJFvee9S66+fo1Uip46aOQ=
X-Google-Smtp-Source: ABdhPJxO0N1Vhj6uxmeeY5WAG6sl8t3oCWjpzItMIUGILeu6NM1va7wmKtfTkSQRWHpCjGq9GR7bkK04kuz7gQ1h/vU=
X-Received: by 2002:a05:620a:424f:: with SMTP id
 w15mr17482640qko.258.1635228436506; 
 Mon, 25 Oct 2021 23:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-20-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-20-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:07:05 -0500
X-Gmail-Original-Message-ID: <CACNAnaH1pNrHjxUOsuP2ZLj2hdJKKw2WJubS7sdsKL6TeHFCsw@mail.gmail.com>
Message-ID: <CACNAnaH1pNrHjxUOsuP2ZLj2hdJKKw2WJubS7sdsKL6TeHFCsw@mail.gmail.com>
Subject: Re: [PATCH 19/24] bsd-user/arm/target_arch_signal.h: arm user context
 and trapframe for signals
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Stacey Son <sson@freebsd.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Arm specific user context structures for signal handling and the closely
> related trap frame.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
> index 9fee58ca9c..67355ff28f 100644
> --- a/bsd-user/arm/target_arch_signal.h
> +++ b/bsd-user/arm/target_arch_signal.h
> @@ -90,4 +90,42 @@ typedef struct target_mcontext {
>      } __fpu;
>  } target_mcontext_t;
>
> +typedef struct target_ucontext {
> +    target_sigset_t     uc_sigmask;
> +    target_mcontext_t   uc_mcontext;
> +    abi_ulong           uc_link;
> +    target_stack_t      uc_stack;
> +    int32_t             uc_flags;
> +    int32_t             __spare__[4];
> +} target_ucontext_t;
> +
> +struct target_sigframe {
> +    target_siginfo_t    sf_si;  /* saved siginfo */
> +    target_ucontext_t   sf_uc;  /* saved ucontext */
> +};
> +
> +

We might be able to kill this extra newline? I'm not familiar enough
with qemu's style preferences here...

> +/* compare to sys/arm/include/frame.h */
> +struct target_trapframe {
> +    abi_ulong tf_spsr; /* Zero on arm26 */
> +    abi_ulong tf_r0;
> +    abi_ulong tf_r1;
> +    abi_ulong tf_r2;
> +    abi_ulong tf_r3;
> +    abi_ulong tf_r4;
> +    abi_ulong tf_r5;
> +    abi_ulong tf_r6;
> +    abi_ulong tf_r7;
> +    abi_ulong tf_r8;
> +    abi_ulong tf_r9;
> +    abi_ulong tf_r10;
> +    abi_ulong tf_r11;
> +    abi_ulong tf_r12;
> +    abi_ulong tf_usr_sp;
> +    abi_ulong tf_usr_lr;
> +    abi_ulong tf_svc_sp; /* Not used on arm26 */
> +    abi_ulong tf_svc_lr; /* Not used on arm26 */
> +    abi_ulong tf_pc;
> +};
> +
>  #endif /* !_TARGET_ARCH_SIGNAL_H_ */
> --
> 2.32.0
>

I didn't think we actually supported arm26, but I see those comments
also exist verbatim in machine/frame.h; no objection to reflecting
them here, as well.

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

