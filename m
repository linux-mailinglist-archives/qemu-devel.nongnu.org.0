Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFAD2FB249
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 08:02:55 +0100 (CET)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1l2U-00045Q-5l
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 02:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1l04-0003Q8-Gq
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:00:24 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:44445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1l02-0008Dz-Ge
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:00:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 86857580875
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 02:00:20 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Tue, 19 Jan 2021 02:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=0SAIM
 U9u5nPHjGlIHa3tdMYZT62p2EnlhpAlAA7m+Zw=; b=vgkrc4UPEgpEbmbQb+b90
 Oq3Z6RNfAWOwn6Yi7UoWSg6OqLQR13RZGNkw8ecmjROcfjS0/vg2emrS1vCertLQ
 Czf4VbXOnK8WDdV4EyOgA/hCVMEqRaLFC7k4apuh9H8XDZDzZVTaacdc+707dCKV
 i9UNzNa14A7jqTUVSyjQR/DzbOxLZfeekP1wp6N225EVDahLkJkXlSxJqFzgjH/H
 qkEiaH2psJsKkMzUy9qkvpj10jNWeuQqzjXhER0VY56qpwQ4dkWLrPW4i4DqAxK9
 EgWFpO5QTCBEGO2wofs/tF+cj/r2AsiMaTWTGjJ2wkacfPDROA5XzMCC4xujY/Z8
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=0SAIMU9u5nPHjGlIHa3tdMYZT62p2EnlhpAlAA7m+
 Zw=; b=iwuvXXOEo/e0uPv5SGUg+ZAk59Z6CrFGXTcfyQVYN4MIossENsXNznqWf
 S30me2xPouIJ/WOv1CkGrEBWp8q579/tOHL+PTCVWfW8ZXSeK2xGDRH3wgOtSxYv
 mJA5Lx6ETDJ6fCeyJkagGMIg1RYNtGGnFP+6rCsySsNF21k60H/9DUJAg8fnzCBa
 7IEQjTpkcp5YY6bT7Mu9UUIrmThyH5slPurLr8Wg7iNa1QqdOlKeticCIPNTaocl
 2i4DmEM8ns6XNjq8mWtOI7ehusqwmVuYQwIUSkwx5xEVww7udBlTyYhObB18c0NK
 uyOvC1Ip2umfUuqZKAGSDcz3iZG1g==
X-ME-Sender: <xms:g4MGYAEu8njTCMuMQaTzc6-t7hotYfhSNOzkrfpIFZ7mkvS7UluoKw>
 <xme:g4MGYJWYVKNjMKR_WC9o4rD1TjEMekk61mN9TxrYgCfUhMC7IVv0ZKGfej0cCcGbQ
 YYU8o-mRDGc6d8cRwk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdelgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdr
 higrnhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefteegkeevfe
 ethffgudehgedvueduvdeifedvvdelhfefheekteefueektdefjeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgse
 hflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:g4MGYKIt12IT9wgkjndnnFDYKaSbkpIs9meibkNUY4oF_e8guEKxWw>
 <xmx:g4MGYCFm2ToW4HKlkTVrYuLp3Nu9Hl0pLzrgrCtbxYkRUav2A5x5Ag>
 <xmx:g4MGYGXmAWHY9275kNS6l2DfAUGa0LKNNrRLIu_skXu-vlDquvh6AQ>
 <xmx:g4MGYOj3P9OKP88LW-Fd7k6-9AsZRH-1I-Gqj4j17GnGLkC_OYobwA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4612EC200A5; Tue, 19 Jan 2021 02:00:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <3ed8e4cd-e4e0-4d42-a3db-534e97d1a2da@www.fastmail.com>
In-Reply-To: <2f5b7035-40b2-897f-a0c8-e09b2ba2e125@amsat.org>
References: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
 <0cf6ab15-f976-39ad-ad9c-df48aaa8d1ec@amsat.org> <87pn22uqkh.fsf@linaro.org>
 <2f5b7035-40b2-897f-a0c8-e09b2ba2e125@amsat.org>
Date: Tue, 19 Jan 2021 14:59:56 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On Tue, Jan 19, 2021, at 1:57 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/18/21 5:54 PM, Alex Benn=C3=A9e wrote:
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
> >> On 1/12/21 3:07 AM, Jiaxun Yang wrote:
> >>> Test booting of PMON bootloader on loongson3-virt platform.
> >>>
> >>> $ (venv) AVOCADO_ALLOW_UNTRUSTED_CODE=3D1 \
> >>>     avocado --show=3Dapp,console \
> >>>       run -t machine:loongson3-virt tests/acceptance
> >>> Fetching asset from tests/acceptance/machine_mips_loongson3v.py:Mi=
psLoongson3v.test_pmon_serial_console
> >>> JOB ID     : 8e202b3727847c9104d0d3d6546ed225d35f6706
> >>> JOB LOG    : /home/flygoat/avocado/job-results/job-2021-01-12T10.0=
2-8e202b3/job.log
> >> ...
> >>> console: This software may be redistributed under the BSD copyrigh=
t.
> >>> console: Copyright 2000-2002, Opsycon AB, Sweden.
> >>> console: Copyright 2005, ICT CAS.
> >>> console: CPU GODSON3 BogoMIPS: 1327
> >>> PASS (3.89 s)
> >>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRU=
PT 0 | CANCEL 0
> >>> JOB TIME   : 4.38 s
> >>>
> >>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>> ---
> >>>  MAINTAINERS                                 |  1 +
> >>>  tests/acceptance/machine_mips_loongson3v.py | 39 ++++++++++++++++=
+++++
> >>>  2 files changed, 40 insertions(+)
> >>>  create mode 100644 tests/acceptance/machine_mips_loongson3v.py
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 4be087b88e..f38882f997 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -1164,6 +1164,7 @@ F: hw/intc/loongson_liointc.c
> >>>  F: hw/mips/loongson3_bootp.c
> >>>  F: hw/mips/loongson3_bootp.h
> >>>  F: hw/mips/loongson3_virt.c
> >>> +F: tests/acceptance/machine_mips_loongson3v.py
> >>> =20
> >>>  Boston
> >>>  M: Paul Burton <paulburton@kernel.org>
> >>> diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/a=
cceptance/machine_mips_loongson3v.py
> >>> new file mode 100644
> >>> index 0000000000..17a85de69f
> >>> --- /dev/null
> >>> +++ b/tests/acceptance/machine_mips_loongson3v.py
> >>> @@ -0,0 +1,39 @@
> >>> +# Functional tests for the Generic Loongson-3 Platform.
> >>> +#
> >>> +# Copyright (c) 2020 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
> >>
> >> 2021 Jiaxun Yang <jiaxun.yang@flygoat.com>? :D
>=20
> Jiaxun, if you agree I can update that line and queue your patch.

Please do. Thanks!

- Jiaxun

>=20
> >>
> >>> +#
> >>> +# This work is licensed under the terms of the GNU GPL, version 2=
 or later.
> >>> +# See the COPYING file in the top-level directory.
> >>> +#
> >>> +# SPDX-License-Identifier: GPL-2.0-or-later
> >>> +
> >>> +import os
> >>> +import time
> >>> +
> >>> +from avocado import skipUnless
> >>> +from avocado_qemu import Test
> >>> +from avocado_qemu import wait_for_console_pattern
> >>> +
> >>> +class MipsLoongson3v(Test):
> >>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untru=
sted code')
> >>
> >> The source code is published [1], you provided reproducible
> >> workflow [2] and a tag [3] with a public build artifacts [4],
> >> so my understanding is this is "trustable" binary.
> >>
> >> Alex, would it be OK to add this test without the UNTRUSTED tag
> >> (amending the links in the commit description)?
> >=20
> > It's a subjective call. Having open source code is a minimum step to=

> > being "trusted" but really the trust is in the community that hosts =
the
> > code. The upstream distros (e.g. Debian/Fedora) are trusted because
> > people install their software on their desktops and basically give t=
he
> > software publisher root on their machines. There has to be a level o=
f
> > trust that the distros won't abuse that to steal information from th=
eir
> > users.
> >=20
> > I personally have no idea about the loongson community because it's =
not
> > one I interact with so I have no idea what sort of place it is. Is i=
t a
> > code dump for semi-proprietary non-upstreamed kernels or is it a pla=
ce
> > that has a good development culture with a sane security process tha=
t is
> > responsive to problems and moderately conservative with what they me=
rge?
> >=20
> > If you would trust your keys to a machine running this communities
> > software then by all means treated it as a trusted source.
>=20
> Subjective call understood :)
>=20
> Thanks for your clear explanation,
>=20
> Phil.
>=20
>

--=20
- Jiaxun

