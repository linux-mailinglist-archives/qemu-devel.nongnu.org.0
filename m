Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93853C1737
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:42:28 +0200 (CEST)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1X6Z-00021j-O0
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1WUy-00051S-M2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:03:36 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1WUu-0005c0-3D
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:03:36 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bg14so10491911ejb.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7O6GkFO+drjFXaEQyjbNf2cHtY6N8qMbb7aagsR/+/g=;
 b=frKyxOxR17NdyXhGws6BXrwGM6v6PkE9jS9VIBwO66uyhgz0M0ucMEFUHxycTgxWF1
 Wv5Ws7yfjQwl4QaLlvcxyDrTlOtpH8q5KqQ6NPXzPhksC8SQxmJT+pae2MJcns4t3x/W
 VD+zKpmX++clbIjY5fkPEEbCInOD4SXNl4yE0CEFuP0/l9CEEPFfdB+nj1dUYVw4Ie0R
 yt6A3I7DP1NUQg6mBQAO4j4+XwxuH1yDqrXXWWAKk1B3oR+CELyIfovLV2R2spWSsifl
 UweuMpEKNHxOZHt6SpNsNTker+hTJmlSL14p6hupmHVmyMCvUW8zvHWC6PFTK1A1AA2C
 KrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7O6GkFO+drjFXaEQyjbNf2cHtY6N8qMbb7aagsR/+/g=;
 b=emHm3Jnwp7/vnT/ncsNDEpmRX6wbaYQMIqJyU/LM6iPQKobCw4SfSWC1+0//0akFrD
 66qHFVOXMNgx95bQDdcWMR/eNHuSw3qTOOe0c3inPGIRwVJ3ypPdTlJu8NU9WWJT/g+L
 hUVpi/eWntorVemor+Webcf+a2byg9YdObnv7xbqokrQsmCvpspqtZwhffM0JN5JIOPt
 YDcEpzlK5rmXt5DqRVzTWaWL3X+jyhP3VcJ7q14PU6ef7uhy9FWS2wxlaAAKclpfFTb5
 b6VMKE2vIfG0CubtIF/6ZYaghekCJD3GlJ+oT0DtYKLio+tYFXRI6VFlrJdw3/U+owAA
 0uxQ==
X-Gm-Message-State: AOAM5302SagmrqZ/6HnBx75AGOd6fPkhGsnwg32NHCQFNYgXMqUSOvYv
 wQbLKFvEHH9gloT+4uaJVwY5FZSrtu0iQmtIJdE=
X-Google-Smtp-Source: ABdhPJySZYkvf+3wDoOFjcsYkIIdYh0/FR2IfMDy3FWR0bqRdnTZG9S42uypUfjyplWKImm1l8oZIZwEnwRtxrzzOlU=
X-Received: by 2002:a17:906:f751:: with SMTP id
 jp17mr8686433ejb.105.1625760210390; 
 Thu, 08 Jul 2021 09:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-21-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-21-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 20:03:18 +0400
Message-ID: <CAJ+F1CKewOW60x281gNM_8mfsygGL5jK7GOJba0MPmHgR3nk1Q@mail.gmail.com>
Subject: Re: [PATCH V5 20/25] chardev: cpr framework
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000d4926805c69ecba7"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d4926805c69ecba7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:37 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
> Add the chardev close_on_cpr option for devices that can be closed on cpr
> and reopened after exec.
> cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr is se=
t
> for all chardevs in the configuration.
>

Why not do the right thing by default?

Could use some tests in tests/unit/test-char.c


> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  chardev/char.c         | 41 ++++++++++++++++++++++++++++++++++++++---
>  include/chardev/char.h |  5 +++++
>  migration/cpr.c        |  3 +++
>  qapi/char.json         |  5 ++++-
>  qemu-options.hx        | 26 ++++++++++++++++++++++----
>  5 files changed, 72 insertions(+), 8 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index d959eec..f10fb94 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -36,6 +36,7 @@
>  #include "qemu/help_option.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
> +#include "qemu/env.h"
>  #include "qemu/id.h"
>  #include "qemu/coroutine.h"
>  #include "qemu/yank.h"
> @@ -239,6 +240,9 @@ static void qemu_char_open(Chardev *chr,
> ChardevBackend *backend,
>      ChardevClass *cc =3D CHARDEV_GET_CLASS(chr);
>      /* Any ChardevCommon member would work */
>      ChardevCommon *common =3D backend ? backend->u.null.data : NULL;
> +    char fdname[40];
>

Please use g_autoptr char *fdname =3D NULL; & g_strdup_printf()

+
> +    chr->close_on_cpr =3D (common && common->close_on_cpr);
>
>      if (common && common->has_logfile) {
>          int flags =3D O_WRONLY | O_CREAT;
> @@ -248,7 +252,14 @@ static void qemu_char_open(Chardev *chr,
> ChardevBackend *backend,
>          } else {
>              flags |=3D O_TRUNC;
>          }
> -        chr->logfd =3D qemu_open_old(common->logfile, flags, 0666);
> +        snprintf(fdname, sizeof(fdname), "%s_log", chr->label);
> +        chr->logfd =3D getenv_fd(fdname);
> +        if (chr->logfd < 0) {
> +            chr->logfd =3D qemu_open_old(common->logfile, flags, 0666);
> +            if (!chr->close_on_cpr) {
> +                setenv_fd(fdname, chr->logfd);
> +            }
> +        }
>          if (chr->logfd < 0) {
>              error_setg_errno(errp, errno,
>                               "Unable to open logfile %s",
> @@ -300,11 +311,12 @@ static void char_finalize(Object *obj)
>      if (chr->be) {
>          chr->be->chr =3D NULL;
>      }
> -    g_free(chr->filename);
> -    g_free(chr->label);
>      if (chr->logfd !=3D -1) {
>          close(chr->logfd);
> +        unsetenv_fdv("%s_log", chr->label);
>      }
> +    g_free(chr->filename);
> +    g_free(chr->label);
>      qemu_mutex_destroy(&chr->chr_write_lock);
>  }
>
> @@ -504,6 +516,8 @@ void qemu_chr_parse_common(QemuOpts *opts,
> ChardevCommon *backend)
>
>      backend->has_logappend =3D true;
>      backend->logappend =3D qemu_opt_get_bool(opts, "logappend", false);
> +
> +    backend->close_on_cpr =3D qemu_opt_get_bool(opts, "close-on-cpr",
> false);
>

If set to true and the backend doesn't implement the CPR feature, it should
raise an error.

 }
>
>  static const ChardevClass *char_get_class(const char *driver, Error
> **errp)
> @@ -945,6 +959,9 @@ QemuOptsList qemu_chardev_opts =3D {
>          },{
>              .name =3D "abstract",
>              .type =3D QEMU_OPT_BOOL,
> +        },{
> +            .name =3D "close-on-cpr",
> +            .type =3D QEMU_OPT_BOOL,
>  #endif
>          },
>          { /* end of list */ }
> @@ -1212,6 +1229,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr,
> guint ms,
>      return source;
>  }
>
> +static int chr_cpr_capable(Object *obj, void *opaque)
> +{
> +    Chardev *chr =3D (Chardev *)obj;
> +    Error **errp =3D opaque;
> +
> +    if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) ||
> chr->close_on_cpr) {
>

That'd be easy to misuse. Chardev should always explicitly support CPR
feature (even if close_on_cpr is set)


> +        return 0;
> +    }
> +    error_setg(errp, "error: chardev %s -> %s is not capable of cpr",
> +               chr->label, chr->filename);
> +    return 1;
> +}
> +
> +bool qemu_chr_cpr_capable(Error **errp)
> +{
> +    return !object_child_foreach(get_chardevs_root(), chr_cpr_capable,
> errp);
> +}
> +
>  void qemu_chr_cleanup(void)
>  {
>      object_unparent(get_chardevs_root());
> diff --git a/include/chardev/char.h b/include/chardev/char.h
> index 7c0444f..e488ad1 100644
> --- a/include/chardev/char.h
> +++ b/include/chardev/char.h
> @@ -50,6 +50,8 @@ typedef enum {
>      /* Whether the gcontext can be changed after calling
>       * qemu_chr_be_update_read_handlers() */
>      QEMU_CHAR_FEATURE_GCONTEXT,
> +    /* Whether the device supports cpr */
> +    QEMU_CHAR_FEATURE_CPR,
>
>      QEMU_CHAR_FEATURE_LAST,
>  } ChardevFeature;
> @@ -67,6 +69,7 @@ struct Chardev {
>      int be_open;
>      /* used to coordinate the chardev-change special-case: */
>      bool handover_yank_instance;
> +    bool close_on_cpr;
>      GSource *gsource;
>      GMainContext *gcontext;
>      DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
> @@ -291,4 +294,6 @@ void resume_mux_open(void);
>  /* console.c */
>  void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error
> **errp);
>
> +bool qemu_chr_cpr_capable(Error **errp);
> +
>  #endif
> diff --git a/migration/cpr.c b/migration/cpr.c
> index 6333988..feff97f 100644
> --- a/migration/cpr.c
> +++ b/migration/cpr.c
> @@ -138,6 +138,9 @@ void cprexec(strList *args, Error **errp)
>          error_setg(errp, "cprexec requires cprsave with restart mode");
>          return;
>      }
> +    if (!qemu_chr_cpr_capable(errp)) {
> +        return;
> +    }
>      if (vfio_cprsave(errp)) {
>          return;
>      }
> diff --git a/qapi/char.json b/qapi/char.json
> index adf2685..5efaf59 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -204,12 +204,15 @@
>  # @logfile: The name of a logfile to save output
>  # @logappend: true to append instead of truncate
>  #             (default to false to truncate)
> +# @close-on-cpr: if true, close device's fd on cprsave. defaults to fals=
e.
> +#                since 6.1.
>  #
>  # Since: 2.6
>  ##
>  { 'struct': 'ChardevCommon',
>    'data': { '*logfile': 'str',
> -            '*logappend': 'bool' } }
> +            '*logappend': 'bool',
> +            '*close-on-cpr': 'bool' } }
>
>  ##
>  # @ChardevFile:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fa53734..d5ff45f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3134,43 +3134,57 @@ DEFHEADING(Character device options:)
>
>  DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>      "-chardev help\n"
> -    "-chardev null,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3D=
on|off]\n"
> +    "-chardev
> null,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,close-=
on-cpr=3Don|off]\n"
>      "-chardev
> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4=3Don|off][,ipv6=
=3Don|off][,nodelay=3Don|off][,reconnect=3Dseconds]\n"
>      "
>  [,server=3Don|off][,wait=3Don|off][,telnet=3Don|off][,websocket=3Don|off=
][,reconnect=3Dseconds][,mux=3Don|off]\n"
> -    "
>  [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID]=
 (tcp)\n"
> +    "
>  [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID]=
[,close-on-cpr=3Don|off]
> (tcp)\n"
>      "-chardev
> socket,id=3Did,path=3Dpath[,server=3Don|off][,wait=3Don|off][,telnet=3Don=
|off][,websocket=3Don|off][,reconnect=3Dseconds]\n"
> -    "
>  [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|off=
][,tight=3Don|off]
> (unix)\n"
> +    "
>  [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|off=
][,tight=3Don|off][,close-on-cpr=3Don|off]
> (unix)\n"
>      "-chardev udp,id=3Did[,host=3Dhost],port=3Dport[,localaddr=3Dlocalad=
dr]\n"
>      "
>  [,localport=3Dlocalport][,ipv4=3Don|off][,ipv6=3Don|off][,mux=3Don|off]\=
n"
> -    "         [,logfile=3DPATH][,logappend=3Don|off]\n"
> +    "         [,logfile=3DPATH][,logappend=3Don|off][,close-on-cpr=3Don|=
off]\n"
>      "-chardev
> msmouse,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>      "-chardev
> vc,id=3Did[[,width=3Dwidth][,height=3Dheight]][[,cols=3Dcols][,rows=3Drow=
s]]\n"
>      "         [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>      "-chardev
> ringbuf,id=3Did[,size=3Dsize][,logfile=3DPATH][,logappend=3Don|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>      "-chardev
> file,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|=
off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>      "-chardev
> pipe,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|=
off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>  #ifdef _WIN32
>      "-chardev
> console,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
>      "-chardev
> serial,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Do=
n|off]\n"
>  #else
>      "-chardev pty,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Do=
n|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>      "-chardev
> stdio,id=3Did[,mux=3Don|off][,signal=3Don|off][,logfile=3DPATH][,logappen=
d=3Don|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>  #endif
>  #ifdef CONFIG_BRLAPI
>      "-chardev
> braille,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>  #endif
>  #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
>          || defined(__NetBSD__) || defined(__OpenBSD__) ||
> defined(__DragonFly__)
>      "-chardev
> serial,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Do=
n|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>      "-chardev
> tty,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|o=
ff]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>  #endif
>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
>      "-chardev
> parallel,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=
=3Don|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>      "-chardev
> parport,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3D=
on|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>  #endif
>  #if defined(CONFIG_SPICE)
>      "-chardev
> spicevmc,id=3Did,name=3Dname[,debug=3Ddebug][,logfile=3DPATH][,logappend=
=3Don|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>      "-chardev
> spiceport,id=3Did,name=3Dname[,debug=3Ddebug][,logfile=3DPATH][,logappend=
=3Don|off]\n"
> +    "         [,close-on-cpr=3Don|off]\n"
>  #endif
>      , QEMU_ARCH_ALL
>  )
> @@ -3245,6 +3259,10 @@ The general form of a character device option is:
>      ``logappend`` option controls whether the log file will be truncated
>      or appended to when opened.
>
> +    Every backend supports the ``close-on-cpr`` option.  If on, the
> +    devices's descriptor is closed during cprsave, and reopened after
> exec.
> +    This is useful for devices that do not support cpr.
> +
>  The available backends are:
>
>  ``-chardev null,id=3Did``
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d4926805c69ecba7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:37 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.<br>
Add the chardev close_on_cpr option for devices that can be closed on cpr<b=
r>
and reopened after exec.<br>
cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr is set<=
br>
for all chardevs in the configuration.<br></blockquote><div><br></div><div>=
Why not do the right thing by default?</div><div><br></div><div>Could use s=
ome tests in tests/unit/test-char.c<br></div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 ++++++++++++++++=
++++++++++++++++++++++---<br>
=C2=A0include/chardev/char.h |=C2=A0 5 +++++<br>
=C2=A0migration/cpr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
=C2=A0qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++++-<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 26 +++++++++++++++++++++=
+----<br>
=C2=A05 files changed, 72 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index d959eec..f10fb94 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -36,6 +36,7 @@<br>
=C2=A0#include &quot;qemu/help_option.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
+#include &quot;qemu/env.h&quot;<br>
=C2=A0#include &quot;qemu/id.h&quot;<br>
=C2=A0#include &quot;qemu/coroutine.h&quot;<br>
=C2=A0#include &quot;qemu/yank.h&quot;<br>
@@ -239,6 +240,9 @@ static void qemu_char_open(Chardev *chr, ChardevBackend=
 *backend,<br>
=C2=A0 =C2=A0 =C2=A0ChardevClass *cc =3D CHARDEV_GET_CLASS(chr);<br>
=C2=A0 =C2=A0 =C2=A0/* Any ChardevCommon member would work */<br>
=C2=A0 =C2=A0 =C2=A0ChardevCommon *common =3D backend ? backend-&gt;u.null.=
data : NULL;<br>
+=C2=A0 =C2=A0 char fdname[40];<br></blockquote><div><br></div><div>Please =
use g_autoptr char *fdname =3D NULL; &amp; g_strdup_printf()</div><div> <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 chr-&gt;close_on_cpr =3D (common &amp;&amp; common-&gt;close=
_on_cpr);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (common &amp;&amp; common-&gt;has_logfile) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int flags =3D O_WRONLY | O_CREAT;<br>
@@ -248,7 +252,14 @@ static void qemu_char_open(Chardev *chr, ChardevBacken=
d *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D O_TRUNC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;logfd =3D qemu_open_old(common-&gt;log=
file, flags, 0666);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(fdname, sizeof(fdname), &quot;%s_log&=
quot;, chr-&gt;label);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;logfd =3D getenv_fd(fdname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chr-&gt;logfd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;logfd =3D qemu_open_old(=
common-&gt;logfile, flags, 0666);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!chr-&gt;close_on_cpr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setenv_fd(fdname, =
chr-&gt;logfd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (chr-&gt;logfd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errn=
o,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unable to open logfile %s&quot;,<br>
@@ -300,11 +311,12 @@ static void char_finalize(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0if (chr-&gt;be) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chr-&gt;be-&gt;chr =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 g_free(chr-&gt;filename);<br>
-=C2=A0 =C2=A0 g_free(chr-&gt;label);<br>
=C2=A0 =C2=A0 =C2=A0if (chr-&gt;logfd !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(chr-&gt;logfd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsetenv_fdv(&quot;%s_log&quot;, chr-&gt;label=
);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 g_free(chr-&gt;filename);<br>
+=C2=A0 =C2=A0 g_free(chr-&gt;label);<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_destroy(&amp;chr-&gt;chr_write_lock);<br>
=C2=A0}<br>
<br>
@@ -504,6 +516,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommo=
n *backend)<br>
<br>
=C2=A0 =C2=A0 =C2=A0backend-&gt;has_logappend =3D true;<br>
=C2=A0 =C2=A0 =C2=A0backend-&gt;logappend =3D qemu_opt_get_bool(opts, &quot=
;logappend&quot;, false);<br>
+<br>
+=C2=A0 =C2=A0 backend-&gt;close_on_cpr =3D qemu_opt_get_bool(opts, &quot;c=
lose-on-cpr&quot;, false);<br></blockquote><div><br></div><div>If set to tr=
ue and the backend doesn&#39;t implement the CPR feature, it should raise a=
n error.</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
=C2=A0}<br>
<br>
=C2=A0static const ChardevClass *char_get_class(const char *driver, Error *=
*errp)<br>
@@ -945,6 +959,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;abstract&qu=
ot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;close-on-cpr&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D QEMU_OPT_BOOL,<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* end of list */ }<br>
@@ -1212,6 +1229,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint=
 ms,<br>
=C2=A0 =C2=A0 =C2=A0return source;<br>
=C2=A0}<br>
<br>
+static int chr_cpr_capable(Object *obj, void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 Chardev *chr =3D (Chardev *)obj;<br>
+=C2=A0 =C2=A0 Error **errp =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) || chr-=
&gt;close_on_cpr) {<br></blockquote><div><br></div><div>That&#39;d be easy =
to misuse. Chardev should always explicitly support CPR feature (even if cl=
ose_on_cpr is set)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 error_setg(errp, &quot;error: chardev %s -&gt; %s is not cap=
able of cpr&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chr-&gt;label, chr-=
&gt;filename);<br>
+=C2=A0 =C2=A0 return 1;<br>
+}<br>
+<br>
+bool qemu_chr_cpr_capable(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 return !object_child_foreach(get_chardevs_root(), chr_cpr_ca=
pable, errp);<br>
+}<br>
+<br>
=C2=A0void qemu_chr_cleanup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0object_unparent(get_chardevs_root());<br>
diff --git a/include/chardev/char.h b/include/chardev/char.h<br>
index 7c0444f..e488ad1 100644<br>
--- a/include/chardev/char.h<br>
+++ b/include/chardev/char.h<br>
@@ -50,6 +50,8 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0/* Whether the gcontext can be changed after calling<br=
>
=C2=A0 =C2=A0 =C2=A0 * qemu_chr_be_update_read_handlers() */<br>
=C2=A0 =C2=A0 =C2=A0QEMU_CHAR_FEATURE_GCONTEXT,<br>
+=C2=A0 =C2=A0 /* Whether the device supports cpr */<br>
+=C2=A0 =C2=A0 QEMU_CHAR_FEATURE_CPR,<br>
<br>
=C2=A0 =C2=A0 =C2=A0QEMU_CHAR_FEATURE_LAST,<br>
=C2=A0} ChardevFeature;<br>
@@ -67,6 +69,7 @@ struct Chardev {<br>
=C2=A0 =C2=A0 =C2=A0int be_open;<br>
=C2=A0 =C2=A0 =C2=A0/* used to coordinate the chardev-change special-case: =
*/<br>
=C2=A0 =C2=A0 =C2=A0bool handover_yank_instance;<br>
+=C2=A0 =C2=A0 bool close_on_cpr;<br>
=C2=A0 =C2=A0 =C2=A0GSource *gsource;<br>
=C2=A0 =C2=A0 =C2=A0GMainContext *gcontext;<br>
=C2=A0 =C2=A0 =C2=A0DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);<br>
@@ -291,4 +294,6 @@ void resume_mux_open(void);<br>
=C2=A0/* console.c */<br>
=C2=A0void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error=
 **errp);<br>
<br>
+bool qemu_chr_cpr_capable(Error **errp);<br>
+<br>
=C2=A0#endif<br>
diff --git a/migration/cpr.c b/migration/cpr.c<br>
index 6333988..feff97f 100644<br>
--- a/migration/cpr.c<br>
+++ b/migration/cpr.c<br>
@@ -138,6 +138,9 @@ void cprexec(strList *args, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;cprexec requires c=
prsave with restart mode&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (!qemu_chr_cpr_capable(errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0if (vfio_cprsave(errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/qapi/char.json b/qapi/char.json<br>
index adf2685..5efaf59 100644<br>
--- a/qapi/char.json<br>
+++ b/qapi/char.json<br>
@@ -204,12 +204,15 @@<br>
=C2=A0# @logfile: The name of a logfile to save output<br>
=C2=A0# @logappend: true to append instead of truncate<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(default to false to=
 truncate)<br>
+# @close-on-cpr: if true, close device&#39;s fd on cprsave. defaults to fa=
lse.<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 since 6.1.<br>
=C2=A0#<br>
=C2=A0# Since: 2.6<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;ChardevCommon&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*logfile&#39;: &#39;str&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*logappend&#39;: &#39;bool&=
#39; } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*logappend&#39;: &#39;bool&=
#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*close-on-cpr&#39;: &#39;bo=
ol&#39; } }<br>
<br>
=C2=A0##<br>
=C2=A0# @ChardevFile:<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index fa53734..d5ff45f 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -3134,43 +3134,57 @@ DEFHEADING(Character device options:)<br>
<br>
=C2=A0DEF(&quot;chardev&quot;, HAS_ARG, QEMU_OPTION_chardev,<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev help\n&quot;<br>
-=C2=A0 =C2=A0 &quot;-chardev null,id=3Did[,mux=3Don|off][,logfile=3DPATH][=
,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;-chardev null,id=3Did[,mux=3Don|off][,logfile=3DPATH][=
,logappend=3Don|off][,close-on-cpr=3Don|off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev socket,id=3Did[,host=3Dhost],port=3Dport=
[,to=3Dto][,ipv4=3Don|off][,ipv6=3Don|off][,nodelay=3Don|off][,reconnect=3D=
seconds]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,server=3Don|o=
ff][,wait=3Don|off][,telnet=3Don|off][,websocket=3Don|off][,reconnect=3Dsec=
onds][,mux=3Don|off]\n&quot;<br>
-=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,logfile=3DPATH][,l=
ogappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID] (tcp)\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,logfile=3DPATH][,l=
ogappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID][,close-on-cpr=3Don|off=
] (tcp)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev socket,id=3Did,path=3Dpath[,server=3Don|=
off][,wait=3Don|off][,telnet=3Don|off][,websocket=3Don|off][,reconnect=3Dse=
conds]\n&quot;<br>
-=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,mux=3Don|off][,log=
file=3DPATH][,logappend=3Don|off][,abstract=3Don|off][,tight=3Don|off] (uni=
x)\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,mux=3Don|off][,log=
file=3DPATH][,logappend=3Don|off][,abstract=3Don|off][,tight=3Don|off][,clo=
se-on-cpr=3Don|off] (unix)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev udp,id=3Did[,host=3Dhost],port=3Dport[,l=
ocaladdr=3Dlocaladdr]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,localport=3Dl=
ocalport][,ipv4=3Don|off][,ipv6=3Don|off][,mux=3Don|off]\n&quot;<br>
-=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,logfile=3DPATH][,l=
ogappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,logfile=3DPATH][,l=
ogappend=3Don|off][,close-on-cpr=3Don|off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev msmouse,id=3Did[,mux=3Don|off][,logfile=
=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev vc,id=3Did[[,width=3Dwidth][,height=3Dhe=
ight]][[,cols=3Dcols][,rows=3Drows]]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,mux=3Don|off]=
[,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev ringbuf,id=3Did[,size=3Dsize][,logfile=
=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev file,id=3Did,path=3Dpath[,mux=3Don|off][=
,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev pipe,id=3Did,path=3Dpath[,mux=3Don|off][=
,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0#ifdef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev console,id=3Did[,mux=3Don|off][,logfile=
=3DPATH][,logappend=3Don|off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev serial,id=3Did,path=3Dpath[,mux=3Don|off=
][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev pty,id=3Did[,mux=3Don|off][,logfile=3DPA=
TH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev stdio,id=3Did[,mux=3Don|off][,signal=3Do=
n|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0#endif<br>
=C2=A0#ifdef CONFIG_BRLAPI<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev braille,id=3Did[,mux=3Don|off][,logfile=
=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0#endif<br>
=C2=A0#if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| defined(__NetBSD__) || defined(__OpenB=
SD__) || defined(__DragonFly__)<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev serial,id=3Did,path=3Dpath[,mux=3Don|off=
][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev tty,id=3Did,path=3Dpath[,mux=3Don|off][,=
logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0#endif<br>
=C2=A0#if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly=
__)<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev parallel,id=3Did,path=3Dpath[,mux=3Don|o=
ff][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev parport,id=3Did,path=3Dpath[,mux=3Don|of=
f][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0#endif<br>
=C2=A0#if defined(CONFIG_SPICE)<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev spicevmc,id=3Did,name=3Dname[,debug=3Dde=
bug][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev spiceport,id=3Did,name=3Dname[,debug=3Dd=
ebug][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,close-on-cpr=3Don|=
off]\n&quot;<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0, QEMU_ARCH_ALL<br>
=C2=A0)<br>
@@ -3245,6 +3259,10 @@ The general form of a character device option is:<br=
>
=C2=A0 =C2=A0 =C2=A0``logappend`` option controls whether the log file will=
 be truncated<br>
=C2=A0 =C2=A0 =C2=A0or appended to when opened.<br>
<br>
+=C2=A0 =C2=A0 Every backend supports the ``close-on-cpr`` option.=C2=A0 If=
 on, the<br>
+=C2=A0 =C2=A0 devices&#39;s descriptor is closed during cprsave, and reope=
ned after exec.<br>
+=C2=A0 =C2=A0 This is useful for devices that do not support cpr.<br>
+<br>
=C2=A0The available backends are:<br>
<br>
=C2=A0``-chardev null,id=3Did``<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d4926805c69ecba7--

