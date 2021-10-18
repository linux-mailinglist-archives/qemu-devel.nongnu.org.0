Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B355D430E78
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:00:01 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJoe-0006MP-LM
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJQ4-0006MA-Id
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:34:36 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:25413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJPx-0000ZB-Uy
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:34:33 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 8D9929D934
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:34:26 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjD235DWz3GMC
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:34:26 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4A6ABD68A
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:34:26 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f181.google.com with SMTP id bl14so14204223qkb.4
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:34:26 -0700 (PDT)
X-Gm-Message-State: AOAM533EoAlppz5iIZzNL8jTFr+14LIs+yuWHR7lxk/qBm3N6f0IlS5j
 8Eri4+Lm1x9FibNbQB4qkgNigsQHjoVTc+FGUeg=
X-Google-Smtp-Source: ABdhPJzGZlLFK82IFfEgw2wlMWs/18g5c5mxuArBGGzYPsgu8B6CwEm6yfo6y1GmHFOIdtsifE7tG2HQWyJlw9JHhuk=
X-Received: by 2002:ae9:df82:: with SMTP id t124mr20009653qkf.69.1634528065997; 
 Sun, 17 Oct 2021 20:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-7-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-7-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:34:15 -0500
X-Gmail-Original-Message-ID: <CACNAnaFkaKabJJS9MCENdbMmeDMGj2TWEQ+_2F8DDcPf9MeCvQ@mail.gmail.com>
Message-ID: <CACNAnaFkaKabJJS9MCENdbMmeDMGj2TWEQ+_2F8DDcPf9MeCvQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] bsd-user/errno_defs.h: Add internal error numbers
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
Cc: Stacey Son <sson@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> From: Stacey Son <sson@FreeBSD.org>
>
> To emulate signals and interrupted system calls, we need to have the
> same mechanisms we have in the kernel, including these errno values.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/errno_defs.h | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
> index 1efa502a12..b538dd93da 100644
> --- a/bsd-user/errno_defs.h
> +++ b/bsd-user/errno_defs.h
> @@ -1,6 +1,3 @@
> -/*      $OpenBSD: errno.h,v 1.20 2007/09/03 14:37:52 millert Exp $      */
> -/*      $NetBSD: errno.h,v 1.10 1996/01/20 01:33:53 jtc Exp $   */
> -
>  /*
>   * Copyright (c) 1982, 1986, 1989, 1993
>   *      The Regents of the University of California.  All rights reserved.
> @@ -37,6 +34,9 @@
>   *      @(#)errno.h     8.5 (Berkeley) 1/21/94
>   */
>
> +#ifndef _ERRNO_DEFS_H_
> +#define _ERRNO_DEFS_H_
> +
>  #define TARGET_EPERM            1               /* Operation not permitted */
>  #define TARGET_ENOENT           2               /* No such file or directory */
>  #define TARGET_ESRCH            3               /* No such process */
> @@ -147,3 +147,11 @@
>  #define TARGET_EIDRM            89              /* Identifier removed */
>  #define TARGET_ENOMSG           90              /* No message of desired type */
>  #define TARGET_ELAST            90              /* Must be equal largest errno */
> +
> +/* Internal errors: */
> +#define TARGET_EJUSTRETURN      254             /* Just return without
> +                                                   modifing regs */
> +#define TARGET_ERESTART         255             /* Restart syscall */
> +#define TARGET_ERESTARTSYS      TARGET_ERESTART /* Linux compat */
> +
> +#endif /* !  _ERRNO_DEFS_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

