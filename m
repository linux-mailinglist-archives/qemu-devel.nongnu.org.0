Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E77101FC3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 10:13:22 +0100 (CET)
Received: from localhost ([::1]:42990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWzZZ-0001NO-UO
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 04:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iWzYe-0000xY-9f
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 04:12:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iWzYc-0002mP-UF
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 04:12:24 -0500
Received: from mail-yw1-f44.google.com ([209.85.161.44]:37647)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iWzYc-0002lv-QN
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 04:12:22 -0500
Received: by mail-yw1-f44.google.com with SMTP id v84so7044083ywc.4
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 01:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aPv2AP08+Cvb/KelaqhjD1kifYH9mIeJ6RtHeh7cCp8=;
 b=DtmKwQ+tZnLrSYuykm4uNzrEVKwpgqY6aGHxt8RdsYBbEtEBiy91vaN4UyvnwDubbd
 yHqILxv7Xprfp41vpX/lJHPfXC3zAS+g1jpgOHPV3SDyoq/0BCsTSn057TlyxkCZh4jz
 bkUeQd8Lv9Nf34kJ9L8PROYtIraV0U7v0klxH8vfPBRnt9VUJq2qXg1JFxXXrAD4PxoM
 jYRSnSLdSDkwm75VpDOtAjsgOlL06zTvqS3dSNdpCQUqsOOeK6Zl3qKEclQMW2YZ5f8Q
 +61JWtKmAndnTk38YtWsX3q0Rhl6wxjL99qRXrf+UElUiqYrHwbAyY8CFRxvywQUN5aR
 Ulyg==
X-Gm-Message-State: APjAAAUqd294FnEopq0KHs52H1OGho5iwvAkMVQRyEmuKV0S70fwsnjq
 XbvAChVAOX0ArKtkWySRsTSaXXt0+mRLQLDux10=
X-Google-Smtp-Source: APXvYqyMF7ri26YSIm2bxsLVlu4MwVtQ1cPPnd1nIDNpuUYrcnU0hu51jLmpPFtqUie7P7jY6KCWrh21VVI3oFUJCIQ=
X-Received: by 2002:a0d:ddc3:: with SMTP id
 g186mr23953246ywe.201.1574154741602; 
 Tue, 19 Nov 2019 01:12:21 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB48863165DEE32E5C563E93F4DE650@BYAPR02MB4886.namprd02.prod.outlook.com>
 <CAL1e-=jvmJNiZR4iLDL-97qm=v+2s0cwn5YTzJQ=JZ_gwOe4tQ@mail.gmail.com>
 <BYAPR02MB4886C8D82898F1E406C124F8DE7E0@BYAPR02MB4886.namprd02.prod.outlook.com>
 <BYAPR02MB48865884056A88B660B620FCDE770@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB48865884056A88B660B620FCDE770@BYAPR02MB4886.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 19 Nov 2019 10:12:09 +0100
Message-ID: <CAAdtpL5VvmLxmy8RdR3TrN7AHcKMfh5dHochp-Mn8pOEp1L6Ww@mail.gmail.com>
Subject: Re: QEMU for Qualcomm Hexagon - KVM Forum talk and code available
To: Alessandro Di Federico <ale@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 =?UTF-8?Q?Niccol=C3=B2_Izzo?= <izzoniccolo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.44
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alessandro and Niccol=C3=B2,

On Tue, Nov 12, 2019 at 11:54 PM Taylor Simpson <tsimpson@quicinc.com> wrot=
e:
>
> I had discussions with several people at the KVM Forum, and I=E2=80=99ve =
been thinking about how to divide up the code for community review.  Here i=
s my proposal for the steps.
>
> linux-user changes + linux-user/hexagon + skeleton of target/hexagon
> This is the minimum amount to build and run a very simple program.  I hav=
e an assembly program that prints =E2=80=9CHello=E2=80=9D and exits.  It is=
 constructed to use very few instructions that can be added brute force in =
the Hexagon back end.
> Add the code that is imported from the Hexagon simulator and the qemu hel=
per generator
> This will allow the scalar ISA to be executed.  This will grow the set of=
 programs that could execute, but there will still be limitations.  In part=
icular, there can be no packets which means the C library won=E2=80=99t wor=
k .  We have to build with -nostdlib
> Add support for packet semantics
> At this point, we will be able to execute full programs linked with the C=
 library.  This will include the check-tcg tests.
> Add support for the wide vector extensions
> Add the helper overrides for performance optimization
> Some of these will be written by hand, and we=E2=80=99ll work with rev.ng=
 to integrate their flex/bison generator.

Few years ago Luc Michel added the TMS320C6x.
The original git repository is down, I saved a copy:
https://github.com/philmd/qemu/commit/44a32515d
Last time I checked I had it rebased on QEMU 2.8.

I wonder if rev.ng flex/bison generator as it would also work with
this architecture (obviously I mean with the VLIW 'backend' logic, not
the Hexagon 'frontend').

Regards,

Phil.

