Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE642430E7A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:02:58 +0200 (CEST)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJrT-00074C-Tj
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJRQ-0006vH-Vv
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:36:00 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:25934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJRA-0001xk-LL
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:36:00 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id A192E9D6C0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:41 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjFT3t3Pz3GYG
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:41 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 65E8ED68F
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:41 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f169.google.com with SMTP id x123so404204qke.7
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:35:41 -0700 (PDT)
X-Gm-Message-State: AOAM530xiQ+4ZTX9/0jziCxl+qDKQ7i7JeGch2hTgrtZSYW0BI7Je/k3
 6qyyZRi47eUJuY6d7RdmiqVsAuFWQ+QY3IyXmd8=
X-Google-Smtp-Source: ABdhPJxBl2fqzTR2xNAd3ychekO+YHmOvjIILY+OKSeYa8rpqI5FX9EL0OLeIOoDKgwb0csQ4rSocgzqaFBoYTr+XTI=
X-Received: by 2002:a37:9f02:: with SMTP id i2mr20350129qke.305.1634528141077; 
 Sun, 17 Oct 2021 20:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-10-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-10-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:35:30 -0500
X-Gmail-Original-Message-ID: <CACNAnaFN-yimZyPCVLGqxS7ZHnW+Xqna6k0wxhURS_hDQTPc0A@mail.gmail.com>
Message-ID: <CACNAnaFN-yimZyPCVLGqxS7ZHnW+Xqna6k0wxhURS_hDQTPc0A@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] bsd-user/target_os_elf: If ELF_HWCAP2 is
 defined, publish it
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Some architectures publish AT_HWCAP2 as well as AT_HWCAP. Those
> architectures will define ELF_HWCAP2 in their target_arch_elf.h files
> for the value for this process. If it is defined, then publish it.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/freebsd/target_os_elf.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_o=
s_elf.h
> index adcffd1ddb..e5ac8e8e50 100644
> --- a/bsd-user/freebsd/target_os_elf.h
> +++ b/bsd-user/freebsd/target_os_elf.h
> @@ -112,6 +112,10 @@ static abi_ulong target_create_elf_tables(abi_ulong =
p, int argc, int envc,
>          NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
>          features =3D ELF_HWCAP;
>          NEW_AUX_ENT(FREEBSD_AT_HWCAP, features);
> +#ifdef ELF_HWCAP2
> +        features =3D ELF_HWCAP2;
> +        NEW_AUX_ENT(FREEBSD_AT_HWCAP2, features);
> +#endif
>          NEW_AUX_ENT(AT_UID, (abi_ulong)getuid());
>          NEW_AUX_ENT(AT_EUID, (abi_ulong)geteuid());
>          NEW_AUX_ENT(AT_GID, (abi_ulong)getgid());
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

