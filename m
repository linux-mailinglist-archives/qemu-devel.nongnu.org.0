Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D380E53518B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 17:38:28 +0200 (CEST)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuFZD-00064m-ED
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 11:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nuFVf-00051B-Uo
 for qemu-devel@nongnu.org; Thu, 26 May 2022 11:34:48 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:40823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nuFVd-0006c3-QA
 for qemu-devel@nongnu.org; Thu, 26 May 2022 11:34:47 -0400
Received: by mail-lj1-x229.google.com with SMTP id r3so2139230ljd.7
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KWEgs/A9cOUHte+SqIxG83rhn4eJC3nAZ9iJZQHVLjc=;
 b=S6b2dUo7ehTh5Gzj0yxU3W709a8c0bpNNZjNSGSri2666JAc/hhZdXtz7EpgJ7ahmd
 kzVoaHFYL78opqT/X5//Jzo7K7bKu+qQK5V/N3RGYyX0VUSJz5l28u8q3u5wgmWp1h4K
 6sMTfzBCAetMV+moBcuYsb/ZM1eesFPoOQ/PvhSkfjmUVWqKpNgjVlYcF91fjenVfG5f
 WBta9u5mQAbDZbX/jDFsCNfZ3R+J3JkvamgFDxWqIseSVecVKG98WlROe64Oice5Tn6i
 wH2b8HaZQKO8jRtTWsdWOP0Ll/eg6MFvb7blSBDExeAB7but1b+uczLA65XjUr4Egzge
 m5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWEgs/A9cOUHte+SqIxG83rhn4eJC3nAZ9iJZQHVLjc=;
 b=hyFkZb0u5ucXnP+efcvaxdqDV6goHxWwmHRawKNKnwb6uHToDw/vWaFPGBPrINhG6n
 +nwHNMLT0UGatweOvYpRDng2MccMYRvKja1GCm9E0btl7OlsCI0mmxqLk86GGTa/akSA
 DdteLC04OYOMMGFSqr4wrBf/2DSeSP76b6v58hzcMID7MdHYMWKZ3dmjCh73ugniQxQ/
 LcS/hUvcX6bMvvs0OwFf2G/aswaKJ/CyKnwlj6JUiXCQijlz5BIjWNgPkQZ/1J5dBMUq
 Cdpt5ruavC383WhprjjyaXV5P24vOwxqxyNzITqHRdlTIJ4snkB9dQc/l5vkgNJiIQAx
 P96g==
X-Gm-Message-State: AOAM531qAOkB1rCSFoE4pcXJACAZRah21sjTiVfzYlyWYhyCVbuQh4S2
 QHzVZi3U6NVov8gfCqiDrwSy6yOeJH4/HhdjPXk=
X-Google-Smtp-Source: ABdhPJz8NjMuSmnLYSY5bWXqt4oRoigHtwT6I9/K21uUw3VuEi/fIN/AVa6HjstABxNnkRVGt5vq5Nez4LUM7WmPKuU=
X-Received: by 2002:a2e:8e21:0:b0:253:d33d:d684 with SMTP id
 r1-20020a2e8e21000000b00253d33dd684mr21715743ljk.507.1653579282757; Thu, 26
 May 2022 08:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220526110705.59952-1-berrange@redhat.com>
 <20220526110705.59952-6-berrange@redhat.com>
In-Reply-To: <20220526110705.59952-6-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 26 May 2022 17:34:31 +0200
Message-ID: <CAJ+F1CKQpEQFjVE4ZO9Qmy6YKBNm1r50xXFnEoBihgjk88HFKQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] gitlab: don't run CI jobs in forks by default
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c1bd2d05dfebedcd"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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

--000000000000c1bd2d05dfebedcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 26, 2022 at 1:28 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> To preserve CI shared runner credits we don't want to run
> pipelines on every push.
>
> This sets up the config to that pipelines are never created
>

to/so ?


> for contributors by default. To override this the QEMU_CI
> variable can be set to a non-zero value. If set to 1, the
> pipeline will be created but all jobs will remain manually
> started. The contributor can selectively run jobs that they
> care about. If set to 2, the pipeline will be created and
> all jobs will immediately start.
>
> This behavior can be controlled using push variables
>
>   git push -o ci.variable=3DQEMU_CI=3D1
>
> To make this more convenient define an alias
>
>    git config --local alias.push-ci "push -o ci.variable=3DQEMU_CI=3D1"
>    git config --local alias.push-ci-now "push -o ci.variable=3DQEMU_CI=3D=
2"
>
> Which lets you run
>
>   git push-ci
>
> to create the pipeline, or
>
>   git push-ci-now
>
> to create and run the pipeline
>


Nice
Is there a place to put that in the devel documentation? Either in
submiting-a-patch.rst "Test your patches" (there is a broken link
Testing#Continuous_Integration here, wonder why sphinx doesn't catch it) or
somewhere in ci.rst documents perhaps.


> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/base.yml      |  9 +++++++++
>  docs/devel/ci-jobs.rst.inc | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 6a918abbda..62f2a850c3 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -28,6 +28,10 @@
>      - if: '$QEMU_JOB_ONLY_FORKS =3D=3D "1" && $CI_PROJECT_NAMESPACE =3D=
=3D
> "qemu-project"'
>        when: never
>
> +    # Forks don't get pipelines unless QEMU_CI=3D1 or QEMU_CI=3D2 is set
> +    - if: '$QEMU_CI !=3D "1" && $QEMU_CI !=3D "2" && $CI_PROJECT_NAMESPA=
CE !=3D
> "qemu-project"'
> +      when: never
> +
>      # Avocado jobs don't run in forks unless $QEMU_CI_AVOCADO_TESTING is
> set
>      - if: '$QEMU_JOB_AVOCADO && $QEMU_CI_AVOCADO_TESTING !=3D "1" &&
> $CI_PROJECT_NAMESPACE !=3D "qemu-project"'
>        when: never
> @@ -59,5 +63,10 @@
>      # an earlier criteria
>      #############################################################
>
> +    # Forks pipeline jobs don't start automatically unless
> +    # QEMU_CI=3D2 is set
> +    - if: '$QEMU_CI !=3D "2" && $CI_PROJECT_NAMESPACE !=3D "qemu-project=
"'
> +      when: manual
> +
>      # Jobs can run if any jobs they depend on were successfull
>      - when: on_success
> diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
> index 0b4926e537..e36c8cc68d 100644
> --- a/docs/devel/ci-jobs.rst.inc
> +++ b/docs/devel/ci-jobs.rst.inc
> @@ -98,6 +98,18 @@ Contributor controlled runtime variables
>  The following variables may be set by contributors to control
>  job execution
>
> +QEMU_CI
> +~~~~~~~
> +
> +By default, no pipelines will be created on contributor forks
> +in order to preserve CI credits
> +
> +Set this variable to 1 to create the pipelines, but leave all
> +the jobs to be manually started from the UI
> +
> +Set this variable to 2 to create the pipelines and run all
> +the jobs immediately, as was historicaly behaviour
> +
>  QEMU_CI_AVOCADO_TESTING
>  ~~~~~~~~~~~~~~~~~~~~~~~
>  By default, tests using the Avocado framework are not run automatically =
in
> --
> 2.36.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c1bd2d05dfebedcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 26, 2022 at 1:28 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">To preserve CI shared runner credits we don&#39;t want to run<br>
pipelines on every push.<br>
<br>
This sets up the config to that pipelines are never created<br></blockquote=
><div><br></div><div>to/so ?</div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
for contributors by default. To override this the QEMU_CI<br>
variable can be set to a non-zero value. If set to 1, the<br>
pipeline will be created but all jobs will remain manually<br>
started. The contributor can selectively run jobs that they<br>
care about. If set to 2, the pipeline will be created and<br>
all jobs will immediately start.<br>
<br>
This behavior can be controlled using push variables<br>
<br>
=C2=A0 git push -o ci.variable=3DQEMU_CI=3D1<br>
<br>
To make this more convenient define an alias<br>
<br>
=C2=A0 =C2=A0git config --local alias.push-ci &quot;push -o ci.variable=3DQ=
EMU_CI=3D1&quot;<br>
=C2=A0 =C2=A0git config --local alias.push-ci-now &quot;push -o ci.variable=
=3DQEMU_CI=3D2&quot;<br>
<br>
Which lets you run<br>
<br>
=C2=A0 git push-ci<br>
<br>
to create the pipeline, or<br>
<br>
=C2=A0 git push-ci-now<br>
<br>
to create and run the pipeline<br></blockquote><div><br></div><div><br></di=
v><div>Nice</div><div>Is there a place to put that in the devel documentati=
on? Either in submiting-a-patch.rst &quot;Test your patches&quot; (there is=
 a broken link Testing#Continuous_Integration here, wonder why sphinx doesn=
&#39;t catch it) or somewhere in ci.rst documents perhaps.<br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
---<br>
=C2=A0.gitlab-ci.d/base.yml=C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++++++++<br>
=C2=A0docs/devel/ci-jobs.rst.inc | 12 ++++++++++++<br>
=C2=A02 files changed, 21 insertions(+)<br>
<br>
diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml<br>
index 6a918abbda..62f2a850c3 100644<br>
--- a/.gitlab-ci.d/base.yml<br>
+++ b/.gitlab-ci.d/base.yml<br>
@@ -28,6 +28,10 @@<br>
=C2=A0 =C2=A0 =C2=A0- if: &#39;$QEMU_JOB_ONLY_FORKS =3D=3D &quot;1&quot; &a=
mp;&amp; $CI_PROJECT_NAMESPACE =3D=3D &quot;qemu-project&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0when: never<br>
<br>
+=C2=A0 =C2=A0 # Forks don&#39;t get pipelines unless QEMU_CI=3D1 or QEMU_C=
I=3D2 is set<br>
+=C2=A0 =C2=A0 - if: &#39;$QEMU_CI !=3D &quot;1&quot; &amp;&amp; $QEMU_CI !=
=3D &quot;2&quot; &amp;&amp; $CI_PROJECT_NAMESPACE !=3D &quot;qemu-project&=
quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 when: never<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Avocado jobs don&#39;t run in forks unless $QEMU_CI_A=
VOCADO_TESTING is set<br>
=C2=A0 =C2=A0 =C2=A0- if: &#39;$QEMU_JOB_AVOCADO &amp;&amp; $QEMU_CI_AVOCAD=
O_TESTING !=3D &quot;1&quot; &amp;&amp; $CI_PROJECT_NAMESPACE !=3D &quot;qe=
mu-project&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0when: never<br>
@@ -59,5 +63,10 @@<br>
=C2=A0 =C2=A0 =C2=A0# an earlier criteria<br>
=C2=A0 =C2=A0 =C2=A0#######################################################=
######<br>
<br>
+=C2=A0 =C2=A0 # Forks pipeline jobs don&#39;t start automatically unless<b=
r>
+=C2=A0 =C2=A0 # QEMU_CI=3D2 is set<br>
+=C2=A0 =C2=A0 - if: &#39;$QEMU_CI !=3D &quot;2&quot; &amp;&amp; $CI_PROJEC=
T_NAMESPACE !=3D &quot;qemu-project&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 when: manual<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Jobs can run if any jobs they depend on were successf=
ull<br>
=C2=A0 =C2=A0 =C2=A0- when: on_success<br>
diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc<br>
index 0b4926e537..e36c8cc68d 100644<br>
--- a/docs/devel/ci-jobs.rst.inc<br>
+++ b/docs/devel/ci-jobs.rst.inc<br>
@@ -98,6 +98,18 @@ Contributor controlled runtime variables<br>
=C2=A0The following variables may be set by contributors to control<br>
=C2=A0job execution<br>
<br>
+QEMU_CI<br>
+~~~~~~~<br>
+<br>
+By default, no pipelines will be created on contributor forks<br>
+in order to preserve CI credits<br>
+<br>
+Set this variable to 1 to create the pipelines, but leave all<br>
+the jobs to be manually started from the UI<br>
+<br>
+Set this variable to 2 to create the pipelines and run all<br>
+the jobs immediately, as was historicaly behaviour<br>
+<br>
=C2=A0QEMU_CI_AVOCADO_TESTING<br>
=C2=A0~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0By default, tests using the Avocado framework are not run automatical=
ly in<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c1bd2d05dfebedcd--

