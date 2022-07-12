Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD8571E57
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:08:51 +0200 (CEST)
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHVK-0008GV-O1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHPA-00028I-SL
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:02:31 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:39507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHP9-0000gW-0O
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:02:28 -0400
Received: by mail-ua1-x92f.google.com with SMTP id s38so3085028uac.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=McsdCZV/jFfbkueF7HVx2JyfaUxHLp4ywyCFIMck+gE=;
 b=jddGGCRuZ6t/pxGvecBpi/utZ4fYe+iu0U9nS7tXIhcZScldR41fZi4vU5DLvluMNX
 /tKIUveZdCANWt4U1yXNfNSFWqeHz6Ah+ceKMh8pRldP7gVeFys6i/3OqUoCjYvQWNcf
 cPoRrAri/j0WlJi8tI8Dyo3zkbr7JJo6DKHivNopKkefX5eCrem0CbTweI/VFLEl/ri1
 AErGtBSgfoPHTX0o8/ctZwRutb67bpHELXwdDY8gbNTFCSezS4/dEhr0w2WWKX/XF1ZL
 UE5hzQ33vAlmzP53v09W8Ha4izViqJZ/jXu0CTFMHkcO3yy+NN26lH/r5lApCrsnHD7j
 h3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McsdCZV/jFfbkueF7HVx2JyfaUxHLp4ywyCFIMck+gE=;
 b=grmeUIwlbpFjpWJI/ASx8rWY0rhr8CxjaQragFOL0XENqpcGP/NBpRA2gOIaAHnzFt
 0OEqElz85w1d/0TXvuqx7eJKKB6oMkh0dlzkQFH397ZkWqlmJnFx0J+Oi73TeUt34WN4
 +pitOubNpO1pXtF/Sc1KuBu8XB8O/O7hLT2VGqdAZFNdnRyRwbshdBPKd/0HWFIEevdw
 V3sATaD0S4yvofkO83mzEMvPIof/+lvKdpJEDwoybm6vOwGsO9Rvuy+MDdPsslQE1g0E
 0a9fg7UZZQThvc1fr4ojHkheaY53+KFwpt+2mQKPRLQ9wvS7OJ83F1F3Dc/FZxyt/ndI
 lxLg==
X-Gm-Message-State: AJIora96cxuSuUYolwfxdSU55q4nluQPNtyJaPTloddK2HtmXf11srJp
 +3V6ATkcEDgW7Risl7+DGC81xoKhmtj0fd50aGWhqg==
X-Google-Smtp-Source: AGRyM1tC+EN8ELRuPiGwRrixL6hQovpiMMWrzEaeHHkFglXzOcSquTL0IVFojgJKJOR/jZAlmB9q6rrmgQP+IWQPWZI=
X-Received: by 2002:ab0:7341:0:b0:382:30b9:be20 with SMTP id
 k1-20020ab07341000000b0038230b9be20mr8391444uap.95.1657638144459; Tue, 12 Jul
 2022 08:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-5-marcandre.lureau@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 12 Jul 2022 09:02:13 -0600
Message-ID: <CANCZdfoVqU-J53SCy+4Lfy-yjMw3B39WF+gdu48tZSL0Ev+Lgw@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] error-report: introduce overridable
 error_is_detailed()
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c4576805e39cf497"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000c4576805e39cf497
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 3:36 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Remove the direct dependency from error-report to monitor code.
> This will allow to move error-report to a subproject.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/error-report.h | 2 ++
>  softmmu/vl.c                | 5 +++++
>  stubs/error-is-detailed.c   | 7 +++++++
>  util/error-report.c         | 3 +--
>  stubs/meson.build           | 1 +
>  5 files changed, 16 insertions(+), 2 deletions(-)
>  create mode 100644 stubs/error-is-detailed.c
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
> index 3ae2357fda54..6ab25d458350 100644
> --- a/include/qemu/error-report.h
> +++ b/include/qemu/error-report.h
> @@ -30,6 +30,8 @@ void loc_set_none(void);
>  void loc_set_cmdline(char **argv, int idx, int cnt);
>  void loc_set_file(const char *fname, int lno);
>
> +bool error_is_detailed(void);
> +
>  int error_vprintf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
>  int error_printf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 3f264d4b0930..f94efc56e9d6 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2589,6 +2589,11 @@ void qmp_x_exit_preconfig(Error **errp)
>      }
>  }
>
> +bool error_is_detailed(void)
> +{
> +    return !monitor_cur();
> +}
> +
>  void qemu_init(int argc, char **argv, char **envp)
>  {
>      QemuOpts *opts;
> diff --git a/stubs/error-is-detailed.c b/stubs/error-is-detailed.c
> new file mode 100644
> index 000000000000..c47cd236932f
> --- /dev/null
> +++ b/stubs/error-is-detailed.c
> @@ -0,0 +1,7 @@
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +
> +bool error_is_detailed(void)
> +{
> +    return TRUE;
> +}
> diff --git a/util/error-report.c b/util/error-report.c
> index c43227a975e2..4d1d66fc0650 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -11,7 +11,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "monitor/monitor.h"
>  #include "qemu/error-report.h"
>
>  /*
> @@ -195,7 +194,7 @@ real_time_iso8601(void)
>   */
>  static void vreport(report_type type, const char *fmt, va_list ap)
>  {
> -    bool detailed =3D !monitor_cur();
> +    bool detailed =3D error_is_detailed();
>      gchar *timestr;
>
>      if (message_with_timestamp && detailed) {
> diff --git a/stubs/meson.build b/stubs/meson.build
> index d8f3fd5c44f2..0f3a782824f9 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -9,6 +9,7 @@ stub_ss.add(files('cpus-get-virtual-clock.c'))
>  stub_ss.add(files('qemu-timer-notify-cb.c'))
>  stub_ss.add(files('icount.c'))
>  stub_ss.add(files('dump.c'))
> +stub_ss.add(files('error-is-detailed.c'))
>  stub_ss.add(files('error-printf.c'))
>  stub_ss.add(files('fdset.c'))
>  stub_ss.add(files('gdbstub.c'))
> --
> 2.37.0.rc0
>
>

--000000000000c4576805e39cf497
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 3:36 AM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Remove the direct dependency from error-report to monitor code.<br>
This will allow to move error-report to a subproject.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/error-report.h | 2 ++<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 5 +++++<br>
=C2=A0stubs/error-is-detailed.c=C2=A0 =C2=A0| 7 +++++++<br>
=C2=A0util/error-report.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A0stubs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A05 files changed, 16 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 stubs/error-is-detailed.c<br></blockquote><div><br=
></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">=
imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h<br>
index 3ae2357fda54..6ab25d458350 100644<br>
--- a/include/qemu/error-report.h<br>
+++ b/include/qemu/error-report.h<br>
@@ -30,6 +30,8 @@ void loc_set_none(void);<br>
=C2=A0void loc_set_cmdline(char **argv, int idx, int cnt);<br>
=C2=A0void loc_set_file(const char *fname, int lno);<br>
<br>
+bool error_is_detailed(void);<br>
+<br>
=C2=A0int error_vprintf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);<b=
r>
=C2=A0int error_printf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);<br>
<br>
diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
index 3f264d4b0930..f94efc56e9d6 100644<br>
--- a/softmmu/vl.c<br>
+++ b/softmmu/vl.c<br>
@@ -2589,6 +2589,11 @@ void qmp_x_exit_preconfig(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+bool error_is_detailed(void)<br>
+{<br>
+=C2=A0 =C2=A0 return !monitor_cur();<br>
+}<br>
+<br>
=C2=A0void qemu_init(int argc, char **argv, char **envp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QemuOpts *opts;<br>
diff --git a/stubs/error-is-detailed.c b/stubs/error-is-detailed.c<br>
new file mode 100644<br>
index 000000000000..c47cd236932f<br>
--- /dev/null<br>
+++ b/stubs/error-is-detailed.c<br>
@@ -0,0 +1,7 @@<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+<br>
+bool error_is_detailed(void)<br>
+{<br>
+=C2=A0 =C2=A0 return TRUE;<br>
+}<br>
diff --git a/util/error-report.c b/util/error-report.c<br>
index c43227a975e2..4d1d66fc0650 100644<br>
--- a/util/error-report.c<br>
+++ b/util/error-report.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
<br>
=C2=A0/*<br>
@@ -195,7 +194,7 @@ real_time_iso8601(void)<br>
=C2=A0 */<br>
=C2=A0static void vreport(report_type type, const char *fmt, va_list ap)<br=
>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool detailed =3D !monitor_cur();<br>
+=C2=A0 =C2=A0 bool detailed =3D error_is_detailed();<br>
=C2=A0 =C2=A0 =C2=A0gchar *timestr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (message_with_timestamp &amp;&amp; detailed) {<br>
diff --git a/stubs/meson.build b/stubs/meson.build<br>
index d8f3fd5c44f2..0f3a782824f9 100644<br>
--- a/stubs/meson.build<br>
+++ b/stubs/meson.build<br>
@@ -9,6 +9,7 @@ stub_ss.add(files(&#39;cpus-get-virtual-clock.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;qemu-timer-notify-cb.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;icount.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;dump.c&#39;))<br>
+stub_ss.add(files(&#39;error-is-detailed.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;error-printf.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;fdset.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;gdbstub.c&#39;))<br>
-- <br>
2.37.0.rc0<br>
<br>
</blockquote></div></div>

--000000000000c4576805e39cf497--

