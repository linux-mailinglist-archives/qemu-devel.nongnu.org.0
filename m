Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217657D4B6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:17:11 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcbe-0001ul-BL
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1oEYrg-0006jh-VA
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:17:28 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1oEYrf-0003T4-7K
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:17:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id b11so3942221eju.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=9f2OuqYtPqOokpSul20pyXfqGlx/FCB4qSITGvZViMk=;
 b=V3U7IPO7OyZ/w09RcSKQB027L1CeSiyE+JXHKw3WvLJMSQKGJ3vKGPcVIFJ1w9RSW/
 aGcUwIW9ewUNHthz7T18xof4milVtu7Z6ytH5brYUDyzS4ouc9rqm5awq7po7SUPvOQb
 8ryKpwxaJG2rT/6mV6Zb8eaT0cudFMX1zEsLsAJkjAw3BH4Zsqt/K455/WwpEayFIMRX
 RRckiRjE2s095fZxjPEtsrDVVdl/besBurGuI+0aSiXrb/wkFNWoIg1wAwnZrNt+b4tZ
 L3qIW97wi7AcoeEfHJVZ8rC0sggiT7IUtoJZjWLhVwDb2r6+JXhMc5dZ4Gk6dvRgB6/4
 blog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9f2OuqYtPqOokpSul20pyXfqGlx/FCB4qSITGvZViMk=;
 b=A4WjHEAfOOcqD119/DW920o8FOvk9xIQQSQTNW6MXPKI9BAmGUBL2I0fMnc6s9vvXt
 fd1BO1Cr9D9GEsdf7f4AUPURNEmo5VDmZY0hvNOTkqUr4sRsaNsJ0iWbAPTcqSZQTQth
 IMsZrHrlD0c49NI0UbEcvJqxp/VLQaHj1A+MW7YB6BWmI1alOh8lNgSHFKopgWSHmpoR
 TKB653oirxFZvvfaZKdKy0t1ddIihS1lxvnKcDPKhcw7rzIGysRFPtsmwAd4Dw2l8I9X
 IXJqQlHe2wBI3K/pOPwIz/cZHfpMEzkhzCgEZt3o17RT6+6GJRGNE+sRzy2wy5dxXs7m
 N3AQ==
X-Gm-Message-State: AJIora99kPe4Fm4xJDVltQcLCV5t9VJvRnc1mJN8jHrFTQMtcZC5YbER
 k9ZqdcdcyPviNkMEwQypbthyNvWn0aIKjFDERhAmtJ7jChYjxQ==
X-Google-Smtp-Source: AGRyM1sofZ1h5B+0mV3/RDzcPgEguzeUjFGybv1Cz4kWALfAVc7N+3dRWqQOXFtC8yZb0Fu99lUufKA1gEionTLYwkY=
X-Received: by 2002:a17:906:478b:b0:72b:5cd6:3f50 with SMTP id
 cw11-20020a170906478b00b0072b5cd63f50mr40407349ejc.514.1658420244537; Thu, 21
 Jul 2022 09:17:24 -0700 (PDT)
MIME-Version: 1.0
From: Roque Arcudia Hernandez <roqueh@google.com>
Date: Thu, 21 Jul 2022 09:17:13 -0700
Message-ID: <CAKbPEtZxCGfz4_h8_YMg2bb-kQF0sorLAppKcBTweV0gxM+OLA@mail.gmail.com>
Subject: Hard limit on 256 IRQs in qtest
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009159cd05e4530d78"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=roqueh@google.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -156
X-Spam_score: -15.7
X-Spam_bar: ---------------
X-Spam_report: (-15.7 / 5.0 requ) BAYES_40=-0.001, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Jul 2022 16:12:41 -0400
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

--0000000000009159cd05e4530d78
Content-Type: text/plain; charset="UTF-8"

Hello,

To write a qtest for an SoC using ARM GICv3 as interrupt controller the
qtest infrastructure is short on IRQs.

File tests/qtest/libqtest.c defines:

#define MAX_IRQ 256

Which is the number of elements in the array that is used to keep track of
the value of the irq gpio:

    bool irq_level[MAX_IRQ];

The GICv3 can take up to 1020. The SoC we are trying to emulate uses more
than the current 256 limit we can observe at the GIC input. If we focus
just on the external interrupt range the GIC would need 1020 - 32 = 988
IRQs. Will it be OK to make this change to the qtest infrastructure?

Thanks,

Roque

--0000000000009159cd05e4530d78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-a32f83f5-7fff-3f69-42=
dd-1c202ecbf015"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Hello,</s=
pan></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">To write a qte=
st for an SoC using ARM GICv3 as interrupt controller the qtest infrastruct=
ure is short on IRQs.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">File tests/qtest/libqtest.c defines:</span></p><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">#define MAX_IRQ 256</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Which is the number of elements =
in the array that is used to keep track of the value of the irq gpio:</span=
></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=
=A0=C2=A0bool irq_level[MAX_IRQ];</span></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">The GICv3 can take up to 1020. The SoC we are trying =
to emulate uses more than the current 256 limit we can observe at the GIC i=
nput. If we focus just on the external interrupt range the GIC would need 1=
020 - 32 =3D 988 IRQs. Will it be OK to make this change to the qtest infra=
structure?</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">T=
hanks,</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Roque=
</span></p></span><br class=3D"gmail-Apple-interchange-newline"></div>

--0000000000009159cd05e4530d78--

