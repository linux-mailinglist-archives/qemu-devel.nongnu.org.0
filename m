Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F8430E6F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 05:47:58 +0200 (CEST)
Received: from localhost ([::1]:55714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJcz-0001IP-49
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 23:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJQv-0006Yp-U4
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:35:31 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:25829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJQq-0001V7-9P
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:35:28 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id B77429D34B
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:23 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjF74Wxjz3GN0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:23 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 501A9D68D
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:23 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f178.google.com with SMTP id g17so5950294qtk.8
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:35:23 -0700 (PDT)
X-Gm-Message-State: AOAM530OlVfp5J9j6NgASLj3pSHwzjrWQaOvHWtNLHY6aeMaYjT1iR96
 9flW90O5I64R+qb8H99tL/GRjGXrq8BM/k7gLB0=
X-Google-Smtp-Source: ABdhPJzYqDzinUs0DMFqdHGkGZDwnVrV5a+jXPQdD9LD49d4/sc9s8bKZ0QzdElGIPccT6KeqP9jiOPQwWMi+JN5uHM=
X-Received: by 2002:ac8:57c3:: with SMTP id w3mr27118657qta.132.1634528122910; 
 Sun, 17 Oct 2021 20:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-9-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-9-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:35:12 -0500
X-Gmail-Original-Message-ID: <CACNAnaHh0cf2VSjXOjZ6s9B+bFiGK5e1eymNeTRgX_TWEbcDOg@mail.gmail.com>
Message-ID: <CACNAnaHh0cf2VSjXOjZ6s9B+bFiGK5e1eymNeTRgX_TWEbcDOg@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] bsd-user/target_os_elf.h: Remove fallback
 ELF_HWCAP and reorder
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
> All architectures have a ELF_HWCAP, so remove the fallback ifdef.
> Place ELF_HWCAP in the same order as on native FreeBSD.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/freebsd/target_os_elf.h | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_o=
s_elf.h
> index 2d03a883aa..adcffd1ddb 100644
> --- a/bsd-user/freebsd/target_os_elf.h
> +++ b/bsd-user/freebsd/target_os_elf.h
> @@ -38,10 +38,6 @@
>  #define ELF_PLATFORM (NULL)
>  #endif
>
> -#ifndef ELF_HWCAP
> -#define ELF_HWCAP 0
> -#endif
> -
>  /* XXX Look at the other conflicting AT_* values. */
>  #define FREEBSD_AT_NCPUS     19
>  #define FREEBSD_AT_HWCAP     25
> @@ -114,12 +110,12 @@ static abi_ulong target_create_elf_tables(abi_ulong=
 p, int argc, int envc,
>          NEW_AUX_ENT(AT_FLAGS, (abi_ulong)0);
>          NEW_AUX_ENT(FREEBSD_AT_NCPUS, (abi_ulong)bsd_get_ncpu());
>          NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
> +        features =3D ELF_HWCAP;
> +        NEW_AUX_ENT(FREEBSD_AT_HWCAP, features);
>          NEW_AUX_ENT(AT_UID, (abi_ulong)getuid());
>          NEW_AUX_ENT(AT_EUID, (abi_ulong)geteuid());
>          NEW_AUX_ENT(AT_GID, (abi_ulong)getgid());
>          NEW_AUX_ENT(AT_EGID, (abi_ulong)getegid());
> -        features =3D ELF_HWCAP;
> -        NEW_AUX_ENT(FREEBSD_AT_HWCAP, features);
>          target_auxents =3D sp; /* Note where the aux entries are in the =
target */
>  #ifdef ARCH_DLINFO
>          /*
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

