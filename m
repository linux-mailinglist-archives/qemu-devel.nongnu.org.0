Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0256AA3F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 20:09:04 +0200 (CEST)
Received: from localhost ([::1]:60154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Vvz-0004JH-EP
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 14:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9VuB-00032z-Nf; Thu, 07 Jul 2022 14:07:12 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:40788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9Vu9-0001rq-IE; Thu, 07 Jul 2022 14:07:11 -0400
Received: by mail-lf1-x136.google.com with SMTP id t25so32457194lfg.7;
 Thu, 07 Jul 2022 11:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/A7d8BQLXV/XXdp/vvIK/7R6cuXLRsnA228FefT5qVY=;
 b=Annx30K7eQkvadQO7MsihpNbIZW0EloAfctwxnQjLp3d8WFqRCl5OG9NyFwdIrvkvV
 KsEZhWLg66Mhi3B7GmbDnvfe9wkBQDMM9cy9uKRKGjmfaeMDHCTK0bx9SDpcaMhBTRqW
 xAxbIhPTu+x5IhUZUFosvehVBQHlxQO43ICa21FMygV0zoawlhujadaSGpqm6/4f/a8k
 wTsTC65NPh9DLH8fl3cTr6iJ5qnWEnrpGkAy9gpmuUDIdPgtiUfYpJO8UwIzfCWcK3cp
 OE0/ZuDj1p9FfnG2VPxCOy/VGN8OvDnmeFoUX03teXymKJ4TRQhd2M3S5l3uCDwwDLfC
 Aejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/A7d8BQLXV/XXdp/vvIK/7R6cuXLRsnA228FefT5qVY=;
 b=1/49VIHWbEUCQfrDRXQrgKFGeG6OIPOo/rlopkgpord5HE3Y8cqIdSAnWum6J9Aqlz
 0mkf/2GVMxx8P08Sj9lhwZtgZZG0REcvbbduYemvHpyx9pMav2k1OoURoMyP3fmSW6vS
 DYVo+AcNbncYbGEqtPcrmkY3SL6e76emSoHGux9IUsV0Xo0TFm8HZJwmd23w1xGpP9uF
 RJpT3o0DERyN927JL+xQ3NLkjYRTuJWOmV2ASgeK/rT25F7yDl89arLXZaad843Gakx6
 aQOCQxeeqtPIu1T2w+knqJGCZKjSYLLhVxSAnTMGvrB7K0tnfldd0yJhvf7BEdjjY33y
 /41w==
X-Gm-Message-State: AJIora/SSdVRkfMIujzpe0XwyC54QkD7ndJSaz9H1Ouc0DYYMJ508DML
 DlS0gaihFLNm3JJpUzx+1ctY5UAjeWV9RKbO5UM=
X-Google-Smtp-Source: AGRyM1sNATu9CdgPBuMj4wFRFs0bOFBFJhCsoGiaYFakYKWBKVVNNrj4AeQZVga+vRMXYvRYCct1QS2QBl7ZgfqAXyE=
X-Received: by 2002:a05:6512:6d4:b0:47f:74b4:4ec4 with SMTP id
 u20-20020a05651206d400b0047f74b44ec4mr29559913lff.654.1657217227484; Thu, 07
 Jul 2022 11:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-6-marcandre.lureau@redhat.com>
 <87mtdldswa.fsf@pond.sub.org>
In-Reply-To: <87mtdldswa.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Jul 2022 22:06:56 +0400
Message-ID: <CAJ+F1C+u_hyRAG0ivQs3NWyBzMiA=ugonXxWfaz5A_33UPTGNQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] error-report: introduce ErrorReportDetailedFunc
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000028f48405e33af480"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000028f48405e33af480
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 7, 2022 at 4:13 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Remove monitor dependency from error printing code, by allowing program=
s
> > to set a callback for when to use "detailed" reporting or not.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/error-report.h          | 4 +++-
> >  bsd-user/main.c                      | 2 +-
> >  linux-user/main.c                    | 2 +-
> >  qemu-img.c                           | 2 +-
> >  qemu-io.c                            | 2 +-
> >  qemu-nbd.c                           | 2 +-
> >  scsi/qemu-pr-helper.c                | 2 +-
> >  softmmu/vl.c                         | 7 ++++++-
> >  storage-daemon/qemu-storage-daemon.c | 7 ++++++-
> >  util/error-report.c                  | 8 +++++---
> >  10 files changed, 26 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
> > index 3ae2357fda54..e2e630f207f0 100644
> > --- a/include/qemu/error-report.h
> > +++ b/include/qemu/error-report.h
> > @@ -13,6 +13,8 @@
> >  #ifndef QEMU_ERROR_REPORT_H
> >  #define QEMU_ERROR_REPORT_H
> >
> > +typedef bool (*ErrorReportDetailedFunc)(void);
> > +
> >  typedef struct Location {
> >      /* all members are private to qemu-error.c */
> >      enum { LOC_NONE, LOC_CMDLINE, LOC_FILE } kind;
> > @@ -46,7 +48,7 @@ bool error_report_once_cond(bool *printed, const char
> *fmt, ...)
> >  bool warn_report_once_cond(bool *printed, const char *fmt, ...)
> >      G_GNUC_PRINTF(2, 3);
> >
> > -void error_init(const char *argv0);
> > +void error_init(const char *argv0, ErrorReportDetailedFunc detailed_fn=
);
> >
> >  /*
> >   * Similar to error_report(), except it prints the message just once.
> > diff --git a/bsd-user/main.c b/bsd-user/main.c
> > index 6f09180d6541..d5f8fca863d7 100644
> > --- a/bsd-user/main.c
> > +++ b/bsd-user/main.c
> > @@ -292,7 +292,7 @@ int main(int argc, char **argv)
> >
> >      save_proc_pathname(argv[0]);
> >
> > -    error_init(argv[0]);
> > +    error_init(argv[0], NULL);
> >      module_call_init(MODULE_INIT_TRACE);
> >      qemu_init_cpu_list();
> >      module_call_init(MODULE_INIT_QOM);
> [More such calls of error_init()...]
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index 54e920ada1a1..3b46fc9c1fc5 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -2590,6 +2590,11 @@ void qmp_x_exit_preconfig(Error **errp)
> >      }
> >  }
> >
> > +static bool error_is_detailed(void)
> > +{
> > +    return !monitor_cur();
> > +}
> > +
> >  void qemu_init(int argc, char **argv, char **envp)
> >  {
> >      QemuOpts *opts;
> > @@ -2634,7 +2639,7 @@ void qemu_init(int argc, char **argv, char **envp=
)
> >      qemu_add_opts(&qemu_action_opts);
> >      module_call_init(MODULE_INIT_OPTS);
> >
> > -    error_init(argv[0]);
> > +    error_init(argv[0], error_is_detailed);
> >      qemu_init_exec_dir(argv[0]);
> >
> >      qemu_init_arch_modules();
> > diff --git a/storage-daemon/qemu-storage-daemon.c
> b/storage-daemon/qemu-storage-daemon.c
> > index c104817cdddc..7e4d5030a045 100644
> > --- a/storage-daemon/qemu-storage-daemon.c
> > +++ b/storage-daemon/qemu-storage-daemon.c
> > @@ -368,13 +368,18 @@ static void pid_file_init(void)
> >      atexit(pid_file_cleanup);
> >  }
> >
> > +static bool error_is_detailed(void)
> > +{
> > +    return !monitor_cur();
> > +}
> > +
> >  int main(int argc, char *argv[])
> >  {
> >  #ifdef CONFIG_POSIX
> >      signal(SIGPIPE, SIG_IGN);
> >  #endif
> >
> > -    error_init(argv[0]);
> > +    error_init(argv[0], error_is_detailed);
> >      qemu_init_exec_dir(argv[0]);
> >      os_setup_signal_handling();
> >
> > diff --git a/util/error-report.c b/util/error-report.c
> > index c43227a975e2..c2181f80a83d 100644
> > --- a/util/error-report.c
> > +++ b/util/error-report.c
> > @@ -11,7 +11,6 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > -#include "monitor/monitor.h"
> >  #include "qemu/error-report.h"
> >
> >  /*
> > @@ -28,6 +27,7 @@ typedef enum {
> >  bool message_with_timestamp;
> >  bool error_with_guestname;
> >  const char *error_guest_name;
> > +ErrorReportDetailedFunc detailed_fn =3D NULL;
> >
> >  int error_printf(const char *fmt, ...)
> >  {
> > @@ -195,7 +195,7 @@ real_time_iso8601(void)
> >   */
> >  static void vreport(report_type type, const char *fmt, va_list ap)
> >  {
> > -    bool detailed =3D !monitor_cur();
> > +    bool detailed =3D detailed_fn ? detailed_fn() : TRUE;
> >      gchar *timestr;
> >
> >      if (message_with_timestamp && detailed) {
> > @@ -387,7 +387,7 @@ static void qemu_log_func(const gchar *log_domain,
> >      }
> >  }
> >
> > -void error_init(const char *argv0)
> > +void error_init(const char *argv0, ErrorReportDetailedFunc detailed)
> >  {
> >      const char *p =3D strrchr(argv0, '/');
> >
> > @@ -401,4 +401,6 @@ void error_init(const char *argv0)
> >      g_log_set_default_handler(qemu_log_func, NULL);
> >      g_warn_if_fail(qemu_glog_domains =3D=3D NULL);
> >      qemu_glog_domains =3D g_strdup(g_getenv("G_MESSAGES_DEBUG"));
> > +
> > +    detailed_fn =3D detailed;
> >  }
>
> A callback works, but note that each program's function is fixed.  Why
> not use the linker to resolve it?  Have a .o in libqemuutil.a that
> defines error_is_detailed() to return false always.  Have another
> error_is_detailed() that returns !monitor_cur() in monitor.c.  A program
> that links the monitor gets the latter, all the others the former.
>
> What do you think?
>

Yes, if we manage to overwrite symbols from a static library in a
subproject. See the other thread for discussion.


--=20
Marc-Andr=C3=A9 Lureau

--00000000000028f48405e33af480
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 7, 2022 at 4:13 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Remove monitor dependency from error printing code, by allowing progra=
ms<br>
&gt; to set a callback for when to use &quot;detailed&quot; reporting or no=
t.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/qemu/error-report.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
4 +++-<br>
&gt;=C2=A0 bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 linux-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 qemu-io.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 qemu-nbd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 scsi/qemu-pr-helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 ++++++-<br>
&gt;=C2=A0 storage-daemon/qemu-storage-daemon.c | 7 ++++++-<br>
&gt;=C2=A0 util/error-report.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 8 +++++---<br>
&gt;=C2=A0 10 files changed, 26 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h=
<br>
&gt; index 3ae2357fda54..e2e630f207f0 100644<br>
&gt; --- a/include/qemu/error-report.h<br>
&gt; +++ b/include/qemu/error-report.h<br>
&gt; @@ -13,6 +13,8 @@<br>
&gt;=C2=A0 #ifndef QEMU_ERROR_REPORT_H<br>
&gt;=C2=A0 #define QEMU_ERROR_REPORT_H<br>
&gt;=C2=A0 <br>
&gt; +typedef bool (*ErrorReportDetailedFunc)(void);<br>
&gt; +<br>
&gt;=C2=A0 typedef struct Location {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* all members are private to qemu-error.c */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 enum { LOC_NONE, LOC_CMDLINE, LOC_FILE } kind;<br>
&gt; @@ -46,7 +48,7 @@ bool error_report_once_cond(bool *printed, const cha=
r *fmt, ...)<br>
&gt;=C2=A0 bool warn_report_once_cond(bool *printed, const char *fmt, ...)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 G_GNUC_PRINTF(2, 3);<br>
&gt;=C2=A0 <br>
&gt; -void error_init(const char *argv0);<br>
&gt; +void error_init(const char *argv0, ErrorReportDetailedFunc detailed_f=
n);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Similar to error_report(), except it prints the message =
just once.<br>
&gt; diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
&gt; index 6f09180d6541..d5f8fca863d7 100644<br>
&gt; --- a/bsd-user/main.c<br>
&gt; +++ b/bsd-user/main.c<br>
&gt; @@ -292,7 +292,7 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 save_proc_pathname(argv[0]);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 error_init(argv[0]);<br>
&gt; +=C2=A0 =C2=A0 error_init(argv[0], NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 module_call_init(MODULE_INIT_TRACE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_init_cpu_list();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 module_call_init(MODULE_INIT_QOM);<br>
[More such calls of error_init()...]<br>
&gt; diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
&gt; index 54e920ada1a1..3b46fc9c1fc5 100644<br>
&gt; --- a/softmmu/vl.c<br>
&gt; +++ b/softmmu/vl.c<br>
&gt; @@ -2590,6 +2590,11 @@ void qmp_x_exit_preconfig(Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static bool error_is_detailed(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return !monitor_cur();<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 void qemu_init(int argc, char **argv, char **envp)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QemuOpts *opts;<br>
&gt; @@ -2634,7 +2639,7 @@ void qemu_init(int argc, char **argv, char **env=
p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_add_opts(&amp;qemu_action_opts);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 module_call_init(MODULE_INIT_OPTS);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 error_init(argv[0]);<br>
&gt; +=C2=A0 =C2=A0 error_init(argv[0], error_is_detailed);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_init_exec_dir(argv[0]);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_init_arch_modules();<br>
&gt; diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qem=
u-storage-daemon.c<br>
&gt; index c104817cdddc..7e4d5030a045 100644<br>
&gt; --- a/storage-daemon/qemu-storage-daemon.c<br>
&gt; +++ b/storage-daemon/qemu-storage-daemon.c<br>
&gt; @@ -368,13 +368,18 @@ static void pid_file_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 atexit(pid_file_cleanup);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static bool error_is_detailed(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return !monitor_cur();<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 int main(int argc, char *argv[])<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 #ifdef CONFIG_POSIX<br>
&gt;=C2=A0 =C2=A0 =C2=A0 signal(SIGPIPE, SIG_IGN);<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 error_init(argv[0]);<br>
&gt; +=C2=A0 =C2=A0 error_init(argv[0], error_is_detailed);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_init_exec_dir(argv[0]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 os_setup_signal_handling();<br>
&gt;=C2=A0 <br>
&gt; diff --git a/util/error-report.c b/util/error-report.c<br>
&gt; index c43227a975e2..c2181f80a83d 100644<br>
&gt; --- a/util/error-report.c<br>
&gt; +++ b/util/error-report.c<br>
&gt; @@ -11,7 +11,6 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; -#include &quot;monitor/monitor.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; @@ -28,6 +27,7 @@ typedef enum {<br>
&gt;=C2=A0 bool message_with_timestamp;<br>
&gt;=C2=A0 bool error_with_guestname;<br>
&gt;=C2=A0 const char *error_guest_name;<br>
&gt; +ErrorReportDetailedFunc detailed_fn =3D NULL;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int error_printf(const char *fmt, ...)<br>
&gt;=C2=A0 {<br>
&gt; @@ -195,7 +195,7 @@ real_time_iso8601(void)<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 static void vreport(report_type type, const char *fmt, va_list a=
p)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 bool detailed =3D !monitor_cur();<br>
&gt; +=C2=A0 =C2=A0 bool detailed =3D detailed_fn ? detailed_fn() : TRUE;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 gchar *timestr;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (message_with_timestamp &amp;&amp; detailed) {<=
br>
&gt; @@ -387,7 +387,7 @@ static void qemu_log_func(const gchar *log_domain,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void error_init(const char *argv0)<br>
&gt; +void error_init(const char *argv0, ErrorReportDetailedFunc detailed)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *p =3D strrchr(argv0, &#39;/&#39;);<br>
&gt;=C2=A0 <br>
&gt; @@ -401,4 +401,6 @@ void error_init(const char *argv0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_log_set_default_handler(qemu_log_func, NULL);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 g_warn_if_fail(qemu_glog_domains =3D=3D NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_glog_domains =3D g_strdup(g_getenv(&quot;G_ME=
SSAGES_DEBUG&quot;));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 detailed_fn =3D detailed;<br>
&gt;=C2=A0 }<br>
<br>
A callback works, but note that each program&#39;s function is fixed.=C2=A0=
 Why<br>
not use the linker to resolve it?=C2=A0 Have a .o in libqemuutil.a that<br>
defines error_is_detailed() to return false always.=C2=A0 Have another<br>
error_is_detailed() that returns !monitor_cur() in monitor.c.=C2=A0 A progr=
am<br>
that links the monitor gets the latter, all the others the former.<br>
<br>
What do you think?<br></blockquote><div><br></div><div>Yes, if we manage to=
 overwrite symbols from a static library in a subproject. See the other thr=
ead for discussion. <br></div></div><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000028f48405e33af480--

