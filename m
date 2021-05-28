Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8759A39478A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 21:43:02 +0200 (CEST)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmiNp-0001S4-47
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 15:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1lmiMi-0008Qg-AZ; Fri, 28 May 2021 15:41:52 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:35469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1lmiMg-0004XM-FW; Fri, 28 May 2021 15:41:52 -0400
Received: by mail-oi1-x236.google.com with SMTP id v22so5348457oic.2;
 Fri, 28 May 2021 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3b/5hZoUJnGGXW2KW5LT7/3XSDYmASHQYpEKst3achE=;
 b=spzRWMOFz+UiIQApbd5NLLF6F7WYevJuGPDz5O41WKqrk4oC8VtG+v9mrqb+zgGpBK
 Yszqc7vPC3so7DmS1cA7MQjZD1arZQvpH3MQvWsMxz2vdtAvPJ+BM4IGaI351KHD3dP5
 yi79DB/9KjlJ7EtHocjd4Ktl5yr8rTg72T7/uOk1DOac8E6rjMilb0gaLHmAwFoQ4n1V
 REL+oHSXtPXOv/l0eOpNbyPZ3IdDnuVxrQDv5XX5Ii5WDpqhP0/xB6W8A0aXJyJ+Mnz0
 vHsPaDxMPmwNm73E9IZFZ0eHePdsQuZ64opKe2WxF9aT9ytkvY1DF9b3BkLCGDDXrNg9
 6xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3b/5hZoUJnGGXW2KW5LT7/3XSDYmASHQYpEKst3achE=;
 b=m7TlgU1qJQeGk26LyKPFPqdv5KwBN64Y5hMsdVVyR9kh6bNWTV7rmecBRreUoZSNhT
 GD+0O76wX8R+zxwWtyGBvpCxE2tK5GULoIL0S8FsmtyOoF0va9Dt28PaoyKjWpt0A6wR
 ZsCxLek3k5upBWJfm0NmkNQ2NGZ0LkT4E6I7x1huLZTtvYEe8fxy3UAZewCjANLE7vwO
 y68FXQjl3yo5Bf6uRUXqdzl2QXCa/19rf1wxxPtQO8dkgztsHcIIPVCEuR2V1Ksvhnyw
 qi7crT8IEgCLpoREL9qrzXyYYfO9lwrB/12uuKVnPYKYZ0D+gemo/2tsHG89o1c/4NRD
 f6Tw==
X-Gm-Message-State: AOAM530nxAsSwLtXHET2tpf1lTRItQwoT6BmWoNkMnB2JE9IOJ0MWrC/
 kTyF2txoVun1us1tFZZdTq+/tvwWT3R1jA1LTsY=
X-Google-Smtp-Source: ABdhPJwDupQxXhznQqnnc1SLRoqVEGDzttT4r7hTDgl5I/IqLT6tSn+GdwAVup2obdwMyvE6kniKUz+SpBcoWKFGml8=
X-Received: by 2002:aca:c384:: with SMTP id t126mr10283471oif.69.1622230908409; 
 Fri, 28 May 2021 12:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
In-Reply-To: <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
From: Swetha Joshi <swethajoshi139@gmail.com>
Date: Fri, 28 May 2021 12:41:33 -0700
Message-ID: <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Dongjiu Geng <gengdongjiu1@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000a198c05c36911ae"
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=swethajoshi139@gmail.com; helo=mail-oi1-x236.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000a198c05c36911ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I apologize for the delay, here are the repro steps:
1. Remove CONFIG_ARM_VIRT=3Dy from arm-softmmu.mak
2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include, in
all the places where we disable kvm using -disable-kvm, replace this
with -enable-kvm
3. Build

You should see errors pointing to these routines: virt_is_acpi_enabled,
acpi_ghes_record_errors

Thanks,
Swetha.

On Fri, May 28, 2021 at 12:08 AM Dongjiu Geng <gengdongjiu1@gmail.com>
wrote:

> Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B45=E6=9C=88=
27=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:19=E5=86=99=E9=81=93=EF=
=BC=9A
> >
> > On Wed, 26 May 2021 at 18:32, Swetha Joshi <swethajoshi139@gmail.com>
> wrote:
> > >
> > > Hello,
> > >
> > > One of the qemu machines we use has KVM enabled, but we don't want th=
e
> CONFIG_ARM_VIRT enabled as it pulls in emulation of a variety of physical
> hardware that we don't need. The compilation errors I mentioned are not i=
n
> the qemu mainline per say but we see them in one of the qemu derived
> machines we use.
> >
> > Sure, but unless you can give me a recipe for reproducing the
> > build failure in mainline I can't really help...
>
> Hi Swetha=EF=BC=8C
>      Yes,  Can you give a method that how to reproduce the build
> failure issues? Thanks
>
> >
> > thanks
> > -- PMM
>


--=20
Regards

Swetha Joshi.

--0000000000000a198c05c36911ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I apologize for the delay, here are the repro steps:<div>1=
. Remove=C2=A0CONFIG_ARM_VIRT=3Dy from arm-softmmu.mak</div><div>2. In .git=
lab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include, in all the pla=
ces where we disable kvm using=C2=A0-disable-kvm, replace this with=C2=A0-e=
nable-kvm</div><div>3. Build</div><div><br></div><div>You should see errors=
 pointing to these routines:=C2=A0<span style=3D"background-color:rgb(255,2=
55,254);color:rgb(0,0,0);font-family:&quot;Droid Sans Mono&quot;,monospace,=
monospace,&quot;Droid Sans Fallback&quot;;font-size:12px;white-space:pre">v=
irt_is_acpi_enabled, </span><span style=3D"background-color:rgb(255,255,254=
);color:rgb(0,0,0);font-family:&quot;Droid Sans Mono&quot;,monospace,monosp=
ace,&quot;Droid Sans Fallback&quot;;font-size:12px;white-space:pre">acpi_gh=
es_record_errors</span></div><div><span style=3D"background-color:rgb(255,2=
55,254);color:rgb(0,0,0);font-family:&quot;Droid Sans Mono&quot;,monospace,=
monospace,&quot;Droid Sans Fallback&quot;;font-size:12px;white-space:pre"><=
br></span></div><div><span style=3D"background-color:rgb(255,255,254);color=
:rgb(0,0,0);font-family:&quot;Droid Sans Mono&quot;,monospace,monospace,&qu=
ot;Droid Sans Fallback&quot;;font-size:12px;white-space:pre">Thanks,</span>=
</div><div><span style=3D"background-color:rgb(255,255,254);color:rgb(0,0,0=
);font-family:&quot;Droid Sans Mono&quot;,monospace,monospace,&quot;Droid S=
ans Fallback&quot;;font-size:12px;white-space:pre">Swetha.</span></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, May 28, 2021 at 12:08 AM Dongjiu Geng &lt;<a href=3D"mailto:gengdongjiu=
1@gmail.com">gengdongjiu1@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
=E4=BA=8E2021=E5=B9=B45=E6=9C=8827=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=
=8D=882:19=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; On Wed, 26 May 2021 at 18:32, Swetha Joshi &lt;<a href=3D"mailto:sweth=
ajoshi139@gmail.com" target=3D"_blank">swethajoshi139@gmail.com</a>&gt; wro=
te:<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; One of the qemu machines we use has KVM enabled, but we don&#39;t=
 want the CONFIG_ARM_VIRT enabled as it pulls in emulation of a variety of =
physical hardware that we don&#39;t need. The compilation errors I mentione=
d are not in the qemu mainline per say but we see them in one of the qemu d=
erived machines we use.<br>
&gt;<br>
&gt; Sure, but unless you can give me a recipe for reproducing the<br>
&gt; build failure in mainline I can&#39;t really help...<br>
<br>
Hi Swetha=EF=BC=8C<br>
=C2=A0 =C2=A0 =C2=A0Yes,=C2=A0 Can you give a method that how to reproduce =
the build<br>
failure issues? Thanks<br>
<br>
&gt;<br>
&gt; thanks<br>
&gt; -- PMM<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards<div><br></div><div>Swet=
ha Joshi.</div></div></div>

--0000000000000a198c05c36911ae--

