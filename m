Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B950966B202
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:20:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH4my-0004F5-Pk; Sun, 15 Jan 2023 10:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arthur.sengileyev@gmail.com>)
 id 1pH4mw-0004EZ-FC; Sun, 15 Jan 2023 10:19:14 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arthur.sengileyev@gmail.com>)
 id 1pH4mu-0003w6-Ui; Sun, 15 Jan 2023 10:19:14 -0500
Received: by mail-qt1-x832.google.com with SMTP id x7so12774149qtv.13;
 Sun, 15 Jan 2023 07:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TXcJdcHzW9tweOnncHi3fy4+1C89KEs/hq8+D1UZ28o=;
 b=OZ6/C1DCw3/6Whr+rKWnc+NxHWg19uvTpaefyWywSc/jLjjnJuOO2+80nElSYWiChr
 vzqSnK2ViSC6wGCLfwgsP+aR5QGe/hIJqRK4hu0wgORlNGH7snzJBfwhOf6ykOBF8zan
 UF9ZA+DXMyYWS8Gei8/iq1mbSFkKy+PhRHp6TPKUV2+y+ujOCvNV0dDXVfvnY447Om0n
 yHHEhddEeGaDADmyyMl9xrx4BCSaJ/G84alIl9K6BqWYN0lrNg2J60/bJ+065xDRE9Wt
 LJl3CdqkkeAT0oTOVGU86A2zqz3mPFFYSnAMf9HlD8GfKhcuBD0Yt5mJsO7RNAoAsdhh
 mqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TXcJdcHzW9tweOnncHi3fy4+1C89KEs/hq8+D1UZ28o=;
 b=oOaioVyDXvPSFW1Dbh2vbGY6SjmISjmX/IDx3+qMkA7Xp53X6NSxeE7/AZ96zV/9XG
 ygfUsgASMSrilgwaOHE35tS6Ph4aC0j1Iw78oOIW8zUnG7CXYKmqYi7eDZ0L+Hn3qtlI
 giVbVcA5m58AHlSwdSdJfWCsD0m2Co1iE9eCQT17lHWNbsis6YCVj33SJoin7KHXOsgI
 N0+raKqXpv7bygTWuq6T8NTrL0NFpOP7+zdowXItjJ8zqougIV9ecgETEllsi+y8nAe0
 EJsO+jesavo3itIx8K8mskXw7Uiie3INuORGGcN0/N+6VdIIcITHSgfCfS4cdgwSzmSR
 rKlg==
X-Gm-Message-State: AFqh2kpzyMCDCxzeyqzUHGMQOz3eHzbAduo9mmWcmY0m0wfS2zddB5yY
 1JK6bkVjv0eY3S+ofiyJmXKWwHt+2R/K7uoZpzg=
X-Google-Smtp-Source: AMrXdXvfmIiu8joqM078PxttMDBePLXsX4sjAUEBOzn2nAm1Jh8Qiq1JemPF/xfNfMASmkJ5ZxOf/gZlY1IDFPn0RLY=
X-Received: by 2002:a05:622a:400b:b0:3a8:dce9:84cb with SMTP id
 cf11-20020a05622a400b00b003a8dce984cbmr4696483qtb.302.1673795951691; Sun, 15
 Jan 2023 07:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20230114184003.76193-1-arthur.sengileyev@gmail.com>
 <CAEUhbmVYWu2oH0w2iLBncxrVgh2uBRoQQkiV83bCkrN9q7AnfQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVYWu2oH0w2iLBncxrVgh2uBRoQQkiV83bCkrN9q7AnfQ@mail.gmail.com>
From: Arthur Sengileyev <arthur.sengileyev@gmail.com>
Date: Sun, 15 Jan 2023 17:19:00 +0200
Message-ID: <CAJOJsw3sDuGBnZxfyQTiGLwV41wUOFPZdWRgqSs0HAk1z5vt5w@mail.gmail.com>
Subject: Re: [PATCH v2] Windows installer: keep dependency cache
To: Bin Meng <bmeng.cn@gmail.com>
Cc: sw@weilnetz.de, jsnow@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000208f1c05f24efd48"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=arthur.sengileyev@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000208f1c05f24efd48
Content-Type: text/plain; charset="UTF-8"

Will resubmit v3 fixing this. Sorry for this. This is my first time using
the mailing list to submit changes.

Regards,
Arthur

On Sun, Jan 15, 2023 at 5:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Sun, Jan 15, 2023 at 2:40 AM Arthur Sengileyev
> <arthur.sengileyev@gmail.com> wrote:
> >
> > It should be possible to reuse cache built by previous iteration
> > to process next executables. Processed dependencies are already
> > skipped later based on dll name.
> >
> > Changes for v2:
> > (1) changed variable name
> > (2) changed wording in description
>
> The changelog should not be in the commit message.
>
> >
> > Signed-off-by: Arthur Sengileyev <arthur.sengileyev@gmail.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  scripts/nsis.py | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/nsis.py b/scripts/nsis.py
> > index 03ed7608a2..7cffba70ff 100644
> > --- a/scripts/nsis.py
> > +++ b/scripts/nsis.py
> > @@ -91,12 +91,13 @@ def main():
> >          print("Searching '%s' for the dependent dlls ..." % search_path)
> >          dlldir = os.path.join(destdir + prefix, "dll")
> >          os.mkdir(dlldir)
> > +        deps_cache = set()
> >
> >          for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
> >              signcode(exe)
> >
> >              # find all dll dependencies
> > -            deps = set(find_deps(exe, search_path, set()))
> > +            deps = set(find_deps(exe, search_path, deps_cache))
> >              deps.remove(exe)
> >
> >              # copy all dlls to the DLLDIR
> > --
>
> Regards,
> Bin
>

--000000000000208f1c05f24efd48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Will resubmit v3 fixing this. Sorry for this. This is=
 my first time using the mailing list to submit changes.</div><div><br></di=
v><div>Regards,</div><div>Arthur<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 15, 2023 at 5:16 PM B=
in Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun,=
 Jan 15, 2023 at 2:40 AM Arthur Sengileyev<br>
&lt;<a href=3D"mailto:arthur.sengileyev@gmail.com" target=3D"_blank">arthur=
.sengileyev@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; It should be possible to reuse cache built by previous iteration<br>
&gt; to process next executables. Processed dependencies are already<br>
&gt; skipped later based on dll name.<br>
&gt;<br>
&gt; Changes for v2:<br>
&gt; (1) changed variable name<br>
&gt; (2) changed wording in description<br>
<br>
The changelog should not be in the commit message.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Arthur Sengileyev &lt;<a href=3D"mailto:arthur.sengiley=
ev@gmail.com" target=3D"_blank">arthur.sengileyev@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=
=3D"_blank">bmeng.cn@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/nsis.py | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/scripts/nsis.py b/scripts/nsis.py<br>
&gt; index 03ed7608a2..7cffba70ff 100644<br>
&gt; --- a/scripts/nsis.py<br>
&gt; +++ b/scripts/nsis.py<br>
&gt; @@ -91,12 +91,13 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Searching &#39;%s&#39; f=
or the dependent dlls ...&quot; % search_path)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlldir =3D os.path.join(destdir + pr=
efix, &quot;dll&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(dlldir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps_cache =3D set()<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for exe in glob.glob(os.path.join(de=
stdir + prefix, &quot;*.exe&quot;)):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signcode(exe)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # find all dll depende=
ncies<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D set(find_deps(exe,=
 search_path, set()))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D set(find_deps(exe,=
 search_path, deps_cache))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.remove(exe)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # copy all dlls to the=
 DLLDIR<br>
&gt; --<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div>

--000000000000208f1c05f24efd48--

