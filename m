Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9484259C041
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:12:53 +0200 (CEST)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7EZ-0001o8-E6
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouteau@adacore.com>)
 id 1oQ7AP-0005KR-DC
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:08:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouteau@adacore.com>)
 id 1oQ7AL-0007Bw-Is
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:08:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so11236518pjl.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=goEm8a9bZmzDJohwDuNowyjLTHBMe21HAyuONxQz4lE=;
 b=iAHbfEahePsQlJtSbqgev/v/qTxK3A7yY4NMjUl6NbZ64fm5PPu0EC5pLgL7aCQbQV
 ZFAYHvcMYi0jzM1lV9FaOSK1LMmTPBrWcNyuH19rp2GIeDtGzDfvYyN9D/e8uuWDtgW8
 gluhmSL023BTpRZ6SHnlyqYqw9vUhipW5HmJKX3VadpyX5uTQ2Bs0yeuZ0RRtZZyXfM6
 DpWWl0OmSf7snKB2/N4X6+iv9BJy5c4pUZGXUDT9ljn4qF1m0KLpOCLkuQpyUAs44WW0
 qTdM0WboVG+N35UnUxs6uYI/rQlVn6BjAXGMirf+t1RFtVb26AYHzoZ3Tpnf6k745n5q
 lyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=goEm8a9bZmzDJohwDuNowyjLTHBMe21HAyuONxQz4lE=;
 b=pzcNVLmX/iTqwvnWPOLy2useF22gc9hfqIPDpcGdrb0emiiiXGOtnfl3OFpdi1vejj
 fKSah248eM0WSBeFh5KCc7L1wjdER2FlVWoRPcU6srVI8tszXO2uPV0WwChVZZ7iWpuq
 nTGqBGT327vcoDa2VC+yk9miY7OitgGa8TqWwWhjX1ytdR4TWI6cQcXWNstOp3WtvPxK
 1HVTXXx8L9jQ9EfTDLhztlLNrno5ra9ZW+bbjDgzDEy6W6mvFHuqbdhryjZBeyYDV74W
 P9okq+fw9lbBismv+T6Opq2gAL9XlowTFykY/Z5AfR7Nmn6gowJm7U5yubM0X66Rxs+G
 +jwg==
X-Gm-Message-State: ACgBeo0xdKsdV0eLcFFKxRVoMis3xQEj4TrHRIYXk1oFlwNkoP/OJ4sq
 6keb6AqFr+SSrsbnUJZabtreiaPHzicoyidS3kFrCg==
X-Google-Smtp-Source: AA6agR7o09fHsawbnbCNyetHcG/VFkYKAEzt+/59vFgbT6cSIblP8v6Q2jPx4m3zM0BOSX2yjsdAlYF29H4jfrtjNRY=
X-Received: by 2002:a17:902:cec1:b0:172:e677:553b with SMTP id
 d1-20020a170902cec100b00172e677553bmr6007035plg.99.1661173706100; Mon, 22 Aug
 2022 06:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <CY1PR03MB213764AFCA6F51DC5558C1AEB3839@CY1PR03MB2137.namprd03.prod.outlook.com>
 <CAFEAcA8s1MTvtSuX-xjqoxbz_c7_f-V97Ra6Qzy1QdMpfXTLAA@mail.gmail.com>
 <1000569943.5927253.1657274788950@mail.yahoo.com>
 <CALQG_Whc5dNp1yVM5H+8grKawsPfbdzU33ExnjddSEa6n=XpYQ@mail.gmail.com>
 <CY1PR03MB2137D5D2C2C9A0F7D83BD86FB39A9@CY1PR03MB2137.namprd03.prod.outlook.com>
In-Reply-To: <CY1PR03MB2137D5D2C2C9A0F7D83BD86FB39A9@CY1PR03MB2137.namprd03.prod.outlook.com>
From: Fabien Chouteau <chouteau@adacore.com>
Date: Mon, 22 Aug 2022 15:08:09 +0200
Message-ID: <CALQG_WgxN98VcU5+JUFo_La1qFG7kOeaXpX-Vhcp_R78UzEZxA@mail.gmail.com>
Subject: Re: Support for Gaisler multicore LEONx SoCs
To: Gregg Allison <Gregg.Allison@lasp.colorado.edu>
Cc: Frederic Konrad <konrad.frederic@yahoo.fr>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Content-Type: multipart/alternative; boundary="000000000000a9ade205e6d42436"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=chouteau@adacore.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000a9ade205e6d42436
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, Aug 1, 2022 at 6:42 PM Gregg Allison <
Gregg.Allison@lasp.colorado.edu> wrote:

> Fabien, can I obtain the SMP Leon3/Leon4 fork from AdaCore directly?
>

Our fork is here: https://github.com/adacore/qemu/tree/qemu-stable-7.0.0
There is much more than SMP Leon3 in there :)

I add in copy Cl=C3=A9ment Chigot who is in charge of contribution to upstr=
eam
QEMU now.
I think we can put SMP Leon3 on top of the TODO list for contributions.
That being said, no promises on when it can be done :)

Regards,

--=20
Fabien Chouteau

--000000000000a9ade205e6d42436
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 1, 2022 at 6:42 PM Gregg Allis=
on &lt;<a href=3D"mailto:Gregg.Allison@lasp.colorado.edu">Gregg.Allison@las=
p.colorado.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div class=3D"msg7666121393030158623">





<div lang=3D"EN-US">
<div class=3D"gmail-m_7666121393030158623WordSection1"><span style=3D"font-=
size:11pt;font-family:&quot;Calibri&quot;,sans-serif;color:rgb(31,73,125)">=
</span><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-s=
erif;color:rgb(31,73,125)">Fabien, can I obtain the SMP Leon3/Leon4 fork fr=
om AdaCore directly?</span></div></div></div></blockquote><div><br></div><d=
iv>Our fork is here: <a href=3D"https://github.com/adacore/qemu/tree/qemu-s=
table-7.0.0">https://github.com/adacore/qemu/tree/qemu-stable-7.0.0</a></di=
v><div>There is much more than SMP Leon3 in there :)</div><div><br></div><d=
iv>I add in copy Cl=C3=A9ment Chigot who is in charge of contribution to up=
stream QEMU now.</div><div>I think we can put SMP Leon3 on top of the TODO =
list for contributions. That being said, no promises on when it can be done=
 :)<br></div><div><br></div><div>Regards,</div><div><br></div></div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Fabien Chouteau=
<br></div></div></div>

--000000000000a9ade205e6d42436--

