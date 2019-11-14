Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27207FC108
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 08:56:58 +0100 (CET)
Received: from localhost ([::1]:54208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iV9zs-00075Q-KJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 02:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iV9yY-0006a4-Mx
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 02:55:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iV9yX-0002a4-HN
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 02:55:34 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55960)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iV9yX-0002ZW-95
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 02:55:33 -0500
Received: by mail-wm1-x341.google.com with SMTP id b11so4584643wmb.5
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 23:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=75FJzIe86qGHKmdmRjxoZt8QTnxqmAnQ6Id743DocJM=;
 b=sVCS7Sxi0MWRuMSmR65KAjN6j2Xhj7ho7LZnLI9JyzF2T6P0cySB835wBetIkLOVIE
 JbXWS5ykZWJsI9KMvSrcqdqlF1IvEXJ7GrnBkIJUWDZCINkO0NTZc9It9Eo+rk1z0rUL
 esAubUu6w565wq6tBsA2NcqonMA+wNoS6t+iuvt8Plv1SanTvzIh48TzPnX2hwC9v00E
 fwG08CMSgHZWqO/miJh2LomPuQvj0FvD1ejemHclC9E2bxJZrS8btOcKCXngxuQaz3Pv
 D0lGfIwjPSuO20iS9iIFXSHZb+jp5lQFaaaHX/27U7ybCLiH03JFlqWX+JO8zAHmsiws
 KRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=75FJzIe86qGHKmdmRjxoZt8QTnxqmAnQ6Id743DocJM=;
 b=CAM3VBJ7KVbuDkmal0umKsOP/6iH/UE3sawJKVgO7LgblBFMkfhSaFlyBfDwR5Gssr
 4zWF8B/f3aglDvvBbNZc1o2rRLdYPwtxtbzAV5YpeUed9XlIZrO9+9TeXNFB93HQ5J1+
 4XrH201Uezjw7FUD8nmJdncLgeJ/wsQ+ejGR1dVZIWHMWcIAqVOU0Aj3hMlepO0EcaIB
 GblZBOxEc6XKpEhLXxW+fBiRWY0YHoPJzs/Dsr6CMF8vKjyJoUeUagI5AiqFwbBDVMUj
 nKez9xiFW1Xs58OIqlTwTS76QI77kLlUlUGGBeYWazVVKBCzW0kzycpxVogLRVKUXzUn
 rsRw==
X-Gm-Message-State: APjAAAVhI7p7o9QsDADFq1z3XNqcqLW902hgaMZsMtLHt+cbTyUM2/L5
 DmNB43Ap0WbWBplUV/0aHxmrFYgv7cZtcohOUNU=
X-Google-Smtp-Source: APXvYqwpxrNmEuDRf0Z8w9QbM0xDe5/C+JiINLU2QptKA9+a6r0Yy3bytmWNYSaDWTOblvPjdTIfSOqpCCf2l0RiddY=
X-Received: by 2002:a05:600c:20e:: with SMTP id
 14mr6223510wmi.107.1573718132225; 
 Wed, 13 Nov 2019 23:55:32 -0800 (PST)
MIME-Version: 1.0
References: <1573655945-14912-1-git-send-email-pbonzini@redhat.com>
 <1573655945-14912-3-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1573655945-14912-3-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 14 Nov 2019 11:55:19 +0400
Message-ID: <CAJ+F1CLt2buDE8=GaPO7wTBC5Z7-TgM+GVgR+kZwRcYxMdN14g@mail.gmail.com>
Subject: Re: [PATCH 02/16] vl: extract accelerator option processing to a
 separate function
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Nov 13, 2019 at 6:39 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> As a first step towards supporting multiple "-accel" options, push -icoun=
t
> and -accel semantics into a new function, and use qemu_opts_foreach to
> retrieve the key/value lists instead of stashing them into globals.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  vl.c | 40 ++++++++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 841fdae..5367f23 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2827,6 +2827,33 @@ static void user_register_global_props(void)
>                        global_init_func, NULL, NULL);
>  }
>
> +static int do_configure_icount(void *opaque, QemuOpts *opts, Error **err=
p)
> +{
> +    if (tcg_enabled()) {
> +        configure_icount(opts, errp);
> +    } else {
> +        error_setg(errp, "-icount is not allowed with hardware virtualiz=
ation");
> +    }
> +    return 0;
> +}
> +
> +static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error =
**errp)
> +{
> +    if (tcg_enabled()) {
> +        qemu_tcg_configure(opts, &error_fatal);
> +    }
> +    return 0;
> +}
> +
> +static void configure_accelerators(void)
> +{
> +    qemu_opts_foreach(qemu_find_opts("icount"),
> +                      do_configure_icount, NULL, &error_fatal);
> +
> +    qemu_opts_foreach(qemu_find_opts("accel"),
> +                      do_configure_accelerator, NULL, &error_fatal);

It used to call qemu_tcg_configure() when no -accel option given. In
this case, it still sets mttcg_enabled =3D default_mttcg_enabled(), but
now it misses that. Perhaps it could be set earlier.

> +}
> +
>  int main(int argc, char **argv, char **envp)
>  {
>      int i;
> @@ -4241,18 +4268,7 @@ int main(int argc, char **argv, char **envp)
>      qemu_spice_init();
>
>      cpu_ticks_init();
> -    if (icount_opts) {
> -        if (!tcg_enabled()) {
> -            error_report("-icount is not allowed with hardware virtualiz=
ation");
> -            exit(1);
> -        }
> -        configure_icount(icount_opts, &error_abort);
> -        qemu_opts_del(icount_opts);
> -    }
> -
> -    if (tcg_enabled()) {
> -        qemu_tcg_configure(accel_opts, &error_fatal);
> -    }
> +    configure_accelerators();
>
>      if (default_net) {
>          QemuOptsList *net =3D qemu_find_opts("net");
> --
> 1.8.3.1
>
>
>


--=20
Marc-Andr=C3=A9 Lureau

