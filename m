Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6FC571F89
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:37:28 +0200 (CEST)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHx1-00039t-Cj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHre-0006b4-T2
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:31:58 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:42622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHrc-0005oz-SR
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:31:54 -0400
Received: by mail-vs1-xe35.google.com with SMTP id i186so8147060vsc.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q6kBR/ynFUaaBX0EY23beWsf2vMMGIfUScEZQhgjCBM=;
 b=XD5GzeI6CyzdthlrWbHPmVUJlI2cEGTOBxC98F63+CtzXVPTGaLV967ZltCBKfEiKg
 ljNi4GMdcwMAbL9JZALGnFXeZ2CZ/OrF8aeOnjha9/WyPcj2ArEsYimYuZ3xslYpygnv
 xCZEdhMSLtCoXldtvbmKP07EBWR2nLU72e1j56HqEit2OC/bjNVSzodercrHYwk5szwf
 aYqHTyywVgecyEj6vsIYNttdJ4hw/E/CBl0BBdNy4Jwt778r4FxU6EPoP76NbP9NQlmo
 0WJvnHrpsK35AFHFfmYLEt/f58BqKi9qwEl6oJjHzBTFcBlQq7B6HpH0s0ZBpAAQF2EE
 Yw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6kBR/ynFUaaBX0EY23beWsf2vMMGIfUScEZQhgjCBM=;
 b=D6IwKtZSS4LBVDWCrfg9Y0G5SBFB15hJ4VWgKz+ab+s1nXzy/2dwexGxmcKQPfqoQC
 z9GQCGDJcIJnFSOaonlwnVGTQJXOmLn4CLtq+CZDYsWvqzW0ln0yph3vPn16+bW5NQOQ
 psj4QTHsh6BGGyg+Ba82XdYM6HDxN3Cvt6I7tPxo92ZIkkCBgPxDWE3D1HCnTy0TtgbZ
 0+lh6DiANT3eXcopWReGidjmSoqfNV7YTbt+WU4JV2299hH/cavwWJcJxuK91YcNNxb5
 L5XHogUR3zLyjujALyr7+pY3kdlkGPFGs7FI//9KFSbW1QrWL0HnO8JyJEMzgL5GIx7X
 Rllw==
X-Gm-Message-State: AJIora/k3yWdh5Po3ea5fStSjY27d1rmy57gHqOMyOHpzlCUK28LXhgA
 q5yTqP3Oe+PYo3q3w/kJhPMbs1vSn5rXP9rQSckS1Q==
X-Google-Smtp-Source: AGRyM1vNPqUqjaAF8cQtWeM40yN1JW9tGBmq7GOpiPUq1AMvyoZR5tH7tZtUQ6Mmy7ILKn5lpXMD96bC9rTIhWpEdhQ=
X-Received: by 2002:a67:ec88:0:b0:357:83f:e0f3 with SMTP id
 h8-20020a67ec88000000b00357083fe0f3mr9196801vsp.76.1657639911366; Tue, 12 Jul
 2022 08:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220712095901.212353-1-richard.henderson@linaro.org>
 <20220712095901.212353-3-richard.henderson@linaro.org>
In-Reply-To: <20220712095901.212353-3-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 12 Jul 2022 09:31:40 -0600
Message-ID: <CANCZdfqzBCtipXdzk36xKxOfshPJo2KbJb_VAX_eS+kAkh3P=Q@mail.gmail.com>
Subject: Re: [COMMITTED 2/3] iotests: fix copy-before-write for macOS and
 FreeBSD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000015342705e39d5e26"
Received-SPF: none client-ip=2607:f8b0:4864:20::e35;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe35.google.com
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

--00000000000015342705e39d5e26
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 4:02 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
> strerror() represents ETIMEDOUT a bit different in Linux and macOS /
> FreeBSD. Let's support the latter too.
>

tl;dr: This change goes back to 1990, but many forks of the BSD networking
code
and its APIs pre-date that and now FreeBSD and Linux are on different sides
of
that change...

It all starts with 4.2BSD's error string for ETIMEDOUT being:

./4.2/usr/src/sys/h/errno.h:#define ETIMEDOUT 60 /* Connection timed out */

but that changed in 1990 with 4.3reno to (though the kernel version of this
file
retained the old wording until it was changed in 4.4-LITE):

./4.3reno/usr/include/errno.h:#define ETIMEDOUT 60 /* Operation timed out */

and 4.4 picked it up from there. While MacOS is Mach based (which was 4.3BSD
based and the 86 and 92 versions both have the 4.3 wording), it had a large
infusion of code from NetBSD/FreeBSD which were derived by then from
4.4-LITE. NET.2 had the 4.3 wording, and early versions of both NetBSD
and FreeBSD (as well as 386BSD and the various patchkit versions) had the
4.3 wording, but that all went away with stipulations by the projects to use
4.4-LITE after BSDi related legal action...

As far as I can tell (and my historical archives are less complete for
Linux), Linux
always had the 4.3 wording because, I think, (a) that's what SunOS had and
(b)
System V had the 4.3 wording starting at System Vr3 when the TCP stack was
introduced which took large parts of its code from 4.3BSD.

Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout
> option")
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> Message-Id: <20220705153708.186418-1-vsementsov@yandex-team.ru>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/qemu-iotests/tests/copy-before-write | 5 +++++
>  1 file changed, 5 insertions(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/tests/qemu-iotests/tests/copy-before-write
> b/tests/qemu-iotests/tests/copy-before-write
> index 16efebbf8f..56937b9dff 100755
> --- a/tests/qemu-iotests/tests/copy-before-write
> +++ b/tests/qemu-iotests/tests/copy-before-write
> @@ -192,6 +192,11 @@ read 1048576/1048576 bytes at offset 0
>
>      def test_timeout_break_guest(self):
>          log = self.do_cbw_timeout('break-guest-write')
> +        # macOS and FreeBSD tend to represent ETIMEDOUT as
> +        # "Operation timed out", when Linux prefer
> +        # "Connection timed out"
> +        log = log.replace('Operation timed out',
> +                          'Connection timed out')
>          self.assertEqual(log, """\
>  wrote 524288/524288 bytes at offset 0
>  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> --
> 2.34.1
>
>
>

--00000000000015342705e39d5e26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 4:02 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:=
vsementsov@yandex-team.ru" target=3D"_blank">vsementsov@yandex-team.ru</a>&=
gt;<br>
<br>
strerror() represents ETIMEDOUT a bit different in Linux and macOS /<br>
FreeBSD. Let&#39;s support the latter too.<br></blockquote><div><br></div><=
div><div>tl;dr: This change goes back to 1990, but many forks of the BSD ne=
tworking code</div><div>and its APIs pre-date that and now FreeBSD and Linu=
x are on different sides of</div><div>that change...</div><div><br></div></=
div><div>It all starts with 4.2BSD&#39;s error string for ETIMEDOUT being:<=
/div><div><br></div><div>./4.2/usr/src/sys/h/errno.h:#define	ETIMEDOUT	60		=
/* Connection timed out */<br></div><div><br></div><div>but that changed in=
 1990 with 4.3reno to (though the kernel version of this file</div><div>ret=
ained the old wording until it was changed in 4.4-LITE):</div><div><br></di=
v><div>./4.3reno/usr/include/errno.h:#define	ETIMEDOUT	60		/* Operation tim=
ed out */<br></div><div><br></div><div>and 4.4 picked it up from there. Whi=
le MacOS is Mach based (which was 4.3BSD</div><div>based and the 86 and 92 =
versions both have the 4.3 wording),=C2=A0it had a large</div><div>infusion=
 of code from NetBSD/FreeBSD which were derived by then from</div><div>4.4-=
LITE. NET.2 had the 4.3 wording, and early versions of both NetBSD</div><di=
v>and FreeBSD (as well as 386BSD and the various patchkit versions) had the=
</div><div>4.3 wording, but that all went away with stipulations by the pro=
jects to use</div><div>4.4-LITE after BSDi related legal action...</div><di=
v><br></div><div>As far as I can tell (and my historical archives are less =
complete for Linux), Linux</div><div>always had the 4.3 wording because, I =
think, (a) that&#39;s what SunOS had and (b)</div><div>System V had the 4.3=
 wording starting at System Vr3 when the TCP stack was</div><div>introduced=
 which took large parts of its code from 4.3BSD.</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Fixes: 9d05a87b77 (&quot;iotest=
s: copy-before-write: add cases for cbw-timeout option&quot;)<br>
Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementso=
v@yandex-team.ru" target=3D"_blank">vsementsov@yandex-team.ru</a>&gt;<br>
Tested-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_b=
lank">thuth@redhat.com</a>&gt;<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20220705153708.186418-1-vsementsov@yandex=
-team.ru" target=3D"_blank">20220705153708.186418-1-vsementsov@yandex-team.=
ru</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0tests/qemu-iotests/tests/copy-before-write | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br></blockquote><div><br></div><div>R=
eviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.co=
m</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotest=
s/tests/copy-before-write<br>
index 16efebbf8f..56937b9dff 100755<br>
--- a/tests/qemu-iotests/tests/copy-before-write<br>
+++ b/tests/qemu-iotests/tests/copy-before-write<br>
@@ -192,6 +192,11 @@ read 1048576/1048576 bytes at offset 0<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_timeout_break_guest(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log =3D self.do_cbw_timeout(&#39;break-gu=
est-write&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # macOS and FreeBSD tend to represent ETIMEDOU=
T as<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;Operation timed out&quot;, when Linux =
prefer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;Connection timed out&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 log =3D log.replace(&#39;Operation timed out&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;Connection timed out&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(log, &quot;&quot;&quot;\=
<br>
=C2=A0wrote 524288/524288 bytes at offset 0<br>
=C2=A0512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000015342705e39d5e26--

