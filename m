Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4443AC5A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:40:07 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfG7y-0007En-AG
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFOk-0006wH-DV; Tue, 26 Oct 2021 01:53:22 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:61214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFOb-000120-K8; Tue, 26 Oct 2021 01:53:21 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 89A0C78283;
 Tue, 26 Oct 2021 05:53:09 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdgwP35G1z3J3b;
 Tue, 26 Oct 2021 05:53:09 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4A9A2C36E;
 Tue, 26 Oct 2021 05:53:09 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f43.google.com with SMTP id u25so534264qve.2;
 Mon, 25 Oct 2021 22:53:09 -0700 (PDT)
X-Gm-Message-State: AOAM5324JAitpCk7454DHprzZxbmF8PlHevyjhhv5DUns8/kD8dpn5WE
 cq+QK23g1GgVk89FS2imMsHAqGxjMpFjp0VP4dk=
X-Google-Smtp-Source: ABdhPJxZRUV0XYtMSE36Dwkay10GH+IIMLTYOAPeLQBwZA55xq93hmDgGW6w3DifdY2wKf47UhVpX3zyX8kJfVIudbA=
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr20731512qvp.51.1635227588957; 
 Mon, 25 Oct 2021 22:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-8-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-8-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 00:52:58 -0500
X-Gmail-Original-Message-ID: <CACNAnaHZbPwnX7O2hO0Uv5YdNtrYUp3DJeA67mpMKo1w306uag@mail.gmail.com>
Message-ID: <CACNAnaHZbPwnX7O2hO0Uv5YdNtrYUp3DJeA67mpMKo1w306uag@mail.gmail.com>
Subject: Re: [PATCH 07/24] bsd-user/arm/target_arch_cpu.h: Implment trivial
 EXCP exceptions
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Implent EXCP_UDEF, EXCP_DEBUG, EXCP_INTERRUPT, EXCP_ATOMIC and

s/Implent/Implement/

> EXCP_YIELD. The first two generate a signal to the emulated
> binary. EXCP_ATOMIC handles atomic operations. The remainder are fancy
> nops.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cp=
u.h
> index 94c9109c3f..f22384676a 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -47,6 +47,34 @@ static inline void target_cpu_loop(CPUARMState *env)
>          cpu_exec_end(cs);
>          process_queued_cpu_work(cs);
>          switch (trapnr) {
> +        case EXCP_UDEF:
> +            {
> +                /* See arm/arm/undefined.c undefinedinstruction(); */
> +                info.si_addr =3D env->regs[15];
> +                info.si_signo =3D TARGET_SIGILL;
> +                info.si_errno =3D 0;
> +                info.si_code =3D TARGET_ILL_ILLADR;
> +                queue_signal(env, info.si_signo, &info);
> +            }
> +            break;
> +        case EXCP_INTERRUPT:
> +            /* just indicate that signals should be handled asap */
> +            break;
> +        case EXCP_DEBUG:
> +            {
> +
> +                info.si_signo =3D TARGET_SIGTRAP;
> +                info.si_errno =3D 0;
> +                info.si_code =3D TARGET_TRAP_BRKPT;
> +                queue_signal(env, info.si_signo, &info);
> +            }
> +            break;
> +        case EXCP_ATOMIC:
> +            cpu_exec_step_atomic(cs);
> +            break;
> +        case EXCP_YIELD:
> +            /* nothing to do here for user-mode, just resume guest code =
*/
> +            break;
>          default:
>              fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborti=
ng\n",
>                      trapnr);
> --
> 2.32.0
>

Modulo typo:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

