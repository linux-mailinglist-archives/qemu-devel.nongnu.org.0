Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7E4B6EC0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:21:40 +0100 (CET)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyi3-00044o-BD
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:21:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vysakhpillai@gmail.com>)
 id 1nJyeo-0000wZ-It
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:18:19 -0500
Received: from [2607:f8b0:4864:20::42a] (port=40461
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vysakhpillai@gmail.com>)
 id 1nJyen-0005qK-0u
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:18:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c4so13774449pfl.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 06:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TVVK/8MSlE49QnbyhSxayfDHBXxM1QwTsR4QOpzaUOo=;
 b=dtIHwc5x7ek7GcoHgv19eS1bT5oWk4cZtr0A7MRsp+FshfeqWs6Fh3iF+mVThjcPUd
 /45niPqHEdA7qfOuwTquq1XzqU2JVr7S09ANWrzjpWn9irMHUjYSVzBPCWQ8HtGtYQZK
 eM0D4dci1vUkoxscqdnUuOx2X7+irPDGMrAMYx+qxPu2Bgejz6mGQP2xpMY2wZVgS/OY
 31OUsuYzDHQEgeeM246rUAB3wNCwr71NwFgJtAWLxsxTOqtP1CjF2cPHnauAlDW/n9gD
 PpRx57eL0gohbiA64w2Xmd+j80ZiE4RDi/TA75xqSt/ZGdNDILAzwj/OiR9R5g9oREVr
 iigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVVK/8MSlE49QnbyhSxayfDHBXxM1QwTsR4QOpzaUOo=;
 b=vA59AI6rLyo6lK+6JgL8twom9IUL5FfICwKavTh3UYjZiNKvR3wBBfyDILgM/xFngC
 nOfRM/5QT2LFtATnneMnnU73GDCY8vlen7S5CwwwtISLdEpa0I/GvkRISapkih2aCkAN
 xhGW7hbAT6uIwNMUNFxG1AlgXn+TEKJRlxX9dqpL9gw8L3cWQqUrf5r/WkEhCgUf2t5p
 Epfd53pAIHaIxgGk5Semvtlkw84wksDgNENui2vEj3T9xtLYD9CiMSnlf29Yyz3AQxRL
 g53x1ax0u5z2+Y4nphYb9jdlM80/Ya1626LANZYGHW3Hatb6NWFUJq4wXPzDGh4uhHbQ
 gfxQ==
X-Gm-Message-State: AOAM5313BC2DezyM/wNKz2RYrIxSVxqv8MxH3+zIRzubFlBzcpu5QDgb
 GjxrFciwSoXS2ToqD/sX6l1P5lvZtsFGLQwJ/NQ=
X-Google-Smtp-Source: ABdhPJzst80b7/rJeQxXRolz2iQ936I04xtZGS5tJl0wdjkonbFYPdMGU4XYL5IhDl18vAJKbewCUmE+C+g+FC0m/OE=
X-Received: by 2002:a65:458f:: with SMTP id o15mr3718892pgq.92.1644934687158; 
 Tue, 15 Feb 2022 06:18:07 -0800 (PST)
MIME-Version: 1.0
References: <CAAFEQFF9tjKEt1fL5=kiVpRxXX=Ti9HKW-YE1rnFXx0dPB9VQA@mail.gmail.com>
 <CAFEAcA8pr1w8OLRPDHb7+F=9UysEEOhQpU=o6upg_s1AQ-rnbg@mail.gmail.com>
In-Reply-To: <CAFEAcA8pr1w8OLRPDHb7+F=9UysEEOhQpU=o6upg_s1AQ-rnbg@mail.gmail.com>
From: vysakh pillai <vysakhpillai@gmail.com>
Date: Tue, 15 Feb 2022 19:47:55 +0530
Message-ID: <CAAFEQFG+0VOU+HypTwW-5HJjbAhD=8GLk7PMF-R9z4NKXW_2qQ@mail.gmail.com>
Subject: Re: Holding RISCV CPUs in reset
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b4f4f705d80f339c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=vysakhpillai@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
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

--000000000000b4f4f705d80f339c
Content-Type: text/plain; charset="UTF-8"

Thanks for the info Peter. I will look into the ARM implementation.

Cheers,
Vy

On Tue, 15 Feb 2022, 4:49 pm Peter Maydell, <peter.maydell@linaro.org>
wrote:

> On Tue, 15 Feb 2022 at 10:30, vysakh pillai <vysakhpillai@gmail.com>
> wrote:
> >
> > Hi,
> >  In an SMP system like the sifive_u machine which has a RISCV  e_cpu as
> hart0 and a set of u_cpus as hart 1-N, is there a way to start just the
> hart0 and hold the other CPUs in reset until explicitly released by hart0
> SW?
> >
> >  I am working on a machine similar to the sifive_u machine that has a
> set of control registers which are accessible by hart0 to release the other
> cores from reset once the SoC level initialization is completed by the
> hart0 SW. Currently, the CPUs spin if they have a non-zero mhartid,
> executing code from resetvec.
>
> I don't think the riscv code has support for this, but QEMU's
> core machinery does because it's used by some arm boards,
> so it shouldn't be too difficult to add the necessary riscv parts.
>
> You can look at the handling of the 'start-powered-off' property:
> the SoC model sets that on CPUs which do not start running
> immediately. The target/riscv code may need some minor changes
> to do something appropriate with it.
> The power-controller device model on an arm board then starts CPUs
> as required by calling arm_set_cpu_on() or similar. There will
> need to be a riscv-specific version of that code too.
>
> (We don't distinguish "starts powered off" from "starts held
> in reset", because from QEMU's point of view both states are
> the same: the CPU is not executing instructions.)
>
> thanks
> -- PMM
>

--000000000000b4f4f705d80f339c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the info Peter. I will look into the ARM imple=
mentation.<div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div d=
ir=3D"auto">Vy</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, 15 Feb 2022, 4:49 pm Peter Maydell, &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, 15 Feb 2022 at 10:30, vys=
akh pillai &lt;<a href=3D"mailto:vysakhpillai@gmail.com" target=3D"_blank" =
rel=3D"noreferrer">vysakhpillai@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;=C2=A0 In an SMP system like the sifive_u machine which has a RISCV=C2=
=A0 e_cpu as hart0 and a set of u_cpus as hart 1-N, is there a way to start=
 just the hart0 and hold the other CPUs in reset until explicitly released =
by hart0 SW?<br>
&gt;<br>
&gt;=C2=A0 I am working on a machine similar to the sifive_u machine that h=
as a set of control registers which are accessible by hart0 to release the =
other cores from reset once the SoC level initialization is completed by th=
e hart0 SW. Currently, the CPUs spin if they have a non-zero mhartid, execu=
ting code from resetvec.<br>
<br>
I don&#39;t think the riscv code has support for this, but QEMU&#39;s<br>
core machinery does because it&#39;s used by some arm boards,<br>
so it shouldn&#39;t be too difficult to add the necessary riscv parts.<br>
<br>
You can look at the handling of the &#39;start-powered-off&#39; property:<b=
r>
the SoC model sets that on CPUs which do not start running<br>
immediately. The target/riscv code may need some minor changes<br>
to do something appropriate with it.<br>
The power-controller device model on an arm board then starts CPUs<br>
as required by calling arm_set_cpu_on() or similar. There will<br>
need to be a riscv-specific version of that code too.<br>
<br>
(We don&#39;t distinguish &quot;starts powered off&quot; from &quot;starts =
held<br>
in reset&quot;, because from QEMU&#39;s point of view both states are<br>
the same: the CPU is not executing instructions.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000b4f4f705d80f339c--

