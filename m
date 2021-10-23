Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B5343824B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 10:06:56 +0200 (CEST)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meC3J-0001Zi-NO
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 04:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBWi-00073y-0D; Sat, 23 Oct 2021 03:33:12 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:50242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBWe-0004pc-VP; Sat, 23 Oct 2021 03:33:10 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id C0ABC9973A;
 Sat, 23 Oct 2021 07:33:06 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HbtH64jP5z3F8l;
 Sat, 23 Oct 2021 07:33:06 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 82BA9A59B;
 Sat, 23 Oct 2021 07:33:06 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f177.google.com with SMTP id j12so6837380qkk.5;
 Sat, 23 Oct 2021 00:33:06 -0700 (PDT)
X-Gm-Message-State: AOAM532RM1yZuTzOKImiEefaNMw+A3IUZ6pcaiR50w4Z6UpwhLGrwJgw
 8pCnsKuA+vXg3RLcAl8/Md4iSNGdl5QS7twnp4E=
X-Google-Smtp-Source: ABdhPJw/IFVLcz8M3/qcaFujdxkDeFu4j7Sbjp8Zz52NQ8fBwWp4lqvQWlHcDcudfPtI/UE9tDahrobmQE56BDlKJG4=
X-Received: by 2002:ae9:df82:: with SMTP id t124mr3602912qkf.69.1634974386253; 
 Sat, 23 Oct 2021 00:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-7-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-7-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 23 Oct 2021 02:32:55 -0500
X-Gmail-Original-Message-ID: <CACNAnaEyty9ZewFHBajDqrQDujaKjuQjR3T+_XX2L=e2-i618g@mail.gmail.com>
Message-ID: <CACNAnaEyty9ZewFHBajDqrQDujaKjuQjR3T+_XX2L=e2-i618g@mail.gmail.com>
Subject: Re: [PATCH 06/24] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
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
Cc: Stacey Son <sson@freebsd.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Sean Bruno <sbruno@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Add a boiler plate CPU loop that does nothing except return an error for
> all traps.
>
> Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index c71ec000b3..94c9109c3f 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -35,6 +35,28 @@ static inline void target_cpu_init(CPUARMState *env,
>      }
>  }
>
> +static inline void target_cpu_loop(CPUARMState *env)
> +{
> +    int trapnr;
> +    target_siginfo_t info;
> +    CPUState *cs = env_cpu(env);
> +
> +    for (;;) {
> +        cpu_exec_start(cs);
> +        trapnr = cpu_exec(cs);
> +        cpu_exec_end(cs);
> +        process_queued_cpu_work(cs);
> +        switch (trapnr) {
> +        default:
> +            fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
> +                    trapnr);
> +            cpu_dump_state(cs, stderr, 0);
> +            abort();
> +        } /* switch() */
> +        process_pending_signals(env);
> +    } /* for (;;) */
> +}
> +
>  static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
>  {
>      if (newsp) {
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

