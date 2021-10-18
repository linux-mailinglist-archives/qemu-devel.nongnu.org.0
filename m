Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8259F430F51
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:42:42 +0200 (CEST)
Received: from localhost ([::1]:56142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKTx-0006N1-F7
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJYU-0001Qq-Su
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:43:18 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:57372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJYN-0003xn-05
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:43:14 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id E933F9F61D
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:43:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjQ15wP5z3JRP
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:43:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id A6767D9C4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:43:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f181.google.com with SMTP id n2so850194qta.2
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:43:05 -0700 (PDT)
X-Gm-Message-State: AOAM531rohawGZUQgJPIlllyFbKE69zz+ZwOE8SPdkFmecbpGv2kf7AO
 HU4YKx7S+L/BP26DGjLYFdJSrFRdBvFhr5M2/n0=
X-Google-Smtp-Source: ABdhPJz1sLfhw2QTOz4OMAoax2OUIKPr7Kv3US+GZZDjBX+Tx4fBgP0JEMIDNsyezJkVXl4Tt0H9EhFRu9LG1qVJXSU=
X-Received: by 2002:ac8:514f:: with SMTP id h15mr26901467qtn.340.1634528585317; 
 Sun, 17 Oct 2021 20:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-2-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-2-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:42:54 -0500
X-Gmail-Original-Message-ID: <CACNAnaFu1uX=pcsjwmYxKAPLX=JdsPHTnrJmjRD2U+aX79KhZQ@mail.gmail.com>
Message-ID: <CACNAnaFu1uX=pcsjwmYxKAPLX=JdsPHTnrJmjRD2U+aX79KhZQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] meson: *-user: only descend into *-user when
 configured
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <wlosh@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> To increase flexibility, only descend into *-user when that is
> configured. This allows *-user to selectively include directories based
> on the host OS which may not exist on all hosts. Adopt Paolo's
> suggestion of checking the configuration in the directories that know
> about the configuration.
>
> Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
> Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Warner Losh <wlosh@bsdimp.com>
> Acked-by: Paolo Bonzini <pbonzinni@redhat.com>
>
> Sponsored by:           Netflix
> ---
>  bsd-user/meson.build   | 4 ++++
>  linux-user/meson.build | 4 ++++
>  meson.build            | 3 +--
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 0369549340..243fb78930 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_target.has_key('CONFIG_BSD_USER')
> +   subdir_done()
> +endif
> +
>  bsd_user_ss.add(files(
>    'bsdload.c',
>    'elfload.c',
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index 9549f81682..602255a3d6 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_target.has_key('CONFIG_LINUX_USER')
> +   subdir_done()
> +endif
> +
>  linux_user_ss.add(files(
>    'elfload.c',
>    'exit.c',
> diff --git a/meson.build b/meson.build
> index 99a0a3e689..1f2da5f7d9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2303,10 +2303,9 @@ subdir('ebpf')
>
>  common_ss.add(libbpf)
>
> -bsd_user_ss.add(files('gdbstub.c'))
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>
> -linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
> +linux_user_ss.add(files('thunk.c'))
>  specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
>
>  # needed for fuzzing binaries
> --
> 2.32.0
>

I don't understand the gdbstub.c removal  here; don't we still want to
be compiling it in, just only if the appropriate
CONFIG_{BSD,LINUX}_USER knob is set? I note that it doesn't appear to
be added in individual *-user/meson.build, I assume it's uncommon to
add in ../foo.c in meson-land...

Thanks,

Kyle Evans

