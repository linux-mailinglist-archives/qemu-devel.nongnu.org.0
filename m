Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC205225EA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 22:54:35 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noWsM-00037A-2J
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 16:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1noWrE-00023f-7c; Tue, 10 May 2022 16:53:24 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1noWrC-0007V4-QQ; Tue, 10 May 2022 16:53:23 -0400
Received: by mail-qk1-x72e.google.com with SMTP id m1so269775qkn.10;
 Tue, 10 May 2022 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IsBbeXS+30rDMCODtEC/spRUfPOJc+SgPuYL9ug9h0I=;
 b=q2S/jPuym8q2jbV1fikshUpDifomzezq2jW/zktzZnSqJ3bNuAgm9PXD0pYHVuMw9I
 ZZRscm4EHRnhdPf/JfG0/uwoGTrbBRSCHz4tAp2n12klZ07rrMQcXeNSQ9p2XnlxB8+K
 oxoymC3gCFseBP6HGPREbUc2LhOXDeD1CYxYstBljhNxuyAvVxrcEEabIbqgQF3hLzVV
 1i4nZDbOBOCKydsawlqxfqnBKn1XrlzHGx3e6NFJKgYGQ6x1dd7sGZVtNpNS/2WqB9ws
 WZAxxA8TkwyN+2W1Jij9KGGtRA3+3IFoUi68Bql0wadPSEaJarZtndItQUncenxdwoEq
 /Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IsBbeXS+30rDMCODtEC/spRUfPOJc+SgPuYL9ug9h0I=;
 b=thF8cO8D6h3bbbH1hYSF+S30+iTGQrkgdoNEmfP9V6VVLIj/NwjAq1lZqHdfQd40kZ
 X3S9T5ibwTWnjWVErmeddyZu8QXX4chG5cvajW6fsK0Nz9xNQ/cz2rC4vqdiL+Zx1SUQ
 /KHjMdeOk0HvTFeFhhOWupWKX6mg9gf3RweRPALHUda988SP6TqAJ+ngv+q84t2FNiw8
 Dt1mcSp5lGXbGfo8epC5Uj1OJpoSGAK8tlAEnaCkqpoCMQ/Hfw5130CwUPe+0ONWisLe
 AHGigWOZKP3Ey+rQ4boHYc2I+9dzsm0c0zBs/qZjyvnbQUA/5UU0V2TY4XWKkkGUoYq5
 6Vfw==
X-Gm-Message-State: AOAM533gJZzb7zbLGmU8KXVPMIvV3Q6PTlivIW1hpbk40avhZ8gmlGCd
 2aiemrzp68kqbpGISp07OmM4xR82GW9i5alrvtifyGGIpvQ=
X-Google-Smtp-Source: ABdhPJygEhciYZX00Po9JxDLMAiYPh+wWFY8frwZNV3vhyLzpeAwjm5zxySwAd/t0JFi8Xo0yQ0jDsZROShrDhCQ5MY=
X-Received: by 2002:a05:620a:4481:b0:6a0:1dd3:d210 with SMTP id
 x1-20020a05620a448100b006a01dd3d210mr17267665qkp.137.1652216000782; Tue, 10
 May 2022 13:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220509202035.50335-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220509202035.50335-1-philippe.mathieu.daude@gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 10 May 2022 22:53:02 +0200
Message-ID: <CAG4p6K7Aj=N9xEjp1nxKgxb5Hb849zXdLMPpBWsV8Jvriq23-w@mail.gmail.com>
Subject: Re: [PATCH] hw/adc/zynq-xadc: Use qemu_irq typedef
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000d1a63905deae8302"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x72e.google.com
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

--000000000000d1a63905deae8302
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 9, 2022 at 10:20 PM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Except hw/core/irq.c which implements the forward-declared opaque
> qemu_irq structure, hw/adc/zynq-xadc.{c,h} are the only files not
> using the typedef. Fix this single exception.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

$ git grep --files-with-matches --perl-regexp "\bIRQState\b"
hw/core/irq.c
include/qemu/typedefs.h

Reviewed-By: Bernhard Beschow <shentey@gmail.com>

--000000000000d1a63905deae8302
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 9, 2022 at 10:20 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philippe.mathieu.daude@gmail.c=
om">philippe.mathieu.daude@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<=
a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;=
<br>
<br>
Except hw/core/irq.c which implements the forward-declared opaque<br>
qemu_irq structure, hw/adc/zynq-xadc.{c,h} are the only files not<br>
using the typedef. Fix this single exception.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br><=
/div>$ git grep --files-with-matches --perl-regexp &quot;\bIRQState\b&quot;=
<br>hw/core/irq.c<br>include/qemu/typedefs.h</div><br><div class=3D"gmail_q=
uote">Reviewed-By: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com=
">shentey@gmail.com</a>&gt;<br></div></div>

--000000000000d1a63905deae8302--

