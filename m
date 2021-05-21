Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954038CDDD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 21:04:23 +0200 (CEST)
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkARZ-0006PD-O7
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 15:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lkAPq-0005WM-NF
 for qemu-devel@nongnu.org; Fri, 21 May 2021 15:02:34 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:43671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lkAPm-00084N-5g
 for qemu-devel@nongnu.org; Fri, 21 May 2021 15:02:34 -0400
Received: by mail-io1-xd29.google.com with SMTP id k16so21144269ios.10
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 12:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/jxyZ6Gj2G7Kjj9wcJOJMllBhAAKW6JQD130oyELeFw=;
 b=O1YpmQBZ54MU6ZWApng4V/AaeBpCT5gNi1RhLLmZXWImLEFpXY3y9obWMckZqVR+FE
 SLrns2goEP3s8TUH97spwbrawGfhbvLIrp7Bng0wOJCw+UC2YDiH526WbeVT0/DpO4yR
 UYg7UTKaoAuK3uDv9B9VEzKvI3apXB0EUPCj9oe4CJGU7Ogl8q+qNDy8v3VYpBcq7tyg
 uq649bs1OQLg+FdnmiEqBJymG9s3LRoi0EyTJ/gtFFEpJ5uxN6hs4cZqCPEBfOf9HHeD
 BWCZVxKiWq8D9K3m72xLIX93YoKPFhO29bKukADM04svV82MfpF1uV+9Zf2erERM0AM9
 AGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jxyZ6Gj2G7Kjj9wcJOJMllBhAAKW6JQD130oyELeFw=;
 b=QNjUg4aRoJKVV7mbRlyi41rpoX+UBqLeqyxePATM8PzhSq6s80QO6xFT0juIolqvzS
 vZQ8HPCpTd7fx4dGVBvWQOEK98ugUN+pVgWIOJz/LytIV3bB3yjgIkkFlatl8R969NJc
 xiKonDOP8azWeyHxLWXbyjKOeTcXdNETvjpBOHUisYXPmnyJk/eDTuLLeA4PTaKD0TLU
 Hqyuiio7XDrjdKDDQwdb9kPU+PAbL1ZFBT7k6J2wBXhTnHwH8btok4DbHtPAlJo+KL3n
 nfY31crEyB7vrNEh+C2KuwKAbQri6neLN+UTzfDFc3Dek4fTh02nD415Q4QDY0TNUBVB
 AYuA==
X-Gm-Message-State: AOAM532OLe0KIkE1l1YY8j1sENza5Kc73snpYA0FLopugJhXvpUoAAAa
 jNzwT+zRzWJjns2S9Ok/XEPKgFqPpqhksrhRSvCLDd/MpS0=
X-Google-Smtp-Source: ABdhPJza2iXMnJ3txJ93kGa5IxMhmX1/RpqRdYpKL+Hd35AqQjtuUhVfDno3/C45NfiJidvxUWpB5evqomgxgQgjTvc=
X-Received: by 2002:a6b:d918:: with SMTP id r24mr199714ioc.25.1621623746439;
 Fri, 21 May 2021 12:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
In-Reply-To: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Sat, 22 May 2021 00:32:00 +0530
Message-ID: <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
Subject: Fwd: GSoC Intro - TUI interface for QMP
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005dac2905c2dbb3b7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd29.google.com
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, armbru@redhat.com,
 wainersm@redhat.com, stefanha@redhat.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005dac2905c2dbb3b7
Content-Type: text/plain; charset="UTF-8"

Hello all,

I am Niteesh, one of the students selected under Google Summer of Code 2021
to work on the project* Interactive, asynchronous QMP TUI.*
Link to my proposal:
https://docs.google.com/document/d/1o_U9txCyqZDYIqqhj4V0IEO9-20KY2pb4egi75ueXco/edit?usp=sharing

The goal of this project is to get an interactive and asynchronous TUI
interface
that is capable of connecting to the AQMP server and communicate with it.

My experience with async stuff and AQMP is writing a chat application to
better understand python's asyncio and trying to connect the UI to AQMP.
The UI built for chatting basically worked as a primitive interface to send
and
receive QMP commands. The below video demonstrates this.
https://github.com/gs-niteesh/Async-Chat-App/blob/master/qemu.mp4

By end of this summer, I would like to get a basic TUI with some desirable
features working. Some of the features I would like to get working are
1) Syntax checking
2) Syntax highlighting
3) Code completion
4) Logging

I would like to hear some of the features you would like to have and also
your
advice's on implementation.

PS: If you are seeing the mail twice, sorry, I forgot to include the
mailing list
in the first time.


Thanks,
Niteesh

--0000000000005dac2905c2dbb3b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hel=
lo all,<br></div><div class=3D"gmail_quote"><div dir=3D"ltr"><div style=3D"=
font-size:small"><br></div><div style=3D"font-size:small">I am Niteesh, one=
 of the students selected under Google Summer of Code 2021</div><div style=
=3D"font-size:small">to work on the project<b>=C2=A0Interactive, asynchrono=
us=C2=A0QMP TUI.</b></div><div style=3D"font-size:small">Link to my proposa=
l:=C2=A0<a href=3D"https://docs.google.com/document/d/1o_U9txCyqZDYIqqhj4V0=
IEO9-20KY2pb4egi75ueXco/edit?usp=3Dsharing" target=3D"_blank">https://docs.=
google.com/document/d/1o_U9txCyqZDYIqqhj4V0IEO9-20KY2pb4egi75ueXco/edit?usp=
=3Dsharing</a></div><div style=3D"font-size:small"><b><br></b></div><div st=
yle=3D"font-size:small">The goal of this=C2=A0project is to get an interact=
ive and asynchronous TUI interface</div><div style=3D"font-size:small">that=
 is capable of connecting to the AQMP server and communicate with it.</div>=
<div style=3D"font-size:small"><br></div><div style=3D"font-size:small">My =
experience=C2=A0with async stuff and AQMP is writing a chat application to<=
/div><div style=3D"font-size:small">better understand python&#39;s asyncio =
and trying to connect the UI to AQMP.</div><div style=3D"font-size:small">T=
he UI built for chatting basically worked as a primitive interface to send =
and</div><div style=3D"font-size:small">receive QMP commands. The below vid=
eo demonstrates=C2=A0this.</div><div style=3D"font-size:small"><a href=3D"h=
ttps://github.com/gs-niteesh/Async-Chat-App/blob/master/qemu.mp4" target=3D=
"_blank">https://github.com/gs-niteesh/Async-Chat-App/blob/master/qemu.mp4<=
/a></div><div style=3D"font-size:small"><br></div><div style=3D"font-size:s=
mall">By end of this summer, I would like to get a basic TUI with some desi=
rable</div><div style=3D"font-size:small">features=C2=A0working. Some of th=
e features I would like to get working are</div><div style=3D"font-size:sma=
ll"><span style=3D"font-family:Roboto,sans-serif;font-size:10pt;white-space=
:pre-wrap">1) Syntax checking</span><br></div><div style=3D"font-size:small=
"><span style=3D"font-family:Roboto,sans-serif;font-size:10pt;white-space:p=
re-wrap">2) Syntax highlighting</span></div><div style=3D"font-size:small">=
<span style=3D"font-family:Roboto,sans-serif;font-size:10pt;white-space:pre=
-wrap">3) Code completion</span></div><div style=3D"font-size:small"><span =
style=3D"font-family:Roboto,sans-serif;font-size:10pt;white-space:pre-wrap"=
>4) Logging</span></div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">I would like to hear some of the features you would li=
ke to have and also your</div><div style=3D"font-size:small">advice&#39;s o=
n=C2=A0implementation.</div><div style=3D"font-size:small"><br></div><div s=
tyle=3D"font-size:small"><div class=3D"gmail_default" style=3D"font-size:sm=
all">PS: If you are seeing the mail twice, sorry, I forgot to include the m=
ailing list</div><div class=3D"gmail_default" style=3D"font-size:small">in =
the first time.</div><br></div><div style=3D"font-size:small"><br></div><di=
v style=3D"font-size:small">Thanks,</div><div style=3D"font-size:small">Nit=
eesh</div></div>
</div></div>

--0000000000005dac2905c2dbb3b7--

