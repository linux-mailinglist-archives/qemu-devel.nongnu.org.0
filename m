Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AFA3E3BE7
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 19:23:56 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCmWg-0003J3-TU
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 13:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCmVY-0002eA-Pb
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:22:44 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:43916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCmVW-000160-Nr
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:22:44 -0400
Received: by mail-qv1-xf30.google.com with SMTP id db14so7809200qvb.10
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=po8pJL4ushFgA8Ja5uaRHHi+Tz39TbLD0kvLm8kiVo4=;
 b=p2j2tGgr3IPK3W2yykDctQ9ZtlIV3EzxVMmw/1n8BCQB0JjzE0vcgqT3aRitDsJYJk
 HShuucee9v2vUuW3eoLLTtADXOaBUBu4AS1ZvXPf/tJxDQ1JNv3V8npulAjAZzQpIjIh
 r1KkHjrYlrv9o0rzFukhaW4aRuvNca7UTsOFeCsNhPOlAh14DCLWDqlympoOnuXM5QKJ
 lmaA8z3LMlnChBd9I1qh7fSfmxCFKTdMy6u/qbWagU/vqqbku6uvYlRfO7bxn+Pv/6iz
 bzI9XcyDNiOx8AaUsG4cM7XIbkziFlTicDLDFw0sT9D3MqjD1zR3aPE3THsentjpCgTJ
 gMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=po8pJL4ushFgA8Ja5uaRHHi+Tz39TbLD0kvLm8kiVo4=;
 b=FCHG7jDws7/di4KsbJIRT48l47CI3PwV2y0jGZfHaLlp+nfkXbApPwHyFgbbfkP/XM
 e5Q2iRt4fInvECrkaOPcda0oX9ptPdcYaml8LpE/5mUeg2OM+vdjGYtFLV+16ndJUsps
 TuBVjToEKblbHPUIl/qnO30jDfbJqfeFdXzBdqvXE3QGLQdQ9TFYmO5PwXfDWGmxlI2b
 x7G9sWmzBjcgK4hDYqFzNmtfVBqLTmbCEiPX06O414uYViLJxG3o0Km9goJ875P/XZh5
 T5g/4q7nCX9iYrMVT0xpC0AzpEguvmg0ww7v0fgbb+Su8/JazFsujhbgrIemhLdFLAvs
 Y0yA==
X-Gm-Message-State: AOAM532MRbM2uJSm4C7gRRJoG7+QhFw7NFHfN7BT6BaRx8zGfDZpsDo3
 lz8IavDHnHPWBjL22PDc9H0JZktZga47kRz4Bvzx5A==
X-Google-Smtp-Source: ABdhPJw7U9e7agButlYwqmzEXP5S/n/fDdj4csIa1FWNjX6RuPYxhz3tbM0MxbdezBkb8mogVrEYlKNHxxuOPqqf3z0=
X-Received: by 2002:ad4:5b85:: with SMTP id 5mr20495780qvp.24.1628443361333;
 Sun, 08 Aug 2021 10:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-13-imp@bsdimp.com>
 <bde1f44f-d8a1-4900-e0c6-c6f699d3a8e8@linaro.org>
 <CACNAnaE3dp0Ex7kR58FStcM01PMRi63_sNjRVduVTVOHjO+PVg@mail.gmail.com>
In-Reply-To: <CACNAnaE3dp0Ex7kR58FStcM01PMRi63_sNjRVduVTVOHjO+PVg@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 8 Aug 2021 11:22:30 -0600
Message-ID: <CANCZdfrDez57t8iXKs-nU-oH-xMLXKUtxBe45J=sNBBcgznq5g@mail.gmail.com>
Subject: Re: [PATCH for 6.2 12/49] bsd-user: implement path searching
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000016e71405c90f8488"
Received-SPF: none client-ip=2607:f8b0:4864:20::f30;
 envelope-from=wlosh@bsdimp.com; helo=mail-qv1-xf30.google.com
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
Cc: Stacey Son <sson@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000016e71405c90f8488
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 7, 2021 at 11:49 PM Kyle Evans <kevans@freebsd.org> wrote:

> On Sat, Aug 7, 2021 at 10:11 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 8/7/21 11:42 AM, Warner Losh wrote:
> > > +        path = g_strdup(p);
> > > +        if (path == NULL) {
> >
> > Only returns null when the input is null, which you've already
> eliminated.
> >
> > > +static bool find_in_path(char *path, const char *filename, char
> *retpath,
> > > +                         size_t rpsize)
> > > +{
> > > +    const char *d;
> > > +
> > > +    while ((d = strsep(&path, ":")) != NULL) {
> > > +        if (*d == '\0') {
> > > +            d = ".";
> > > +        }
> > > +        if (snprintf(retpath, rpsize, "%s/%s", d, filename) >=
> (int)rpsize) {
> > > +            continue;
> > > +        }
> > > +        if (is_there((const char *)retpath)) {
> > > +            return true;
> > > +        }
> > > +    }
> > > +    return false;
> >
> > Hmm.  Fixed size retpath buffer isn't ideal.
> > Any reason not to use g_find_program_in_path?
> >
>
> g_find_program_in_path may work well here, as well...
>

Quite well:  1 file changed, 5 insertions(+), 42 deletions(-) so a nice
reduction in code when the unnecessary stuff is removed. I'll have
that in v2 of the series.

> I note that we don't search the path at all in linux-user/.
> >
>
> IIRC imgact_binmisc will have the resolved path but preserve argv as
> it should have been were it not emulated, so we have to re-evaluate
> the PATH search here because we try to be faithful to the context.
>

I just looked at the imgact_binmisc code, and that's what it does, so
that sounds reasonable to me as well.

Warner

--00000000000016e71405c90f8488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sat, Aug 7, 2021 at 11:49 PM Kyle Evans &lt;<a=
 href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Aug 7, 2021 a=
t 10:11 PM Richard Henderson<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richa=
rd.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D g_strdup(p);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (path =3D=3D NULL) {<br>
&gt;<br>
&gt; Only returns null when the input is null, which you&#39;ve already eli=
minated.<br>
&gt;<br>
&gt; &gt; +static bool find_in_path(char *path, const char *filename, char =
*retpath,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t rpsize)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 const char *d;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 while ((d =3D strsep(&amp;path, &quot;:&quot;)) !=
=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*d =3D=3D &#39;\0&#39;) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d =3D &quot;.&quot;;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (snprintf(retpath, rpsize, &quot;=
%s/%s&quot;, d, filename) &gt;=3D (int)rpsize) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_there((const char *)retpath))=
 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 return false;<br>
&gt;<br>
&gt; Hmm.=C2=A0 Fixed size retpath buffer isn&#39;t ideal.<br>
&gt; Any reason not to use g_find_program_in_path?<br>
&gt;<br>
<br>
g_find_program_in_path may work well here, as well...<br></blockquote><div>=
<br></div><div>Quite well:=C2=A0=C2=A01 file changed, 5 insertions(+), 42 d=
eletions(-) so a nice</div><div>reduction in code when the unnecessary stuf=
f is removed. I&#39;ll have</div><div>that in v2 of the series.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; I note that we don&#39;t search the path at all in linux-user/.<br>
&gt;<br>
<br>
IIRC imgact_binmisc will have the resolved path but preserve argv as<br>
it should have been were it not emulated, so we have to re-evaluate<br>
the PATH search here because we try to be faithful to the context.<br></blo=
ckquote><div><br></div><div>I just looked at the imgact_binmisc code, and t=
hat&#39;s what it does, so</div><div>that sounds reasonable to me as well.<=
/div><div><br></div><div>Warner</div></div></div>

--00000000000016e71405c90f8488--

