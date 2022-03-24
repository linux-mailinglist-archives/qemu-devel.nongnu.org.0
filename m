Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070CB4E6B02
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 00:07:22 +0100 (CET)
Received: from localhost ([::1]:40668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXWY4-0003fv-Kl
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 19:07:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thesamprice@gmail.com>)
 id 1nXWVe-0002tD-AU
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 19:04:50 -0400
Received: from [2a00:1450:4864:20::136] (port=45673
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thesamprice@gmail.com>)
 id 1nXWVc-0005AN-AU
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 19:04:49 -0400
Received: by mail-lf1-x136.google.com with SMTP id p10so4711738lfa.12
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 16:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tIH1QQ3WMmZQRXUJLuHI4BYeC85a3XLQa9Rnhmm1DQ8=;
 b=TQloxxVPOm67U8jzsJacwXU/28ePH1uhlhFXS7+0x5Z3LjGzaDkFH0DlihZbiY8wKA
 m6hWaVrIdsNW/SH7A218y5R7huFFdsWs2u3jOWmwu2kz1bBzsPEmuTPTzJ1OcC2axYJw
 EioxgocPtuPL79iSc2g9D0wZ1eDFj+v/dKLLqSt2hX/NrMiyVA5HrlTE2oCEhVMsZWzN
 boESVhtNSjdmsMOfgMZxUOt4boVsFr38YfQTLO48QjLucIk25w8xBMxg8DOblx92Zk5j
 eBkMxWuM3vhfO8LyZDA5BYPqNjWKXdmlC9NeM/sp7CMCW5+rplHxeDXg8g1o8vUdg5xm
 KBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIH1QQ3WMmZQRXUJLuHI4BYeC85a3XLQa9Rnhmm1DQ8=;
 b=m3qlIim5FcVEaUMpxUxxuP4MZValIvZza01zXLpEy8S0dMnjhOKBsLiaV/oyu5HsB0
 meITJDZiYfpPyyvJ9upDSrxnWrADb6+lSqZxuZVPsiDw5MDT5+n5+4b2RJ4m9uK9IOU/
 UmZe7wm8/UZkPTSga2RawtvVharb33S//pEov4khF0jpvAatfY/Q4pfhykF3ryyLcenB
 ojuxgGPbWbOylNmpujGHg1EyF9XKthXkZg9bQJZMqKNdMFdRnF9Zm4Td7fSywmiClWvY
 O6llqv0Yz1ryRE3DRnWhyoTV1gS9v7BITySPlIExN9lDDnjQ161cTqOU6vCkOKw1neJD
 FatQ==
X-Gm-Message-State: AOAM5310JNaJXS6aoCnbJWIoeRjRDAngHJvCN0Oxa51SY8y58SZ3pMEm
 Hcxs3bLpwXR3/fKUd7IovPkYXE2ihQxXHj37pMY=
X-Google-Smtp-Source: ABdhPJxjks4SMsDwoYaZ9hnW90l0ipC5RhwpZxbcDZfbEsWLmCcfyKud/d5oavQp4BD95epFZOvqOI8P08KsSeXevE8=
X-Received: by 2002:a05:6512:108f:b0:44a:4317:a066 with SMTP id
 j15-20020a056512108f00b0044a4317a066mr5582903lfg.236.1648163086291; Thu, 24
 Mar 2022 16:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAEekfLZ2iJKTZoqDCusrn+Hvcdxxe9TpyshkU9VvrLAVREBWdA@mail.gmail.com>
 <87fsn72hx9.fsf@linaro.org>
In-Reply-To: <87fsn72hx9.fsf@linaro.org>
From: Sam Price <thesamprice@gmail.com>
Date: Thu, 24 Mar 2022 19:04:34 -0400
Message-ID: <CAEekfLZrJSrombH8oDjkTAzwVhThi199G5Uao=cCsWGZmCB+9w@mail.gmail.com>
Subject: Re: Device driver api
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004a57dc05dafedfde"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=thesamprice@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004a57dc05dafedfde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for all the insight.

My use case is for embedded programs interfacing with custom fpga
registers, and getting code coverage for these.
My device wouldn't have value for the community.
I'll play around with dlopen, and prototype some stuff on a fork.

Sam


On Thu, Mar 24, 2022 at 4:51 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Sam Price <thesamprice@gmail.com> writes:
>
> > Is there a shared library interface in the works for writing firmware
> > device models without recompiling all of qemu?
>
> No - but incremental builds should be fairly cheap especially if you
> only build the target you care about, possibly with a reduced config.
>
> > I was reading through
> >
> https://sebastienbourdelin.com/2021/06/16/writing-a-custom-device-for-qem=
u/
>
> That's a nice write-up.
>
> > but was wondering if there was a shared library approach where I could
> build my device driver with some basic functions for getting
> > memory ranges this library supports / etc and then
> >
> > https://elinux.org/images/9/95/Jw-ei-elc2010-final.pdf
> > 10 years ago there was a presentation mentioning using dlopen to do
> > thisd o this type of thing.
>
> The upstream community isn't really motivated to maintain an API for
> external device models because ultimately we believe they are best
> placed in the QEMU code, if not upstream in a fork. There are some forks
> of QEMU which support things like SystemC models but so far none of that
> has been submitted for upstream.
>
> --
> Alex Benn=C3=A9e
>


--=20
Thank you,

Sam Price
(707) 742-3726

--0000000000004a57dc05dafedfde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for all the insight.=C2=A0=C2=A0<div><br><div>My us=
e case is for embedded programs interfacing with custom fpga registers, and=
 getting code coverage for these.<br>My device wouldn&#39;t have value for =
the community.</div><div>I&#39;ll play around with dlopen, and prototype so=
me stuff on a fork.<br><br>Sam</div><div><br></div></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 24, 20=
22 at 4:51 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org=
">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><br>
Sam Price &lt;<a href=3D"mailto:thesamprice@gmail.com" target=3D"_blank">th=
esamprice@gmail.com</a>&gt; writes:<br>
<br>
&gt; Is there a shared library interface in the works for writing firmware<=
br>
&gt; device models without recompiling all of qemu?<br>
<br>
No - but incremental builds should be fairly cheap especially if you<br>
only build the target you care about, possibly with a reduced config.<br>
<br>
&gt; I was reading through <br>
&gt; <a href=3D"https://sebastienbourdelin.com/2021/06/16/writing-a-custom-=
device-for-qemu/" rel=3D"noreferrer" target=3D"_blank">https://sebastienbou=
rdelin.com/2021/06/16/writing-a-custom-device-for-qemu/</a><br>
<br>
That&#39;s a nice write-up.<br>
<br>
&gt; but was wondering if there was a shared library approach where I could=
 build my device driver with some basic functions for getting<br>
&gt; memory ranges this library supports / etc and then<br>
&gt;<br>
&gt; <a href=3D"https://elinux.org/images/9/95/Jw-ei-elc2010-final.pdf" rel=
=3D"noreferrer" target=3D"_blank">https://elinux.org/images/9/95/Jw-ei-elc2=
010-final.pdf</a><br>
&gt; 10 years ago there was a presentation mentioning using dlopen to do<br=
>
&gt; thisd o this type of thing.<br>
<br>
The upstream community isn&#39;t really motivated to maintain an API for<br=
>
external device models because ultimately we believe they are best<br>
placed in the QEMU code, if not upstream in a fork. There are some forks<br=
>
of QEMU which support things like SystemC models but so far none of that<br=
>
has been submitted for upstream.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Thank you,<br><br>Sam Price<br>(707) 742-3726</d=
iv>

--0000000000004a57dc05dafedfde--

