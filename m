Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB276D52D1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 22:47:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjR4S-00047G-IQ; Mon, 03 Apr 2023 16:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pjR4P-000478-NR
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:46:30 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pjR4L-00073Q-L6
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:46:29 -0400
Received: by mail-ed1-x532.google.com with SMTP id y4so122460026edo.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 13:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680554782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cEpQQ2WK55L/rMciJwVHV+TqsiRcwa0BOp8BsRQ1qmk=;
 b=Gs3zjaMAuCTuSqsLOYObFOvIYqCRa04DlQBV1J+KrbrAmTXkThrRiOoIFBaB/HBYoD
 eZWXkixi6Qe9VBhfiJk4EHvR09PMwFp+sIwMyYY2yq30BtdqYa9+PoMMnQhOo7yIlS0k
 /jqF4YfiufpMmSe6GA5eGghbL7QQ0Plk74coK4m24iUtePGre9QwsSqX0XyzexAU+zEY
 SlVlAOIue6VYazwvmW3+2TeYvdn3t0rGjwWCx5qoE2NcE6RnEiOvDkKYRY31E+7io0LU
 tXtwLT+ou2HKYcMF+TaNd7RIZHLz5rY4wFs4desVov/ZIjbQnT+vRw9cw4iyR5g+0e40
 hw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680554782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cEpQQ2WK55L/rMciJwVHV+TqsiRcwa0BOp8BsRQ1qmk=;
 b=3yfcfBOTTdGJshhQdhuOxQCSihPruioUqKxXqAu/ssbti+tpVbD93ENGj8Kg/i/mYx
 bjysGQiIpm9V7BZkjDDEiw9jzx+7sc/+Ggh9kU4BYCCuZORs6elb8QE8ofyS43x2lYp7
 TC9/LeD0eWjoPMYqJeKvdBSVlxwqTnYHpG0WgC9uHj54O2TgLra1pgFRox2FmWJCUAJS
 egsjRqkXq1Tw8GFqZZH1gJo/5fOpLRt4DtfqdQHkWQi+dMJJcsHLzK84wHg7F/IyQFBX
 /xNnMG3AecRQcxXZI6svV2pTKUx1QhsQhNSo46NxmsMTkrSJhC8UJmSdaW1nCLH9Xe+X
 WZuQ==
X-Gm-Message-State: AAQBX9eKjGRxUkXXMLFNDvm//ix625YBLS7ySxJSkjZjeuAkhREEFbVk
 XgOjE6BWmAotBLvpl8UeUbQauGJEWzUP+31KUkTXSw==
X-Google-Smtp-Source: AKy350ZHotUpEPVrdkHr/SEDAf9f9ftBB1CTF8vsRcc01UPFJWxG6Y+qR1EEfqvJMOf6nr6dUA7mVjMwx2WR6AxvVvs=
X-Received: by 2002:a50:aad2:0:b0:501:d3a2:b4ae with SMTP id
 r18-20020a50aad2000000b00501d3a2b4aemr250599edc.7.1680554782361; Mon, 03 Apr
 2023 13:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-6-peter.maydell@linaro.org>
In-Reply-To: <20230403144637.2949366-6-peter.maydell@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 3 Apr 2023 14:46:11 -0600
Message-ID: <CANCZdfoxszQhVWgjX5+hjVVo4gMCnMwNgHdLsZWH_Uf1GrwBFQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] bsd-user: Add '-one-insn-per-tb' option
 equivalent to '-singlestep'
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Kyle Evans <kevans@freebsd.org>, libvir-list@redhat.com, 
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d41f9505f874a600"
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000d41f9505f874a600
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 8:46=E2=80=AFAM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> The '-singlestep' option is confusing, because it doesn't actually
> have anything to do with single-stepping the CPU. What it does do
> is force TCG emulation to put one guest instruction in each TB,
> which can be useful in some situations.
>
> Create a new command line argument -one-insn-per-tb, so we can
> document that -singlestep is just a deprecated synonym for it,
> and eventually perhaps drop it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: not even compile tested!
> ---
>

It looks good in theory. It may even compile. If ti does:

Reviewed-by: Warner Losh <imp@bsdimp.com>



>  docs/user/main.rst | 7 ++++++-
>  bsd-user/main.c    | 5 +++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/docs/user/main.rst b/docs/user/main.rst
> index f9ac701f4b1..f4786353965 100644
> --- a/docs/user/main.rst
> +++ b/docs/user/main.rst
> @@ -247,5 +247,10 @@ Debug options:
>  ``-p pagesize``
>     Act as if the host page size was 'pagesize' bytes
>
> +``-one-insn-per-tb``
> +   Run the emulation with one guest instruction per translation block.
> +   This slows down emulation a lot, but can be useful in some situations=
,
> +   such as when trying to analyse the logs produced by the ``-d`` option=
.
> +
>  ``-singlestep``
> -   Run the emulation in single step mode.
> +   This is a deprecated synonym for the ``-one-insn-per-tb`` option.
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index a9e5a127d38..9d604a670b7 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -162,7 +162,8 @@ static void usage(void)
>             "-d item1[,...]    enable logging of specified items\n"
>             "                  (use '-d help' for a list of log items)\n"
>             "-D logfile        write logs to 'logfile' (default stderr)\n=
"
> -           "-singlestep       always run in singlestep mode\n"
> +           "-one-insn-per-tb  run with one guest instruction per emulate=
d
> TB\n"
> +           "-singlestep       deprecated synonym for -one-insn-per-tb\n"
>             "-strace           log system calls\n"
>             "-trace
> [[enable=3D]<pattern>][,events=3D<file>][,file=3D<file>]\n"
>             "                  specify tracing options\n"
> @@ -385,7 +386,7 @@ int main(int argc, char **argv)
>              (void) envlist_unsetenv(envlist, "LD_PRELOAD");
>          } else if (!strcmp(r, "seed")) {
>              seed_optarg =3D optarg;
> -        } else if (!strcmp(r, "singlestep")) {
> +        } else if (!strcmp(r, "singlestep") || !strcmp(r,
> "one-insn-per-tb") {
>              opt_one_insn_per_tb =3D true;
>          } else if (!strcmp(r, "strace")) {
>              do_strace =3D 1;
> --
> 2.34.1
>
>

--000000000000d41f9505f874a600
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 3, 2023 at 8:46=E2=80=AFA=
M Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">The &#39;-singlestep&#39; option is confusing, because it does=
n&#39;t actually<br>
have anything to do with single-stepping the CPU. What it does do<br>
is force TCG emulation to put one guest instruction in each TB,<br>
which can be useful in some situations.<br>
<br>
Create a new command line argument -one-insn-per-tb, so we can<br>
document that -singlestep is just a deprecated synonym for it,<br>
and eventually perhaps drop it.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
---<br>
NB: not even compile tested!<br>
---<br></blockquote><div><br></div><div>It looks good in theory. It may eve=
n compile. If ti does:</div><div><br></div><div>Reviewed-by: Warner Losh &l=
t;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0docs/user/main.rst | 7 ++++++-<br>
=C2=A0bsd-user/main.c=C2=A0 =C2=A0 | 5 +++--<br>
=C2=A02 files changed, 9 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/docs/user/main.rst b/docs/user/main.rst<br>
index f9ac701f4b1..f4786353965 100644<br>
--- a/docs/user/main.rst<br>
+++ b/docs/user/main.rst<br>
@@ -247,5 +247,10 @@ Debug options:<br>
=C2=A0``-p pagesize``<br>
=C2=A0 =C2=A0 Act as if the host page size was &#39;pagesize&#39; bytes<br>
<br>
+``-one-insn-per-tb``<br>
+=C2=A0 =C2=A0Run the emulation with one guest instruction per translation =
block.<br>
+=C2=A0 =C2=A0This slows down emulation a lot, but can be useful in some si=
tuations,<br>
+=C2=A0 =C2=A0such as when trying to analyse the logs produced by the ``-d`=
` option.<br>
+<br>
=C2=A0``-singlestep``<br>
-=C2=A0 =C2=A0Run the emulation in single step mode.<br>
+=C2=A0 =C2=A0This is a deprecated synonym for the ``-one-insn-per-tb`` opt=
ion.<br>
diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
index a9e5a127d38..9d604a670b7 100644<br>
--- a/bsd-user/main.c<br>
+++ b/bsd-user/main.c<br>
@@ -162,7 +162,8 @@ static void usage(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-d item1[,...]=C2=A0 =C2=A0=
 enable logging of specified items\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (use &#39;-d help&#39; for a list of lo=
g items)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-D logfile=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 write logs to &#39;logfile&#39; (default stderr)\n&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-singlestep=C2=A0 =C2=A0 =
=C2=A0 =C2=A0always run in singlestep mode\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-one-insn-per-tb=C2=A0 run =
with one guest instruction per emulated TB\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-singlestep=C2=A0 =C2=A0 =
=C2=A0 =C2=A0deprecated synonym for -one-insn-per-tb\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-strace=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0log system calls\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-trace=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 [[enable=3D]&lt;pattern&gt;][,events=3D&lt;file&gt;][,=
file=3D&lt;file&gt;]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specify tracing options\n&quot;<br>
@@ -385,7 +386,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) envlist_unsetenv(env=
list, &quot;LD_PRELOAD&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!strcmp(r, &quot;seed&quot;)) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seed_optarg =3D optarg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strcmp(r, &quot;singlestep&quot;))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strcmp(r, &quot;singlestep&quot;) =
|| !strcmp(r, &quot;one-insn-per-tb&quot;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt_one_insn_per_tb =3D tru=
e;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!strcmp(r, &quot;strace&quot;)=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_strace =3D 1;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000d41f9505f874a600--

