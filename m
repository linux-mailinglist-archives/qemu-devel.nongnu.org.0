Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E374743AD28
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:24:13 +0200 (CEST)
Received: from localhost ([::1]:43842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGoe-0001mw-NE
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFZC-0002sX-1F; Tue, 26 Oct 2021 02:04:10 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:45736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFZ7-0001Se-DK; Tue, 26 Oct 2021 02:04:08 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 89A2D7A56B;
 Tue, 26 Oct 2021 06:04:01 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hdh8x1qcfz3M2L;
 Tue, 26 Oct 2021 06:04:01 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 1F37FCB9C;
 Tue, 26 Oct 2021 06:04:01 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f176.google.com with SMTP id 77so14124579qkh.6;
 Mon, 25 Oct 2021 23:04:01 -0700 (PDT)
X-Gm-Message-State: AOAM531LYkk25VENzMJAjVjO/laE41II5cv6OBhpl1YSOWQJJxUJQkgc
 k6wtNeArmDZaaHM67Z22rdIuF2HKICdW+R6F9GM=
X-Google-Smtp-Source: ABdhPJwpxiVg4c/DdyQV/zumttQfZPk/hW7G2Bwldjz+0crS/yutBSiRyDsZmaWFirhGE50JGSk4q9XXHhq16Po7Ipg=
X-Received: by 2002:a05:620a:424f:: with SMTP id
 w15mr17472248qko.258.1635228240805; 
 Mon, 25 Oct 2021 23:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-19-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-19-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:03:50 -0500
X-Gmail-Original-Message-ID: <CACNAnaF8uekw-mUVDVo5jyxTfwyMWDAfONwRszaNfi58PDW9Ng@mail.gmail.com>
Message-ID: <CACNAnaF8uekw-mUVDVo5jyxTfwyMWDAfONwRszaNfi58PDW9Ng@mail.gmail.com>
Subject: Re: [PATCH 18/24] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
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
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_signal.h | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
> index 973183d99c..9fee58ca9c 100644
> --- a/bsd-user/arm/target_arch_signal.h
> +++ b/bsd-user/arm/target_arch_signal.h
> @@ -54,4 +54,40 @@
>  #define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
>  #define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
>
> +/* arm/arm/machdep.c */
> +struct target_sigcontext {
> +    target_sigset_t sc_mask;    /* signal mask to retstore */
> +    int32_t     sc_onstack;     /* sigstack state to restore */
> +    abi_long    sc_pc;          /* pc at time of signal */
> +    abi_long    sc_reg[32];     /* processor regs 0 to 31 */
> +    abi_long    mullo, mulhi;   /* mullo and mulhi registers */
> +    int32_t     sc_fpused;      /* fp has been used */
> +    abi_long    sc_fpregs[33];  /* fp regs 0 to 31 & csr */
> +    abi_long    sc_fpc_eir;     /* fp exception instr reg */
> +    /* int32_t reserved[8]; */
> +};
> +
> +typedef struct {
> +    uint32_t    __fp_fpsr;
> +    struct {
> +        uint32_t    __fp_exponent;
> +        uint32_t    __fp_mantissa_hi;
> +        uint32_t    __fp_mantissa_lo;
> +    }       __fp_fr[8];
> +} target__fpregset_t;
> +
> +typedef struct {
> +    uint32_t    __vfp_fpscr;
> +    uint32_t    __vfp_fstmx[33];
> +    uint32_t    __vfp_fpsid;
> +} target__vfpregset_t;
> +
> +typedef struct target_mcontext {
> +    uint32_t        __gregs[TARGET__NGREG];
> +    union {
> +        target__fpregset_t  __fpregs;
> +        target__vfpregset_t __vfpregs;
> +    } __fpu;
> +} target_mcontext_t;
> +
>  #endif /* !_TARGET_ARCH_SIGNAL_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

