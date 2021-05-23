Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851E38DBD3
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 18:11:39 +0200 (CEST)
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkqhV-0007rX-7z
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 12:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scrameta@googlemail.com>)
 id 1lkqdz-000796-Vu
 for qemu-devel@nongnu.org; Sun, 23 May 2021 12:08:00 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scrameta@googlemail.com>)
 id 1lkqdx-0000iu-TP
 for qemu-devel@nongnu.org; Sun, 23 May 2021 12:07:59 -0400
Received: by mail-ed1-x52c.google.com with SMTP id b17so29074299ede.0
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GmmMU3Pd0YB9dduih5KI9P8NwKFaBBsJ3J72S0qzjJU=;
 b=SIwbVVbidEAWo2svDFUE3Akrc5YWk2HrPPV4DaxHGScv1kE7ub2C+FV6h1uiR9XNVG
 6fo/iXuhuuq07ZOtsCWcz23cvH6sru7WuDi8UHLfg+Vj+GS6mau3/SgBXnNHUgAZQiVr
 oXsSYTpNSYKH+DWWMx/nQ1NUFQbfsK4X2UmQ3qGFrxQwbtuPioSh+eerMKjckpuHscTZ
 s61/0nNy3eh4svCXj+EGlw8+OlR+tUp0uLpOjPfNPt9htrLYaViLCdAGAPKRr+9Pg6OT
 c6dOztiijArvV5T8q7+/aD4A2kYFWC0oVWo3pCix7XIBPG5e19tZwL0zokKxxa/5/zZl
 0Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GmmMU3Pd0YB9dduih5KI9P8NwKFaBBsJ3J72S0qzjJU=;
 b=Sfp3DczkWneZ9Ml31eRPrEK9rxPQIdwUnyW4SgdAe3ARVKy8S3IMgoW3Xh6xuF+21v
 NEGDcQ/NiRL6csIAXU4VyTI052INVXkjCaSP7kN46wVEZdu7uU5OLYsDyjsIpnlG81hK
 9oQMrejy8TfrMz+bNQbz5BYBDgf3CJh3JWxPNTV8EQgOFAS0dfWhvA0uvbLQcMJA42WG
 N3lTSpbMnI0nCbF19gWfaAZgIkuGKNMc/vg/zZAEPzogltUkxEcZJmU9BNQb/IyPFfHC
 ri1cXFeLGxbS6au+svTGvoQxHB2CIU3uL+DXL0ysPeKbYU5gqlzbqBu80xHgE6rUZZuE
 X8VA==
X-Gm-Message-State: AOAM530zT3VdGWk+kcbqSPFe7omV9UiMzbZqlw3aeHgHgcx1TL+RG1qp
 byZ7Mjo5k4pkMWOXYxCpj/1dz58nK+P+kWncGIg=
X-Google-Smtp-Source: ABdhPJw7walUwhKPw0Su9C1Wpv34DJULZFwka6gL0l8g2WXvmZ+rYP8n5Wz3d+kB2vX0tFNPMdCCwyM55HVf7XjKW6Q=
X-Received: by 2002:a50:ed06:: with SMTP id j6mr18670727eds.15.1621786073939; 
 Sun, 23 May 2021 09:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAOG2ctwMt9hpqu425+J5cCR_KCt1d2iSxMcbx6ENB41BNMqZ6g@mail.gmail.com>
 <60d91249-621-a6e8-e94b-24f73fbb7825@eik.bme.hu>
In-Reply-To: <60d91249-621-a6e8-e94b-24f73fbb7825@eik.bme.hu>
From: Mark Watson <scrameta@googlemail.com>
Date: Sun, 23 May 2021 18:07:39 +0200
Message-ID: <CAOG2ctxj9toCpfiyrfTJ3VgM49ADCLcp_1CD3bkaQU-ug5mXTg@mail.gmail.com>
Subject: Re: notdirty_write thrashing in simple for loop
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d6c3e905c3017e3e"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=scrameta@googlemail.com; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d6c3e905c3017e3e
Content-Type: text/plain; charset="UTF-8"

Hi

On Sun, 23 May 2021 at 15:41, BALATON Zoltan <balaton@eik.bme.hu> wrote:

> I think you need to be more specific about details or even better provide
> a way to reproduce it without your hardware if possible otherwise people
> will not get what you're seeing. From the above it's not clear to me if
> you're emulating an fpga hardware in QEMU or actually run with the fpga
> (supposedly implementing the Amiga chipset) in the virtual machine's
> memory so accesses to some addresses will do something in hardware (in
> which case it may be difficult to reproduce without it and also could be
> the source of problems so hard to tell what might be causing your issue.)
>

I managed to reproduce now locally without the fpga, on my x86 system.

The issue seems to be the layout of where the Amiga puts code and the
stack. It does not use virtual memory and each program seems to get the
stack just below the code. So whenever the code increments i, it writes to
the page and qemu does a lookup in a map to potentially invalidate the
code.


> (Is this related to pistorm or something based on that for full Amiga
> emulation without Amiga hardware? Just insterested, unrelated to this
> thread.)
>
The minimig is a recreation of the Amiga hardware in the FPGA. In addition
to its own dedicated board, it has been ported to many boards: Turbo
Chameleon, Mist, MiSTer (DE10 Nano with expansion). In the MiSTer an SOC
FPGA chip is used, which has dual arm codes and an fpga on the same
silicon, with high performance bridges beween them.
Pistorm and Buffee are fairly similar, in that they are replacing the 68K
cpu with an emulated cpu, but with intefaces to real hardware. As I
undetstand it, the former uses Musashi and the latter they are writing
their own JIT.


> So you do nothing in the loop just test for the loop variable and this
> sometimes runs slow?
>
Yes in fact even without the test in the loop. Just a loop incrementing i,
where i is on the stack. As I now found out it seems to be an issue if the
code and the variable i are in the same page.

Now I could try to modify the software on the amiga to split stack and
code. I do wonder if some kind of caching layer could be added to qemu so
that repeated invalidates do not take so much cpu time.


> Also verify that these excessive calls to notdirty_write does
> only happen when it's running slow so it's really the source of the
> problems and not something normal otherwise.
>
I have now confirmed this, I enable the trace_event on the notdirty to
confirm.

Many thanks for the qemu and dgb debugging tips, much appreciated. I will
real them.

Mark Watson

--000000000000d6c3e905c3017e3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sun, 23 May 2021 at 15:41, BALATON Zoltan &lt;<a href=
=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; wrote:</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
I think you need to be more specific about details or even better provide <=
br>
a way to reproduce it without your hardware if possible otherwise people <b=
r>
will not get what you&#39;re seeing. From the above it&#39;s not clear to m=
e if <br>
you&#39;re emulating an fpga hardware in QEMU or actually run with the fpga=
 <br>
(supposedly implementing the Amiga chipset) in the virtual machine&#39;s <b=
r>
memory so accesses to some addresses will do something in hardware (in <br>
which case it may be difficult to reproduce without it and also could be <b=
r>
the source of problems so hard to tell what might be causing your issue.)<b=
r></blockquote><div><br></div><div>I managed to reproduce now locally witho=
ut=C2=A0the fpga, on my x86 system.</div><div><br></div><div>The issue seem=
s to be the layout of where the Amiga puts code and the stack. It does not =
use virtual memory and each program seems to get the stack just below the c=
ode. So whenever the code increments i, it writes to the page and qemu does=
 a lookup in a map to potentially invalidate the code.=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
(Is this related to pistorm or something based on that for full Amiga <br>
emulation without Amiga hardware? Just insterested, unrelated to this <br>
thread.)<br></blockquote><div>The minimig is a recreation of the Amiga hard=
ware in the FPGA. In addition to its own dedicated board, it has been porte=
d to many boards: Turbo Chameleon, Mist, MiSTer (DE10 Nano with expansion).=
 In the MiSTer an SOC FPGA chip is used, which has dual arm codes and an fp=
ga on the same silicon, with high performance bridges beween them.<br></div=
><div>Pistorm and Buffee are fairly similar, in that they are replacing the=
 68K cpu with an emulated cpu, but with intefaces to real hardware. As I un=
detstand it, the former uses Musashi and the latter they are writing their =
own JIT.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
So you do nothing in the loop just test for the loop variable and this <br>
sometimes runs slow?<br></blockquote><div>Yes in fact even without the test=
 in the loop. Just a loop incrementing i, where i is on the stack. As I now=
 found out it seems to be an issue if the code and the variable i are in th=
e same page.</div><div><br></div><div>Now I could try to modify the softwar=
e on the amiga to split stack and code. I do wonder if some kind of caching=
 layer could be added to qemu so that repeated invalidates do not take so m=
uch cpu time.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Also verify that these excessive calls to notdirty_write does <b=
r>
only happen when it&#39;s running slow so it&#39;s really the source of the=
 <br>
problems and not something normal otherwise.<br></blockquote><div>I have no=
w confirmed this, I enable the trace_event on the notdirty to confirm.</div=
><div><br></div><div>Many thanks for the qemu and dgb debugging tips, much =
appreciated. I will real them.</div><div>=C2=A0</div><div>Mark Watson</div>=
</div></div>

--000000000000d6c3e905c3017e3e--

