Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AAC54C9C0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:28:23 +0200 (CEST)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1T4I-0001et-Hy
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ritul.bits@gmail.com>)
 id 1o1SWk-0001um-HE
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 08:53:43 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:46860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ritul.bits@gmail.com>)
 id 1o1SWi-0007EP-Il
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 08:53:42 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3137c877092so59529997b3.13
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=jsVda8jevM+fMdtFvPTM3LQVcbbrgHyx9IwkyOB8tiE=;
 b=lj15rIoOypsVqM7elcdnXsDANK6RfoPhULfDsq3CBf5LG4HwpmFZT1pXELJmDXICOR
 iJ+9t3l2DKyNK7JLRQiNC1BVQCF4sM0D7QUjeVJO3sHehjoKA+o+7yUJFPbfT7R2ke/J
 HxAmaFXEP0VPL3OviiovyHN9niQR9giUsfakhfWCB7Hbzir4YA0FpZaIoBUJTgPxslTX
 43ssiMzu1g+DZVbaTtoi4TrXHzVq3+GrWQTwq2BZcSbXbWgxFuJwfV+yD1QgD7Yw4Bj7
 Td/lV2uRnIrbwtg6PDLZEvbveBrLldNeSXlZIsM4p7oSlu9LFfd8eqJONNZoVJk57Ws0
 qsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jsVda8jevM+fMdtFvPTM3LQVcbbrgHyx9IwkyOB8tiE=;
 b=sZ1KAmmVH18a6WYG9GOj5PGPMIYs6ADEeZMfb0PR3PnqRS4SvYCdyg7lRxaJUvwW1U
 qpC9f4nbPUNPGoF/DgfEAIu6Qbd6fwbFvnlpyaxlnAQSJbvQ974XF1AV3SXN14kgnPS9
 Qh7JfN4nEZpjaRmQ/9s4D9wEwc514vqJ/N/IB5rZUIGectZe7z72m+A7+0KpIBsC4Zct
 ya4jKG+bFZPvJ0B8swxKvJzfbGJOY2MyLvWl5/0fngAoQ//cuiFBi5I9+Y09HjqmOUru
 HoP2UnMaP9NKEaDZo79AZ31p5C1ZMwNqr2TWUjRvz2KL63JDP74s6kRchKXUSne9ZAyU
 zOSA==
X-Gm-Message-State: AJIora98kYedoxHWg9Lyd/dF51VUhdc1Najwh6Amye6soloCwwQT5YDy
 dbSia2HR0wOpolE/J2NCeafg784PG/74xqcD0/5U0uUZV1C3Ng==
X-Google-Smtp-Source: AGRyM1uKqBkn00c4uXI0fuPCicsTGG22KWrwrWnZM5DA4mmxElPk4+8PKo4iZCxQjjW54U0cWt/X1Mcn8efgvCY8RME=
X-Received: by 2002:a0d:ea88:0:b0:30f:cd93:fddb with SMTP id
 t130-20020a0dea88000000b0030fcd93fddbmr11700873ywe.365.1655297619127; Wed, 15
 Jun 2022 05:53:39 -0700 (PDT)
MIME-Version: 1.0
From: ritul guru <ritul.bits@gmail.com>
Date: Wed, 15 Jun 2022 18:23:28 +0530
Message-ID: <CAHHF-2Kxj6LgiPB3gEy=r-e0QWGX7=BSxezqP6LjZ7V1MuEv5w@mail.gmail.com>
Subject: regarding QEMU ACPI table generation and passing acpi tables/methods
 to guest OS
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000095f27e05e17c02ab"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=ritul.bits@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Jun 2022 09:17:40 -0400
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

--00000000000095f27e05e17c02ab
Content-Type: text/plain; charset="UTF-8"

Came across below link about QEMU to pass acpi tables to guest OS.
https://wiki.qemu.org/Features/ACPITableGeneration

Can I get more docs with respect to acpi tables/devices passing to guest OS
from hypervisor or dom0?

Looking for an example how an asl file which gets added in the SSDT table
can be passed to the guest OS with the help of QEMU.



*Thanks & RegardsRitul Guru+91-9916513186*

--00000000000095f27e05e17c02ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;font-size:small;color:#000099"><div class=3D"gmail_default">Came=
 across below link about QEMU to pass acpi tables to guest OS.=C2=A0</div><=
div class=3D"gmail_default"><a href=3D"https://wiki.qemu.org/Features/ACPIT=
ableGeneration" target=3D"_blank">https://wiki.qemu.org/Features/ACPITableG=
eneration</a><br></div><div class=3D"gmail_default"><br></div><div class=3D=
"gmail_default">Can I get more docs with respect to acpi tables/devices pas=
sing to guest OS from hypervisor or dom0?</div><div class=3D"gmail_default"=
><br></div><div class=3D"gmail_default">Looking for an example how an asl f=
ile which gets added in the SSDT table can be passed to the guest OS with t=
he help of QEMU.</div><div class=3D"gmail_default"><br></div></div><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr"><b><font size=3D"2" face=3D"verdana, sans-serif"><span sty=
le=3D"color:rgb(0,0,153)">Thanks &amp; Regards<br>Ritul Guru<br>+91<font si=
ze=3D"2">-</font>9916513186</span></font></b></div></div></div></div>

--00000000000095f27e05e17c02ab--

