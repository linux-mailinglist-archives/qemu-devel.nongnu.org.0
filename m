Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3E37D436
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:27:27 +0200 (CEST)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvS3-0004WZ-3F
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lgvQm-0003lv-Ha
 for qemu-devel@nongnu.org; Wed, 12 May 2021 16:26:08 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lgvQh-0004dU-7L
 for qemu-devel@nongnu.org; Wed, 12 May 2021 16:26:08 -0400
Received: by mail-qk1-x735.google.com with SMTP id f29so11318137qka.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 13:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t2wzT8buG5g5nGlLGxKAYpy93Ujr62CFu4PSjlYXsBE=;
 b=lVYHAkyOF6ewQPLdaBuQakT32Q/e7LcJkdF9lUIostFNCLQdMKDCC7asNLJSpuTbW0
 KJRDZFoNKrYSWJe6BNj+axQbHm0aDo256xiy0nvnqexN+y7cS9EjgbbvI0YaWW0Z87ko
 E2bcpW0fIK9eGPDo4F2Peg9/B6IKr6q4g6gS0MR9nWaACyKSveubcvEq7/X8S6VTJWL+
 FIc9eSMzZJi4DRYYL3K9ptdQfUpuV4WnIy4UQPTUsYamOoe8ZhidYHeQCg5XvmoFhsA5
 r9QLJEhQOeANBZAgDLkDR6B+us+akss4sOmgo2IeUAp6Pni9xirhp4TLn2FupHP0cuPU
 HuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t2wzT8buG5g5nGlLGxKAYpy93Ujr62CFu4PSjlYXsBE=;
 b=uUWkd8IRlBHZTXZKU2Uv7siDR+uSnT/2UD9E+7ZOmi2HBJ+lDjIDeISgSaZU1R/Kv+
 ONENc8r+/oB07LG2bBFaf2ahDsFCGVMI+8zmfgC8Ad64lDTY+Xa57r112J1x2GQaj2sQ
 Jw3Ay5H12j7AmfOxwJhoi1FCYdXXXVTgUW994af1opYCRg3WhC1+8ZrAchm9WUZxywEH
 tBjEboVEMs0hUbb45fJ2sRUI9StgJWg2BOsIA2SypZJU9Ch9xLr2d1wOUFITq4wRzGg1
 D/ea6/WRoNP/ffq0ZE51zGUP3TzroitjMketP0ctYMuv1tJU8DBe4xNbO2ljsMBu6kYP
 IXdQ==
X-Gm-Message-State: AOAM532cOVzSOunlIRzXnsQ2YBcdcvvIxwWSj9T0T9Dg8+9OyergcCBd
 +sYge8W72cKwAEiJuVxmd/yAg7TLjgrokHPXYoonxA==
X-Google-Smtp-Source: ABdhPJwBHxdaNDgRVuDibq99x9TO1k/cB6+f60I9LWdW8ipSXhS3KDYj2CUbm5+Gogiu+AJ7tarqY2Q+vuLm4umCyJE=
X-Received: by 2002:a37:f512:: with SMTP id l18mr34570960qkk.89.1620851161269; 
 Wed, 12 May 2021 13:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210512053714.3268162-1-f4bug@amsat.org>
 <20210512053714.3268162-7-f4bug@amsat.org>
In-Reply-To: <20210512053714.3268162-7-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 12 May 2021 14:25:50 -0600
Message-ID: <CANCZdfouF2RgQz55JDLEB8_aqKfc817f=a56Vj9VhEN=hrQMjw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] gitlab-ci: Add FreeBSD jobs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000b39ac505c227d161"
Received-SPF: none client-ip=2607:f8b0:4864:20::735;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b39ac505c227d161
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 11:37 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Add system/user emulation jobs on FreeBSD host.
>
> To build these jobs, you need to add a FreeBSD runner and
> add 'freebsd' to the QEMU_CUSTOM_RUNNER variable in your
> GitLab project.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-freebsd.yml | 59 ++++++++++++++++++++++++++++++
>  .gitlab-ci.d/qemu-project.yml      |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 .gitlab-ci.d/buildtest-freebsd.yml
>

This looks good to my eye, modulo the typo below. Fix that and it's

Reviewed by: Warner Losh <imp@bsdimp.com>

I can't wait to use it...

Warner


> diff --git a/.gitlab-ci.d/buildtest-freebsd.yml
> b/.gitlab-ci.d/buildtest-freebsd.yml
> new file mode 100644
> index 00000000000..683e815afbf
> --- /dev/null
> +++ b/.gitlab-ci.d/buildtest-freebsd.yml
> @@ -0,0 +1,59 @@
> +include:
> +  - local: '/.gitlab-ci.d/buildtest-template.yml'
> +
> +.runner_freebsd_template:
> +  rules:
> +    # To enable thss job template, add 'freebsd' to the QEMU_CUSTOM_RUNN=
ER
>

thss -> this


> +    # variable in your project UI via Settings -> CI/CD -> Variables
> +    #
> https://docs.gitlab.com/ee/ci/variables/README.html#project-cicd-variable=
s
> +    - if: $QEMU_CUSTOM_RUNNER =3D~ /freebsd/
> +      when: always
> +    - when: never
> +  tags:
> +    - freebsd
> +
> +build-user-freebsd:
> +  extends:
> +    - .runner_freebsd_template
> +    - .native_build_job_template
> +  image:
> +  variables:
> +    MAKE_CHECK_ARGS: check-build
> +    CONFIGURE_ARGS: --disable-system --python=3D/usr/local/bin/python3.7
> +
> +build-system-freebsd:
> +  extends:
> +    - .runner_freebsd_template
> +    - .native_build_job_template
> +  image:
> +  variables:
> +    TARGETS: aarch64-softmmu avr-softmmu hppa-softmmu ppc64-softmmu
> +      riscv64-softmmu s390x-softmmu x86_64-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +    CONFIGURE_ARGS: --enable-trace-backends=3Dlog,simple,syslog
> +      --python=3D/usr/local/bin/python3.7
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - .git-submodule-status
> +      - build
> +
> +check-system-freebsd:
> +  extends:
> +    - .runner_freebsd_template
> +    - .native_test_job_template
> +  needs:
> +    - job: build-system-freebsd
> +      artifacts: true
> +  variables:
> +    MAKE_CHECK_ARGS: check
> +
> +acceptance-system-freebsd:
> +  extends:
> +    - .runner_freebsd_template
> +    - .integration_test_job_template
> +  needs:
> +    - job: build-system-freebsd
> +      artifacts: true
> +  variables:
> +    MAKE_CHECK_ARGS: check-acceptance
> diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.ym=
l
> index 64cb2ba1da5..5dcf1d34c5b 100644
> --- a/.gitlab-ci.d/qemu-project.yml
> +++ b/.gitlab-ci.d/qemu-project.yml
> @@ -8,4 +8,5 @@ include:
>    - local: '/.gitlab-ci.d/containers.yml'
>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>    - local: '/.gitlab-ci.d/buildtest.yml'
> +  - local: '/.gitlab-ci.d/buildtest-freebsd.yml'
>    - local: '/.gitlab-ci.d/static_checks.yml'
> --
> 2.26.3
>
>

--000000000000b39ac505c227d161
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 11, 2021 at 11:37 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Add system/user emulation jobs on FreeBSD host.<br>
<br>
To build these jobs, you need to add a FreeBSD runner and<br>
add &#39;freebsd&#39; to the QEMU_CUSTOM_RUNNER variable in your<br>
GitLab project.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0.gitlab-ci.d/buildtest-freebsd.yml | 59 +++++++++++++++++++++++++++++=
+<br>
=C2=A0.gitlab-ci.d/qemu-project.yml=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 60 insertions(+)<br>
=C2=A0create mode 100644 .gitlab-ci.d/buildtest-freebsd.yml<br></blockquote=
><div><br></div><div>This looks good to my eye, modulo the typo below. Fix =
that and it&#39;s</div><div><br></div><div>Reviewed by: Warner Losh &lt;<a =
href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></div><=
div>I can&#39;t wait to use it...</div><div><br></div><div>Warner</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/.gitlab-ci.d/buildtest-freebsd.yml b/.gitlab-ci.d/buildtest-fr=
eebsd.yml<br>
new file mode 100644<br>
index 00000000000..683e815afbf<br>
--- /dev/null<br>
+++ b/.gitlab-ci.d/buildtest-freebsd.yml<br>
@@ -0,0 +1,59 @@<br>
+include:<br>
+=C2=A0 - local: &#39;/.gitlab-ci.d/buildtest-template.yml&#39;<br>
+<br>
+.runner_freebsd_template:<br>
+=C2=A0 rules:<br>
+=C2=A0 =C2=A0 # To enable thss job template, add &#39;freebsd&#39; to the =
QEMU_CUSTOM_RUNNER<br></blockquote><div><br></div><div>thss -&gt; this</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 # variable in your project UI via Settings -&gt; CI/CD -&gt;=
 Variables<br>
+=C2=A0 =C2=A0 # <a href=3D"https://docs.gitlab.com/ee/ci/variables/README.=
html#project-cicd-variables" rel=3D"noreferrer" target=3D"_blank">https://d=
ocs.gitlab.com/ee/ci/variables/README.html#project-cicd-variables</a><br>
+=C2=A0 =C2=A0 - if: $QEMU_CUSTOM_RUNNER =3D~ /freebsd/<br>
+=C2=A0 =C2=A0 =C2=A0 when: always<br>
+=C2=A0 =C2=A0 - when: never<br>
+=C2=A0 tags:<br>
+=C2=A0 =C2=A0 - freebsd<br>
+<br>
+build-user-freebsd:<br>
+=C2=A0 extends:<br>
+=C2=A0 =C2=A0 - .runner_freebsd_template<br>
+=C2=A0 =C2=A0 - .native_build_job_template<br>
+=C2=A0 image:<br>
+=C2=A0 variables:<br>
+=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check-build<br>
+=C2=A0 =C2=A0 CONFIGURE_ARGS: --disable-system --python=3D/usr/local/bin/p=
ython3.7<br>
+<br>
+build-system-freebsd:<br>
+=C2=A0 extends:<br>
+=C2=A0 =C2=A0 - .runner_freebsd_template<br>
+=C2=A0 =C2=A0 - .native_build_job_template<br>
+=C2=A0 image:<br>
+=C2=A0 variables:<br>
+=C2=A0 =C2=A0 TARGETS: aarch64-softmmu avr-softmmu hppa-softmmu ppc64-soft=
mmu<br>
+=C2=A0 =C2=A0 =C2=A0 riscv64-softmmu s390x-softmmu x86_64-softmmu<br>
+=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check-build<br>
+=C2=A0 =C2=A0 CONFIGURE_ARGS: --enable-trace-backends=3Dlog,simple,syslog<=
br>
+=C2=A0 =C2=A0 =C2=A0 --python=3D/usr/local/bin/python3.7<br>
+=C2=A0 artifacts:<br>
+=C2=A0 =C2=A0 expire_in: 2 days<br>
+=C2=A0 =C2=A0 paths:<br>
+=C2=A0 =C2=A0 =C2=A0 - .git-submodule-status<br>
+=C2=A0 =C2=A0 =C2=A0 - build<br>
+<br>
+check-system-freebsd:<br>
+=C2=A0 extends:<br>
+=C2=A0 =C2=A0 - .runner_freebsd_template<br>
+=C2=A0 =C2=A0 - .native_test_job_template<br>
+=C2=A0 needs:<br>
+=C2=A0 =C2=A0 - job: build-system-freebsd<br>
+=C2=A0 =C2=A0 =C2=A0 artifacts: true<br>
+=C2=A0 variables:<br>
+=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
+<br>
+acceptance-system-freebsd:<br>
+=C2=A0 extends:<br>
+=C2=A0 =C2=A0 - .runner_freebsd_template<br>
+=C2=A0 =C2=A0 - .integration_test_job_template<br>
+=C2=A0 needs:<br>
+=C2=A0 =C2=A0 - job: build-system-freebsd<br>
+=C2=A0 =C2=A0 =C2=A0 artifacts: true<br>
+=C2=A0 variables:<br>
+=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check-acceptance<br>
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml<=
br>
index 64cb2ba1da5..5dcf1d34c5b 100644<br>
--- a/.gitlab-ci.d/qemu-project.yml<br>
+++ b/.gitlab-ci.d/qemu-project.yml<br>
@@ -8,4 +8,5 @@ include:<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/containers.yml&#39;<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/crossbuilds.yml&#39;<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/buildtest.yml&#39;<br>
+=C2=A0 - local: &#39;/.gitlab-ci.d/buildtest-freebsd.yml&#39;<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/static_checks.yml&#39;<br>
-- <br>
2.26.3<br>
<br>
</blockquote></div></div>

--000000000000b39ac505c227d161--

