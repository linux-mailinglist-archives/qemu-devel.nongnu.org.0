Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856B51CF0D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 04:47:18 +0200 (CEST)
Received: from localhost ([::1]:44650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmnzw-0002p9-JO
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 22:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nmnyg-00028Z-BZ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 22:45:58 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nmnye-0002v4-2z
 for qemu-devel@nongnu.org; Thu, 05 May 2022 22:45:57 -0400
Received: by mail-ua1-x92d.google.com with SMTP id w21so2343572uan.3
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 19:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOlB6S5ln00fvSUrDxpNMaBJ0LlFDW6Vmwm76ztQ2Mk=;
 b=weATXT3BBppvBe6r8jzmRHZabBsjhkUIuM3BDgCwmaiaM68CEtthQQCUl8ZzR9b/f9
 /TEOhG8dNQADoPf9wATR+0crFuQCJa2LVKetUOjHTIxJc7eL7QWZFAb6sO0ncWDrDGu2
 h4ECA+xzlGHlbZrWcJGbKYdiQZu5JzGQ0osgtVeUNad126nQjSkmeFawkp9XWvbzVCZo
 sYsxfrFRL80YTqHLQCFNB3u8loUrrBkIahrMEF4jxDMWSu7kSTriJpy2RbOS0te8Ts8D
 wTiMxOROZ1sGpAU7UiJcHBMRBFv0ti1oxkx49j4Np7VM3L6IZyRQEihitHoVWYLz7bQ3
 hDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOlB6S5ln00fvSUrDxpNMaBJ0LlFDW6Vmwm76ztQ2Mk=;
 b=AHJcqVXEsnFBZoV89yUeL0bqnL01d91TaRX8lim30bLrwEdL5uz2L/l58RMRJTMUjd
 fgYNbIc9am4blTYZIIkB06GZYVdPFpnfnXP/1V6dAhu7G5NFnzqP5vcWea3xLPW4MxOR
 lkS7iXBwgkRmrePo/XHHyaYvjaREAoLmXKJ+m9P4rBvyceUJ1ZHROSkilagTS9Y3uplX
 agyWf/96pgoo+veKns1QyOGSd/0llgQlAmbfqWyu26nVvexw1FCggkNPKlVM0zPkHaGN
 rQy8tPBuGyVmLUpbLqdOjL19aIMuOooGVn6muVBiOEBSU4gxCgHFCSuEKTx/GgUCZZma
 UnPQ==
X-Gm-Message-State: AOAM533BSMhPbXsAAG7ll0yeBITsRq5SUdyy6LKnBQ+SGWc2lMf+yC8g
 iJ87coRcG263KB35ENYPeZh6MVw/PEcYe84QRwLIQQ==
X-Google-Smtp-Source: ABdhPJyUVZAQ0xXisFRRYunYr+1w9/TacnP2X6iQjzNcEDazvOqrMAX3jM8kpC44BLD/NGj6YkjsIWOmKPuD/VwMsGA=
X-Received: by 2002:a05:6130:90:b0:362:891c:edef with SMTP id
 x16-20020a056130009000b00362891cedefmr356409uaf.106.1651805154191; Thu, 05
 May 2022 19:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <YnRed7sw45lTbRjb@humpty.home.comstyle.com>
In-Reply-To: <YnRed7sw45lTbRjb@humpty.home.comstyle.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 5 May 2022 20:45:58 -0600
Message-ID: <CANCZdfpQ4oBx=bZq1xTPdRA3fZW=FSKw9-LGUQC9NcGROSFQuA@mail.gmail.com>
Subject: Re: [PATCH] tests/vm: update openbsd to release 7.1
To: Brad Smith <brad@comstyle.com>
Cc: Kyle Evans <kevans@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>, 
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000074401605de4edb61"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
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

--00000000000074401605de4edb61
Content-Type: text/plain; charset="UTF-8"

On Thu, May 5, 2022 at 5:32 PM Brad Smith <brad@comstyle.com> wrote:

> tests/vm/openbsd: Update to release 7.1
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

Though i didn't verify the csum.

Warner


> ---
>  tests/vm/openbsd | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index 337fe7c303..dc34b2718b 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>      name = "openbsd"
>      arch = "x86_64"
>
> -    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
> -    csum =
> "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
> +    link = "https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso"
> +    csum =
> "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396"
>      size = "20G"
>      pkgs = [
>          # tools
> --
> 2.36.0
>
>

--00000000000074401605de4edb61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 5:32 PM Brad S=
mith &lt;<a href=3D"mailto:brad@comstyle.com">brad@comstyle.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">tests/vm/ope=
nbsd: Update to release 7.1<br>
<br>
Signed-off-by: Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com" target=
=3D"_blank">brad@comstyle.com</a>&gt;<br></blockquote><div><br></div><div>R=
eviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.co=
m</a>&gt;</div><div><br></div><div>Though i didn&#39;t verify the csum.</di=
v><div><br></div><div>Warner</div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0tests/vm/openbsd | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/vm/openbsd b/tests/vm/openbsd<br>
index 337fe7c303..dc34b2718b 100755<br>
--- a/tests/vm/openbsd<br>
+++ b/tests/vm/openbsd<br>
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0name =3D &quot;openbsd&quot;<br>
=C2=A0 =C2=A0 =C2=A0arch =3D &quot;x86_64&quot;<br>
<br>
-=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://cdn.openbsd.org/pub/OpenBS=
D/7.0/amd64/install70.iso" rel=3D"noreferrer" target=3D"_blank">https://cdn=
.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso</a>&quot;<br>
-=C2=A0 =C2=A0 csum =3D &quot;1882f9a23c9800e5dba3dbd2cf0126f552605c915433e=
f4c5bb672610a4ca3a4&quot;<br>
+=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://cdn.openbsd.org/pub/OpenBS=
D/7.1/amd64/install71.iso" rel=3D"noreferrer" target=3D"_blank">https://cdn=
.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso</a>&quot;<br>
+=C2=A0 =C2=A0 csum =3D &quot;d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc84=
9c1133bdb0d67843396&quot;<br>
=C2=A0 =C2=A0 =C2=A0size =3D &quot;20G&quot;<br>
=C2=A0 =C2=A0 =C2=A0pkgs =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# tools<br>
-- <br>
2.36.0<br>
<br>
</blockquote></div></div>

--00000000000074401605de4edb61--

