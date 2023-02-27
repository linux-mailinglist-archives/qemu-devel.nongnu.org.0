Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C506A4D19
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:24:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWkxs-0005fy-I7; Mon, 27 Feb 2023 16:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pWkxq-0005fa-5E
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:23:18 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pWkxo-0001vV-6r
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:23:17 -0500
Received: by mail-ed1-x529.google.com with SMTP id ck15so31706795edb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lrjYoD6/wHlXRUN0srwd3jltAAmdE6tJfL2xBlBo824=;
 b=GkEXZW47BxUd2lOqUJ9n5IfbNEWcSXQ9OrfaISNgOYSmUqnnw4Vu3ESvViIGleWk++
 IjdtW7F55KwwSY5CrD69hkUuFs7BxIPllJx6o8bAmHDWfDbQhl0H8L/0fZvljRQ3rmen
 3kDWkeZAvMypOiQmelO+4YPLBW3j4Hqx5GgawGWudFjbm9cxlrwpbG2upHeDu1WDIvIu
 iVf7R8lPF5UpsK6LfMPUoHR3t4Va3OxCqoVlhKX+rTxgQBEYNcZsBMg0bEGFKDpeNFYy
 pdsV+NiYgUuczlG90Etdlx39gUIhHtsAhInA56K2iqXKdxogZp3IULJNov0XaVUHi9UE
 KJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrjYoD6/wHlXRUN0srwd3jltAAmdE6tJfL2xBlBo824=;
 b=MtULEkoxFOWbZQTxbErgosZSkp5+kUospGIUvR8/0C4vpM7JGBfdiiwgGpin1Fjtno
 0lClp/2fUiVAB4jv/vvwdjC1e29Cp8EPn8Q9gGPOPlN5RD2J5VRst7WtClE0iit4qhK9
 R4LQ6SK3v649OvWqnu1jHim+MJzg3DBdUaekOO+mBfTseYuKPlea5OdIggD3ofcatGNF
 UWnJg77CE2v8KqEzn1Fyjp4u/P7G6Ra4x3zeYiyhqf3aLDQRfs2g+BM6wMWQTcFllNO5
 tvT1cj0eqJ0x6VX7Ar0fGyVfBeMVIm4AYfcP3H/Xn6hamupzixIeCkh924ky0ZGOYaPr
 8Iqw==
X-Gm-Message-State: AO0yUKU6JdUa/vKtgbWBYLlkCCq70ggmRZB3rjgwuz+BfXNFCVR7cFbc
 zgpJViabJI8U6vsI/FMPMnWZhnFIIg5a4498fPJeix7ScQ4=
X-Google-Smtp-Source: AK7set/Goq9k9KXkfNCOlSfXgQy0HJx1YB4n3A82NkxthFr4f0g25CCFWZPrOPFWu+1G72QOZOpa75X/n5x/6MVLaDc=
X-Received: by 2002:a17:906:4d97:b0:8b1:81fa:b07a with SMTP id
 s23-20020a1709064d9700b008b181fab07amr44939eju.12.1677532994172; Mon, 27 Feb
 2023 13:23:14 -0800 (PST)
MIME-Version: 1.0
References: <CAH50XRfsWih++5yoZSx-3L9mzf+vGPRz2Che=_6TAuATphvXbQ@mail.gmail.com>
 <874jr7juo5.fsf@linaro.org>
In-Reply-To: <874jr7juo5.fsf@linaro.org>
From: Dinah B <dinahbaum123@gmail.com>
Date: Mon, 27 Feb 2023 16:23:02 -0500
Message-ID: <CAH50XRddEDTxJeCMXmbNg417vRojEuYpb8GzDrw75rt=OmF_uQ@mail.gmail.com>
Subject: Re: Adopting abandoned patch?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000377a2005f5b5162b"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=dinahbaum123@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000377a2005f5b5162b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, here's the original patch:
https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D2;bug=3D621529;filename=
=3Dmultiboot2.patch;msg=3D15

On Mon, Feb 27, 2023 at 4:59=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:

>
> Dinah B <dinahbaum123@gmail.com> writes:
>
> > Hi,
> >
> > I'm looking to get more involved in contributing to QEMU. I noticed tha=
t
> there are some issues in the tracker
> > where a sample patch has been contributed but never got merged, like a
> proposal to add multiboot2 support:
> > https://gitlab.com/qemu-project/qemu/-/issues/389
>
> I couldn't see a patch attached to the bug report. Is it elsewhere?
>
> >
> > Is another dev allowed to "adopt" the patch as-is, with proper
> attribution to the original dev and drive it to
> > completion/merging (there are some features missing)? Or is "starting
> from scratch" required for legal
> > reasons?
>
> It's certainly possible to pick up a patch from someone else and take it
> forward. Aside from addressing any review comments I think the minimum
> requirement is the authors original Signed-off-by is intact which
> asserts they could contribute code to the project.
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--000000000000377a2005f5b5162b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, here&#39;s the original patch: <a href=3D"https://=
bugs.debian.org/cgi-bin/bugreport.cgi?att=3D2;bug=3D621529;filename=3Dmulti=
boot2.patch;msg=3D15">https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D2=
;bug=3D621529;filename=3Dmultiboot2.patch;msg=3D15</a></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 27, 2023=
 at 4:59=E2=80=AFAM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
Dinah B &lt;<a href=3D"mailto:dinahbaum123@gmail.com" target=3D"_blank">din=
ahbaum123@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;m looking to get more involved in contributing to QEMU. I notice=
d that there are some issues in the tracker<br>
&gt; where a sample patch has been contributed but never got merged, like a=
 proposal to add multiboot2 support:<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/389" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/=
389</a><br>
<br>
I couldn&#39;t see a patch attached to the bug report. Is it elsewhere?<br>
<br>
&gt;<br>
&gt; Is another dev allowed to &quot;adopt&quot; the patch as-is, with prop=
er attribution to the original dev and drive it to<br>
&gt; completion/merging (there are some features missing)? Or is &quot;star=
ting from scratch&quot; required for legal<br>
&gt; reasons?<br>
<br>
It&#39;s certainly possible to pick up a patch from someone else and take i=
t<br>
forward. Aside from addressing any review comments I think the minimum<br>
requirement is the authors original Signed-off-by is intact which<br>
asserts they could contribute code to the project.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div>

--000000000000377a2005f5b5162b--

