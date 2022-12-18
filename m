Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE2864FDE1
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 07:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6moT-00068l-Gq; Sun, 18 Dec 2022 01:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p6moR-00068c-Pu
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 01:06:15 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p6moP-0007Bc-Iy
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 01:06:15 -0500
Received: by mail-lf1-x136.google.com with SMTP id y25so9355832lfa.9
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 22:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z102RUXVVPs0gw0OWahHqDGq275E7iQw75ujKG+XOrs=;
 b=pkdp9qqJQT3wlwy4ljqqGqbFE5tssXf1zhgpf9pRwteBgSh0kF8douPXVm3oAgEwPV
 21IDfnFf6fQjNDgzQdTV5SmkRHnx5KPLeKiPIylXQSka8XlkhQIAWuolMjve57pyRYyX
 uHBch/xTRIexMPd0h81zwGiEEMPjyHXszF6k6Rh6H4Vi9O+u6mSs4xnzfrKWHBP1sFdO
 UoT1DG26uMt6Ijj00uS1Wywzl1IsxILblRDYEnErjB6/YXdbWPly+s0ehsDj5wjK+0pa
 gHcRxOcnd+pIr5fmJ5h9u2PyBPcum4bGLhi8o97Q66hMG01ViirNRU1ejqFaeuaoFkDn
 zr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z102RUXVVPs0gw0OWahHqDGq275E7iQw75ujKG+XOrs=;
 b=OLXAvGSN7Nz1ym85wBVsGZdhnoUR7mDZh9Wgps263E1bcQuE79OeU9rsNhDBdr37v9
 gRoUT8SUHQ9awXvG+GnTEgey5nvKV18eq0MVYPYstnLpIIhLOEl4z65U3XFB0F2Hz292
 cswhYCBgDrHRXEAstmfRZzNKZ8jSYhaCJr7CcmD5IqRMPMF1yLfjzkXpDE+l2Ksj3RXr
 CHZIGk+UdrKy89DKDdx6ti3C1i/g/7dFOUd3gYobQnYWxZQXZa5LsYWsK6doPcFe9Q75
 OSwCCYQ3EG83Sm4e3YRl0vFTiDMdPQJsW+qsiEgJ9vQUDey3WPeU0Mys9Ef+/hj7X8DU
 JREw==
X-Gm-Message-State: ANoB5plVlDp9iPmW7P9gjT/ILHl8cp3Xt5ZYMhRptIZgNaMFjG+Ga67G
 PgR/gTRDVsM4ciYyypgygaVxun7KSLM+bKLW4pQ=
X-Google-Smtp-Source: AA0mqf7QUJAZzxBIRvJ27qYuwnXbMCq7RF21epKQG7aOsZy4APO831BRw3ZXck6wPyrfslqO9djfNH28JK2AxwLqKv0=
X-Received: by 2002:ac2:5324:0:b0:4b5:6d83:1a87 with SMTP id
 f4-20020ac25324000000b004b56d831a87mr10708827lfh.375.1671343570968; Sat, 17
 Dec 2022 22:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20221218000649.686882-4-pbonzini@redhat.com>
In-Reply-To: <20221218000649.686882-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 18 Dec 2022 10:05:59 +0400
Message-ID: <CAJ+F1CKbg_+kkePuAEkTX-br-p_ET0DTHRtukgmD8vBXf0Zb9Q@mail.gmail.com>
Subject: Re: [PATCH] util: remove support -chardev tty and -chardev parport
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Dec 18, 2022 at 4:08 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> These were deprecated in 6.0 and can now be removed.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/char.c                  | 33 ++-------------------------------
>  docs/about/deprecated.rst       |  6 ------
>  docs/about/removed-features.rst |  5 +++++
>  docs/qdev-device-use.txt        |  4 ++--
>  qemu-options.hx                 | 11 +----------
>  5 files changed, 10 insertions(+), 49 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 4c5de164025d..87ab6efbcca0 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -530,19 +530,6 @@ static const ChardevClass *char_get_class(const char=
 *driver, Error **errp)
>      return cc;
>  }
>
> -static struct ChardevAlias {
> -    const char *typename;
> -    const char *alias;
> -    bool deprecation_warning_printed;
> -} chardev_alias_table[] =3D {
> -#ifdef HAVE_CHARDEV_PARPORT
> -    { "parallel", "parport" },
> -#endif
> -#ifdef HAVE_CHARDEV_SERIAL
> -    { "serial", "tty" },
> -#endif
> -};
> -
>  typedef struct ChadevClassFE {
>      void (*fn)(const char *name, void *opaque);
>      void *opaque;
> @@ -578,28 +565,12 @@ help_string_append(const char *name, void *opaque)
>      g_string_append_printf(str, "\n  %s", name);
>  }
>
> -static const char *chardev_alias_translate(const char *name)
> -{
> -    int i;
> -    for (i =3D 0; i < (int)ARRAY_SIZE(chardev_alias_table); i++) {
> -        if (g_strcmp0(chardev_alias_table[i].alias, name) =3D=3D 0) {
> -            if (!chardev_alias_table[i].deprecation_warning_printed) {
> -                warn_report("The alias '%s' is deprecated, use '%s' inst=
ead",
> -                            name, chardev_alias_table[i].typename);
> -                chardev_alias_table[i].deprecation_warning_printed =3D t=
rue;
> -            }
> -            return chardev_alias_table[i].typename;
> -        }
> -    }
> -    return name;
> -}
> -
>  ChardevBackend *qemu_chr_parse_opts(QemuOpts *opts, Error **errp)
>  {
>      Error *local_err =3D NULL;
>      const ChardevClass *cc;
>      ChardevBackend *backend =3D NULL;
> -    const char *name =3D chardev_alias_translate(qemu_opt_get(opts, "bac=
kend"));
> +    const char *name =3D qemu_opt_get(opts, "backend");
>
>      if (name =3D=3D NULL) {
>          error_setg(errp, "chardev: \"%s\" missing backend",
> @@ -637,7 +608,7 @@ Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMain=
Context *context,
>      const ChardevClass *cc;
>      Chardev *chr =3D NULL;
>      ChardevBackend *backend =3D NULL;
> -    const char *name =3D chardev_alias_translate(qemu_opt_get(opts, "bac=
kend"));
> +    const char *name =3D qemu_opt_get(opts, "backend");
>      const char *id =3D qemu_opts_id(opts);
>      char *bid =3D NULL;
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index f3cb309cb8e1..e5d7d29f7f02 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -39,12 +39,6 @@ should specify an ``audiodev=3D`` property.  Additiona=
lly, when using
>  vnc, you should specify an ``audiodev=3D`` property if you plan to
>  transmit audio through the VNC protocol.
>
> -``-chardev`` backend aliases ``tty`` and ``parport`` (since 6.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -``tty`` and ``parport`` are aliases that will be removed. Instead, the
> -actual backend names ``serial`` and ``parallel`` should be used.
> -
>  Short-form boolean options (since 6.0)
>  ''''''''''''''''''''''''''''''''''''''
>
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-feature=
s.rst
> index 68ac80d37a40..f2a5785d3176 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -416,6 +416,11 @@ Input parameters that take a size value should only =
use a size suffix
>  the value is hexadecimal.  That is, '0x20M' should be written either as
>  '32M' or as '0x2000000'.
>
> +``-chardev`` backend aliases ``tty`` and ``parport`` (removed in 8.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +``tty`` and ``parport`` used to be aliases for ``serial`` and ``parallel=
``
> +respectively. The actual backend names should be used instead.
>
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
> index 240888933482..c98c86d82802 100644
> --- a/docs/qdev-device-use.txt
> +++ b/docs/qdev-device-use.txt
> @@ -216,11 +216,11 @@ LEGACY-CHARDEV translates to -chardev HOST-OPTS... =
as follows:
>
>  * unix:FNAME becomes -chardev socket,path=3DFNAME
>
> -* /dev/parportN becomes -chardev parport,file=3D/dev/parportN
> +* /dev/parportN becomes -chardev parallel,file=3D/dev/parportN
>
>  * /dev/ppiN likewise
>
> -* Any other /dev/FNAME becomes -chardev tty,path=3D/dev/FNAME
> +* Any other /dev/FNAME becomes -chardev serial,path=3D/dev/FNAME
>
>  * mon:LEGACY-CHARDEV is special: it multiplexes the monitor onto the
>    character device defined by LEGACY-CHARDEV.  -chardev provides more
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7f99d15b231f..f3d5e1313ca1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3379,11 +3379,9 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>  #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
>          || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__Drag=
onFly__)
>      "-chardev serial,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH]=
[,logappend=3Don|off]\n"
> -    "-chardev tty,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,l=
ogappend=3Don|off]\n"
>  #endif
>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
>      "-chardev parallel,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPAT=
H][,logappend=3Don|off]\n"
> -    "-chardev parport,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH=
][,logappend=3Don|off]\n"
>  #endif
>  #if defined(CONFIG_SPICE)
>      "-chardev spicevmc,id=3Did,name=3Dname[,debug=3Ddebug][,logfile=3DPA=
TH][,logappend=3Don|off]\n"
> @@ -3398,7 +3396,7 @@ The general form of a character device option is:
>  ``-chardev backend,id=3Did[,mux=3Don|off][,options]``
>      Backend is one of: ``null``, ``socket``, ``udp``, ``msmouse``,
>      ``vc``, ``ringbuf``, ``file``, ``pipe``, ``console``, ``serial``,
> -    ``pty``, ``stdio``, ``braille``, ``tty``, ``parallel``, ``parport``,
> +    ``pty``, ``stdio``, ``braille``, ``parallel``,
>      ``spicevmc``, ``spiceport``. The specific backend will determine the
>      applicable options.
>
> @@ -3622,15 +3620,8 @@ The available backends are:
>      Connect to a local BrlAPI server. ``braille`` does not take any
>      options.
>
> -``-chardev tty,id=3Did,path=3Dpath``
> -    ``tty`` is only available on Linux, Sun, FreeBSD, NetBSD, OpenBSD
> -    and DragonFlyBSD hosts. It is an alias for ``serial``.
> -
> -    ``path`` specifies the path to the tty. ``path`` is required.
> -
>  ``-chardev parallel,id=3Did,path=3Dpath``
>    \
> -``-chardev parport,id=3Did,path=3Dpath``
>      ``parallel`` is only available on Linux, FreeBSD and DragonFlyBSD
>      hosts.
>
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

