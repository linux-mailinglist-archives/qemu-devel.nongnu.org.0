Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6143AC9D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:06:13 +0200 (CEST)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGXD-0003wD-9o
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFhi-0007Ak-6y; Tue, 26 Oct 2021 02:12:58 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:12592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFhY-00030V-FS; Tue, 26 Oct 2021 02:12:54 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4BCD47BAA8;
 Tue, 26 Oct 2021 06:12:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdhM31K83z3N9v;
 Tue, 26 Oct 2021 06:12:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 0E69BCFB8;
 Tue, 26 Oct 2021 06:12:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f180.google.com with SMTP id x123so14155575qke.7;
 Mon, 25 Oct 2021 23:12:47 -0700 (PDT)
X-Gm-Message-State: AOAM532Lr5fEjMC6w+XAe2WVQJNkGo2Kp9Dav0J4ey9EpPXZRbeLj/Qw
 wceVFX8BOoxVJKqG6164pmmP8UC1yz8wi6CYsJM=
X-Google-Smtp-Source: ABdhPJw0dNKYpPhfOjhVycb4ESLZWr/Nz0uuCg2He5n3oeH92ikXFkDG7HrkJiQ83BIzw3GOplHTzUzXq5VHnouWy4E=
X-Received: by 2002:a37:9f02:: with SMTP id i2mr17306604qke.305.1635228766774; 
 Mon, 25 Oct 2021 23:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-24-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-24-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:12:36 -0500
X-Gmail-Original-Message-ID: <CACNAnaHA3096Apc-ry3qm676XxFQVYXmLT9a=JfUNxQZ9EXX2A@mail.gmail.com>
Message-ID: <CACNAnaHA3096Apc-ry3qm676XxFQVYXmLT9a=JfUNxQZ9EXX2A@mail.gmail.com>
Subject: Re: [PATCH 23/24] bsd-user/arm/target_arch_signal.h: arm
 get_ucontext_sigreturn
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
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
Cc: qemu-trivial@nongnu.org, Stacey Son <sson@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Update ucontext to implement sigreturn.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_signal.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
> index 1d051af9ae..7da68c727c 100644
> --- a/bsd-user/arm/target_arch_signal.h
> +++ b/bsd-user/arm/target_arch_signal.h
> @@ -232,4 +232,22 @@ static inline abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
>      return err;
>  }
>
> +/* Compare to arm/arm/machdep.c sys_sigreturn() */
> +static inline abi_long get_ucontext_sigreturn(CPUARMState *regs,
> +        abi_ulong target_sf, abi_ulong *target_uc)
> +{
> +    uint32_t cpsr = cpsr_read(regs);
> +
> +    *target_uc = 0;
> +
> +    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
> +            (cpsr & (CPSR_I | CPSR_F)) != 0) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    *target_uc = target_sf;
> +
> +    return 0;
> +}
> +
>  #endif /* !_TARGET_ARCH_SIGNAL_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

