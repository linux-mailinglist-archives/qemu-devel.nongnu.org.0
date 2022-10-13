Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BED5FD93B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:33:16 +0200 (CEST)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixOl-00076S-2j
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oixIM-0002fB-IR
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:26:40 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:44730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oixIJ-00026g-9s
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:26:38 -0400
Received: by mail-lj1-x233.google.com with SMTP id h8so2085673lja.11
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n48bZAuz8Zo+CTqO/aVA5XDqUedGj4w0ltzWESSB2ek=;
 b=GqId+REjToansBtBksDq5CIqcpGxYuM9vDP+Ei6MHExwRCsOvlKqp0bSMYkJXTbfDR
 mlNNvUNUAzZBh6mIDquuJW6t9gfeLl1MBtK7EU+/aL/YJPAOe/HrutL5Iob9ABeNHy9N
 w98J5apiTn1Ff/fl7BlWnlW7KBePGYyv5xj5DjU42FPC9y0O5b8Kh1XwfezAZU4BIBLa
 4n1KiFgF7fzgP/FLKCLMo2WP41tKmJZHpqMltwvF4lSBUn9KtmspQOmG21k2FsMv/bel
 svpOUixmqM2sSV/0rcKJ0Yvgm9V7l/8kJK8nIUAFJYG5tik2TgHgbgRrfjyUWY/pr+uo
 ApbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n48bZAuz8Zo+CTqO/aVA5XDqUedGj4w0ltzWESSB2ek=;
 b=J3WQH4/STZfywaz6V7lgct0950jT4X5xvVjrIAPiPIwDL+80ajjLiuB05T41j4fy+y
 mRfE2UA/WebCN3QSyqNsvn0U3uvM+bvRL5tW16N/4pG+0Cw+deo/RcGwKZ3CYy2TKsFi
 vY/soN12Mv9Ed+qLj4coh/h9hQvP2iiYkorQ5HaZzZSTL6SVlimhk1vjk4GBGDQs+Gsd
 7xUeMWhQaKoRXg0Ge29sOLVPHsfwpkuuZWr4zu00lAvzQ9g0rsVV28WaCFlqQw0ySZpt
 Ase1BErZ3nUX8Qlkcm2bB1uuH8gHp7s39TYB1xXdYGgXC8JmbbbmvSo3SEVp8vF3gsok
 +chg==
X-Gm-Message-State: ACrzQf11OhdijYJNog2NCPMOsifEowc0Tgz2AGAQ6uJ/GEyueWPiMBwa
 7OXms4kZ7Xqzp9fS780lJb6VRf/lre7Uuh7qkJc=
X-Google-Smtp-Source: AMsMyM68KUjon8GrW6G0mU3sW39rR6ogeZU9PEgvewUYYn7y4AHYxv+71hNoHGUemKnHUTWtnTzAS0jsb0b1rvtJ5hQ=
X-Received: by 2002:a2e:552:0:b0:26e:4c9:bcd1 with SMTP id
 79-20020a2e0552000000b0026e04c9bcd1mr12490054ljf.529.1665663993352; 
 Thu, 13 Oct 2022 05:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
 <CAFEAcA_U_mXy5haEZjEKbH_qS_oi38LK4RMD-z42QC5h2Z67cA@mail.gmail.com>
 <Y0fxjk5zaeDYCPIo@redhat.com>
 <CAFEAcA95S8rM39_Uxv_mDQNagsgo81JTc-aUVJmOnHhiN8R_zQ@mail.gmail.com>
In-Reply-To: <CAFEAcA95S8rM39_Uxv_mDQNagsgo81JTc-aUVJmOnHhiN8R_zQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 13 Oct 2022 16:26:21 +0400
Message-ID: <CAJ+F1CKsfJetjCSwvavfLzqcC0JPW=22A-dNbNbfWBi9qdYp8Q@mail.gmail.com>
Subject: Re: [PATCH] configure: Avoid using strings binary
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a3960605eae99eb1"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a3960605eae99eb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi


On Thu, Oct 13, 2022 at 3:50 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 13 Oct 2022 at 12:08, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
> wrote:
> >
> > On Thu, Oct 13, 2022 at 11:39:34AM +0100, Peter Maydell wrote:
> > > On Thu, 13 Oct 2022 at 09:47, Michal Privoznik <mprivozn@redhat.com>
> wrote:
> > > >
> > > > When determining the endiandness of the target architecture we're
> > > > building for a small program is compiled, which in an obfuscated
> > > > way declares two strings. Then, we look which string is in
> > > > correct order (using strings binary) and deduct the endiandness.
> > > > But using the strings binary is problematic, because it's part of
> > > > toolchain (strings is just a symlink to
> > > > x86_64-pc-linux-gnu-strings or llvm-strings). And when
> > > > (cross-)compiling, it requires users to set the symlink to the
> > > > correct toolchain.
> > > >
> > > > Fortunately, we have a better alternative anyways. Since we
> > > > require either clang or gcc we can rely on macros they declare.
> > > >
> > > > Bug: https://bugs.gentoo.org/876933
> > > > Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> > >
> > > If we can determine this just by looking at C macros, does
> > > this really need to be a configure test at all ? Paolo?
> >
> > We don't need to rely on CLang / GCC macros either, as this
> > is exposed by GLib
> >
> > $ grep BYTE_ORDER /usr/lib64/glib-2.0/include/glibconfig.h
> > #define G_BYTE_ORDER G_LITTLE_ENDIAN
> >
> > IOW, any code that needs to know can do one of:
> >
> >   #if G_BYTE_ORDER =3D=3D G_LITTLE_ENDIAN
> >
> >   #if G_BYTE_ORDER =3D=3D G_BIG_ENDIAN
>
> It would be more consistent for configure to do this the same
> way that compiler.h does, though:
>
> #define HOST_BIG_ENDIAN (__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__)
>
>
Weird, it should have been introduced with commit e03b56863d ("Replace
config-time define HOST_WORDS_BIGENDIAN"), and it's part of commit
519655970 ("Move HOST_LONG_BITS to compiler.h")...probably my bad with a
rebase.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a3960605eae99eb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 13, 2022 at 3:50 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, 13 Oct 2022 at 12:08, Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Thu, Oct 13, 2022 at 11:39:34AM +0100, Peter Maydell wrote:<br>
&gt; &gt; On Thu, 13 Oct 2022 at 09:47, Michal Privoznik &lt;<a href=3D"mai=
lto:mprivozn@redhat.com" target=3D"_blank">mprivozn@redhat.com</a>&gt; wrot=
e:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; When determining the endiandness of the target architecture =
we&#39;re<br>
&gt; &gt; &gt; building for a small program is compiled, which in an obfusc=
ated<br>
&gt; &gt; &gt; way declares two strings. Then, we look which string is in<b=
r>
&gt; &gt; &gt; correct order (using strings binary) and deduct the endiandn=
ess.<br>
&gt; &gt; &gt; But using the strings binary is problematic, because it&#39;=
s part of<br>
&gt; &gt; &gt; toolchain (strings is just a symlink to<br>
&gt; &gt; &gt; x86_64-pc-linux-gnu-strings or llvm-strings). And when<br>
&gt; &gt; &gt; (cross-)compiling, it requires users to set the symlink to t=
he<br>
&gt; &gt; &gt; correct toolchain.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Fortunately, we have a better alternative anyways. Since we<=
br>
&gt; &gt; &gt; require either clang or gcc we can rely on macros they decla=
re.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bug: <a href=3D"https://bugs.gentoo.org/876933" rel=3D"noref=
errer" target=3D"_blank">https://bugs.gentoo.org/876933</a><br>
&gt; &gt; &gt; Signed-off-by: Michal Privoznik &lt;<a href=3D"mailto:mprivo=
zn@redhat.com" target=3D"_blank">mprivozn@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; If we can determine this just by looking at C macros, does<br>
&gt; &gt; this really need to be a configure test at all ? Paolo?<br>
&gt;<br>
&gt; We don&#39;t need to rely on CLang / GCC macros either, as this<br>
&gt; is exposed by GLib<br>
&gt;<br>
&gt; $ grep BYTE_ORDER /usr/lib64/glib-2.0/include/glibconfig.h<br>
&gt; #define G_BYTE_ORDER G_LITTLE_ENDIAN<br>
&gt;<br>
&gt; IOW, any code that needs to know can do one of:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#if G_BYTE_ORDER =3D=3D G_LITTLE_ENDIAN<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#if G_BYTE_ORDER =3D=3D G_BIG_ENDIAN<br>
<br>
It would be more consistent for configure to do this the same<br>
way that compiler.h does, though:<br>
<br>
#define HOST_BIG_ENDIAN (__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__)<br>
<br></blockquote><div><br></div><div>Weird, it should have been introduced =
with commit e03b56863d (&quot;Replace config-time define HOST_WORDS_BIGENDI=
AN&quot;), and it&#39;s part of commit 519655970 (&quot;Move HOST_LONG_BITS=
 to compiler.h&quot;)...probably my bad with a rebase.</div></div><div clas=
s=3D"gmail_quote"><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a3960605eae99eb1--

