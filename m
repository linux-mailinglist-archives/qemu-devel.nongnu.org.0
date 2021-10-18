Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1C6430E6C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 05:46:39 +0200 (CEST)
Received: from localhost ([::1]:54804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJbg-0000Sf-LZ
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 23:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJP8-000655-17
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:33:38 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:25002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJP5-00079j-9H
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:33:37 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 806B79D342
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:33:34 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjC22mMJz3GN9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:33:34 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 3FE58D2BE
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:33:34 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f172.google.com with SMTP id bp7so9599148qkb.12
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:33:34 -0700 (PDT)
X-Gm-Message-State: AOAM533CGEMyEbo+LPFy4Kn66gxtSYufKnMvbDoT8lcBL0uNStI3AL4y
 VUOZGb3ND7Yw74M+JSNV9lzttE6ttDY5w34jo/U=
X-Google-Smtp-Source: ABdhPJxJN9h9hYAcwD52QlC/RGWnBuN32hKW9l35B655DYc1skOE+l445lp6sjDjIg0BpvmIXaF7p8/skCauJAZKN44=
X-Received: by 2002:a05:620a:178b:: with SMTP id
 ay11mr9441527qkb.287.1634528013849; 
 Sun, 17 Oct 2021 20:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-6-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-6-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:33:23 -0500
X-Gmail-Original-Message-ID: <CACNAnaF3_uM0xKgWNpbbnFaJWRy56m1SYZw6g=pznZsfYFJ1tA@mail.gmail.com>
Message-ID: <CACNAnaF3_uM0xKgWNpbbnFaJWRy56m1SYZw6g=pznZsfYFJ1tA@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] bsd-user: export get_errno and is_error from
 syscall.c
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> Make get_errno and is_error global so files other than syscall.c can use
> them.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/qemu.h    |  4 ++++
>  bsd-user/syscall.c | 10 +++++-----
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 522d6c4031..3b8475394c 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -235,6 +235,10 @@ extern unsigned long target_dflssiz;
>  extern unsigned long target_maxssiz;
>  extern unsigned long target_sgrowsiz;
>
> +/* syscall.c */
> +abi_long get_errno(abi_long ret);
> +bool is_error(abi_long ret);
> +
>  /* user access */
>
>  #define VERIFY_READ  PAGE_READ
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 372836d44d..2fd2ba8330 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -33,18 +33,18 @@
>  static abi_ulong target_brk;
>  static abi_ulong target_original_brk;
>
> -static inline abi_long get_errno(abi_long ret)
> +abi_long get_errno(abi_long ret)
>  {
> -    if (ret =3D=3D -1)
> +    if (ret =3D=3D -1) {
>          /* XXX need to translate host -> target errnos here */
>          return -(errno);
> -    else
> -        return ret;
> +    }
> +    return ret;
>  }
>
>  #define target_to_host_bitmask(x, tbl) (x)
>
> -static inline int is_error(abi_long ret)
> +bool is_error(abi_long ret)
>  {
>      return (abi_ulong)ret >=3D (abi_ulong)(-4096);
>  }
> --
> 2.32.0
>


Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

