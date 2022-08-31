Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2B65A7B5B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:28:44 +0200 (CEST)
Received: from localhost ([::1]:41306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKxe-0007xv-U7
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTKw3-00062u-Qo
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 06:27:03 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:34709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTKw1-0006rF-TV
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 06:27:03 -0400
Received: by mail-lf1-x12e.google.com with SMTP id bt10so19310972lfb.1
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=hZWGuCvCxmEVEPOGkFiblBSwU8FhuwSwTEALeGdep+g=;
 b=IXpPJEExaaEiPwoF7cUbpffZ3XrAEnM36Tg8YdxY8wBFQZ7zanemG1k51nO7eUT+0k
 WVBlKezai2fkY780439+Cf2ClszRc7KnmTNaSJDhuesLrlSJAttp/WUjzdaZ2Q52uCAP
 Tj0zHb4drmMnPLUivrl7SQQj5GDRnjRbSq0OO+7Fqbz1G9xaWQRcvRJJ8ehO6UIrwmFl
 1e78/LDBHkAKCiyEmje5DL5m3XV8pThx3avaVErDudfmeJi4GV1rCDXhapZtbAuy1cHL
 epvvAUi43ydJRoehOgDeRHHQcGaX9N7xIDxJkZVsijLncl6mb34ZvhfGrvBZPGrkr7oP
 qtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=hZWGuCvCxmEVEPOGkFiblBSwU8FhuwSwTEALeGdep+g=;
 b=hNE4EVz73/iKQ0uOn4Y/MnVKxXpl+BmacTr9oE0pKbJcw7FjU3EjmxOzC0kzdnuHFp
 KxNp78fpgVGl92BrmjqQkcKpVf3bkvPaXQNVe1/3w6R62kqG13OenFuBd660+oBXXHh8
 wsbRNjydWkLFuA1qX05JUWWxr9W66GYocWkaLMMyYw+KXVXjkX7e9UG1juvTi2zBeqdj
 fEdfjYRtULS36s1mq4tq2E0tcIgglnUbploEqt7OTZ1/kofMrqfpObTuz6JqxKqVV9yM
 iiL8xiL6R2jICkI53AfJE/zFr/qaBySbETWzyMFULp1+Ia/nPuOtRXS0145aeQQ9pmbM
 zlFg==
X-Gm-Message-State: ACgBeo1ukvlbEr1Vxjfg+WFnwKNFY2OMHP5PZFQLGUzeBUMD/K0W+ifV
 OCg1O6KLORdf/FIGlYTMEXj8WVaW3EGpJ6tx890=
X-Google-Smtp-Source: AA6agR6/eqMejbtS2KWn2KcnsLt7sGpybOOygkMf0x+mgu588w4sDw4OjTHn+AYPa4hCIHirFu3X/UtfiHLgU9X1qdQ=
X-Received: by 2002:a05:6512:12d6:b0:492:cfab:ffae with SMTP id
 p22-20020a05651212d600b00492cfabffaemr9564065lfg.329.1661941620055; Wed, 31
 Aug 2022 03:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <1443720628-16512-1-git-send-email-marcandre.lureau@redhat.com>
 <9cb1a173-c703-1787-90e1-4668710b323b@intel.com>
In-Reply-To: <9cb1a173-c703-1787-90e1-4668710b323b@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 14:26:48 +0400
Message-ID: <CAJ+F1CLnMzLReHExCukDpKSy0UiBPoFemWtGYCASp-YXKgOWLw@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH] Add qemu .clang-format
To: "Wang, Lei" <lei4.wang@intel.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e6a3de05e786ef01"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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

--000000000000e6a3de05e786ef01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 31, 2022 at 10:24 AM Wang, Lei <lei4.wang@intel.com> wrote:

>
> On 10/2/2015 1:30 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > clang-format is awesome to reflow your code according to qemu coding
> > style in an editor (in the region you modify).
> >
> > (note: clang-tidy should be able to add missing braces around
> > statements, but I haven't tried it, it's quite recent)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   .clang-format | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >   create mode 100644 .clang-format
> >
> > diff --git a/.clang-format b/.clang-format
> > new file mode 100644
> > index 0000000..6422547
> > --- /dev/null
> > +++ b/.clang-format
> > @@ -0,0 +1,6 @@
> > +BasedOnStyle: LLVM
> > +IndentWidth: 4
> > +UseTab: Never
> > +BreakBeforeBraces: Linux
> > +AllowShortIfStatementsOnASingleLine: false
> > +IndentCaseLabels: false
>
> Hi, any progress on this? I also found a gist on GitHub which can be a
> reference:
> https://gist.github.com/elmarco/aa5e0b23567f46fb7f0e73cde586a0c1
>
>
Yes, that was a more complete configuration from me as well, but it is 5y
old already and might need some new updates.

Feel free to submit a new updated version.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000e6a3de05e786ef01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 31, 2022 at 10:24 AM Wa=
ng, Lei &lt;<a href=3D"mailto:lei4.wang@intel.com">lei4.wang@intel.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 10/2/2015 1:30 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" target=
=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; clang-format is awesome to reflow your code according to qemu coding<b=
r>
&gt; style in an editor (in the region you modify).<br>
&gt; <br>
&gt; (note: clang-tidy should be able to add missing braces around<br>
&gt; statements, but I haven&#39;t tried it, it&#39;s quite recent)<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.clang-format | 6 ++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 .clang-format<br>
&gt; <br>
&gt; diff --git a/.clang-format b/.clang-format<br>
&gt; new file mode 100644<br>
&gt; index 0000000..6422547<br>
&gt; --- /dev/null<br>
&gt; +++ b/.clang-format<br>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +BasedOnStyle: LLVM<br>
&gt; +IndentWidth: 4<br>
&gt; +UseTab: Never<br>
&gt; +BreakBeforeBraces: Linux<br>
&gt; +AllowShortIfStatementsOnASingleLine: false<br>
&gt; +IndentCaseLabels: false<br>
<br>
Hi, any progress on this? I also found a gist on GitHub which can be a <br>
reference: <a href=3D"https://gist.github.com/elmarco/aa5e0b23567f46fb7f0e7=
3cde586a0c1" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com/e=
lmarco/aa5e0b23567f46fb7f0e73cde586a0c1</a><br>
<br>
</blockquote></div><div><br></div><div>Yes, that was a more complete config=
uration from me as well, but it is 5y old already and might need some new u=
pdates.</div><div><br></div><div>Feel free to submit a new updated version.=
<br></div><div><br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e6a3de05e786ef01--

