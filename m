Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689BB57B895
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 16:33:37 +0200 (CEST)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEAlc-0001np-4b
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 10:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouteau@adacore.com>)
 id 1oEAiH-00082t-56
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 10:30:09 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouteau@adacore.com>)
 id 1oEAiF-0004Ok-EG
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 10:30:08 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 s18-20020a17090aa11200b001f1e9e2438cso2246169pjp.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 07:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZWV197jMnQ1Njg9vh0NXLPaiqyf9ApHh0N5cyXMlDk=;
 b=je9NA+SlRORZtLz5ceEU/s78XFPvnPK7ARZzPKVXWjo+azm7O6geqgVAHR2PjuJtxK
 Y2nTy+5QQ7YrtoWXuW8o7myWaaFXsSxFZGBVbd2UELwMaZhA0p8pUCxPLBKJfTV4AxjI
 vhOIVJSHtf1cwMiAzPRQziT+BcX2iFBrmtXPxJwPZyzOof9HL+fCglWUQWDKdHMiIePa
 yEWQG/sA5q/HZt8oXaHZTe4RD6BifIAM1p2jYM5zp/06AGYv/gyg1YrUYMRyexHJp7q6
 +3gAgaxe26sVqWkG1He6B57fug/UYpogLAQxi/ahX4PNYUdh7DR8XH02PG5s6H2r2/ii
 t6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZWV197jMnQ1Njg9vh0NXLPaiqyf9ApHh0N5cyXMlDk=;
 b=nLwmCH4TskLRDaPHYnOJuT/UBhgTLEK6msJEexhVzu/tR19L9foHWIhzjwVJtl8rXc
 KYxFncmdbN6l7dyZaRrn+jHo8pVT4nzhtQoavYLqAZKwbklFMp/wAOo5rhZVknMv+A0a
 G47NYONuceDKjUoSMfzChgZXNQ7m/t6bVFWaGAS+Upa5eDspDhzXupS4TVPL4XMNA/Ql
 YPBmmuZZDqfhb/vPXezqCoBt7BCZ3u/M4CQmK6GIkCBc0rCs0zu1n1FMmRjxO7F4kPQ2
 U7dFMx7Z55xfwoWBbWqdJd2tTKdy5T4ZiQaUmblkM8V1gPbz8jYrFP3YzchDS+O8vmVM
 G0WQ==
X-Gm-Message-State: AJIora9sX4yoKJadz5xvyBqJTjXeGci/MDcOeUy5OoX+8E/YRy2Qsi39
 xrweFlEQkI0+Zk5cwgt85YEMQMaUSCLPh+z0kr8eYA==
X-Google-Smtp-Source: AGRyM1uzNsUOiZZeYetfUP3ASh4bvTSDLhSQY8NJ3Z8RJwZgKdMCIgljxnpsUtx8TvKJNXWkN++fYAFqADb7MNh8LV4=
X-Received: by 2002:a17:903:1207:b0:16a:7e87:dad3 with SMTP id
 l7-20020a170903120700b0016a7e87dad3mr39380585plh.99.1658327404809; Wed, 20
 Jul 2022 07:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <CY1PR03MB213764AFCA6F51DC5558C1AEB3839@CY1PR03MB2137.namprd03.prod.outlook.com>
 <CAFEAcA8s1MTvtSuX-xjqoxbz_c7_f-V97Ra6Qzy1QdMpfXTLAA@mail.gmail.com>
 <1000569943.5927253.1657274788950@mail.yahoo.com>
In-Reply-To: <1000569943.5927253.1657274788950@mail.yahoo.com>
From: Fabien Chouteau <chouteau@adacore.com>
Date: Wed, 20 Jul 2022 16:29:48 +0200
Message-ID: <CALQG_Whc5dNp1yVM5H+8grKawsPfbdzU33ExnjddSEa6n=XpYQ@mail.gmail.com>
Subject: Re: Support for Gaisler multicore LEONx SoCs
To: Frederic Konrad <konrad.frederic@yahoo.fr>
Cc: Gregg Allison <gregg.allison@lasp.colorado.edu>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e2a34205e43d6f8a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=chouteau@adacore.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000e2a34205e43d6f8a
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

On Fri, Jul 8, 2022 at 12:16 PM Frederic Konrad <konrad.frederic@yahoo.fr>
wrote:

> About the SMP support AdaCore had a few patches for it, I'll let Fabien
> answer.
>

The patches for SMP support actually come from Gaisler originally (if I
remember correctly).

For sure we at AdaCore support SMP Leon3/Leon4 in our fork of QEMU, and I
think all the required patches are contributed upstream.

-- 
Fabien Chouteau

--000000000000e2a34205e43d6f8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 8, 2022 at 12:16 PM Fr=
ederic Konrad &lt;<a href=3D"mailto:konrad.frederic@yahoo.fr">konrad.freder=
ic@yahoo.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><div style=3D"font-family:Helvetica Neue,Helvetica,Arial,sa=
ns-serif;font-size:13px"><div id=3D"gmail-m_2815899744894986057ydp6e9c7218y=
ahoo_quoted_7277343291">
            <div style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,=
Arial,sans-serif;font-size:13px;color:rgb(38,40,42)"><div dir=3D"ltr">About=
 the SMP support AdaCore had a few patches for it, I&#39;ll let Fabien answ=
er.<br></div></div></div></div></div></blockquote><div><br></div><div>The p=
atches for SMP support actually come from Gaisler originally (if I remember=
 correctly).</div><div><br></div><div>For sure we at AdaCore support SMP Le=
on3/Leon4 in our fork of QEMU, and I think all the required patches are con=
tributed upstream.<br></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr">Fabien Chouteau<br></div></div></div>

--000000000000e2a34205e43d6f8a--

