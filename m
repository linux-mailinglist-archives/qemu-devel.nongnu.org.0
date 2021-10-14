Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE80042DE3D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:36:25 +0200 (CEST)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2mO-0004os-Sp
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2Jx-0001dO-6v
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:07:01 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:25379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2Ju-0001p3-EI
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:07:00 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id EF416ACC11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:57 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HVXmx61xpz4fpL
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:57 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id B041034AE
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:57 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f176.google.com with SMTP id v17so6031097qtp.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:06:57 -0700 (PDT)
X-Gm-Message-State: AOAM533UXt20DfLbcW290j4G9+n1H739Uo9siuqMIIzbRd8MuZ0t1RiT
 rdNbAVlg3nQ/atIcxarn9iRjlz5/KFUZ69WF8Pw=
X-Google-Smtp-Source: ABdhPJwqQDXMdkCk79US9SndVDxK4X91qQxUPmwCSviEcky/nImTSQfEd15Vv6DWMfKY7DGm8ocVMEHRYh0OYyQl0Y8=
X-Received: by 2002:ac8:5747:: with SMTP id 7mr7034371qtx.11.1634224017409;
 Thu, 14 Oct 2021 08:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-4-imp@bsdimp.com>
In-Reply-To: <20211008212344.95537-4-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 14 Oct 2021 10:06:46 -0500
X-Gmail-Original-Message-ID: <CACNAnaFe0+vX5kkdwyk9Of5j+1SphCRAA3brpuWjfLqn=ubf8g@mail.gmail.com>
Message-ID: <CACNAnaFe0+vX5kkdwyk9Of5j+1SphCRAA3brpuWjfLqn=ubf8g@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] bsd-user/mmap.c: MAP_ symbols are defined, so no
 need for ifdefs
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 4:24 PM Warner Losh <imp@bsdimp.com> wrote:
>
> All these MAP_ symbols are always defined on supported FreeBSD versions
> (12.2 and newer), so remove the #ifdefs since they aren't needed.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/mmap.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 4f4fa3ab46..6f33aec58b 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -286,13 +286,9 @@ static abi_ulong mmap_find_vma_aligned(abi_ulong sta=
rt, abi_ulong size,
>      wrapped =3D repeat =3D 0;
>      prev =3D 0;
>      flags =3D MAP_ANONYMOUS | MAP_PRIVATE;
> -#ifdef MAP_ALIGNED
>      if (alignment !=3D 0) {
>          flags |=3D MAP_ALIGNED(alignment);
>      }
> -#else
> -    /* XXX TODO */
> -#endif
>
>      for (;; prev =3D ptr) {
>          /*
> @@ -407,22 +403,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len=
, int prot,
>              printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
>                      >> MAP_ALIGNMENT_SHIFT);
>          }
> -#if MAP_GUARD
>          if (flags & MAP_GUARD) {
>              printf("MAP_GUARD ");
>          }
> -#endif
>          if (flags & MAP_FIXED) {
>              printf("MAP_FIXED ");
>          }
>          if (flags & MAP_ANONYMOUS) {
>              printf("MAP_ANON ");
>          }
> -#ifdef MAP_EXCL
>          if (flags & MAP_EXCL) {
>              printf("MAP_EXCL ");
>          }
> -#endif
>          if (flags & MAP_PRIVATE) {
>              printf("MAP_PRIVATE ");
>          }
> @@ -432,11 +424,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,=
 int prot,
>          if (flags & MAP_NOCORE) {
>              printf("MAP_NOCORE ");
>          }
> -#ifdef MAP_STACK
>          if (flags & MAP_STACK) {
>              printf("MAP_STACK ");
>          }
> -#endif
>          printf("fd=3D%d offset=3D0x%llx\n", fd, offset);
>      }
>  #endif
> @@ -445,7 +435,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,
>          errno =3D EINVAL;
>          goto fail;
>      }
> -#ifdef MAP_STACK
>      if (flags & MAP_STACK) {
>          if ((fd !=3D -1) || ((prot & (PROT_READ | PROT_WRITE)) !=3D
>                      (PROT_READ | PROT_WRITE))) {
> @@ -453,8 +442,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,
>              goto fail;
>          }
>      }
> -#endif /* MAP_STACK */
> -#ifdef MAP_GUARD
>      if ((flags & MAP_GUARD) && (prot !=3D PROT_NONE || fd !=3D -1 ||
>          offset !=3D 0 || (flags & (MAP_SHARED | MAP_PRIVATE |
>          /* MAP_PREFAULT | */ /* MAP_PREFAULT not in mman.h */
> @@ -462,7 +449,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,
>          errno =3D EINVAL;
>          goto fail;
>      }
> -#endif
>
>      if (offset & ~TARGET_PAGE_MASK) {
>          errno =3D EINVAL;
> --
> 2.32.0
>
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

