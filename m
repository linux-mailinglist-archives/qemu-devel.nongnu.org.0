Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBD841F718
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 23:47:44 +0200 (CEST)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWQNb-0002OE-DC
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 17:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mWQLC-0001X2-RV
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:45:15 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mWQLA-0000aE-SK
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:45:14 -0400
Received: by mail-lf1-x12e.google.com with SMTP id y23so4506387lfb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 14:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N2mvPykmjS3m9Qzk5mWF1H/ykv1JXCTtBvjU7+sVYGE=;
 b=NeZjKw10Ay3ov9EKQQo7diqdKE5Jc2ayPO/ukeMfoPpo7aZ2SSkPZQngmZbO0dUQKk
 Yfb5KwfQN9cmGKYg5W8mZP/SOpkA79EoFKC5IIFpYeMA8ABae55Qiyb13uwIkxudRjBY
 ah8vUwX6H9rSpPJc+IKosRLVC6pPmg0lfcNBfK411UqLPtEdzStVOd0aj4QjkWao9Q+d
 P1J7J6koJdFEwWx+MHvGb8YH9rWPcchzj5d0Fk7RUotBHjDHS3TrAtyWiqC3ID+LaMpL
 DqERbOGchaNruzmXYoMx8GGo5oP5icQweMd933il7O0XAw5j/D8vaPQc2OHjm8ja/KI5
 JyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N2mvPykmjS3m9Qzk5mWF1H/ykv1JXCTtBvjU7+sVYGE=;
 b=wm6Bf2X3PM/lBQTAwIMLH81CiCrSBb7iNUry+w2A5shQOMJi32a+Xxf65gKKLjwzmC
 bIMu3HyFwVNeBQ+yErFnKGUyBy2Axg5MGOjOzeXtnHYg98lIN43ppoqhwcHj3cj8FuTQ
 Zo2U6CMNy9Rvdb5gSWsa7jsrJ83EduHGFBylrOpGBNq7p698OeIoRvEazbvdgdDg0BSG
 RtPTufNiL+wahca63+5cI0NbCMkMpbwOa6deYVFjJowbARPG8UX4DnQRZROd9lK/kEvc
 IUxXhA0Q5sEvlZaGjz6TwauJ5rTJLRSsXBSyzv9A3hKm5KOtL06vDbBxABMrhzcDVLC4
 r+bA==
X-Gm-Message-State: AOAM531r04qvunUA/EClupWV9ab5WtxFNDN/7BXE6GiRCPK/bhYSknw/
 8VVRNFLZCANcmBOn+hNzmNoQ00OW3FSAV6DLF0DpWw==
X-Google-Smtp-Source: ABdhPJx/LRNwtMPrl3pw1pofOF4ZsnksxA0LF52MpYIe9lxYW8t0uh38dfh7mVydBOA/AuxSJ3scmrLJc0/LZB4TMUo=
X-Received: by 2002:a19:7b16:: with SMTP id w22mr342659lfc.197.1633124710585; 
 Fri, 01 Oct 2021 14:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
 <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Fri, 1 Oct 2021 22:44:57 +0100
Message-ID: <CAHDbmO21bXEdWpn2g5roW7SmpYxVSrXMPKJg8w7sEe6y26bk+Q@mail.gmail.com>
Subject: Re: hexagon container update
To: Brian Cain <bcain@quicinc.com>
Content-Type: multipart/alternative; boundary="0000000000003fb18d05cd517af4"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003fb18d05cd517af4
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Oct 2021, 18:59 Brian Cain, <bcain@quicinc.com> wrote:

> > -----Original Message-----
> > From: Richard Henderson <richard.henderson@linaro.org>
> ...
> > On 10/1/21 12:59 PM, Brian Cain wrote:
> > > Alex,
> > >
> > > We need to update the docker container used for hexagon for new test
> cases
> > proposed in Taylor's recent patch series under review.  Thankfully,
> CodeLinaro
> > has provided a binary of the hexagon cross toolchain so now I think we
> can
> > simplify the hexagon docker file to something like the below.  I hope
> this also
> > means that we can remove the exceptional handling for the hexagon
> container.
> > >
> > > I can propose a patch but I'm not quite certain how to test it.
> >
> > make docker-image-debian-hexagon-cross NOCACHE=1 V=1
> >
> > and then make check-tcg to use the new image.
>
> Ok -- so the intent of the NOCACHE is that it will force the use of my
> newly modified Dockerfile and not the one in the qemu container repository?
>
> > > The "--no-check-certificate" argument to wget is very bad but I'm not
> quite
> > certain how to upgrade/change the container's certificate store to
> accept the
> > apparently-legit-but-perhaps-newer-than-expected certificate presented by
> > codelinaro.jfrog.io.
> >
> > Hum.  This all suggests that it would be better to update the
> build-toolchain
> > script.
>
> If there's any trust concerns we can verify the download in the dockerfile
> using the hash file for the tarball and/or the gpg signature.
>
> The build-toolchain is a bit of a hassle given the processing time, it'd
> be great to avoid it.  If the hash or signature check doesn't suffice I
> will investigate how to update debian10's signatures.  Are we bound to
> debian10 for all the containers?  If using a different basis was effective
> at resolving this issue, could I select a different one?
>

Sure, debian11 is now stable. We try and avoid rolling releases as a base
but the latest debian should be fine.


> > > RUN cd /tmp && \
> > >      wget --quiet --no-check-certificate ${CLANG_URL}
> > > RUN cd /opt && \
> > >      tar xf /tmp/clang+llvm-Sept-2021-cross-hexagon-unknown-linux-
> > musl.tar.xz
> >
> > You'd want to remove the tarball as well.
>
> Yes, good point.
>

--0000000000003fb18d05cd517af4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 1 Oct 2021, 18:59 Brian Cain, &lt;<a href=3D"m=
ailto:bcain@quicinc.com">bcain@quicinc.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro=
.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>=
&gt;<br>
...<br>
&gt; On 10/1/21 12:59 PM, Brian Cain wrote:<br>
&gt; &gt; Alex,<br>
&gt; &gt;<br>
&gt; &gt; We need to update the docker container used for hexagon for new t=
est cases<br>
&gt; proposed in Taylor&#39;s recent patch series under review.=C2=A0 Thank=
fully, CodeLinaro<br>
&gt; has provided a binary of the hexagon cross toolchain so now I think we=
 can<br>
&gt; simplify the hexagon docker file to something like the below.=C2=A0 I =
hope this also<br>
&gt; means that we can remove the exceptional handling for the hexagon cont=
ainer.<br>
&gt; &gt;<br>
&gt; &gt; I can propose a patch but I&#39;m not quite certain how to test i=
t.<br>
&gt; <br>
&gt; make docker-image-debian-hexagon-cross NOCACHE=3D1 V=3D1<br>
&gt; <br>
&gt; and then make check-tcg to use the new image.<br>
<br>
Ok -- so the intent of the NOCACHE is that it will force the use of my newl=
y modified Dockerfile and not the one in the qemu container repository?<br>
<br>
&gt; &gt; The &quot;--no-check-certificate&quot; argument to wget is very b=
ad but I&#39;m not quite<br>
&gt; certain how to upgrade/change the container&#39;s certificate store to=
 accept the<br>
&gt; apparently-legit-but-perhaps-newer-than-expected certificate presented=
 by<br>
&gt; <a href=3D"http://codelinaro.jfrog.io" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">codelinaro.jfrog.io</a>.<br>
&gt; <br>
&gt; Hum.=C2=A0 This all suggests that it would be better to update the bui=
ld-toolchain<br>
&gt; script.<br>
<br>
If there&#39;s any trust concerns we can verify the download in the dockerf=
ile using the hash file for the tarball and/or the gpg signature.<br>
<br>
The build-toolchain is a bit of a hassle given the processing time, it&#39;=
d be great to avoid it.=C2=A0 If the hash or signature check doesn&#39;t su=
ffice I will investigate how to update debian10&#39;s signatures.=C2=A0 Are=
 we bound to debian10 for all the containers?=C2=A0 If using a different ba=
sis was effective at resolving this issue, could I select a different one?<=
br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">S=
ure, debian11 is now stable. We try and avoid rolling releases as a base bu=
t the latest debian should be fine.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; &gt; RUN cd /tmp &amp;&amp; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wget --quiet --no-check-certificate ${CLANG_U=
RL}<br>
&gt; &gt; RUN cd /opt &amp;&amp; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 tar xf /tmp/clang+llvm-Sept-2021-cross-hexago=
n-unknown-linux-<br>
&gt; musl.tar.xz<br>
&gt; <br>
&gt; You&#39;d want to remove the tarball as well.<br>
<br>
Yes, good point.<br>
</blockquote></div></div></div>

--0000000000003fb18d05cd517af4--

