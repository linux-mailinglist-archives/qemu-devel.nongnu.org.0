Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF272EF4CB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:26:54 +0100 (CET)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtfB-0001Fb-Sa
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxte7-0000nR-Vr
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:25:47 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:39483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxte6-0007Oc-7m
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:25:47 -0500
Received: by mail-lf1-x133.google.com with SMTP id a12so23788291lfl.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=XjKMffuEV+w1dGE/oKM+hHX5ErhmkqlkockpJ9fVrRk=;
 b=nupuQQ4GX2BiBXgCEdrPXitirZ7yY4/1vFgwG3ZszFvfo//HWZR0PcjOJQU/v+DrlN
 VasQag7Sd6q/NikGpAlD4/+MBB/KDzSYfArIrvPsqmwDoRsN5wkvI0HNRjcU8A7Kcpvn
 TsZfmRNACaheTyTjY5mqBBSZB2ogs9ZUpKNOyu/ml+iPACaokrnBH6DLPvgD7T9jZ9mr
 zGVJNOUvwHnG6y9/fRNl6V69IT0QLeeq8ApL9h+w9oTSmhnGNm0XdNw3Mu5G14VDGwZQ
 DcLv/VPncb/IhxbPl1zPEPyAjUeFAqHw+d2G2DREmxksTK7IyWWCh9XqDi5EVdX8rwIZ
 RPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=XjKMffuEV+w1dGE/oKM+hHX5ErhmkqlkockpJ9fVrRk=;
 b=ZZfQkHPROGn9qN9E/+BdlW4M7T8XZZqwK7Zn0kCEJOlRL9tdMy84/tDeZK0pkh2Xyf
 U8vbV8JMVSC/gLu9+fWAnoqAu8zG2BPU7b8FDJeNuq0xfF3CUuCpvWgrccflGl3R6FSd
 zYVHZrmHCNAuGvbFjAQucChgvpRA6pmV2LZvIphmxztE2nSMJDOVu0Au3kt0p5FwnSwv
 DVe49aUIUTcC8KrYBjJScjUiT+Whwk/J35V3PnRBLuc1DrVpgZ/76UWcuWvSOJ5mF649
 30dyCTooIzZUAgmv9FEdiUNHMj7XLiIi6xzLxJ6jyzOcANCLcHwgSE6MpwnXSSRvaJnU
 JtWA==
X-Gm-Message-State: AOAM530+8bGqHE7BVdDnSBDr8aVYVIYwUxvHiQugwUlv7EzIqdp0GBB+
 fh5bw5AG2xqxCXp+dXwZno079tme8ikaGxUR57w=
X-Google-Smtp-Source: ABdhPJwtA4fZlTkmh3WwKxIMWlEb7fM/BpukGdgy8YkMdG4mYA/Lic/6/A8EdRvQu8n+kZv2XxA4oEoCluexzJEUDr0=
X-Received: by 2002:a2e:8416:: with SMTP id z22mr1795041ljg.347.1610119544645; 
 Fri, 08 Jan 2021 07:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20210108151632.277015-1-f4bug@amsat.org>
In-Reply-To: <20210108151632.277015-1-f4bug@amsat.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 8 Jan 2021 07:25:33 -0800
Message-ID: <CAE2XoE_b=7bkJ6Z8whWfRuzp8ode-rUQWKbQ_fw5mQGsPdG7GQ@mail.gmail.com>
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000008130ae05b8652bde"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO=1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008130ae05b8652bde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2021 at 7:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:
>
> When decodetree.py was added in commit 568ae7efae7, QEMU was
> using Python 2 which happily reads UTF-8 files in text mode.
> Python 3 requires either UTF-8 locale or an explicit encoding
> passed to open(). Now that Python 3 is required, explicit
> UTF-8 encoding for decodetree sources.
>
> This fixes:
>
>   $ /usr/bin/python3 scripts/decodetree.py test.decode
>   Traceback (most recent call last):
>     File "scripts/decodetree.py", line 1397, in <module>
>       main()
>     File "scripts/decodetree.py", line 1308, in main
>       parse_file(f, toppat)
>     File "scripts/decodetree.py", line 994, in parse_file
>       for line in f:
>     File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>       return codecs.ascii_decode(input, self.errors)[0]
>   UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 80=
:
>   ordinal not in range(128)
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/decodetree.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 47aa9caf6d1..fa40903cff1 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -1304,7 +1304,7 @@ def main():
>
>      for filename in args:
>          input_file =3D filename
> -        f =3D open(filename, 'r')
> +        f =3D open(filename, 'r', encoding=3D'utf-8')
>          parse_file(f, toppat)
>          f.close()
>
> --
> 2.26.2
>
>


Reviewed-by:  Yonggang Luo <l <peter.maydell@linaro.org>uoyonggang@gmail.co=
m
>

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000008130ae05b8652bde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Jan 8, 2021 at 7:18 AM Philippe Mathieu-Da=
ud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@ams=
at.org</a>&gt; wrote:<br>&gt;<br>&gt; When decodetree.py was added in commi=
t 568ae7efae7, QEMU was<br>&gt; using Python 2 which happily reads UTF-8 fi=
les in text mode.<br>&gt; Python 3 requires either UTF-8 locale or an expli=
cit encoding<br>&gt; passed to open(). Now that Python 3 is required, expli=
cit<br>&gt; UTF-8 encoding for decodetree sources.<br>&gt;<br>&gt; This fix=
es:<br>&gt;<br>&gt; =C2=A0 $ /usr/bin/python3 scripts/decodetree.py test.de=
code<br>&gt; =C2=A0 Traceback (most recent call last):<br>&gt; =C2=A0 =C2=
=A0 File &quot;scripts/decodetree.py&quot;, line 1397, in &lt;module&gt;<br=
>&gt; =C2=A0 =C2=A0 =C2=A0 main()<br>&gt; =C2=A0 =C2=A0 File &quot;scripts/=
decodetree.py&quot;, line 1308, in main<br>&gt; =C2=A0 =C2=A0 =C2=A0 parse_=
file(f, toppat)<br>&gt; =C2=A0 =C2=A0 File &quot;scripts/decodetree.py&quot=
;, line 994, in parse_file<br>&gt; =C2=A0 =C2=A0 =C2=A0 for line in f:<br>&=
gt; =C2=A0 =C2=A0 File &quot;/usr/lib/python3.6/encodings/ascii.py&quot;, l=
ine 26, in decode<br>&gt; =C2=A0 =C2=A0 =C2=A0 return codecs.ascii_decode(i=
nput, self.errors)[0]<br>&gt; =C2=A0 UnicodeDecodeError: &#39;ascii&#39; co=
dec can&#39;t decode byte 0xc3 in position 80:<br>&gt; =C2=A0 ordinal not i=
n range(128)<br>&gt;<br>&gt; Reported-by: Peter Maydell &lt;<a href=3D"mail=
to:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>=
&gt;<br>&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mail=
to:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>&gt; ---<b=
r>&gt; =C2=A0scripts/decodetree.py | 2 +-<br>&gt; =C2=A01 file changed, 1 i=
nsertion(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/scripts/decodetree.=
py b/scripts/decodetree.py<br>&gt; index 47aa9caf6d1..fa40903cff1 100644<br=
>&gt; --- a/scripts/decodetree.py<br>&gt; +++ b/scripts/decodetree.py<br>&g=
t; @@ -1304,7 +1304,7 @@ def main():<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0fo=
r filename in args:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_file =
=3D filename<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open(filename, &#39=
;r&#39;)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open(filename, &#39;r&#=
39;, encoding=3D&#39;utf-8&#39;)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
parse_file(f, toppat)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()<b=
r>&gt;<br>&gt; --<br>&gt; 2.26.2<br>&gt;<br>&gt;<br><br><div><br></div><div=
>Reviewed-by:=C2=A0

Yonggang Luo &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bla=
nk">l</a><a href=3D"mailto:uoyonggang@gmail.com" target=3D"_blank">uoyongga=
ng@gmail.com</a>&gt;=C2=A0=C2=A0<div class=3D"gmail-yj6qo gmail-ajU" style=
=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px 0px"><br class=
=3D"gmail-Apple-interchange-newline"></div>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br=
>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--0000000000008130ae05b8652bde--

