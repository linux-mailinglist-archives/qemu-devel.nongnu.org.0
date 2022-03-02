Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDED4CAF4F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:05:08 +0100 (CET)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPVDf-0001uQ-Ce
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:05:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1nPVCA-0001D9-Ky
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:03:36 -0500
Received: from [2607:f8b0:4864:20::231] (port=34463
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1nPVC8-00076b-EO
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:03:33 -0500
Received: by mail-oi1-x231.google.com with SMTP id i5so2802853oih.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=oYQSqv9XQngXsr1cCcqmYfsRmoVKH7oHbFnJrAUg7F0=;
 b=PM+R6bkmFhNC1wWhRG1JeDSNo3BErF/x7KfFfXAaCyZaWFn4htSpCF6Qk48o9H8yUH
 rUrTo9nzVLHhUa2XU9nZSEkZ+ymGdsuJOR6PpXBna79NwnL4pSNYjtaNFuktqHvu4zTB
 Gp1xQ6eyJo4RVVxm6l9dcQAyfWXZ2s5qQa6L6C0m0fW8tqjQBqn3Yn3XB9aWDVAdhLHl
 PZOngrg+vSdNjt8fwVEQrAyL+Epy0zZBhIhOGXegnzZCouE59ElcEVXdozUeS5dhdLHi
 rk9xdDx+phOE2oq9bQX9r1w1nuOn30L1FKbtVnUEITzM3+m8+vqElj0TRkmZ3JpwuZhF
 +R3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oYQSqv9XQngXsr1cCcqmYfsRmoVKH7oHbFnJrAUg7F0=;
 b=x3FN3PizChAHL6tD1Wff94FwC+CE7JTQitfJKak3K7itPm3irjYUiCPzlyGIoTS4BT
 /mcsdKfRphaVYkN/UlSAhSZjJdr/rA3MQklMvkRjUoOXj/vancpe3YRdfblAfp/1jgV2
 dE/ZD0Cs6gL91oNRAsPTsHhvb8TGFkJqCWyFYMs4jFlOBYc3dRPjStZ7K2GexrnfKpsj
 flwcoQArI7QjltfVhcsKZj862sogJGAF+lvFFeKg1GVDIthbQuSPQsrk5D4xIXM5V0sp
 Q9KGYvZjUQV9fjkHokRsT4wbooF/QOmi8UBh1jUYy6Lb/T7QQ6zukwspvlzhw8Tlszhz
 3J6A==
X-Gm-Message-State: AOAM53081Rdnlu35F8TeAuH+zjIDBhcWnpgGwgGS2oKEyRwVXhOT1aH7
 CT+fhelzEuBB9H/zuKbOJa3ZeKE4HqOGPrP2KziFNeWXuBM=
X-Google-Smtp-Source: ABdhPJw9tMR5hC/31z+jgRQCs0l6oZqqMhpzy8u//a8sl+IZYnPVRZNW9Tf2kz8xHFbValS/PiocSijDatvtuPPm+Ww=
X-Received: by 2002:aca:5b85:0:b0:2d3:fe13:177f with SMTP id
 p127-20020aca5b85000000b002d3fe13177fmr1431179oib.59.1646251410080; Wed, 02
 Mar 2022 12:03:30 -0800 (PST)
MIME-Version: 1.0
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 2 Mar 2022 21:03:19 +0100
Message-ID: <CABLmASFbowE4Cu8gHk9eD+_h8ZrdupE8MHKAfpW+T8Oe=-3=Wg@mail.gmail.com>
Subject: Issue with qemu-system-ppc running OSX guests
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000082462505d941c660"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HEXHASH_WORD=1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082462505d941c660
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I noticed qemu-system-ppc running OSX guests does not get to the desktop or
does not display the menu bars.

Bisecting lead to this commit:

80eca687c8513a7e1611e0441abdd68b0c02a1d6 is the first bad commit
commit 80eca687c8513a7e1611e0441abdd68b0c02a1d6
Author: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Date:   Wed Mar 2 06:51:36 2022 +0100

    target/ppc: moved vector even and odd multiplication to decodetree

    Moved the instructions vmulesb, vmulosb, vmuleub, vmuloub,
    vmulesh, vmulosh, vmuleuh, vmulouh, vmulesw, vmulosw,
    muleuw and vmulouw from legacy to decodetree. Implemented
    the instructions vmulesd, vmulosd, vmuleud, vmuloud.

    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: Lucas Mateus Castro (alqotel) <
lucas.araujo@eldorado.org.br>
    Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
    Message-Id: <20220225210936.1749575-3-matheus.ferst@eldorado.org.br>
    Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

 target/ppc/helper.h                 | 24 ++++++------
 target/ppc/insn32.decode            | 22 +++++++++++
 target/ppc/int_helper.c             | 20 +++++-----
 target/ppc/translate/vmx-impl.c.inc | 77
++++++++++++++++++++++++++++---------
 target/ppc/translate/vmx-ops.c.inc  | 15 ++------
 tcg/ppc/tcg-target.c.inc            |  6 +++
 6 files changed, 112 insertions(+), 52 deletions(-)

Best,
Howard

--00000000000082462505d941c660
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I noticed qemu-syste=
m-ppc running OSX guests does not get to the desktop or does not display th=
e menu bars.=C2=A0 <br></div><div><br></div><div>Bisecting lead to this com=
mit:</div><div><br></div><div>80eca687c8513a7e1611e0441abdd68b0c02a1d6 is t=
he first bad commit<br>commit 80eca687c8513a7e1611e0441abdd68b0c02a1d6<br>A=
uthor: Lucas Mateus Castro (alqotel) &lt;<a href=3D"mailto:lucas.castro@eld=
orado.org.br">lucas.castro@eldorado.org.br</a>&gt;<br>Date: =C2=A0 Wed Mar =
2 06:51:36 2022 +0100<br><br>=C2=A0 =C2=A0 target/ppc: moved vector even an=
d odd multiplication to decodetree<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Moved=
 the instructions vmulesb, vmulosb, vmuleub, vmuloub,<br>=C2=A0 =C2=A0 vmul=
esh, vmulosh, vmuleuh, vmulouh, vmulesw, vmulosw,<br>=C2=A0 =C2=A0 muleuw a=
nd vmulouw from legacy to decodetree. Implemented<br>=C2=A0 =C2=A0 the inst=
ructions vmulesd, vmulosd, vmuleud, vmuloud.<br>=C2=A0 =C2=A0 <br>=C2=A0 =
=C2=A0 Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org">richard.henderson@linaro.org</a>&gt;<br>=C2=A0 =C2=A0 Signed=
-off-by: Lucas Mateus Castro (alqotel) &lt;<a href=3D"mailto:lucas.araujo@e=
ldorado.org.br">lucas.araujo@eldorado.org.br</a>&gt;<br>=C2=A0 =C2=A0 Signe=
d-off-by: Matheus Ferst &lt;<a href=3D"mailto:matheus.ferst@eldorado.org.br=
">matheus.ferst@eldorado.org.br</a>&gt;<br>=C2=A0 =C2=A0 Message-Id: &lt;<a=
 href=3D"mailto:20220225210936.1749575-3-matheus.ferst@eldorado.org.br">202=
20225210936.1749575-3-matheus.ferst@eldorado.org.br</a>&gt;<br>=C2=A0 =C2=
=A0 Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org=
">clg@kaod.org</a>&gt;<br><br>=C2=A0target/ppc/helper.h =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 ++++++------<br>=C2=A0target/pp=
c/insn32.decode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++++<b=
r>=C2=A0target/ppc/int_helper.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 20 +++++-----<br>=C2=A0target/ppc/translate/vmx-impl.c.inc | 77 ++++++++++=
++++++++++++++++++---------<br>=C2=A0target/ppc/translate/vmx-ops.c.inc =C2=
=A0| 15 ++------<br>=C2=A0tcg/ppc/tcg-target.c.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A06 +++<br>=C2=A06 files changed, 112 insertions(+),=
 52 deletions(-)<br></div><div><br></div><div>Best,</div><div>Howard<br></d=
iv></div>

--00000000000082462505d941c660--

