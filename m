Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5D2DD64A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:34:18 +0100 (CET)
Received: from localhost ([::1]:56988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxAP-0008JL-1i
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kpwnK-0005bq-Ff
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:10:27 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:40429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kpwnC-0005dK-HH
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:10:22 -0500
Received: by mail-qv1-xf31.google.com with SMTP id u16so13615089qvl.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 09:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Q8h3zNjaEiHdMv3qp3Pk1N5DgEP41b1CvJZzXLHsFA=;
 b=DUOb/jEOV7qClsdSYanI3gX73nlEOCEmB5bAEfCAk3XmysC1/Cy/MvmF++bWgFJsiQ
 jIbZYod+KFCkGArYB4uUXqyqdqhjYX9uWX+S97QANU40e7guPPlqT2d2TUeFCgUdCcP3
 Tqwf1tz7cGTkq1PsDeT8Ki6g2cD9SHTCVK/x2cu4kVLUNl/9VVrpRe/uhSMir/41IYmI
 LUqSWVcKgzkx6AEjx03cjJCZGlsmUtLS1+SNXyMptlX4qPGuViLgXRl7xpRmE0IIoLFo
 JlARQsgBzRYO+1p5TpFs1AyZBqgYeOFpowh0GgoKs24HsTNlQ+3ppyjToah2KsenmNkG
 Vm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Q8h3zNjaEiHdMv3qp3Pk1N5DgEP41b1CvJZzXLHsFA=;
 b=i/0HDmuaeepWKNL/PveoZINH/z3Vn22xglSyt2LjxszTiK9BRIkN3yj6UUYAEaME9R
 0szd4Mnn4c/RR/ynWCrwB2nZP4RK4ovUetFjJ1tTdKKMnAC0SUDHWOaR69DOUptwT9Vo
 xHkSrpL8o6oYoG25ROS9RI7n1maeq3alvB3LHxbnXJ1D6oapM9qkQCyBV3QJMEWtSuH8
 OCZGw6hoB+ER4bzQf67uIh0KSbPK5g7cp6ISGtys9sleFa+3NctAlvdcTWTBKRq5p6vr
 ib/XlBVX6m6zavP/yyTVinI2tqtzipGNDaYnT9Nr2U/j9CJ8vJgThPoRVMplcz71n4sr
 yBhw==
X-Gm-Message-State: AOAM530iZfUZ1y64bThhnd8BftcajclqilcTE7JABXiHl/hfmO3IHGYN
 9r0hmjGnlhlyxZ655MpE/eocEhcx4KdgtN2G3hEQ5w==
X-Google-Smtp-Source: ABdhPJwm5PtUW/jyMWPq379aOvpwnYvH5wb/IKqF3Ayd5OL8bkVhvkDIFutWDisbVo+EADP3YtZ+BaHpQnt8B6tLTqE=
X-Received: by 2002:a05:6214:16cb:: with SMTP id
 d11mr48899731qvz.62.1608225017256; 
 Thu, 17 Dec 2020 09:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20201216172949.57380-1-thuth@redhat.com>
 <CAFEAcA97zNc3yEfSeBTOuQLFghcJHbh_toJ368HMZzHke+y0SQ@mail.gmail.com>
 <a6271697-c645-968a-7e0f-e1993140633b@redhat.com>
 <20201217140012.GF247354@redhat.com>
 <CANCZdfpQeiWNt38D60W7un0vkK-GRCU-fShW0amfiwjKs=Wv-Q@mail.gmail.com>
 <CAFEAcA_gs5wqr258FBTAKbctKLf4J4etvvu0hfeFPtH6gRy2+g@mail.gmail.com>
In-Reply-To: <CAFEAcA_gs5wqr258FBTAKbctKLf4J4etvvu0hfeFPtH6gRy2+g@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 17 Dec 2020 10:10:07 -0700
Message-ID: <CANCZdfpJ0iGWoSaz3Qarea2nUEM_tkyHw+z7C6J49CrtjrKANg@mail.gmail.com>
Subject: Re: Status/future of QEMU bsd-user impl ? (Wea Re: [PULL 00/12]
 Compile QEMU with -Wimplicit-fallthrough)
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000df7de905b6ac1090"
Received-SPF: none client-ip=2607:f8b0:4864:20::f31;
 envelope-from=wlosh@bsdimp.com; helo=mail-qv1-xf31.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Sean Bruno <sbruno@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000df7de905b6ac1090
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 9:21 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 17 Dec 2020 at 16:03, Warner Losh <imp@bsdimp.com> wrote:
> > On Thu, Dec 17, 2020 at 7:02 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> wrote:
> >> I don't recall what happened after that initial discussion about
> >> merging the new impl. Did Sean simply not have the time to invest
> >> in the merge ? I'll CC him here to see what opinion he has on the
> >> future of bsd-user in QEMU.
> >
> >
> > I've actually taken over for Sean Bruno managing this.
>
> > I'd love to hear from people ways that I can speed things up.
>
> There was a bit of discussion about this on #qemu IRC the other
> day, coincidentally. I think the conclusion we (upstream QEMU)
> came to was that we'd be happy with a "delete all of bsd-user
> and reinstate" approach, assuming that the "reinstate" part is
> in reasonably logical chunks and not one big "here's what we
> have all in one lump" patch.
>
> AIUI from IRC this is being primarily driven by FreeBSD and
> NetBSD/OpenBSD support is merely "we hope it is not broken
> by the delete-and-reinstate but it was probably broken anyway" ?
>

Yea, I don't think it actually works for anything non-trivial on the other
BSDs.

Warner

--000000000000df7de905b6ac1090
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 9:21 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, 17 Dec 2020 at 16:03, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt; On Thu, Dec 17, 2020 at 7:02 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; =
wrote:<br>
&gt;&gt; I don&#39;t recall what happened after that initial discussion abo=
ut<br>
&gt;&gt; merging the new impl. Did Sean simply not have the time to invest<=
br>
&gt;&gt; in the merge ? I&#39;ll CC him here to see what opinion he has on =
the<br>
&gt;&gt; future of bsd-user in QEMU.<br>
&gt;<br>
&gt;<br>
&gt; I&#39;ve actually taken over for Sean Bruno managing this.<br>
<br>
&gt; I&#39;d love to hear from people ways that I can speed things up.<br>
<br>
There was a bit of discussion about this on #qemu IRC the other<br>
day, coincidentally. I think the conclusion we (upstream QEMU)<br>
came to was that we&#39;d be happy with a &quot;delete all of bsd-user<br>
and reinstate&quot; approach, assuming that the &quot;reinstate&quot; part =
is<br>
in reasonably logical chunks and not one big &quot;here&#39;s what we<br>
have all in one lump&quot; patch.<br>
<br>
AIUI from IRC this is being primarily driven by FreeBSD and<br>
NetBSD/OpenBSD support is merely &quot;we hope it is not broken<br>
by the delete-and-reinstate but it was probably broken anyway&quot; ?<br></=
blockquote><div><br></div><div>Yea, I don&#39;t think it actually works for=
 anything non-trivial on the other BSDs.</div><div><br></div><div>Warner=C2=
=A0</div></div></div>

--000000000000df7de905b6ac1090--

