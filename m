Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B22C2879
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:45:09 +0100 (CET)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYd2-0000Ci-4L
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khYbU-00086J-Kz; Tue, 24 Nov 2020 08:43:32 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khYbS-0005uc-Iv; Tue, 24 Nov 2020 08:43:32 -0500
Received: by mail-ej1-x62e.google.com with SMTP id f23so28579757ejk.2;
 Tue, 24 Nov 2020 05:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NLt9hYWt++DaPXegFmbT1bFITii7wZIzdrhm/7F/+9s=;
 b=ZnXYmZf1deXbA4c/L05TjPJied7VVDoIFMDKio3TaNCsSF2pzWYxH5SsqfqC4RR4Le
 kX9SEok3Dv2PpGFED2fxbkQUH7qBciD3SWgDzggr7rZJElwFnfR7lYzPG+yrXEIX6fsF
 V8miOLv4G1khrE+h52V4gdzglv+J3CeQEic4i6BlxEzuPCroA6vKSGxBByF5Hp0l4Kyw
 iwLscsrF56tyXFXXerAVIwER3y0I5oxj4Z9FBhTVmnHpv8opAGVkxu3qvLnl1jNf5Nhk
 7G2VhQxfJVdHHrGqwOAm1YhGeJLfg+5tpYAVoa65y2/RFy8fQuYSBa1sfARybpwXZdo0
 j2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NLt9hYWt++DaPXegFmbT1bFITii7wZIzdrhm/7F/+9s=;
 b=k/HGQpjLE3wZp6A2fPQdjGlV1+muJbiNsaGssOl983oJKKQIpgp4e/TOjreBDiHyxH
 cGnoMiKjVkm+/VGF7lRuQCDuHBPywR2NhDl4YCX6RK7M1z6fICu2zloMbUf9iEUa1hN6
 ocCaNdXHHrI7qsuU4uJX3LJ2oVJmRUOBANcfhN3SIMVKIcUp8DdN0rmQul+Ob3I9Rxoy
 86qcMgTkNS7dOKIvof7Spzd6Wuv13eZgfK2hFlFxpN6a3VWOcmBVg0iyiGKNe4JlE+LH
 7oQcLmTGaqb7sAWVejZkEsXYlhlws8Z9ZCZKamq1lWGW5Bt/r0AOQmdmvCpJysMgDVB4
 RR8Q==
X-Gm-Message-State: AOAM5319LfUhrmdyvpsLCZSBU5qThfuM+pTXogQQs72soZ7uUw8Ru5Tu
 MtgLjQe79gyw4ZV4vrFhqKM1lLqspd2KQwPbcSw=
X-Google-Smtp-Source: ABdhPJwOVCUmc3PBNZq/NXpgUE08UumIN7y4dWvnm2usYDBXMZkGSTj/l+xXghtYMtz6Ku/4PqkTztLIRquqce/XYfg=
X-Received: by 2002:a17:906:af47:: with SMTP id
 ly7mr4499786ejb.532.1606225399307; 
 Tue, 24 Nov 2020 05:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20201124125235.266884-1-marcandre.lureau@redhat.com>
 <CAFEAcA8cUpnA9bdp_MBe65YZe+6=avrczSO1=_Gc-gT6d+YVfw@mail.gmail.com>
In-Reply-To: <CAFEAcA8cUpnA9bdp_MBe65YZe+6=avrczSO1=_Gc-gT6d+YVfw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 24 Nov 2020 17:43:06 +0400
Message-ID: <CAJ+F1C+o+xZGyjGMyVGZmTGcvtdFswB2DYNCOmBr7uZwTbzCbQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Remove GCC < 4.8 checks
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006576c005b4da7ec2"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006576c005b4da7ec2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 5:33 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 24 Nov 2020 at 12:52, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version=3D
> > "),
> > QEMU explicitely depends on GCC >=3D 4.8.
>
> You need to be a bit cautious about removing QEMU_GNUC_PREREQ()
> checks, because clang advertises itself as GCC 4.2 via the
> __GNUC__ and __GNUC_MINOR__ macros that QEMU_GNUC_PREREQ()
> tests, and so unless the code has explicitly handled clang
> via a different ifdef or feature test clang will be using
> the fallback codepath in cases like this. So you also need
> to find out whether all our supported versions of clang
> are OK with the gcc-4.4-and-up version of the code before
> removing any particular ifdef.
>
> Compare this previous (not-applied) patchset from Philippe:
>  https://patchew.org/QEMU/20200928125859.734287-1-philmd@redhat.com/
> which dealt with two of these ifdefs, one of which is
> "clearly OK" and the other of which is "needs more analysis".
> The path forward I think is along those lines -- we need
> one patch per ifdef we're trying to remove, and the commit
> message can then include the information about why in
> this case it is OK for clang too (or switch the ifdef
> to check for something else, eg one of clang's feature-specific
> test macros).
>


Thanks for pointing out the series, I missed it. Ok, I'll try to do some
more research.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006576c005b4da7ec2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 5:33 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, 24 Nov 2020 at 12:52, &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Since commit efc6c07 (&quot;configure: Add a test for the minimum comp=
iler version=3D<br>
&gt; &quot;),<br>
&gt; QEMU explicitely depends on GCC &gt;=3D 4.8.<br>
<br>
You need to be a bit cautious about removing QEMU_GNUC_PREREQ()<br>
checks, because clang advertises itself as GCC 4.2 via the<br>
__GNUC__ and __GNUC_MINOR__ macros that QEMU_GNUC_PREREQ()<br>
tests, and so unless the code has explicitly handled clang<br>
via a different ifdef or feature test clang will be using<br>
the fallback codepath in cases like this. So you also need<br>
to find out whether all our supported versions of clang<br>
are OK with the gcc-4.4-and-up version of the code before<br>
removing any particular ifdef.<br>
<br>
Compare this previous (not-applied) patchset from Philippe:<br>
=C2=A0<a href=3D"https://patchew.org/QEMU/20200928125859.734287-1-philmd@re=
dhat.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20=
200928125859.734287-1-philmd@redhat.com/</a><br>
which dealt with two of these ifdefs, one of which is<br>
&quot;clearly OK&quot; and the other of which is &quot;needs more analysis&=
quot;.<br>
The path forward I think is along those lines -- we need<br>
one patch per ifdef we&#39;re trying to remove, and the commit<br>
message can then include the information about why in<br>
this case it is OK for clang too (or switch the ifdef<br>
to check for something else, eg one of clang&#39;s feature-specific<br>
test macros).<br></blockquote><div><br></div><div><br></div><div>Thanks for=
 pointing out the series, I missed it. Ok, I&#39;ll try to do some more res=
earch.<br></div><br clear=3D"all"></div><div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--0000000000006576c005b4da7ec2--

