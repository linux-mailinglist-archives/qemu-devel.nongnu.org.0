Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B4D41101E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:32:42 +0200 (CEST)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSDn7-0005zh-Ho
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alivatankhah72@gmail.com>)
 id 1mSDkZ-0004WB-7l; Mon, 20 Sep 2021 03:30:03 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:44029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alivatankhah72@gmail.com>)
 id 1mSDkW-00040G-TR; Mon, 20 Sep 2021 03:30:02 -0400
Received: by mail-qk1-x731.google.com with SMTP id ay33so39423390qkb.10;
 Mon, 20 Sep 2021 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LX/676UtOX6omY/N04kwzI6cT6uWWZeSZsdj1nOV2k4=;
 b=lo53ysv5qZCLJkByWxq3E/yYCCeroNnxhBNPsLKgRpeFdNcYdWD3RbXBIIaR6eTDwE
 RfURSOpnHH/7D+lB5t5gDM3JrA5Cd9EZspOZG2dAma0okO07qiXPiRr7FBoSbmUk0asC
 s/LeD/ojP5soiHwDQMRXIQ9jaUDDClY4aNP1E0syawFsr+vHcDLCXddsX4KBqjFSQv71
 VsIWGh9fpzhqUrb1Ad6nlu+kf6MmzRsmoHfmW270NjRyZ5YHOazTXsDN2fWYUJIrNd8/
 cJ3U8eqYAx8Y26jC8t1MX2rptEtntKWOLc4OmUD+hxygeQ+SdZDTUMeb++Di5hdFILid
 wChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LX/676UtOX6omY/N04kwzI6cT6uWWZeSZsdj1nOV2k4=;
 b=V3uvTNfTMCv0WzNZh3wZmsCfRmaiaFsEVjuBTRvYqZ6JeRp1BVDkncwv1N57nwf2Br
 8rFNKdEVGq2bi8OwTR6autN4JTUZTMWf877g4fEEfujHdRRda2rUSxc2JuKzthv5OCQX
 PjZ8SgQNuNOgBkhlNMlm7e6+kumkaH6JaKXWCf0HW1Xqa6ra6s/xxJp2uM6MRlcmxqrE
 UmEELRnHRvKi+VOf6TN/TfpqFskq+mtTu9KhFKCkbVLQk90TJFwVhCXjzmgjBDHAyXSN
 3hToVcswG9/ZLY9FOdF67NdGcP0K8QmrxOJReEWos5RaekRRmFS85ssG0Vv4ONraNGT0
 G3CA==
X-Gm-Message-State: AOAM532sxKjWuTDcW1Mw16/QGP7g0TOQBAR1rIMQZMr+hfDFQ53oI12y
 137/9pRtgIq+0TSazMa36NO5SLAcBZr+1hoEKFs=
X-Google-Smtp-Source: ABdhPJzH3eTPt53a3IWKxzkG9EIFBlP4FicUukSxc9pVR4Ez0E6p7ikuisOlw0T28N1ATd73mhJ/ixBSpzvDfuTToKw=
X-Received: by 2002:a37:c83:: with SMTP id 125mr5836078qkm.229.1632122998751; 
 Mon, 20 Sep 2021 00:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <CABip9V9nwDNAEg-620hG2r5pyhw_rig+2nf9Ja3s=WA-wmH=jQ@mail.gmail.com>
 <e53eecec-8897-767a-149f-51faffd76d67@amsat.org>
 <CABip9V88osKWXBqSLDscAup6wAoh+_W-6WZR_Okwj9GG60nGCw@mail.gmail.com>
 <CAFEAcA8Mj=icVHh7Jw4UjRhm6W=M7=gpZCfrPuQrQMnaCKAC+A@mail.gmail.com>
 <384c4dd7-312b-9c52-ada5-138840c0217a@amsat.org>
In-Reply-To: <384c4dd7-312b-9c52-ada5-138840c0217a@amsat.org>
From: Ali Vatankhah <alivatankhah72@gmail.com>
Date: Mon, 20 Sep 2021 12:00:23 +0430
Message-ID: <CABip9V-TfUQSA5BwJkoJv7f6gyGR_Pd9f34QDczBcf7ac7m70g@mail.gmail.com>
Subject: Re: high cpu usage in idle state
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000092042205cc683fed"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=alivatankhah72@gmail.com; helo=mail-qk1-x731.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000092042205cc683fed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank a lot Peter and Philippe

On 9/19/21 20:46, Philippe Mathieu-Daud=C3=A9 wrote:
> In the "infinite loop exception" case, '-d int' might be sufficient,
> before using 'exec/cpu', since you'll see the exception raise over
> and over.

I tried -d int and see that a lot of exceptions are rising in idle state
and during boot:

Raise exception at 000000000fd841e4 =3D> 0000000a (00)
Raise exception at 00000000100074cc =3D> 0000000a (00)
....

Can anyone please help me to find why these executions are rising?
Is it kernel configuration mismatch with machine settings? how to debug it?

Best Regards

--00000000000092042205cc683fed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><font face=3D"monospace">Thank a lot Pete=
r and Philippe</font></div><div dir=3D"ltr"><font face=3D"monospace"><br></=
font></div><div dir=3D"ltr"><font face=3D"monospace" color=3D"#000000">On 9=
/19/21=C2=A020:46,=C2=A0<span style=3D"letter-spacing:0.2px;white-space:now=
rap">Philippe Mathieu-Daud=C3=A9=C2=A0</span>wrote:</font></div><div class=
=3D"gmail_quote"><div><font face=3D"monospace">&gt; In the &quot;infinite l=
oop exception&quot; case, &#39;-d int&#39; might be sufficient,</font></div=
><div><font face=3D"monospace">&gt; before using &#39;exec/cpu&#39;, since =
you&#39;ll see the exception raise over</font></div><div><font face=3D"mono=
space">&gt; and over.</font></div><div><font face=3D"monospace"><br></font>=
</div><div><font face=3D"monospace">I tried -d int and see that a lot of ex=
ceptions are rising in idle state and during boot:</font></div><div><font f=
ace=3D"monospace"><br></font></div><div><font face=3D"monospace">Raise exce=
ption at 000000000fd841e4 =3D&gt; 0000000a (00)<br>Raise exception at 00000=
000100074cc =3D&gt; 0000000a (00)<br></font></div><div><font face=3D"monosp=
ace">....</font></div><div><font face=3D"monospace"><br></font></div><div><=
font face=3D"monospace">Can anyone please help me to find why these executi=
ons=C2=A0are rising?=C2=A0</font></div><div><font face=3D"monospace">Is it =
kernel configuration mismatch with machine settings? how to debug it?</font=
></div><div><font face=3D"monospace"><br></font></div><div><font face=3D"mo=
nospace">Best Regards=C2=A0</font></div><div><br></div></div></div>

--00000000000092042205cc683fed--

