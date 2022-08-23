Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55D159E6AE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 18:14:11 +0200 (CEST)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQWXa-0005fJ-Ov
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 12:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oQWJb-0007d4-Qq; Tue, 23 Aug 2022 11:59:43 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oQWJW-0005fZ-FL; Tue, 23 Aug 2022 11:59:43 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x15so12984945pfp.4;
 Tue, 23 Aug 2022 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5/9WAujOPk7f1FmFcvt7ZwBRX/iUYvZP+iuh9bDPgn0=;
 b=XUA1vWKge2nWKNmo2TPQrHCDk8bIGsYNedqH/DhhtmdEOdMGvVYAqZkaWB5HpS0+sN
 VRsbGZiRPZfP19hf/un9hD/Y4BdA6ebEzqNwHg2sJP24mAgS+9la5HHk0BCtLswazL0Z
 O9PLb4b2eUeRHIScG4rEC0jwPrOriVq+xuB2Ybj8Cg40KrjMTSsrCmum2YjwNvh7ua3H
 oh2R9MChDda+F3LPIDFaR2OXTCecaaBjsxriMhnlb5CSf8ZL1iq6Bq6N9qjJuSQCvuEL
 qxHpW1g+Nq1XF+YW54+U5K8ml1EuOwZe+kZ36vKA+zYh1etoz3w1zFgxUbsDLX6dwGaV
 eiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5/9WAujOPk7f1FmFcvt7ZwBRX/iUYvZP+iuh9bDPgn0=;
 b=GKiRLsdhxCsxGPY+SQo0zWUItTG+1oK7LltD7QbG1AuGyrzX3yV8XETcIosKiRGJj7
 rXwqb4/E+ROoYHr+DG10WrvlL/qivZVc7X4MNbWU1ly7P5u/MdZREhQ6Xc/qva2g96ys
 QKZy5rVmVY7Aj5wXSERqQ6j62aaHfSEKy50yfQEkIyHeBdRV6pJG6ILsX3hRhzF8M3eK
 uxMmo5ZgYGkXsY8qjmR3HH5fEFXJKBcwJ4jRgN7WNQkRpb25eLyCv6LqgQy+9Lge3tVb
 XUCNXctBJfhRS80u8fACGX1/IbE7yHTA98LQJMNVZJh2mDvn/jojnf+vgsMWQvI1e66P
 20VQ==
X-Gm-Message-State: ACgBeo1AqjcJVAYOIQMYnVfbTelJLiCkMj1Li3Y9msZ6HNHboQO0BPdH
 0coXR/oJzvVi+s5r81P2Bln6GPvjORdzFHJbTYM=
X-Google-Smtp-Source: AA6agR5SBtkkaKxbl2nWuFxpU3embhbrF3nShIA40t484h+msMpJk5AqrG9HIQHYl37r0irQTzIpacLeE93EWUJpO9A=
X-Received: by 2002:a62:e304:0:b0:536:bdec:5800 with SMTP id
 g4-20020a62e304000000b00536bdec5800mr8072648pfh.49.1661270376619; Tue, 23 Aug
 2022 08:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org>
 <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
 <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
 <CAFEAcA8TmrMo+MOhOutUuwE=GOEFYUGxgRA2_XGZ2iunMTAe5w@mail.gmail.com>
 <CAJtCPL10GL8JL2qb-sZTpmPaHTy7fOoEDb194ZL1NSvXpqGaUQ@mail.gmail.com>
 <CAFEAcA8ozX22==9T33gxS9Ks31fzMgKH9-Eic03gMsg86iTYmA@mail.gmail.com>
In-Reply-To: <CAFEAcA8ozX22==9T33gxS9Ks31fzMgKH9-Eic03gMsg86iTYmA@mail.gmail.com>
From: Shiny Saana <shinysaana@gmail.com>
Date: Tue, 23 Aug 2022 17:59:25 +0200
Message-ID: <CAJtCPL1k5z_QrhMcX_6HYdLY7Tc+3_O3rDUaEqweBpK6-xKAKA@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000aca46005e6eaa66a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=shinysaana@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aca46005e6eaa66a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Your board code should be setting the init-nsvtor property on
> the armv7m object to 0x00200000, if it isn't already.

I'm going to add that property right away!

> Yes, this would be in line with the way we use -kernel on other
> M-profile board models.

Got it! Thank you for correcting my understanding!

> I'll have a think about which one of those I prefer, and maybe
> write a patch...

I do think it would be better with such a solution, yes.
I personally think querying init-nsvtor would reduce complexity and "make
sense".
Or perhaps both?
Something as simple as adding a function taking a functing the base load
address as a parameter, and another that queries init-nsvtor and call it
with that value? Everyone would happy :p

I will go with the "padded 0 bytes" plan for now, so that I can move on
with the rest of the implementation, but please do ping me if you do end up
upstreaming such a patch!
As always, thanks again!

Saana

Le mar. 23 ao=C3=BBt 2022 =C3=A0 16:22, Peter Maydell <peter.maydell@linaro=
.org> a
=C3=A9crit :

> On Tue, 23 Aug 2022 at 15:00, Shiny Saana <shinysaana@gmail.com> wrote:
> > From experimentation and dissasembly on the ROM, (located in
> 0x0020_0000), the very first int (converted to BE) is "0x2020_1000" , whi=
ch
> is located to "OCRAM2", also referred as "ROM RAM" by the documentation,
> and the next int is "0x0020_2091", which both points inside the ROM itsel=
f
> , and which when forcibly disassembled in Ghidra does look like a functio=
n.
> > So I'm pretty confident the initial vector base address is 0x0020_0000.
>
> Right. In fact, rereading the datasheet, I see that I overlooked
> that the IOMUXC_GPR_GPR16 reset value is actually specified. Bits
> [31:7] of that are the CM7_INIT_VTOR, which is to say that they're
> bits [31:7] of the initial vector table address. And they're set
> so that is 0x0020_0000.
>
> Your board code should be setting the init-nsvtor property on
> the armv7m object to 0x00200000, if it isn't already.
>
> > Regarding the "kernel loading" issue, I believe that I was initially
> > mistaken. From other examples online, I believed that it was the way
> > to load the Teensy image. But thinking and discussing it with another
> > ARM dev, wouldn't the ROM itself actually be considered the kernel?
>
> Yes, this would be in line with the way we use -kernel on other
> M-profile board models.
>
> > Knowing that, if the call to  armv7m_load_kernel() is mandatory,
> > maybe it would make sense to load the ROM in C code via this
> > function, with the compiled ROM addresses from 0x0000_0000 to
> > 0x001F_FFFF being padded with 0.
>
> That's one way to do it. I think it would be better to adjust
> armv7m_load_kernel() so that it loaded the file to a board-specific
> ROM base, which would avoid the need for the weird zero-padding.
> Two options:
>  * we could make armv7m_load_kernel() take a base address as well as
>    a size for the region it loads the "kernel" to
>  * we could have armv7m_load_kernel() be clever enough to query
>    the CPU to find out what the VTOR value is and load the
>    "kernel" there
>
> I'll have a think about which one of those I prefer, and maybe
> write a patch...
>
> thanks
> -- PMM
>

--000000000000aca46005e6eaa66a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0=
,0) rgb(204,204,204);color:rgb(0,0,0)">&gt; Your board code should be setti=
ng the init-nsvtor property on</span><br style=3D"font-family:-apple-system=
,HelveticaNeue"><span style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0=
) rgb(204,204,204);color:rgb(0,0,0)">&gt; the armv7m object to 0x00200000, =
if it isn&#39;t already.</span><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I&#39;m going to add that property right away!</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><span style=3D"border-color:rgb(0,0,0) r=
gb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">&gt; Yes, this woul=
d be in line with the way we use -kernel on other</span><br style=3D"font-f=
amily:-apple-system,HelveticaNeue"><span style=3D"border-color:rgb(0,0,0) r=
gb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">&gt; M-profile boar=
d models.</span><br></div><div dir=3D"auto"><span style=3D"border-color:rgb=
(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)"><br></span=
></div><div dir=3D"auto">Got it! Thank you for correcting my understanding!=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><span style=3D"border-c=
olor:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">&g=
t; I&#39;ll have a think about which one of those I prefer, and maybe</span=
><br style=3D"font-family:-apple-system,HelveticaNeue"><span style=3D"borde=
r-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)"=
>&gt; write a patch...</span><br></div><div dir=3D"auto"><span style=3D"bor=
der-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0=
)"><br></span></div><div dir=3D"auto"><span style=3D"border-color:rgb(0,0,0=
) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">I do think it wo=
uld be better with such a solution, yes.</span></div><div dir=3D"auto"><spa=
n style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);c=
olor:rgb(0,0,0)">I personally think querying init-nsvtor would reduce compl=
exity and &quot;make sense&quot;.</span></div><div dir=3D"auto"><span style=
=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rg=
b(0,0,0)">Or perhaps both?</span></div><div dir=3D"auto"><span style=3D"bor=
der-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0=
)">Something as simple as adding a function taking a functing the base load=
 address as a parameter, and another that queries init-nsvtor and call it w=
ith that value? Everyone would happy :p</span></div><div dir=3D"auto"><span=
 style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);co=
lor:rgb(0,0,0)"><br></span></div><div dir=3D"auto"><span style=3D"border-co=
lor:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">I w=
ill go with the &quot;padded 0 bytes&quot; plan for now, so that I can move=
 on with the rest of the implementation, but please do ping me if you do en=
d up upstreaming such a patch!=C2=A0</span></div><div dir=3D"auto"><span st=
yle=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color=
:rgb(0,0,0)">As always, thanks again!</span></div><div dir=3D"auto"><span s=
tyle=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);colo=
r:rgb(0,0,0)"><br></span></div><div dir=3D"auto"><span style=3D"border-colo=
r:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">Saana=
</span></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Le=C2=A0mar. 23 ao=C3=BBt 2022 =C3=A0 16:22, Peter Maydell &lt;=
<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt=
; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)">On Tue, 23 Aug 2022 at 15:0=
0, Shiny Saana &lt;<a href=3D"mailto:shinysaana@gmail.com" target=3D"_blank=
">shinysaana@gmail.com</a>&gt; wrote:<br>
&gt; From experimentation and dissasembly on the ROM, (located in 0x0020_00=
00), the very first int (converted to BE) is &quot;0x2020_1000&quot; , whic=
h is located to &quot;OCRAM2&quot;, also referred as &quot;ROM RAM&quot; by=
 the documentation, and the next int is &quot;0x0020_2091&quot;, which both=
 points inside the ROM itself , and which when forcibly disassembled in Ghi=
dra does look like a function.<br>
&gt; So I&#39;m pretty confident the initial vector base address is 0x0020_=
0000.<br>
<br>
Right. In fact, rereading the datasheet, I see that I overlooked<br>
that the IOMUXC_GPR_GPR16 reset value is actually specified. Bits<br>
[31:7] of that are the CM7_INIT_VTOR, which is to say that they&#39;re<br>
bits [31:7] of the initial vector table address. And they&#39;re set<br>
so that is 0x0020_0000.<br>
<br><span style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,20=
4,204);color:rgb(0,0,0)">Your board code should be setting the init-nsvtor =
property on</span><br style=3D"font-family:-apple-system,HelveticaNeue"><sp=
an style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);=
color:rgb(0,0,0)">the armv7m object to 0x00200000, if it isn&#39;t already.=
</span><br>
<br>
&gt; Regarding the &quot;kernel loading&quot; issue, I believe that I was i=
nitially<br>
&gt; mistaken. From other examples online, I believed that it was the way<b=
r>
&gt; to load the Teensy image. But thinking and discussing it with another<=
br>
&gt; ARM dev, wouldn&#39;t the ROM itself actually be considered the kernel=
?<br>
<br>
Yes, this would be in line with the way we use -kernel on other<br>
M-profile board models.<br>
<br>
&gt; Knowing that, if the call to=C2=A0 armv7m_load_kernel() is mandatory,<=
br>
&gt; maybe it would make sense to load the ROM in C code via this<br>
&gt; function, with the compiled ROM addresses from 0x0000_0000 to<br>
&gt; 0x001F_FFFF being padded with 0.<br>
<br>
That&#39;s one way to do it. I think it would be better to adjust<br>
armv7m_load_kernel() so that it loaded the file to a board-specific<br>
ROM base, which would avoid the need for the weird zero-padding.<br>
Two options:<br>
=C2=A0* we could make armv7m_load_kernel() take a base address as well as<b=
r>
=C2=A0 =C2=A0a size for the region it loads the &quot;kernel&quot; to<br>
=C2=A0* we could have armv7m_load_kernel() be clever enough to query<br>
=C2=A0 =C2=A0the CPU to find out what the VTOR value is and load the<br>
=C2=A0 =C2=A0&quot;kernel&quot; there<br>
<br>
I&#39;ll have a think about which one of those I prefer, and maybe<br>
write a patch...<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000aca46005e6eaa66a--

