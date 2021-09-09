Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A37405012
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:24:40 +0200 (CEST)
Received: from localhost ([::1]:46374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJ6d-0006Dl-Dz
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mOJ5I-0005Vd-NZ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:23:16 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mOJ49-0004bd-OQ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:23:16 -0400
Received: by mail-io1-xd29.google.com with SMTP id a22so1971134iok.12
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 05:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPWCOCN7I5fMhIzlXNnmaovINysouduTAuXbCRL2MLQ=;
 b=C4u3i0CMEN8mNfz2Eq9Z9xuyW6J1PhST/6Zs2PzTWt4qU5iBOpDiqxbvT7PTv15Qrq
 IoJza4UN680vWT+O1F1WmwdR1zRfYhacx1kpPKCIYRbhy/+gFvt+ZfhiUsJre17Kf+lr
 sqdARCqm7eqWqcgMxWFM74dQnambYB5g/waMzjggIZweROkFIPk7yedZcMxPOVUqwxtZ
 5K/PUtpAHtWT+IlAUL/5c4Unj4aKVF3p7Ao6WFaOVfYx50tbLiRPvrGJ0LnfE/QRdb/B
 /mZnF5ZXKERjapz4W3I83OGMp0veWtbOwS1PVFeBk9sLEg4dhSdGZQ+9d8WhWIAeUE1m
 SjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPWCOCN7I5fMhIzlXNnmaovINysouduTAuXbCRL2MLQ=;
 b=JHJIW9844j36XSgOnQXyHi4MIJpk72/TMCc6wqXAVMqtglkobvJY7xle09sB21QqYw
 wnEAkApILmwd3OPOMA9b4Ad19F8BXmwo4SKptvPbs1FRhQTGHmYL9o9o0un0ppDcTUPx
 5gmNudAR6yQOsPROV6h269OgQ3EfjlU3XFKI35eXbB2joD25yshdE1ePj7znf4e4jh1V
 wrfHrAjpFr/j22Y1fcO9W51y6x7LI+pX/5kCtW7/FetxX8MkJ1YnDHapwJ+hIjHm9Kh+
 YgGAjJgw14OD6TUCQkrXoq9QVpCS8mvT2Qm1V2HQH0AeP1klhowI06XiWsfWbxhTw139
 tvlQ==
X-Gm-Message-State: AOAM5301RFjaE6dUwuCJgZfe5AAw2KizKZJGSV6svlsy7MHVwcdURmV7
 QmE7D/U6T3vvQlItOH19BB+tQVUN1TyiXzbM7K4=
X-Google-Smtp-Source: ABdhPJyYXH55NDNt40ty0Bfec8Yf/cQ5j+fkkUEKzWUhk1bVXQ/5TgNianEXO1ozDa0iSdkfzJVsb4xOEi89iFjuWtE=
X-Received: by 2002:a5e:8711:: with SMTP id y17mr2405584ioj.16.1631190123917; 
 Thu, 09 Sep 2021 05:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTbw0m-n0wmqYPw9C_SFVrCYvqOde6qUsB40FMM9BVPHZg@mail.gmail.com>
 <CAFEAcA-H_titydNAYO94k4i5uiJyTXXt=tNyPd7RfjFMjRYb1w@mail.gmail.com>
 <CALUzjTbsSte6rzFVr+k6EyUJTJV8GW2N5yhxBYxZcjkoCJ=K7g@mail.gmail.com>
 <CAFEAcA-LOUvZu4g1gK3WjrmZpH+B8aj5wrEY77isihetQmPUpA@mail.gmail.com>
In-Reply-To: <CAFEAcA-LOUvZu4g1gK3WjrmZpH+B8aj5wrEY77isihetQmPUpA@mail.gmail.com>
From: Duo jia <jiaduo19920301@gmail.com>
Date: Thu, 9 Sep 2021 20:21:53 +0800
Message-ID: <CALUzjTY3AP6AQKU4kAT0NT4CAwJpy9dsgXHT8YHq7PdWEokfDg@mail.gmail.com>
Subject: Re: Application of QEMUTimer in short timing.
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e5b63605cb8f0b65"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e5b63605cb8f0b65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it.

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B49=E6=9C=888=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:47=E5=86=99=E9=81=93=EF=BC=
=9A

> On Wed, 8 Sept 2021 at 03:50, Duo jia <jiaduo19920301@gmail.com> wrote:
> > Also I want to know how to make a delay in qemu.
> > For example, when I send a UART data, there is a certain time interval
> from setting the register to when the data is sent. Most of this time doe=
s
> not affect the simulation effect, but some guest firmware will execute
> errors when there is no such delay. This is a comparison. Few, but it doe=
s
> exist.
> >
> > My question is, if I really want to add such a delay, how to do it. For
> example, in USART, can I set a callback for sending completion, or add so=
me
> delays that will not cause qemu to freeze.
>
> You can do this kind of thing with an additional timer.
> Look at hw/char/cadenc_uart.c and its handling of char_tx_time
> for an example. In that case it is (despite the name)
> modelling slow data receive, not slow data transmit, but
> the basic idea is the same.
>
> As you say, though, very little guest code really cares about
> UART character timings (and the guest code that does is probably
> buggy strictly speaking). So if I were you I would put "model
> delays in UART timings" very low on your priority list...
>
> -- PMM
>

--000000000000e5b63605cb8f0b65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it.=C2=A0<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Peter Maydell &lt;<a href=3D"mailto:peter=
.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; =E4=BA=8E2021=E5=B9=
=B49=E6=9C=888=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:47=E5=86=99=
=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Wed, 8 Sept 2021 at 03:50, Duo jia &lt;<a href=3D"mailto:jiaduo199203=
01@gmail.com" target=3D"_blank">jiaduo19920301@gmail.com</a>&gt; wrote:<br>
&gt; Also I want to know how to make a delay in qemu.<br>
&gt; For example, when I send a UART data, there is a certain time interval=
 from setting the register to when the data is sent. Most of this time does=
 not affect the simulation effect, but some guest firmware will execute err=
ors when there is no such delay. This is a comparison. Few, but it does exi=
st.<br>
&gt;<br>
&gt; My question is, if I really want to add such a delay, how to do it. Fo=
r example, in USART, can I set a callback for sending completion, or add so=
me delays that will not cause qemu to freeze.<br>
<br>
You can do this kind of thing with an additional timer.<br>
Look at hw/char/cadenc_uart.c and its handling of char_tx_time<br>
for an example. In that case it is (despite the name)<br>
modelling slow data receive, not slow data transmit, but<br>
the basic idea is the same.<br>
<br>
As you say, though, very little guest code really cares about<br>
UART character timings (and the guest code that does is probably<br>
buggy strictly speaking). So if I were you I would put &quot;model<br>
delays in UART timings&quot; very low on your priority list...<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000e5b63605cb8f0b65--

