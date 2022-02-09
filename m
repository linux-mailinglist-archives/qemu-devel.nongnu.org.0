Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4154AF128
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 13:16:45 +0100 (CET)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHlts-00052U-3K
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 07:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nHlmX-0003Nx-En
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:09:10 -0500
Received: from [2a00:1450:4864:20::635] (port=37396
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nHlmT-0002Yn-6e
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:09:07 -0500
Received: by mail-ej1-x635.google.com with SMTP id fj5so3806912ejc.4
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 04:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bzFknYgv0qNKFOR2Ylx+sVFiy+hSDHb7B6JlZ06PvfU=;
 b=EQZFpVIMkdmsDmkXNCRftNl3k7lTvuno3aVLbkqYyTl68ZCeL2nRh4a4VOF2332nxF
 qYT2KPSElw+yY1lc/mRe2qeVFF48UO8PmPGx4xKx9vImk4dHyNDH639wKqlYyAChbTiG
 AZkJK78og7wHbg5sX+BNjUfDst9h7aIsQLM5DVzCwts649Jnl9tHzaV0KX0/Y+YXDxP6
 cqKxeWtpY68JFEoZPDvZ1Myi6Xl4M+KCNnBr7VrBUO6Sn0AE2YJ7hs2sLtw16G29zQkE
 4c7l7x8W+J9vVUmBZp35oT10e9uGxcyqcgF91VmSU4SM4/pyo0PL4W6kZ8Htr/22f29k
 pQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bzFknYgv0qNKFOR2Ylx+sVFiy+hSDHb7B6JlZ06PvfU=;
 b=kF0+BWXSkbvoX7cMjrKuv5FXGQInbCtaGElIYQZw0rHOR68poSVacNDpd/zTBoyMaC
 6XbTBWjaQtg6n1aozjZhOmkRHU+AmUATM+0lcvZoEJ+/znl+l+qSeskm4NvymewzUikX
 bDT9wMvqdnhkXl0W8D9jf/pCIrkhdF48YUDzu2UdjBb+r4OfVaLK0/5L6BGN3yyxkpiQ
 kW5+OA66zIlr/HcaJh1+0Ci/lYz/KR/iVO3slRJkkePDSgRO/l/KVbxNV2MkYnIYS3In
 NLRJuUGfCZAu85Tjc1bqWqifOgHVbirLUr1OskdqoJSEY/kC64hIQmxecl6QY/9qcq8F
 Wd9A==
X-Gm-Message-State: AOAM533Rb77Qpil+ssx4V2M90YPKnSJpmr7W3wW8zoA9Q2fH2sd/2J7N
 wRTRIVEUEw9d4pmXPWMKCykFBQ==
X-Google-Smtp-Source: ABdhPJyxabCCoIBffkq46tZwS6Oj2SDOIk5MCSuQGdEPHl84IoyOM7eVDMxlpg2R8zvvSUSoOlvbpQ==
X-Received: by 2002:a17:907:7da4:: with SMTP id
 oz36mr1678022ejc.416.1644408543080; 
 Wed, 09 Feb 2022 04:09:03 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id u18sm5918973eje.37.2022.02.09.04.09.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Feb 2022 04:09:02 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA_TzC6t=m27ZM=oAPBZwNcPm8b=bne4hb722cMx4vQ0Rw@mail.gmail.com>
Date: Wed, 9 Feb 2022 14:09:01 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1150E4A-BEAE-4577-86D7-710F3DEE6074@livius.net>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <DEEEEB34-BF47-4AD3-99BC-EAB791508D27@livius.net>
 <YgOQF0W78MVVsDw6@stefanha-x1.localdomain>
 <BB942F04-BF20-4531-A356-DDF7931B1DEB@livius.net>
 <CAFEAcA_TzC6t=m27ZM=oAPBZwNcPm8b=bne4hb722cMx4vQ0Rw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=ilg@livius.net; helo=mail-ej1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 9 Feb 2022, at 13:30, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> gcc doesn't prepend the pkgversion string to the greeting. ...
> ... and 'gcc --version' prints the version as:
> gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0

Right, strictly speaking, GCC prints the program name, then the greeting =
message, then the version.

The binaries in my distribution look like this:

$ arm-none-eabi-gcc --version
arm-none-eabi-gcc (xPack GNU Arm Embedded GCC x86_64) 10.3.1 20210824 =
(release)

$ arm-none-eabi-gdb --version
GNU gdb (xPack GNU Arm Embedded GCC x86_64) 10.2.90.20210621-git

$ riscv-none-embed-gcc --version
riscv-none-embed-gcc (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0

$ clang-12 --version
xPack x86_64 clang version 12.0.1

$ openocd --version
xPack OpenOCD x86_64 Open On-Chip Debugger 0.11.0+dev (2021-10-17-00:18)


and similarly some other build tools:

$ gcc-xbb --version
gcc-xbb (xPack Build Box x86_64 GCC) 11.2.0

etc


> which is fairly similar to what qemu does today:
> QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.19)

which is fairly different from the more consistent:

$ qemu-system-arm --version
xPack QEMU emulator version 6.2.0 (v6.2.0-1-xpack-arm)


If you prefer the GNU scheme, we can also start with the program name, =
and it would look like:

$ qemu-system-arm --version
qemu-system-arm (xPack QEMU emulator) version 6.2.0 (v6.2.0-1-xpack-arm)

Or something like this, but applied consistently to all binaries.


Regards,

Liviu


