Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD35531F6B4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:47:19 +0100 (CET)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2Na-00038G-O9
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1lD0jV-0007TJ-QT
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:01:51 -0500
Received: from mscreen.etri.re.kr ([129.254.9.16]:33920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1lD0jS-0004Je-8m
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:01:49 -0500
Received: from unknown (HELO send001-relay.gov-dooray.com) (211.180.235.152)
 by 129.254.9.16 with ESMTP; 19 Feb 2021 17:01:34 +0900
X-Original-SENDERIP: 211.180.235.152
X-Original-MAILFROM: ckim@etri.re.kr
X-Original-RCPTTO: qemu-discuss@nongnu.org,
	qemu-devel@nongnu.org
Received: from [10.162.225.112] (HELO smtp002-imp.gov-dooray.com)
 ([10.162.225.112]) by send001-relay.gov-dooray.com with SMTP id
 1f0706c7602f7062; Fri, 19 Feb 2021 17:01:38 +0900
DKIM-Signature: a=rsa-sha256;
 b=vkvyuv1ZNT0otFAw8k/ODi7MfME9Oqu+gpQNQtnkoMQoGKU/5x5P73bc30p6lmklH48mPSRoss
 7dl1moRPciXgBOiW/vmNZA27TUxEsME3CHHF0PkVpi8Z6xx9makOm+5tsZHTTfuF5InSv+RQVexD
 gTfKn27xhUduqiYHtSUUn/MGYaVQjalUGqQvMVSSfJmQApcI04i3zoIs7va5jMpV8LARZdY33OoR
 uUvIYPwCqURnqmtL7rtwyp2P4EvcZeMqk56YXF1zUBHeim9w+10Ijo5bu81aEb9P3oSKDxii9fXk
 O+H6eu3epwNF9cVR/4webz41VlUGSCVBdXKGdekw==;
 c=relaxed/relaxed; s=selector; d=dooray.com; v=1;
 bh=dr5tsTXzwXuQrKwbL+WjH69ZlOSELX3xvlwGkycAttA=;
 h=From:To:Subject:Message-ID;
Received: from [129.254.132.39] (HELO CHANKIMPC) ([129.254.132.39]) by
 smtp002-imp.gov-dooray.com with SMTP id 2da11a52602f7062; Fri, 19 Feb 2021
 17:01:38 +0900
From: <ckim@etri.re.kr>
To: =?ISO-8859-1?Q?'Philippe_Mathieu-Daud=E9'?= <philmd@redhat.com>,
 <qemu-discuss@nongnu.org>
References: <027101d7035b$2e94a600$8bbdf200$@etri.re.kr>
 <57e74877-84a4-0157-1407-a67156dc2b6e@redhat.com>
In-Reply-To: <57e74877-84a4-0157-1407-a67156dc2b6e@redhat.com>
Subject: RE: supported machines for aarch64
Date: Fri, 19 Feb 2021 17:01:37 +0900
Message-ID: <023201d70695$72b7a250$5826e6f0$@etri.re.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH1F+35Sg8yOGj/QGc11V96jX1B8AFlknY7qhfLP9A=
Content-Language: ko
Received-SPF: pass client-ip=129.254.9.16; envelope-from=ckim@etri.re.kr;
 helo=mscreen.etri.re.kr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 19 Feb 2021 04:44:20 -0500
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
Cc: 'Paolo Bonzini' <pbonzini@redhat.com>, 'qemu-devel' <qemu-devel@nongnu.org>,
 'Markus Armbruster' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hello folks,

These are the machine lists that included cortex-a72 when I gave
qemu-system-aarch64 --machine xxx --cpu help.
(I replaced xxx with all the machine I got from qemu-system-aarch64
--machine help. Of course I used simple script for that. And I remove =
'virt'
from the list.)

akita               highbank            midway              netduino2
realview-pb-a8      sx1-v1              xilinx-zynq-a9
ast2500-evb         imx25-pdk           mps2-an385          =
netduinoplus2
realview-pbx-a9     tacoma-bmc          xlnx-zcu102
ast2600-evb         integratorcp        mps2-an505          none
romulus-bmc         terrier             z2
borzoi              kzm                 mps2-an511          nuri
sabrelite           tosa
canon-a1100         lm3s6965evb         mps2-an521          orangepi-pc
sbsa-ref            verdex
cheetah             lm3s811evb          musca-a             palmetto-bmc
smdkc210            versatileab
collie              mainstone           musca-b1            raspi2
sonorapass-bmc      versatilepb
connex              mcimx6ul-evk        musicpal            raspi3
spitz               vexpress-a15
cubieboard          mcimx7d-sabre       n800                realview-eb
swift-bmc           vexpress-a9
emcraft-sf2         microbit            n810
realview-eb-mpcore  sx1                 witherspoon-bmc

Do they all really support cortex-a72? I ask this because for example, =
when
I search for the first machine akita on internet, it says it's using =
PXA255
which ARMv5 chip. But cortex-a72 is ARMv8 chip. Can akita really emulate
cortex-a72?

Thanks!
Chan Kim


> -----Original Message-----
> From: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Sent: Monday, February 15, 2021 4:38 PM
> To: ckim@etri.re.kr; qemu-discuss@nongnu.org
> Cc: qemu-devel <qemu-devel@nongnu.org>; Markus Armbruster
> <armbru@redhat.com>; Paolo Bonzini <pbonzini@redhat.com>
> Subject: Re: supported machines for aarch64
>=20
> Hi,
>=20
> On 2/15/21 6:26 AM, ckim@etri.re.kr wrote:
> > Hello,
> >
> > I tried =93qemu-system-arm =96machine help=94 and it gave me 75 =
machines.
> >
> > Then I tried =93qemu-system-aarch64 =96machine help=94, and it gave =
me
> > almost the same result except it had raspi3, sbsa-ref,
> > xlnx-versal-virt and
> > xlnx-zcu102 in addition.
> >
> > I asked myself, Does this mean most machines work both in 32bit mode
> > and 64bit mode and those added 4 machines work only in 64bit mode?
>=20
> Yes.
>=20
> > So I tried for integrator machine which is supported both by
> > qemu-system-arm and qemu-system-aarch64,
> >
> > =93qemu-system-arm =96machine integrator =96cpu help=94 and
> > =93qemu-system-aarch64 =96machine integrator =96cpu help=94, and =
this time,
> >
> > The cpu list was almost the same(mostly seemd older 32 bit versions)
> > but the aarch64 cpu list gave me 3 more cpus (cortex-a53, a57 and =
a72).
>=20
> Indeed.
>=20
> >
> > So I realized the qemu-system-aarch64 can emulate both 32bit and =
64bit
> > machine and cpu cores =96 as the document says.
>=20
> Correct.
>=20
> > .(it=92s still strange =93qemu-system-arm =96machine help=94 =
doesn=92t give me
> > xlnx-versal-virt in the list, but =93qemu-system-arm =96machine
> > xlnx-versal-virt =96cpu help=94 still gives some machines in the =
list..)
>=20
> This is because '-cpu' is processed *before* '-machine', so this =
works:
>=20
> $ qemu-system-arm -M adsfafdadsfasdfdafadfasdfa -cpu help Available =
CPUs:
>   arm1026
>   arm1136
>   arm1136-r2
>   ...
>=20
> > I started this as a question but found out the answer while =
writing..
>=20
> :)
>=20
> > Thank you and correct me if I=92m wrong
>=20
> Regards,
>=20
> Phil.
>=20





