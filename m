Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6B53C642A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:51:40 +0200 (CEST)
Received: from localhost ([::1]:59916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31xr-0004Vq-Jj
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m31ve-0001Wo-4x
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:49:22 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m31va-00067l-M8
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:49:21 -0400
Received: by mail-ej1-x635.google.com with SMTP id hr1so36879637ejc.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJFgGpstBsAmOZOQeI52yG8QKLcYivydmMP1kSoUPn4=;
 b=hHouIMfphUPVPNhYkzSO4qVb2F54AxNxoqExOkCVgDkm0PplylPYpZ7MQCAAYcnxUL
 BGPoS072WRnwDZM6umE8Z4IggnQslw7FZcSJSLOJiXN6Ty/y71L/hsb+9WyXNmr87riP
 eDAoGAs0JN3k8FXMcVnxcb8I0/yPU327xcZu44jHfWq1zVjnBye+QbpNi8u3vERNT8d6
 ZW5y2tQIVRsQKRqEBQclY3idDQ6Q4HAncz4z8BfFYByKmxaqUK0jWAcGRyZ/V1goCjh3
 pJ9a6xKFFIcocVT5dqy7fph36RuobxGmStKz3k9IUHIMyWXXpbvgcQHbdZjQj3wXElhp
 c6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJFgGpstBsAmOZOQeI52yG8QKLcYivydmMP1kSoUPn4=;
 b=Qa8M+UXjJ/h2Rjw/tipYSE0qsRDXj4Q6x+QdO8AG/q4kRe7Ix/7Od1PzN1eYh22KUj
 xgnjVt5UU6Qha9LWMHnLRJiK1z1kU+JEyyeoIscOy9qY2R9Pr5IS+z/T/X0DM2KoLVZ5
 W+th6axs/EBI4DjKPRbUDNraNSi2gIrOLACeNvkdqnJ7+Lm6aNBWa44bkklr7zhD9Kdq
 PesUsbIBCmdFbx7yzWLg79qaW2Xa+t9fYj+vkMBnc1bwPscUZDtk5lo83khIyJ8Dy8kK
 Af7kGZ06Fnm0O+T0j2sgCeMEAyhgDXp0M4g/cDRtrtfV26qXdBxrBZiFMQBcvZbWcISQ
 nZ+Q==
X-Gm-Message-State: AOAM530AiPI64BNNMWYZ2WV+6QyTAfqNy1BiICWlKXJR7DeXPVGh5dd/
 aaObaMRB83djOFKdDydkEMOkB1b1cSbpf15UW3A=
X-Google-Smtp-Source: ABdhPJzY2CZzb0f6V1oLdktXC24H93kSOrdFaYvFWZcjXP4NOqDYPYF6FYe37PYwipMxIq5LNONnK5XBrOMjYa+A9fs=
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr825848ejy.532.1626119356718; 
 Mon, 12 Jul 2021 12:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-21-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CKewOW60x281gNM_8mfsygGL5jK7GOJba0MPmHgR3nk1Q@mail.gmail.com>
 <7e07ac54-e6dd-4554-1e2b-c51b12239fd2@oracle.com>
In-Reply-To: <7e07ac54-e6dd-4554-1e2b-c51b12239fd2@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Jul 2021 23:49:03 +0400
Message-ID: <CAJ+F1CJbsMEV+nxSFbkg8pH9D76hyA6oHPr=c+g2gQn=K+zs4Q@mail.gmail.com>
Subject: Re: [PATCH V5 20/25] chardev: cpr framework
To: Steven Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000009ea47205c6f26a09"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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

--0000000000009ea47205c6f26a09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jul 12, 2021 at 11:20 PM Steven Sistare <steven.sistare@oracle.com>
wrote:

> On 7/8/2021 12:03 PM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Jul 7, 2021 at 9:37 PM Steve Sistare <steven.sistare@oracle.com
> <mailto:steven.sistare@oracle.com>> wrote:
> >
> >     Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
> >     Add the chardev close_on_cpr option for devices that can be closed
> on cpr
> >     and reopened after exec.
> >     cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr
> is set
> >     for all chardevs in the configuration.
> >
> >
> > Why not do the right thing by default?
>
> Char devices with buffering in the qemu process do not support cpr, as
> there is no general mechanism
> for saving and restoring the buffer and synchronizing that with device
> operation.  In theory vmstate
> could provide that mechanism, but sync'ing the device with vmstate
> operations would be non-trivial,
> as every device handles it differently, and I did not tackle it.  However=
,
> some very  useful devices
> do not buffer, and do support cpr, so I introduce QEMU_CHAR_FEATURE_CPR t=
o
> identify them.  CPR support
> can be incrementally added to more devices in the future via this
> mechanism.
>
> > Could use some tests in tests/unit/test-char.c
>
> OK, I'll check it out.  I have deferred adding unit tests until I get mor=
e
> buy in on the patch series.
>

I understand :) Tbh, I have no clue if you are close to acceptance. (too
late for 6.1 anyway, you can already update the docs)


> >     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:
> steven.sistare@oracle.com>>
> >     ---
> >      chardev/char.c         | 41
> ++++++++++++++++++++++++++++++++++++++---
> >      include/chardev/char.h |  5 +++++
> >      migration/cpr.c        |  3 +++
> >      qapi/char.json         |  5 ++++-
> >      qemu-options.hx        | 26 ++++++++++++++++++++++----
> >      5 files changed, 72 insertions(+), 8 deletions(-)
> >
> >     diff --git a/chardev/char.c b/chardev/char.c
> >     index d959eec..f10fb94 100644
> >     --- a/chardev/char.c
> >     +++ b/chardev/char.c
> >     @@ -36,6 +36,7 @@
> >      #include "qemu/help_option.h"
> >      #include "qemu/module.h"
> >      #include "qemu/option.h"
> >     +#include "qemu/env.h"
> >      #include "qemu/id.h"
> >      #include "qemu/coroutine.h"
> >      #include "qemu/yank.h"
> >     @@ -239,6 +240,9 @@ static void qemu_char_open(Chardev *chr,
> ChardevBackend *backend,
> >          ChardevClass *cc =3D CHARDEV_GET_CLASS(chr);
> >          /* Any ChardevCommon member would work */
> >          ChardevCommon *common =3D backend ? backend->u.null.data : NUL=
L;
> >     +    char fdname[40];
> >
> >
> > Please use g_autoptr char *fdname =3D NULL; & g_strdup_printf()
>
> Will do.
> (the glibc functions are new to me, and my fingers do not automatically
> type them).
>
> >     +
> >     +    chr->close_on_cpr =3D (common && common->close_on_cpr);
> >
> >          if (common && common->has_logfile) {
> >              int flags =3D O_WRONLY | O_CREAT;
> >     @@ -248,7 +252,14 @@ static void qemu_char_open(Chardev *chr,
> ChardevBackend *backend,
> >              } else {
> >                  flags |=3D O_TRUNC;
> >              }
> >     -        chr->logfd =3D qemu_open_old(common->logfile, flags, 0666)=
;
> >     +        snprintf(fdname, sizeof(fdname), "%s_log", chr->label);
> >     +        chr->logfd =3D getenv_fd(fdname);
> >     +        if (chr->logfd < 0) {
> >     +            chr->logfd =3D qemu_open_old(common->logfile, flags,
> 0666);
> >     +            if (!chr->close_on_cpr) {
> >     +                setenv_fd(fdname, chr->logfd);
> >     +            }
> >     +        }
> >              if (chr->logfd < 0) {
> >                  error_setg_errno(errp, errno,
> >                                   "Unable to open logfile %s",
> >     @@ -300,11 +311,12 @@ static void char_finalize(Object *obj)
> >          if (chr->be) {
> >              chr->be->chr =3D NULL;
> >          }
> >     -    g_free(chr->filename);
> >     -    g_free(chr->label);
> >          if (chr->logfd !=3D -1) {
> >              close(chr->logfd);
> >     +        unsetenv_fdv("%s_log", chr->label);
> >          }
> >     +    g_free(chr->filename);
> >     +    g_free(chr->label);
> >          qemu_mutex_destroy(&chr->chr_write_lock);
> >      }
> >
> >     @@ -504,6 +516,8 @@ void qemu_chr_parse_common(QemuOpts *opts,
> ChardevCommon *backend)
> >
> >          backend->has_logappend =3D true;
> >          backend->logappend =3D qemu_opt_get_bool(opts, "logappend",
> false);
> >     +
> >     +    backend->close_on_cpr =3D qemu_opt_get_bool(opts, "close-on-cp=
r",
> false);
> >
> >
> > If set to true and the backend doesn't implement the CPR feature, it
> should raise an error.
>
> Setting to true is the workaround for missing CPR support, so that cpr ma=
y
> still be performed.
> The device will be reopened post exec.  That is not as nice as
> transparently preserving the device,
> but is nicer than disallowing cpr because some device(s) of many do not
> support it.
>

ok, "reopen-on-cpr" would be more descriptive then.


> >      }
> >
> >      static const ChardevClass *char_get_class(const char *driver, Erro=
r
> **errp)
> >     @@ -945,6 +959,9 @@ QemuOptsList qemu_chardev_opts =3D {
> >              },{
> >                  .name =3D "abstract",
> >                  .type =3D QEMU_OPT_BOOL,
> >     +        },{
> >     +            .name =3D "close-on-cpr",
> >     +            .type =3D QEMU_OPT_BOOL,
> >      #endif
> >              },
> >              { /* end of list */ }
> >     @@ -1212,6 +1229,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev
> *chr, guint ms,
> >          return source;
> >      }
> >
> >     +static int chr_cpr_capable(Object *obj, void *opaque)
> >     +{
> >     +    Chardev *chr =3D (Chardev *)obj;
> >     +    Error **errp =3D opaque;
> >     +
> >     +    if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) ||
> chr->close_on_cpr) {
> >
> >
> > That'd be easy to misuse. Chardev should always explicitly support CPR
> feature (even if close_on_cpr is set)
>
> Given my explanation at top, does this make sense now?
>

I think I understand the purpose, but it feels quite adventurous to rely on
this behaviour by default, even if the feature flag is set. Could it
require both FEATURE_CPR && reopen-on-cpr?


> - Steve
>
>
> >     +        return 0;
> >     +    }
> >     +    error_setg(errp, "error: chardev %s -> %s is not capable of
> cpr",
> >     +               chr->label, chr->filename);
> >     +    return 1;
> >     +}
> >     +
> >     +bool qemu_chr_cpr_capable(Error **errp)
> >     +{
> >     +    return !object_child_foreach(get_chardevs_root(),
> chr_cpr_capable, errp);
> >     +}
> >     +
> >      void qemu_chr_cleanup(void)
> >      {
> >          object_unparent(get_chardevs_root());
> >     diff --git a/include/chardev/char.h b/include/chardev/char.h
> >     index 7c0444f..e488ad1 100644
> >     --- a/include/chardev/char.h
> >     +++ b/include/chardev/char.h
> >     @@ -50,6 +50,8 @@ typedef enum {
> >          /* Whether the gcontext can be changed after calling
> >           * qemu_chr_be_update_read_handlers() */
> >          QEMU_CHAR_FEATURE_GCONTEXT,
> >     +    /* Whether the device supports cpr */
> >     +    QEMU_CHAR_FEATURE_CPR,
> >
> >          QEMU_CHAR_FEATURE_LAST,
> >      } ChardevFeature;
> >     @@ -67,6 +69,7 @@ struct Chardev {
> >          int be_open;
> >          /* used to coordinate the chardev-change special-case: */
> >          bool handover_yank_instance;
> >     +    bool close_on_cpr;
> >          GSource *gsource;
> >          GMainContext *gcontext;
> >          DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
> >     @@ -291,4 +294,6 @@ void resume_mux_open(void);
> >      /* console.c */
> >      void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend,
> Error **errp);
> >
> >     +bool qemu_chr_cpr_capable(Error **errp);
> >     +
> >      #endif
> >     diff --git a/migration/cpr.c b/migration/cpr.c
> >     index 6333988..feff97f 100644
> >     --- a/migration/cpr.c
> >     +++ b/migration/cpr.c
> >     @@ -138,6 +138,9 @@ void cprexec(strList *args, Error **errp)
> >              error_setg(errp, "cprexec requires cprsave with restart
> mode");
> >              return;
> >          }
> >     +    if (!qemu_chr_cpr_capable(errp)) {
> >     +        return;
> >     +    }
> >          if (vfio_cprsave(errp)) {
> >              return;
> >          }
> >     diff --git a/qapi/char.json b/qapi/char.json
> >     index adf2685..5efaf59 100644
> >     --- a/qapi/char.json
> >     +++ b/qapi/char.json
> >     @@ -204,12 +204,15 @@
> >      # @logfile: The name of a logfile to save output
> >      # @logappend: true to append instead of truncate
> >      #             (default to false to truncate)
> >     +# @close-on-cpr: if true, close device's fd on cprsave. defaults t=
o
> false.
> >     +#                since 6.1.
> >      #
> >      # Since: 2.6
> >      ##
> >      { 'struct': 'ChardevCommon',
> >        'data': { '*logfile': 'str',
> >     -            '*logappend': 'bool' } }
> >     +            '*logappend': 'bool',
> >     +            '*close-on-cpr': 'bool' } }
> >
> >      ##
> >      # @ChardevFile:
> >     diff --git a/qemu-options.hx b/qemu-options.hx
> >     index fa53734..d5ff45f 100644
> >     --- a/qemu-options.hx
> >     +++ b/qemu-options.hx
> >     @@ -3134,43 +3134,57 @@ DEFHEADING(Character device options:)
> >
> >      DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
> >          "-chardev help\n"
> >     -    "-chardev
> null,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> >     +    "-chardev
> null,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,close-=
on-cpr=3Don|off]\n"
> >          "-chardev
> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4=3Don|off][,ipv6=
=3Don|off][,nodelay=3Don|off][,reconnect=3Dseconds]\n"
> >          "
>  [,server=3Don|off][,wait=3Don|off][,telnet=3Don|off][,websocket=3Don|off=
][,reconnect=3Dseconds][,mux=3Don|off]\n"
> >     -    "
>  [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID]=
 (tcp)\n"
> >     +    "
>  [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID]=
[,close-on-cpr=3Don|off]
> (tcp)\n"
> >          "-chardev
> socket,id=3Did,path=3Dpath[,server=3Don|off][,wait=3Don|off][,telnet=3Don=
|off][,websocket=3Don|off][,reconnect=3Dseconds]\n"
> >     -    "
>  [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|off=
][,tight=3Don|off]
> (unix)\n"
> >     +    "
>  [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|off=
][,tight=3Don|off][,close-on-cpr=3Don|off]
> (unix)\n"
> >          "-chardev
> udp,id=3Did[,host=3Dhost],port=3Dport[,localaddr=3Dlocaladdr]\n"
> >          "
>  [,localport=3Dlocalport][,ipv4=3Don|off][,ipv6=3Don|off][,mux=3Don|off]\=
n"
> >     -    "         [,logfile=3DPATH][,logappend=3Don|off]\n"
> >     +    "
>  [,logfile=3DPATH][,logappend=3Don|off][,close-on-cpr=3Don|off]\n"
> >          "-chardev
> msmouse,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >          "-chardev
> vc,id=3Did[[,width=3Dwidth][,height=3Dheight]][[,cols=3Dcols][,rows=3Drow=
s]]\n"
> >          "         [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off=
]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >          "-chardev
> ringbuf,id=3Did[,size=3Dsize][,logfile=3DPATH][,logappend=3Don|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >          "-chardev
> file,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|=
off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >          "-chardev
> pipe,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|=
off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >      #ifdef _WIN32
> >          "-chardev
> console,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> >          "-chardev
> serial,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Do=
n|off]\n"
> >      #else
> >          "-chardev
> pty,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >          "-chardev
> stdio,id=3Did[,mux=3Don|off][,signal=3Don|off][,logfile=3DPATH][,logappen=
d=3Don|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >      #endif
> >      #ifdef CONFIG_BRLAPI
> >          "-chardev
> braille,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >      #endif
> >      #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__)=
 \
> >              || defined(__NetBSD__) || defined(__OpenBSD__) ||
> defined(__DragonFly__)
> >          "-chardev
> serial,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Do=
n|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >          "-chardev
> tty,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|o=
ff]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >      #endif
> >      #if defined(__linux__) || defined(__FreeBSD__) ||
> defined(__DragonFly__)
> >          "-chardev
> parallel,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=
=3Don|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >          "-chardev
> parport,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3D=
on|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >      #endif
> >      #if defined(CONFIG_SPICE)
> >          "-chardev
> spicevmc,id=3Did,name=3Dname[,debug=3Ddebug][,logfile=3DPATH][,logappend=
=3Don|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >          "-chardev
> spiceport,id=3Did,name=3Dname[,debug=3Ddebug][,logfile=3DPATH][,logappend=
=3Don|off]\n"
> >     +    "         [,close-on-cpr=3Don|off]\n"
> >      #endif
> >          , QEMU_ARCH_ALL
> >      )
> >     @@ -3245,6 +3259,10 @@ The general form of a character device optio=
n
> is:
> >          ``logappend`` option controls whether the log file will be
> truncated
> >          or appended to when opened.
> >
> >     +    Every backend supports the ``close-on-cpr`` option.  If on, th=
e
> >     +    devices's descriptor is closed during cprsave, and reopened
> after exec.
> >     +    This is useful for devices that do not support cpr.
> >     +
> >      The available backends are:
> >
> >      ``-chardev null,id=3Did``
> >     --
> >     1.8.3.1
> >
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009ea47205c6f26a09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 11:20 PM St=
even Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistar=
e@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 7/8/2021 12:03 PM, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Jul 7, 2021 at 9:37 PM Steve Sistare &lt;<a href=3D"mailto:ste=
ven.sistare@oracle.com" target=3D"_blank">steven.sistare@oracle.com</a> &lt=
;mailto:<a href=3D"mailto:steven.sistare@oracle.com" target=3D"_blank">stev=
en.sistare@oracle.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Add QEMU_CHAR_FEATURE_CPR for devices that support =
cpr.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Add the chardev close_on_cpr option for devices tha=
t can be closed on cpr<br>
&gt;=C2=A0 =C2=A0 =C2=A0and reopened after exec.<br>
&gt;=C2=A0 =C2=A0 =C2=A0cpr is allowed only if either QEMU_CHAR_FEATURE_CPR=
 or close_on_cpr is set<br>
&gt;=C2=A0 =C2=A0 =C2=A0for all chardevs in the configuration.<br>
&gt; <br>
&gt; <br>
&gt; Why not do the right thing by default?<br>
<br>
Char devices with buffering in the qemu process do not support cpr, as ther=
e is no general mechanism <br>
for saving and restoring the buffer and synchronizing that with device oper=
ation.=C2=A0 In theory vmstate <br>
could provide that mechanism, but sync&#39;ing the device with vmstate oper=
ations would be non-trivial, <br>
as every device handles it differently, and I did not tackle it.=C2=A0 Howe=
ver, some very=C2=A0 useful devices <br>
do not buffer, and do support cpr, so I introduce QEMU_CHAR_FEATURE_CPR to =
identify them.=C2=A0 CPR support<br>
can be incrementally added to more devices in the future via this mechanism=
.<br>
<br>
&gt; Could use some tests in tests/unit/test-char.c<br>
<br>
OK, I&#39;ll check it out.=C2=A0 I have deferred adding unit tests until I =
get more buy in on the patch series.<br></blockquote><div><br></div><div>I =
understand :) Tbh, I have no clue if you are close to acceptance. (too late=
 for 6.1 anyway, you can already update the docs)<br></div><div> <br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:=
steven.sistare@oracle.com" target=3D"_blank">steven.sistare@oracle.com</a> =
&lt;mailto:<a href=3D"mailto:steven.sistare@oracle.com" target=3D"_blank">s=
teven.sistare@oracle.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 41 ++++++++++++++++++++++++++++++++++++++---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/chardev/char.h |=C2=A0 5 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0migration/cpr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 ++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
26 ++++++++++++++++++++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A05 files changed, 72 insertions(+), 8 deletion=
s(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/chardev/char.c b/chardev/char.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index d959eec..f10fb94 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/chardev/char.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/chardev/char.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -36,6 +36,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qemu/help_option.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qemu/module.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qemu/option.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &quot;qemu/env.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qemu/id.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qemu/coroutine.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qemu/yank.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -239,6 +240,9 @@ static void qemu_char_open(Char=
dev *chr, ChardevBackend *backend,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0ChardevClass *cc =3D CHARDEV_GE=
T_CLASS(chr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* Any ChardevCommon member wou=
ld work */<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0ChardevCommon *common =3D backe=
nd ? backend-&gt;u.null.data : NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char fdname[40];<br>
&gt; <br>
&gt; <br>
&gt; Please use g_autoptr char *fdname =3D NULL; &amp; g_strdup_printf()<br=
>
<br>
Will do.=C2=A0 <br>
(the glibc functions are new to me, and my fingers do not automatically typ=
e them).<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 chr-&gt;close_on_cpr =3D (common &am=
p;&amp; common-&gt;close_on_cpr);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0if (common &amp;&amp; common-&g=
t;has_logfile) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int flags =3D O_W=
RONLY | O_CREAT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -248,7 +252,14 @@ static void qemu_char_open(Cha=
rdev *chr, ChardevBackend *backend,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fla=
gs |=3D O_TRUNC;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;logfd =3D qemu=
_open_old(common-&gt;logfile, flags, 0666);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(fdname, sizeo=
f(fdname), &quot;%s_log&quot;, chr-&gt;label);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;logfd =3D gete=
nv_fd(fdname);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chr-&gt;logfd &lt;=
 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;=
logfd =3D qemu_open_old(common-&gt;logfile, flags, 0666);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!chr=
-&gt;close_on_cpr) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 setenv_fd(fdname, chr-&gt;logfd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (chr-&gt;logfd=
 &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err=
or_setg_errno(errp, errno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unable to ope=
n logfile %s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -300,11 +311,12 @@ static void char_finalize(Obj=
ect *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0if (chr-&gt;be) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chr-&gt;be-&gt;ch=
r =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 g_free(chr-&gt;filename);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 g_free(chr-&gt;label);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0if (chr-&gt;logfd !=3D -1) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(chr-&gt;log=
fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsetenv_fdv(&quot;%s_=
log&quot;, chr-&gt;label);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 g_free(chr-&gt;filename);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 g_free(chr-&gt;label);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0qemu_mutex_destroy(&amp;chr-&gt=
;chr_write_lock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -504,6 +516,8 @@ void qemu_chr_parse_common(Qemu=
Opts *opts, ChardevCommon *backend)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0backend-&gt;has_logappend =3D t=
rue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0backend-&gt;logappend =3D qemu_=
opt_get_bool(opts, &quot;logappend&quot;, false);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 backend-&gt;close_on_cpr =3D qemu_op=
t_get_bool(opts, &quot;close-on-cpr&quot;, false);<br>
&gt; <br>
&gt; <br>
&gt; If set to true and the backend doesn&#39;t implement the CPR feature, =
it should raise an error.<br>
<br>
Setting to true is the workaround for missing CPR support, so that cpr may =
still be performed.=C2=A0 <br>
The device will be reopened post exec.=C2=A0 That is not as nice as transpa=
rently preserving the device, <br>
but is nicer than disallowing cpr because some device(s) of many do not sup=
port it.<br></blockquote><div><br></div><div>ok, &quot;reopen-on-cpr&quot; =
would be more descriptive then.<br></div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0static const ChardevClass *char_get_class(con=
st char *driver, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -945,6 +959,9 @@ QemuOptsList qemu_chardev_opts =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.na=
me =3D &quot;abstract&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ty=
pe =3D QEMU_OPT_BOOL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =
=3D &quot;close-on-cpr&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =
=3D QEMU_OPT_BOOL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* end of list =
*/ }<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1212,6 +1229,24 @@ GSource *qemu_chr_timeout_ad=
d_ms(Chardev *chr, guint ms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0return source;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+static int chr_cpr_capable(Object *obj, void *opaq=
ue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 Chardev *chr =3D (Chardev *)obj;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 Error **errp =3D opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if (qemu_chr_has_feature(chr, QEMU_C=
HAR_FEATURE_CPR) || chr-&gt;close_on_cpr) {<br>
&gt; <br>
&gt; <br>
&gt; That&#39;d be easy to misuse. Chardev should always explicitly support=
 CPR feature (even if close_on_cpr is set)<br>
<br>
Given my explanation at top, does this make sense now?<br></blockquote><div=
><br></div><div>I think I understand the purpose, but it feels quite advent=
urous to rely on this behaviour by default, even if the feature flag is set=
. Could it require both FEATURE_CPR &amp;&amp; reopen-on-cpr?<br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- Steve<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 error_setg(errp, &quot;error: charde=
v %s -&gt; %s is not capable of cpr&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0chr-&gt;label, chr-&gt;filename);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+bool qemu_chr_cpr_capable(Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return !object_child_foreach(get_cha=
rdevs_root(), chr_cpr_capable, errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0void qemu_chr_cleanup(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0object_unparent(get_chardevs_ro=
ot());<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/include/chardev/char.h b/include/chard=
ev/char.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 7c0444f..e488ad1 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/include/chardev/char.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/include/chardev/char.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -50,6 +50,8 @@ typedef enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* Whether the gcontext can be =
changed after calling<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 * qemu_chr_be_update_read_hand=
lers() */<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0QEMU_CHAR_FEATURE_GCONTEXT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 /* Whether the device supports cpr *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 QEMU_CHAR_FEATURE_CPR,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0QEMU_CHAR_FEATURE_LAST,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0} ChardevFeature;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -67,6 +69,7 @@ struct Chardev {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0int be_open;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* used to coordinate the chard=
ev-change special-case: */<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0bool handover_yank_instance;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 bool close_on_cpr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0GSource *gsource;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0GMainContext *gcontext;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0DECLARE_BITMAP(features, QEMU_C=
HAR_FEATURE_LAST);<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -291,4 +294,6 @@ void resume_mux_open(void);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0/* console.c */<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0void qemu_chr_parse_vc(QemuOpts *opts, Charde=
vBackend *backend, Error **errp);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+bool qemu_chr_cpr_capable(Error **errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/migration/cpr.c b/migration/cpr.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 6333988..feff97f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/migration/cpr.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/migration/cpr.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -138,6 +138,9 @@ void cprexec(strList *args, Err=
or **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, =
&quot;cprexec requires cprsave with restart mode&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if (!qemu_chr_cpr_capable(errp)) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0if (vfio_cprsave(errp)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/qapi/char.json b/qapi/char.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0index adf2685..5efaf59 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/qapi/char.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/qapi/char.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -204,12 +204,15 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0# @logfile: The name of a logfile to save out=
put<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0# @logappend: true to append instead of trunc=
ate<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(default to false to truncate)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# @close-on-cpr: if true, close device&#39;s fd on=
 cprsave. defaults to false.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 since 6.1.<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0# Since: 2.6<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0##<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0{ &#39;struct&#39;: &#39;ChardevCommon&#39;,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0&#39;data&#39;: { &#39;*logfile&#39;: =
&#39;str&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*lo=
gappend&#39;: &#39;bool&#39; } }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*lo=
gappend&#39;: &#39;bool&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*cl=
ose-on-cpr&#39;: &#39;bool&#39; } }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0##<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0# @ChardevFile:<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt;=C2=A0 =C2=A0 =C2=A0index fa53734..d5ff45f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/qemu-options.hx<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/qemu-options.hx<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -3134,43 +3134,57 @@ DEFHEADING(Character device=
 options:)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0DEF(&quot;chardev&quot;, HAS_ARG, QEMU_OPTION=
_chardev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev help\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 &quot;-chardev null,id=3Did[,mux=3Do=
n|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;-chardev null,id=3Did[,mux=3Do=
n|off][,logfile=3DPATH][,logappend=3Don|off][,close-on-cpr=3Don|off]\n&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev socket,id=3Did[,=
host=3Dhost],port=3Dport[,to=3Dto][,ipv4=3Don|off][,ipv6=3Don|off][,nodelay=
=3Don|off][,reconnect=3Dseconds]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[,server=3Don|off][,wait=3Don|off][,telnet=3Don|off][,websocket=
=3Don|off][,reconnect=3Dseconds][,mux=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3D=
ID] (tcp)\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3D=
ID][,close-on-cpr=3Don|off] (tcp)\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev socket,id=3Did,p=
ath=3Dpath[,server=3Don|off][,wait=3Don|off][,telnet=3Don|off][,websocket=
=3Don|off][,reconnect=3Dseconds]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|=
off][,tight=3Don|off] (unix)\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|=
off][,tight=3Don|off][,close-on-cpr=3Don|off] (unix)\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev udp,id=3Did[,hos=
t=3Dhost],port=3Dport[,localaddr=3Dlocaladdr]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[,localport=3Dlocalport][,ipv4=3Don|off][,ipv6=3Don|off][,mux=3Do=
n|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,logfile=3DPATH][,logappend=3Don|off][,close-on-cpr=3Don|off]\n&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev msmouse,id=3Did[=
,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev vc,id=3Did[[,wid=
th=3Dwidth][,height=3Dheight]][[,cols=3Dcols][,rows=3Drows]]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev ringbuf,id=3Did[=
,size=3Dsize][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev file,id=3Did,pat=
h=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev pipe,id=3Did,pat=
h=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#ifdef _WIN32<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev console,id=3Did[=
,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev serial,id=3Did,p=
ath=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev pty,id=3Did[,mux=
=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev stdio,id=3Did[,m=
ux=3Don|off][,signal=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#ifdef CONFIG_BRLAPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev braille,id=3Did[=
,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#if defined(__linux__) || defined(__sun__) ||=
 defined(__FreeBSD__) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| defined(__NetB=
SD__) || defined(__OpenBSD__) || defined(__DragonFly__)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev serial,id=3Did,p=
ath=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev tty,id=3Did,path=
=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#if defined(__linux__) || defined(__FreeBSD__=
) || defined(__DragonFly__)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev parallel,id=3Did=
,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev parport,id=3Did,=
path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#if defined(CONFIG_SPICE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev spicevmc,id=3Did=
,name=3Dname[,debug=3Ddebug][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;-chardev spiceport,id=3Di=
d,name=3Dname[,debug=3Ddebug][,logfile=3DPATH][,logappend=3Don|off]\n&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[,close-on-cpr=3Don|off]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0, QEMU_ARCH_ALL<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -3245,6 +3259,10 @@ The general form of a charac=
ter device option is:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0``logappend`` option controls w=
hether the log file will be truncated<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0or appended to when opened.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 Every backend supports the ``close-o=
n-cpr`` option.=C2=A0 If on, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 devices&#39;s descriptor is closed d=
uring cprsave, and reopened after exec.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 This is useful for devices that do n=
ot support cpr.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0The available backends are:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0``-chardev null,id=3Did``<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A01.8.3.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009ea47205c6f26a09--

