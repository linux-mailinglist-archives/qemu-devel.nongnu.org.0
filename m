Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB0571DBF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:02:46 +0200 (CEST)
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHPQ-0001zh-Ff
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHKs-0006zP-7K
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:58:04 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:38674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHKp-0000Nl-2Q
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:58:01 -0400
Received: by mail-ua1-x92c.google.com with SMTP id j6so3078454uae.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18RJ24HurOOKRIJCyKvl1brRxYWQ6KU5G/ZZk4JpHYk=;
 b=z/7sZE36lUwXu0Rup1LIZLR7oPnvmSeJaX3D4YYFledmdsGiDhB+ZvWp4zwsAe9lKt
 7PRChxeXkz5qWMyeMdinFvhL4TyYl2lqnyLUhE3QRHtvxyxQ1B9MCSnguCBQXwDm5tA1
 E2gItVquummjKhbpGVCKovRKACuLd7HGhgUKeuVcFrStEyEvmjcbojxmFB8OYhnPUyQ+
 1uStlDbt3Ya9XAo0t6oQ7OcRypCbfXtM1s8t3WPGuZAycbGSbYSgRCEMlEMnC1WOd7pL
 BhalphX4Wr4DncXVHqqrP/OVD3mnRd/5ksz8ic48qeM9XJ9XXWCOYGnwdVeI0OtSsWpJ
 PkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18RJ24HurOOKRIJCyKvl1brRxYWQ6KU5G/ZZk4JpHYk=;
 b=qzJFptjjkbg+FMWPlNxUOyxm+bktDadZXyKPtGIXCuMOHLW53bhR+/lAcTwX2IbPqL
 It0PN/Y9+7dz2WVogGiB6DX6cNOBc4r7OA9QuavXdW2PORK4gG+pHia1VQ2kTeuOtb3x
 mJJzjkENUxnmDC/jRtIQ0mKblQRLGuYr6Zh+3wipUrOTp4bNAi+CSmLJObL9f+S/hErp
 /m9EnRQRiDsCorEIo3bHjLxA4eGLcAoWB65Oj0Qj/xgB9eJZ+baHzNp7/DV6fiA4t615
 aH22pKtY/okNXyhDKVQqwfSTp0zj54NwxChbxm14GN6C/+ClB/HfT3KP//s/NGFCuD4g
 M4cQ==
X-Gm-Message-State: AJIora8NXKC5htKBvutuKQy+gdRNIYp3USe7cGy+ljWhrEsALLmSsLcE
 aEuxhJ138Y/2OyLa97t0l26xkU3ov7QydgHYr58PnA==
X-Google-Smtp-Source: AGRyM1uWxeccQX7cG0RtNOu1LylDAA+fZA9RB5roZpGugEC0ZUpCEX92jl7dMJIh9gsf+REioCCiohb6lFA9eY4MIPc=
X-Received: by 2002:ab0:2a06:0:b0:379:96c7:bf4f with SMTP id
 o6-20020ab02a06000000b0037996c7bf4fmr7890683uar.8.1657637874788; Tue, 12 Jul
 2022 07:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-11-marcandre.lureau@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 12 Jul 2022 08:57:43 -0600
Message-ID: <CANCZdfpuq4YgrmcuyqJCfpXwguGbVJqBOa2vT==Hkr2bLSYRrw@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] qemu-common: introduce a common subproject
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
Content-Type: multipart/alternative; boundary="000000000000b17fc805e39ce4d6"
Received-SPF: none client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92c.google.com
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

--000000000000b17fc805e39ce4d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 3:36 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Add a new meson subproject to provide common code and scripts for QEMU
> and tools. Initially, it will offer QAPI/QMP code generation and
> common utilities.
>
> libvhost-user & libvduse will make use of the subproject to avoid having
> include/ links to common headers.
>
> The other targeted user is qemu-ga, which will also be converted to a
> subproject (so it can be built, moved, released etc independent from QEMU=
).
>
> Other projects such as qemu-storage-daemon could be built standalone
> eventually in the future.
>
> Note that with meson subprojects are "global". Projects will share
> subprojects (
> https://mesonbuild.com/Subprojects.html#subprojects-depending-on-other-su=
bprojects
> ).
> We will add extra subprojects/ links to allow standalone subproject
> compilation though.
>
> This initial commit simply set the stage to build and link against it.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build                                              | 9 ++++++++-
>  .../qemu-common/include}/qemu/help-texts.h               | 0
>  linux-user/meson.build                                   | 4 ++--
>  subprojects/libvduse/meson.build                         | 2 ++
>  subprojects/libvduse/subprojects/qemu-common             | 1 +
>  subprojects/libvhost-user/meson.build                    | 2 ++
>  subprojects/libvhost-user/subprojects/qemu-common        | 1 +
>  subprojects/qemu-common/meson.build                      | 8 ++++++++
>  8 files changed, 24 insertions(+), 3 deletions(-)
>  rename {include =3D> subprojects/qemu-common/include}/qemu/help-texts.h
> (100%)
>  create mode 120000 subprojects/libvduse/subprojects/qemu-common
>  create mode 120000 subprojects/libvhost-user/subprojects/qemu-common
>  create mode 100644 subprojects/qemu-common/meson.build
>
> diff --git a/meson.build b/meson.build
> index bc5569ace159..254eb1263a66 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -167,6 +167,10 @@ if 'dtrace' in get_option('trace_backends')
>    endif
>  endif
>
> +add_project_arguments('-I' + meson.current_source_dir() /
> 'subprojects/qemu-common/include',
> +  language: ['c', 'cpp', 'objc'],
> +)
> +
>  if get_option('iasl') =3D=3D ''
>    iasl =3D find_program('iasl', required: false)
>  else
> @@ -1577,6 +1581,9 @@ if libbpf.found() and not cc.links('''
>    endif
>  endif
>
> +qemu_common =3D subproject('qemu-common')
> +qemu_common =3D qemu_common.get_variable('qemu_common_dep')
> +
>  #################
>  # config-host.h #
>  #################
> @@ -3052,7 +3059,7 @@ util_ss.add_all(trace_ss)
>  util_ss =3D util_ss.apply(config_all, strict: false)
>  libqemuutil =3D static_library('qemuutil',
>                               sources: util_ss.sources() +
> stub_ss.sources() + genh,
> -                             dependencies: [util_ss.dependencies(), libm=
,
> threads, glib, socket, malloc, pixman])
> +                             dependencies: [util_ss.dependencies(), libm=
,
> threads, glib, socket, malloc, pixman, qemu_common])
>  qemuutil =3D declare_dependency(link_with: libqemuutil,
>                                sources: genh + version_res,
>                                dependencies: [event_loop_base])
> diff --git a/include/qemu/help-texts.h
> b/subprojects/qemu-common/include/qemu/help-texts.h
> similarity index 100%
> rename from include/qemu/help-texts.h
> rename to subprojects/qemu-common/include/qemu/help-texts.h
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index de4320af053c..fc6cdb55d657 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -7,7 +7,7 @@ linux_user_ss =3D ss.source_set()
>  common_user_inc +=3D include_directories('include/host/' / host_arch)
>  common_user_inc +=3D include_directories('include')
>
> -linux_user_ss.add(files(
> +linux_user_ss.add([files(
>    'elfload.c',
>    'exit.c',
>    'fd-trans.c',
> @@ -20,7 +20,7 @@ linux_user_ss.add(files(
>    'thunk.c',
>    'uaccess.c',
>    'uname.c',
> -))
> +), qemu_common])
>

Question: Why does linux-user need these, but bsd-user does not?

Warner


>  linux_user_ss.add(rt)
>
>  linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
> diff --git a/subprojects/libvduse/meson.build
> b/subprojects/libvduse/meson.build
> index ba08f5ee1a03..841509ecb996 100644
> --- a/subprojects/libvduse/meson.build
> +++ b/subprojects/libvduse/meson.build
> @@ -2,6 +2,8 @@ project('libvduse', 'c',
>          license: 'GPL-2.0-or-later',
>          default_options: ['c_std=3Dgnu99'])
>
> +qemu_common =3D subproject('qemu-common')
> +
>  libvduse =3D static_library('vduse',
>                            files('libvduse.c'),
>                            c_args: '-D_GNU_SOURCE')
> diff --git a/subprojects/libvduse/subprojects/qemu-common
> b/subprojects/libvduse/subprojects/qemu-common
> new file mode 120000
> index 000000000000..4c1c87018a7a
> --- /dev/null
> +++ b/subprojects/libvduse/subprojects/qemu-common
> @@ -0,0 +1 @@
> +../../qemu-common
> \ No newline at end of file
> diff --git a/subprojects/libvhost-user/meson.build
> b/subprojects/libvhost-user/meson.build
> index 39825d9404ae..73355908e072 100644
> --- a/subprojects/libvhost-user/meson.build
> +++ b/subprojects/libvhost-user/meson.build
> @@ -5,6 +5,8 @@ project('libvhost-user', 'c',
>  threads =3D dependency('threads')
>  glib =3D dependency('glib-2.0')
>
> +qemu_common =3D subproject('qemu-common')
> +
>  vhost_user =3D static_library('vhost-user',
>                              files('libvhost-user.c'),
>                              dependencies: threads,
> diff --git a/subprojects/libvhost-user/subprojects/qemu-common
> b/subprojects/libvhost-user/subprojects/qemu-common
> new file mode 120000
> index 000000000000..4c1c87018a7a
> --- /dev/null
> +++ b/subprojects/libvhost-user/subprojects/qemu-common
> @@ -0,0 +1 @@
> +../../qemu-common
> \ No newline at end of file
> diff --git a/subprojects/qemu-common/meson.build
> b/subprojects/qemu-common/meson.build
> new file mode 100644
> index 000000000000..8969b08473ef
> --- /dev/null
> +++ b/subprojects/qemu-common/meson.build
> @@ -0,0 +1,8 @@
> +project('qemu-common', 'c',
> +  license: 'GPL-2.0-or-later',
> +  default_options: ['c_std=3Dgnu11']
> +)
> +
> +qemu_common_dep =3D declare_dependency(
> +  include_directories: include_directories('include'),
> +)
> --
> 2.37.0.rc0
>
>

--000000000000b17fc805e39ce4d6
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
Add a new meson subproject to provide common code and scripts for QEMU<br>
and tools. Initially, it will offer QAPI/QMP code generation and<br>
common utilities.<br>
<br>
libvhost-user &amp; libvduse will make use of the subproject to avoid havin=
g<br>
include/ links to common headers.<br>
<br>
The other targeted user is qemu-ga, which will also be converted to a<br>
subproject (so it can be built, moved, released etc independent from QEMU).=
<br>
<br>
Other projects such as qemu-storage-daemon could be built standalone<br>
eventually in the future.<br>
<br>
Note that with meson subprojects are &quot;global&quot;. Projects will shar=
e<br>
subprojects (<a href=3D"https://mesonbuild.com/Subprojects.html#subprojects=
-depending-on-other-subprojects" rel=3D"noreferrer" target=3D"_blank">https=
://mesonbuild.com/Subprojects.html#subprojects-depending-on-other-subprojec=
ts</a>).<br>
We will add extra subprojects/ links to allow standalone subproject<br>
compilation though.<br>
<br>
This initial commit simply set the stage to build and link against it.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 ++++++++-<br>
=C2=A0.../qemu-common/include}/qemu/help-texts.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0linux-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++--<br>
=C2=A0subprojects/libvduse/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0subprojects/libvduse/subprojects/qemu-common=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0subprojects/libvhost-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0subprojects/libvhost-user/subprojects/qemu-common=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 1 +<br>
=C2=A0subprojects/qemu-common/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 ++++++++<br>
=C2=A08 files changed, 24 insertions(+), 3 deletions(-)<br>
=C2=A0rename {include =3D&gt; subprojects/qemu-common/include}/qemu/help-te=
xts.h (100%)<br>
=C2=A0create mode 120000 subprojects/libvduse/subprojects/qemu-common<br>
=C2=A0create mode 120000 subprojects/libvhost-user/subprojects/qemu-common<=
br>
=C2=A0create mode 100644 subprojects/qemu-common/meson.build<br>
<br>
diff --git a/meson.build b/meson.build<br>
index bc5569ace159..254eb1263a66 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -167,6 +167,10 @@ if &#39;dtrace&#39; in get_option(&#39;trace_backends&=
#39;)<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
<br>
+add_project_arguments(&#39;-I&#39; + meson.current_source_dir() / &#39;sub=
projects/qemu-common/include&#39;,<br>
+=C2=A0 language: [&#39;c&#39;, &#39;cpp&#39;, &#39;objc&#39;],<br>
+)<br>
+<br>
=C2=A0if get_option(&#39;iasl&#39;) =3D=3D &#39;&#39;<br>
=C2=A0 =C2=A0iasl =3D find_program(&#39;iasl&#39;, required: false)<br>
=C2=A0else<br>
@@ -1577,6 +1581,9 @@ if libbpf.found() and not cc.links(&#39;&#39;&#39;<br=
>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
<br>
+qemu_common =3D subproject(&#39;qemu-common&#39;)<br>
+qemu_common =3D qemu_common.get_variable(&#39;qemu_common_dep&#39;)<br>
+<br>
=C2=A0#################<br>
=C2=A0# config-host.h #<br>
=C2=A0#################<br>
@@ -3052,7 +3059,7 @@ util_ss.add_all(trace_ss)<br>
=C2=A0util_ss =3D util_ss.apply(config_all, strict: false)<br>
=C2=A0libqemuutil =3D static_library(&#39;qemuutil&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sources: util_ss.sources() + stub_ss.source=
s() + genh,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependencies: [util_ss.dependencies(), libm,=
 threads, glib, socket, malloc, pixman])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependencies: [util_ss.dependencies(), libm,=
 threads, glib, socket, malloc, pixman, qemu_common])<br>
=C2=A0qemuutil =3D declare_dependency(link_with: libqemuutil,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sources: genh + version_res,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependencies: [event_loop_base])<br>
diff --git a/include/qemu/help-texts.h b/subprojects/qemu-common/include/qe=
mu/help-texts.h<br>
similarity index 100%<br>
rename from include/qemu/help-texts.h<br>
rename to subprojects/qemu-common/include/qemu/help-texts.h<br>
diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
index de4320af053c..fc6cdb55d657 100644<br>
--- a/linux-user/meson.build<br>
+++ b/linux-user/meson.build<br>
@@ -7,7 +7,7 @@ linux_user_ss =3D ss.source_set()<br>
=C2=A0common_user_inc +=3D include_directories(&#39;include/host/&#39; / ho=
st_arch)<br>
=C2=A0common_user_inc +=3D include_directories(&#39;include&#39;)<br>
<br>
-linux_user_ss.add(files(<br>
+linux_user_ss.add([files(<br>
=C2=A0 =C2=A0&#39;elfload.c&#39;,<br>
=C2=A0 =C2=A0&#39;exit.c&#39;,<br>
=C2=A0 =C2=A0&#39;fd-trans.c&#39;,<br>
@@ -20,7 +20,7 @@ linux_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;thunk.c&#39;,<br>
=C2=A0 =C2=A0&#39;uaccess.c&#39;,<br>
=C2=A0 =C2=A0&#39;uname.c&#39;,<br>
-))<br>
+), qemu_common])<br></blockquote><div><br></div><div>Question: Why does li=
nux-user=C2=A0need these, but bsd-user does not?</div><div><br></div><div>W=
arner</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
=C2=A0linux_user_ss.add(rt)<br>
<br>
=C2=A0linux_user_ss.add(when: &#39;TARGET_HAS_BFLT&#39;, if_true: files(&#3=
9;flatload.c&#39;))<br>
diff --git a/subprojects/libvduse/meson.build b/subprojects/libvduse/meson.=
build<br>
index ba08f5ee1a03..841509ecb996 100644<br>
--- a/subprojects/libvduse/meson.build<br>
+++ b/subprojects/libvduse/meson.build<br>
@@ -2,6 +2,8 @@ project(&#39;libvduse&#39;, &#39;c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0license: &#39;GPL-2.0-or-later&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_options: [&#39;c_std=3Dgnu99&#39;=
])<br>
<br>
+qemu_common =3D subproject(&#39;qemu-common&#39;)<br>
+<br>
=C2=A0libvduse =3D static_library(&#39;vduse&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0files(&#39;libvduse.c&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0c_args: &#39;-D_GNU_SOURCE&#39;)<br>
diff --git a/subprojects/libvduse/subprojects/qemu-common b/subprojects/lib=
vduse/subprojects/qemu-common<br>
new file mode 120000<br>
index 000000000000..4c1c87018a7a<br>
--- /dev/null<br>
+++ b/subprojects/libvduse/subprojects/qemu-common<br>
@@ -0,0 +1 @@<br>
+../../qemu-common<br>
\ No newline at end of file<br>
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-u=
ser/meson.build<br>
index 39825d9404ae..73355908e072 100644<br>
--- a/subprojects/libvhost-user/meson.build<br>
+++ b/subprojects/libvhost-user/meson.build<br>
@@ -5,6 +5,8 @@ project(&#39;libvhost-user&#39;, &#39;c&#39;,<br>
=C2=A0threads =3D dependency(&#39;threads&#39;)<br>
=C2=A0glib =3D dependency(&#39;glib-2.0&#39;)<br>
<br>
+qemu_common =3D subproject(&#39;qemu-common&#39;)<br>
+<br>
=C2=A0vhost_user =3D static_library(&#39;vhost-user&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files(&#39;libvhost-user.c&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependencies: threads,<br>
diff --git a/subprojects/libvhost-user/subprojects/qemu-common b/subproject=
s/libvhost-user/subprojects/qemu-common<br>
new file mode 120000<br>
index 000000000000..4c1c87018a7a<br>
--- /dev/null<br>
+++ b/subprojects/libvhost-user/subprojects/qemu-common<br>
@@ -0,0 +1 @@<br>
+../../qemu-common<br>
\ No newline at end of file<br>
diff --git a/subprojects/qemu-common/meson.build b/subprojects/qemu-common/=
meson.build<br>
new file mode 100644<br>
index 000000000000..8969b08473ef<br>
--- /dev/null<br>
+++ b/subprojects/qemu-common/meson.build<br>
@@ -0,0 +1,8 @@<br>
+project(&#39;qemu-common&#39;, &#39;c&#39;,<br>
+=C2=A0 license: &#39;GPL-2.0-or-later&#39;,<br>
+=C2=A0 default_options: [&#39;c_std=3Dgnu11&#39;]<br>
+)<br>
+<br>
+qemu_common_dep =3D declare_dependency(<br>
+=C2=A0 include_directories: include_directories(&#39;include&#39;),<br>
+)<br>
-- <br>
2.37.0.rc0<br>
<br>
</blockquote></div></div>

--000000000000b17fc805e39ce4d6--

