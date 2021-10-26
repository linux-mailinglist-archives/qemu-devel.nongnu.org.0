Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176CC43ABFD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:03:26 +0200 (CEST)
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfFYR-0000LU-Rt
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFNN-0006Sa-R4; Tue, 26 Oct 2021 01:51:57 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:60079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFNH-00089i-5V; Tue, 26 Oct 2021 01:51:56 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id B01AE77CFB;
 Tue, 26 Oct 2021 05:51:48 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hdgtr2T3dz3JK7;
 Tue, 26 Oct 2021 05:51:48 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 316D6CE16;
 Tue, 26 Oct 2021 05:51:48 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f176.google.com with SMTP id y10so14038299qkp.9;
 Mon, 25 Oct 2021 22:51:48 -0700 (PDT)
X-Gm-Message-State: AOAM531o4cOchCFm7ngnbW4witrsP1iTTmNKarmrx1ECYX8qdDFXxNxk
 t8KxjmkdhqEIGoxkvdr3IsOrn5W8uAhhYYkaJJw=
X-Google-Smtp-Source: ABdhPJwnCwPQBOjjTDuIlMSp7SmGvhDptLKRDwgP/hzU7tJDroeAPW3u9JEliteNa2gwG9lNft0IQCF/MjRzTJTP8jE=
X-Received: by 2002:a37:9f02:: with SMTP id i2mr17244022qke.305.1635227507831; 
 Mon, 25 Oct 2021 22:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-13-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-13-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 00:51:37 -0500
X-Gmail-Original-Message-ID: <CACNAnaE1HKH8SoVm3HO65V62z52t3Lf0wLzffm_53Fvipn5M0w@mail.gmail.com>
Message-ID: <CACNAnaE1HKH8SoVm3HO65V62z52t3Lf0wLzffm_53Fvipn5M0w@mail.gmail.com>
Subject: Re: [PATCH 12/24] bsd-user/arm/target_arch_sigtramp.h: Signal
 Trampoline for arm
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
> Copy of the signal trampoline code for arm, as well as setup_sigtramp to
> write it to the stack.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_sigtramp.h | 52 +++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 bsd-user/arm/target_arch_sigtramp.h
>
> diff --git a/bsd-user/arm/target_arch_sigtramp.h b/bsd-user/arm/target_arch_sigtramp.h
> new file mode 100644
> index 0000000000..ed53d336ed
> --- /dev/null
> +++ b/bsd-user/arm/target_arch_sigtramp.h
> @@ -0,0 +1,52 @@
> +/*
> + *  arm sysarch() system call emulation
> + *
> + *  Copyright (c) 2013 Stacey D. Son
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _TARGET_ARCH_SIGTRAMP_H_
> +#define _TARGET_ARCH_SIGTRAMP_H_
> +
> +/* Compare to arm/arm/locore.S ENTRY_NP(sigcode) */
> +static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
> +        unsigned sys_sigreturn)
> +{
> +    int i;
> +    uint32_t sys_exit = TARGET_FREEBSD_NR_exit;
> +    /*
> +     * The code has to load r7 manually rather than using
> +     * "ldr r7, =SYS_return to make sure the size of the
> +     * code is correct.
> +     */
> +    uint32_t sigtramp_code[] = {
> +    /* 1 */ 0xE1A0000D,                  /* mov r0, sp */
> +    /* 2 */ 0xE2800000 + sigf_uc,        /* add r0, r0, #SIGF_UC */
> +    /* 3 */ 0xE59F700C,                  /* ldr r7, [pc, #12] */
> +    /* 4 */ 0xEF000000 + sys_sigreturn,  /* swi (SYS_sigreturn) */
> +    /* 5 */ 0xE59F7008,                  /* ldr r7, [pc, #8] */
> +    /* 6 */ 0xEF000000 + sys_exit,       /* swi (SYS_exit)*/
> +    /* 7 */ 0xEAFFFFFA,                  /* b . -16 */
> +    /* 8 */ sys_sigreturn,
> +    /* 9 */ sys_exit
> +    };
> +
> +    for (i = 0; i < 9; i++) {
> +        tswap32s(&sigtramp_code[i]);
> +    }
> +
> +    return memcpy_to_target(offset, sigtramp_code, TARGET_SZSIGCODE);
> +}
> +#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

