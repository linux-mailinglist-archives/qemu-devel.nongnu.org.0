Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A001D8F61
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 07:49:58 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jav8X-00066I-Mk
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 01:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <padmajain967@gmail.com>)
 id 1jav7X-0005fC-PJ
 for qemu-devel@nongnu.org; Tue, 19 May 2020 01:48:56 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:43432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <padmajain967@gmail.com>)
 id 1jav7W-0003QS-7I
 for qemu-devel@nongnu.org; Tue, 19 May 2020 01:48:55 -0400
Received: by mail-oi1-x22a.google.com with SMTP id i22so11292861oik.10
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 22:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2VGnxm/gniTDeAciS2a++UbP0W+wX9+HhoW5xPPYPRQ=;
 b=A3p9MGhJqUSanVmBIZss9SChK+18nyCH0eyIyuz3PeZYMaITaqThKIvkksPYB7ubZc
 aHc1EoFymqTSM8mCtLCkAjnEGlnVQ6+RMpcnhYSh36zBIzVpfAOerWZQe4d5q1FK9pvE
 SLjz25lzeBQYSrUgIuAfwxDP8D6XX+XpF2/9y6alLrnNmXl61IqhgcYLSE4e+NSno+gN
 PIOPzKi0uXEzeIePzYRhyCKFnyN9J0zaWwjVTmvLokv7Slm7ydqH5fnRp8xCFHzrtuTZ
 KYkUxzSfHaKxpQ7CPYtf7MWVhdna4/wtaEhIkNwBd+7vu7ikoDYvwqhwTcFE1G8xdXAP
 AaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2VGnxm/gniTDeAciS2a++UbP0W+wX9+HhoW5xPPYPRQ=;
 b=Yf9QwBDl62TqFMTwuUkIOQbWLlTIYjntRcBp+lMftx+3qDPhVSBE1X0jxr7CoGzkYc
 wCkymsfJyFQAbzjd3nA6U9FX8oLwqkQuLQ8Lh0gh6H0bGaA+hpAAqRvnUU9z5+4AoxzS
 ZR4CpGNdgWhL8oiC0WSEUujoaNwS99V7z2sXn3BY6N9saCrDoirrwOAosIrmAXmG2hdp
 KhHExlGS+weBjDpGyWi+kLwcZoq5LyvyEsh22GpfNJMOna7FN+TueKte5edadDffleca
 eeT7WmX0w6Iynepay5F1vIqDo2FsF8MuJddsmqEWEq1DFd00kJzeKno/G9rbiaEQ86wJ
 E+6w==
X-Gm-Message-State: AOAM532tn+m32D1yFn6iCFS9n3SHLCJfJxEc3n5JVLlOSXR9XAMaMxDb
 L5ZJV87fcsfkTCE9c8vhlOTgdhPjbxnQ/ZVfO5SlQQ==
X-Google-Smtp-Source: ABdhPJyV1y51NYBK8/F0yRWL2ieYbkJ9KYMqxyrbHni6Gj/tKGxVLI/MCtlgwlFpSFxxJpErcKzhgoheueFZ2phmo7w=
X-Received: by 2002:aca:5907:: with SMTP id n7mr2110764oib.136.1589867332499; 
 Mon, 18 May 2020 22:48:52 -0700 (PDT)
MIME-Version: 1.0
From: padma jain <padmajain967@gmail.com>
Date: Tue, 19 May 2020 11:18:41 +0530
Message-ID: <CAO9fdnYKSAre-0euSDdQEqgOuNg1qdp5+ZrLgLTPAs9vNDXECA@mail.gmail.com>
Subject: Audio passthroguh
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000097fd1405a5f9d596"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=padmajain967@gmail.com; helo=mail-oi1-x22a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

--00000000000097fd1405a5f9d596
Content-Type: text/plain; charset="UTF-8"

Hi all,
          I want to understand, how we can differentiate the actual sound
card(PCI passthrough) and emulated sound card. Basically i want to check it
in qemu itself. Any suggestions?

--00000000000097fd1405a5f9d596
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I want to u=
nderstand, how we can differentiate the actual sound card(PCI passthrough) =
and emulated sound card. Basically i want to check it in qemu itself. Any s=
uggestions?=C2=A0</div></div>

--00000000000097fd1405a5f9d596--

