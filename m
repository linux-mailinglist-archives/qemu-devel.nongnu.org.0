Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B7140FE1E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:46:41 +0200 (CEST)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRH0a-0005C4-Pn
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRGk0-0005ZA-Mh
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:29:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRGjv-0001UG-5f
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631896165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BdboGx8W84ZC6NJ45z/qxZdAkM1ckRZ0uRw9g/ecIyI=;
 b=XfF6ekNeAzuo/EM8VKPSeksFKoOZ3tcnHe1K6h/12O+71vJgzE0D+rR0rkncPwFhyQl4hh
 Mz4/Xcc3Mmjo4LdRxABSFnYpx+MgD8hOEdRJzy1OUqrz9NTgNY+s8tNv+ICj35c04yyyk5
 aNCmrKY4Wk5rbO2dDbHj7wlYDkdglLk=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-wIWX-vmROBG4Hzw7dSi8iQ-1; Fri, 17 Sep 2021 12:29:23 -0400
X-MC-Unique: wIWX-vmROBG4Hzw7dSi8iQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 s1-20020a05680810c100b00268d4e0d155so34169038ois.15
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BdboGx8W84ZC6NJ45z/qxZdAkM1ckRZ0uRw9g/ecIyI=;
 b=Oep83L0DYG6fSBjQFHsWP1dFGuawWnuuks098/DdsNs5eFeMeac8wVExcEhcXawiON
 6EO/TlhtuR20ggWsfnNtBKC8iiV130V6vl32o1h2EhWoMU7c9CwnTdha4OXCIUS3pFhZ
 396rW65RvY8Pey1JwPZBH/GOwXxOR2W6BJUenlsnIQsaTRiRha6ISIdovFgyK1HzgcOm
 NGvu8X1zAWG7z9HnNz9c69iqz3KiFJkxmHwnipONMFERho++5j/HOaa+HjcrnOOU+0DP
 m39ZrlWjz3N1DUE+8WdWhiLLedMm4hoK6q5U52pBYtlfUeZGPEnIJUQhCrloNlO4TAwq
 9Q5w==
X-Gm-Message-State: AOAM5332YsTp6GA/z4YxKccG66tIw/eegSYrt+E1uHQByNnd8wmhoY7l
 ftnlH+8CTQnylmOMXVlkkrtMwN5/qx35H7jP3aks3mBZsevCG3wo+NdbrrNLzwfgWoNirQ8GoiZ
 4k11sEYEB+KT/X7jpgkdaHxCGLFQacW8=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr10035958otq.374.1631896162642; 
 Fri, 17 Sep 2021 09:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyed36tyDGInVYXLfRBOmt9WWV0qjvS/29gb2qvOneRG1nxuIF+HOEoKtQyrnM9daMphBFUoVFTrEfXIeZwK8I=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr10035868otq.374.1631896161399; 
 Fri, 17 Sep 2021 09:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
 <20210917162332.3511179-7-alex.bennee@linaro.org>
In-Reply-To: <20210917162332.3511179-7-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 12:29:10 -0400
Message-ID: <CAFn=p-YK0KF9uAPTykb_gft7Jg6yt1JQsxVT_Ddsu9GmfYSsRw@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] python: Update for pylint 2.10
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000002f0fc05cc336fe1"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000002f0fc05cc336fe1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I sent a PR for this (and an additional fix that is needed as of
yesterday):

https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04477.html

Please drop this patch and prefer that series.

--js

On Fri, Sep 17, 2021 at 12:23 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

> From: John Snow <jsnow@redhat.com>
>
> A few new annoyances. Of note is the new warning for an unspecified
> encoding when opening a text file, which actually does indicate a
> potentially real problem; see
> https://www.python.org/dev/peps/pep-0597/#motivation
>
> Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
> terminal output. Note that Python states: "language code and encoding
> may be None if their values cannot be determined" -- use a platform
> default as a backup.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Message-Id: <20210916040955.628560-2-jsnow@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  python/qemu/machine/machine.py | 9 ++++++++-
>  python/setup.cfg               | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> index a7081b1845..51b6e79a13 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -19,6 +19,7 @@
>
>  import errno
>  from itertools import chain
> +import locale
>  import logging
>  import os
>  import shutil
> @@ -290,8 +291,14 @@ def get_pid(self) -> Optional[int]:
>          return self._subp.pid
>
>      def _load_io_log(self) -> None:
> +        # Assume that the output encoding of QEMU's terminal output
> +        # is defined by our locale. If indeterminate, use a platform
> default.
> +        _, encoding =3D locale.getlocale()
> +        if encoding is None:
> +            encoding =3D locale.getpreferredencoding(do_setlocale=3DFals=
e)
>          if self._qemu_log_path is not None:
> -            with open(self._qemu_log_path, "r") as iolog:
> +            with open(self._qemu_log_path, "r",
> +                      encoding=3Dencoding) as iolog:
>                  self._iolog =3D iolog.read()
>
>      @property
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 83909c1c97..0f0cab098f 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -104,6 +104,7 @@ good-names=3Di,
>  [pylint.similarities]
>  # Ignore imports when computing similarities.
>  ignore-imports=3Dyes
> +ignore-signatures=3Dyes
>
>  # Minimum lines number of a similarity.
>  # TODO: Remove after we opt in to Pylint 2.8.3. See commit msg.
> --
> 2.30.2
>
>

--00000000000002f0fc05cc336fe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, I sent a PR for this (and an additional fix that =
is needed as of yesterday):</div><div><br></div><div><a href=3D"https://lis=
ts.gnu.org/archive/html/qemu-devel/2021-09/msg04477.html">https://lists.gnu=
.org/archive/html/qemu-devel/2021-09/msg04477.html</a></div><div><br></div>=
<div>Please drop this patch and prefer that series.</div><div><br></div><di=
v>--js<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Sep 17, 2021 at 12:23 PM Alex Benn=C3=A9e &lt;<a href=3D"=
mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">From: John Snow &lt;<a=
 href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt=
;<br>
<br>
A few new annoyances. Of note is the new warning for an unspecified<br>
encoding when opening a text file, which actually does indicate a<br>
potentially real problem; see<br>
<a href=3D"https://www.python.org/dev/peps/pep-0597/#motivation" rel=3D"nor=
eferrer" target=3D"_blank">https://www.python.org/dev/peps/pep-0597/#motiva=
tion</a><br>
<br>
Use LC_CTYPE to determine an encoding to use for interpreting QEMU&#39;s<br=
>
terminal output. Note that Python states: &quot;language code and encoding<=
br>
may be None if their values cannot be determined&quot; -- use a platform<br=
>
default as a backup.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210916040955.628560-2-jsnow@redhat.com"=
 target=3D"_blank">20210916040955.628560-2-jsnow@redhat.com</a>&gt;<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Tested-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" t=
arget=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0python/qemu/machine/machine.py | 9 ++++++++-<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
=C2=A02 files changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.p=
y<br>
index a7081b1845..51b6e79a13 100644<br>
--- a/python/qemu/machine/machine.py<br>
+++ b/python/qemu/machine/machine.py<br>
@@ -19,6 +19,7 @@<br>
<br>
=C2=A0import errno<br>
=C2=A0from itertools import chain<br>
+import locale<br>
=C2=A0import logging<br>
=C2=A0import os<br>
=C2=A0import shutil<br>
@@ -290,8 +291,14 @@ def get_pid(self) -&gt; Optional[int]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self._subp.pid<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _load_io_log(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Assume that the output encoding of QEMU&#39;=
s terminal output<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # is defined by our locale. If indeterminate, =
use a platform default.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _, encoding =3D locale.getlocale()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if encoding is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding =3D locale.getpreferred=
encoding(do_setlocale=3DFalse)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self._qemu_log_path is not None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(self._qemu_log_path, &=
quot;r&quot;) as iolog:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(self._qemu_log_path, &=
quot;r&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 encoding=3Dencoding) as iolog:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._iolog =
=3D iolog.read()<br>
<br>
=C2=A0 =C2=A0 =C2=A0@property<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index 83909c1c97..0f0cab098f 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -104,6 +104,7 @@ good-names=3Di,<br>
=C2=A0[pylint.similarities]<br>
=C2=A0# Ignore imports when computing similarities.<br>
=C2=A0ignore-imports=3Dyes<br>
+ignore-signatures=3Dyes<br>
<br>
=C2=A0# Minimum lines number of a similarity.<br>
=C2=A0# TODO: Remove after we opt in to Pylint 2.8.3. See commit msg.<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--00000000000002f0fc05cc336fe1--


