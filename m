Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7654895A2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:49:17 +0100 (CET)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rIj-00075g-2z
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6rDe-0003ec-LL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:44:02 -0500
Received: from [2a00:1450:4864:20::433] (port=35796
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6rDc-0006xf-88
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:44:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id e9so24072330wra.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QxqGQjVvP6k5qQrPA+iq9RamMrIW+/v0VACkxI5fWQ=;
 b=NN3rE5OoDqxn76PpgOgfqDNRtYS5JTP8vryeOq0ik6pMl5eFBHYCFvVKQiKeEDq6hl
 Sth/jFBtKZJzZjAeDA06ZnxYBWNIVgK/bFJz4Mr9/lijbRJsfqixgH8K4mNpjHs+5LPo
 jRnO7rBq7yhWAurUGG36cADabCCzBdWRDkdTSeLZpuEI2vEJZhTnrOu+Rp8lyafDsdtt
 xr/lQTwtCdThNaYJ3ZZtvhnNAvnZqys4g6YmyzrbwnR9F82tCkA8wyPUJxlweB/egtep
 DkBdI97zqo4B3FzpCtjLy030ZkTLNqSNWS09gELhnMLIOaFEdSQsW46oNWJvJzQ+E93Y
 AXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QxqGQjVvP6k5qQrPA+iq9RamMrIW+/v0VACkxI5fWQ=;
 b=YHDzmurD+ZGCh0oqrBm7XxSlYGZew+SxxcgDVb2ecwEWD4Ra4di3YiI3Jtr1MfG64Y
 CumQ9ZREqrIUS4zY1pRurv6XcvUMuJZn3iTu4MWXnljZvG5UyDw/GROlz6ti7bopvqpW
 xOPkjYvk4ajxXE2IWd+V5HsOOJi1WVSmEDeW7wsD1CxxAOXRIwSPyPcK5FqNxaAat3/Z
 6cAXsliv13kYj2faFQwjlvqscem46vmiOzL/Jn3GGLFkb540JiO7y8AcA6h+/2KtCmd6
 jNSfUOE4K+XWEyn1xXiPRGn8FVqRzMiqhJEP4QgDkni8UZ0Gv+WjzXnBmZte000LZc+x
 U8gA==
X-Gm-Message-State: AOAM533jZ+5eRKBTIMYfrqKVSY7uGnbXj6Kb0BagoAIkLw1GFvF8OOwH
 Cog0vQeOhzyuhZuuUMQetx4RE3ZeW9RPibN08IUqI/G1z3vVhQ==
X-Google-Smtp-Source: ABdhPJy1Uw0KnAf3Noi9G8Kq1yEdhE3NKeNewnQ9RK9WEuHAtN4zdkaOMWpCm/5BTOV9H6uGCuuCrFXk2xR60l9PrFU=
X-Received: by 2002:a5d:4c4d:: with SMTP id n13mr3720710wrt.641.1641807838288; 
 Mon, 10 Jan 2022 01:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20220109205748.4127032-1-philipp.tomsich@vrull.eu>
 <0424f2d4-c9d0-3409-78e1-c0cabbff90a1@amsat.org>
In-Reply-To: <0424f2d4-c9d0-3409-78e1-c0cabbff90a1@amsat.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 10 Jan 2022 10:43:47 +0100
Message-ID: <CAAeLtUC87ZWT1r4npKKQsXp4vkRx6wdNJ9mvbGjLNoKs9N_L1Q@mail.gmail.com>
Subject: Re: [PATCH] net/dump.c: Suppress spurious compiler warning
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000fdafcd05d5372ccf"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fdafcd05d5372ccf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that I don't expect this to get applied. I just put it onto the list
for visibility and to make the workaround available for downstream users
that might run into the issue while Ubuntu 22.04 is maturing.  I won't have
any time to dig into this on the GCC side until GCC12 is out.

Philipp.

On Mon, 10 Jan 2022 at 10:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
wrote:

> Cc'ing Richard & Eric for dubious compiler warning.
>
> On 1/9/22 21:57, Philipp Tomsich wrote:
> > Compiling with gcc version 11.2.0 (Ubuntu 11.2.0-13ubuntu1) results in
> > a (spurious) warning:
> >
> >   In function =E2=80=98dump_receive_iov=E2=80=99,
> >       inlined from =E2=80=98filter_dump_receive_iov=E2=80=99 at ../net/=
dump.c:157:5:
> >   ../net/dump.c:89:9: error: =E2=80=98writev=E2=80=99 specified size
> 18446744073709551600 exceeds maximum object size 9223372036854775807
> [-Werror=3Dstringop-overflow=3D]
> >      89 |     if (writev(s->fd, dumpiov, cnt + 1) !=3D sizeof(hdr) +
> caplen) {
> >         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   In file included from /home/ptomsich/qemu/include/qemu/osdep.h:108,
> >                    from ../net/dump.c:25:
> >   ../net/dump.c: In function =E2=80=98filter_dump_receive_iov=E2=80=99:
> >   /usr/include/x86_64-linux-gnu/sys/uio.h:52:16: note: in a call to
> function =E2=80=98writev=E2=80=99 declared with attribute =E2=80=98read_o=
nly (2, 3)=E2=80=99
> >      52 | extern ssize_t writev (int __fd, const struct iovec *__iovec,
> int __count)
> >         |                ^~~~~~
> >   cc1: all warnings being treated as errors
> >
> > This change helps that version of GCC to understand what is going on
> > and suppresses this warning.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > ---
> >
> >  net/dump.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/dump.c b/net/dump.c
> > index a07ba62401..c32d3bf4e6 100644
> > --- a/net/dump.c
> > +++ b/net/dump.c
> > @@ -86,7 +86,7 @@ static ssize_t dump_receive_iov(DumpState *s, const
> struct iovec *iov, int cnt)
> >      dumpiov[0].iov_len =3D sizeof(hdr);
> >      cnt =3D iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
> >
> > -    if (writev(s->fd, dumpiov, cnt + 1) !=3D sizeof(hdr) + caplen) {
> > +    if (writev(s->fd, &dumpiov[0], cnt + 1) !=3D sizeof(hdr) + caplen)=
 {
> >          error_report("network dump write error - stopping dump");
> >          close(s->fd);
> >          s->fd =3D -1;
>

--000000000000fdafcd05d5372ccf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Note that I don&#39;t expect this to get applied. I just p=
ut it onto the list for visibility and to make the workaround available for=
 downstream users that might run into the issue while Ubuntu 22.04 is matur=
ing.=C2=A0 I won&#39;t have any time to dig into this on the GCC side until=
 GCC12 is out.<div><br></div><div>Philipp.</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 10 Jan 2022 at 10:3=
9, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug=
@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Cc&#39;ing Richard &amp; Eric for dubious compiler warning.<br>
<br>
On 1/9/22 21:57, Philipp Tomsich wrote:<br>
&gt; Compiling with gcc version 11.2.0 (Ubuntu 11.2.0-13ubuntu1) results in=
<br>
&gt; a (spurious) warning:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0In function =E2=80=98dump_receive_iov=E2=80=99,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inlined from =E2=80=98filter_dump_receive_io=
v=E2=80=99 at ../net/dump.c:157:5:<br>
&gt;=C2=A0 =C2=A0../net/dump.c:89:9: error: =E2=80=98writev=E2=80=99 specif=
ied size 18446744073709551600 exceeds maximum object size 92233720368547758=
07 [-Werror=3Dstringop-overflow=3D]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 89 |=C2=A0 =C2=A0 =C2=A0if (writev(s-&gt;fd, dumpi=
ov, cnt + 1) !=3D sizeof(hdr) + caplen) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0In file included from /home/ptomsich/qemu/include/qemu/osd=
ep.h:108,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
rom ../net/dump.c:25:<br>
&gt;=C2=A0 =C2=A0../net/dump.c: In function =E2=80=98filter_dump_receive_io=
v=E2=80=99:<br>
&gt;=C2=A0 =C2=A0/usr/include/x86_64-linux-gnu/sys/uio.h:52:16: note: in a =
call to function =E2=80=98writev=E2=80=99 declared with attribute =E2=80=98=
read_only (2, 3)=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0 52 | extern ssize_t writev (int __fd, const struct=
 iovec *__iovec, int __count)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
&gt;=C2=A0 =C2=A0cc1: all warnings being treated as errors<br>
&gt; <br>
&gt; This change helps that version of GCC to understand what is going on<b=
r>
&gt; and suppresses this warning.<br>
&gt; <br>
&gt; Signed-off-by: Philipp Tomsich &lt;<a href=3D"mailto:philipp.tomsich@v=
rull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt;=C2=A0 net/dump.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/net/dump.c b/net/dump.c<br>
&gt; index a07ba62401..c32d3bf4e6 100644<br>
&gt; --- a/net/dump.c<br>
&gt; +++ b/net/dump.c<br>
&gt; @@ -86,7 +86,7 @@ static ssize_t dump_receive_iov(DumpState *s, const =
struct iovec *iov, int cnt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dumpiov[0].iov_len =3D sizeof(hdr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cnt =3D iov_copy(&amp;dumpiov[1], cnt, iov, cnt, 0=
, caplen);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (writev(s-&gt;fd, dumpiov, cnt + 1) !=3D sizeof(hdr)=
 + caplen) {<br>
&gt; +=C2=A0 =C2=A0 if (writev(s-&gt;fd, &amp;dumpiov[0], cnt + 1) !=3D siz=
eof(hdr) + caplen) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;network dump writ=
e error - stopping dump&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(s-&gt;fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fd =3D -1;<br>
</blockquote></div>

--000000000000fdafcd05d5372ccf--

