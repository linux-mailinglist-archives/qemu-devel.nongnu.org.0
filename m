Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5798F329C2D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:23:07 +0100 (CET)
Received: from localhost ([::1]:51350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH37K-0007r7-Cd
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1lH35y-0006qK-FM
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:21:42 -0500
Received: from mscreen.etri.re.kr ([129.254.9.16]:36186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1lH35u-0000Fp-3g
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:21:42 -0500
Received: from unknown (HELO send001-relay.gov-dooray.com) (211.180.235.152)
 by 129.254.9.16 with ESMTP; 2 Mar 2021 20:21:22 +0900
X-Original-SENDERIP: 211.180.235.152
X-Original-MAILFROM: ckim@etri.re.kr
X-Original-RCPTTO: qemu-discuss@nongnu.org,
	qemu-devel@nongnu.org
Received: from [10.162.225.112] (HELO smtp002-imp.gov-dooray.com)
 ([10.162.225.112]) by send001-relay.gov-dooray.com with SMTP id
 4c8a2359603e1fba; Tue, 02 Mar 2021 20:21:30 +0900
DKIM-Signature: a=rsa-sha256;
 b=tD1XCxNqTLIfw0UH+G6tcMZY08AD0+442TJi+pQ8DNCf6R7DzoMKYo7mv0tpKXkvnXdMWpesTq
 ll0GhZ45CJyM4RiV+6SESqOESTGFeT3aySQrOT+m8C/VAjT2q3/FA5ZhWsyEY3HnrHJGkCOjsnwN
 csbiwahETTgS0kvucYxnWXPSWQuywcO6S26g55pZEJeqiL5zDRiYK5TsHXr33/Vl7bvcO2YoO6Fp
 7LFcf3IVgo0IIZhBZwwsoRBEp4qz3LILoWqc2Ap5vGROJl2tfJzciPgNtJiZdbwiWglUTnrSphZo
 vbb0d8KFYjSACXjR2KWjnsHzxM9vdi1QWRmmeUrQ==;
 c=relaxed/relaxed; s=selector; d=dooray.com; v=1;
 bh=UxmMKoGtDxz/oSFbg6AwBCC/F+xeCr6WpCVnVCQ+JTk=;
 h=From:To:Subject:Message-ID;
Received: from [129.254.132.39] (HELO CHANKIMPC) ([129.254.132.39]) by
 smtp002-imp.gov-dooray.com with SMTP id 27801676603e1fba; Tue, 02 Mar 2021
 20:21:30 +0900
From: <ckim@etri.re.kr>
To: "'Bin Meng'" <bmeng.cn@gmail.com>,
 =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>
References: <009801d70f44$a75be810$f613b830$@etri.re.kr>
 <0db71960-2a24-5c64-6e2b-42ecdd02b9d6@redhat.com>
 <CAEUhbmWxCuJEcGuBVr2K3rzL2tmHeKvGNnwgohc_cUOC=V7eOg@mail.gmail.com>
In-Reply-To: <CAEUhbmWxCuJEcGuBVr2K3rzL2tmHeKvGNnwgohc_cUOC=V7eOg@mail.gmail.com>
Subject: RE: ninja install on ubuntu 16.04 for qemu-5.2.0 build
Date: Tue, 2 Mar 2021 20:21:28 +0900
Message-ID: <00aa01d70f56$30c7bf00$92573d00$@etri.re.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8GpBiCTEFRNOBwoScIbHmAZazSQJjOFEsAV9drsWqCGBssA==
Content-Language: ko
Received-SPF: pass client-ip=129.254.9.16; envelope-from=ckim@etri.re.kr;
 helo=mscreen.etri.re.kr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Cc: 'qemu-devel' <qemu-devel@nongnu.org>,
 'qemu-discuss' <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Bin Meng and Philippe Mathieu-Daud=C3=A9,

Thanks for the advice. I found apt-get update doesn't help,
But downloading ninja-build source from =
https://github.com/ninja-build/ninja and
Doing git checkout v1.7.0 and ./configure.py --bootstrap just builds =
ninja. (I just used v1.7)
Then I renamed /usr/bin/ninja and made a simbolic link to the newly =
built ninja as /usr/bin/ninja.
And found qemu-5.2.0 is built and runs ok with usual "configure =
--target-list=3Daarch64-softmmu" and make -j12 under build directory.
Thanks for the help!
Chan Kim

> -----Original Message-----
> From: Bin Meng <bmeng.cn@gmail.com>
> Sent: Tuesday, March 2, 2021 7:12 PM
> To: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: ckim@etri.re.kr; qemu-discuss <qemu-discuss@nongnu.org>; =
qemu-devel
> <qemu-devel@nongnu.org>
> Subject: Re: ninja install on ubuntu 16.04 for qemu-5.2.0 build
>=20
> On Tue, Mar 2, 2021 at 6:02 PM Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com>
> wrote:
> >
> > On 3/2/21 10:15 AM, ckim@etri.re.kr wrote:
> > > Hello,
> > >
> > > qemu-5.2.0 now internally uses mesa for building qemu.
> > >
> > > Isn=E2=80=99t there any guideline for this new build method on =
qemu document
> > > page?( I couldn=E2=80=99t find one).
> > >
> > > I was met with this =E2=80=98couldn=E2=80=99t find Ninja 1.7 or =
newer=E2=80=99 and tried
> > > installing ninja with apt-get but the version is too low.(it seems
> > > it=E2=80=99s 1.5)
> >
> > 1.7.1 is available, maybe try running "apt-get update" first?
> >
> > Package: ninja-build
> > Architecture: amd64
> > Version: 1.7.1-1~ubuntu16.04.1
> > Priority: optional
> > Section: universe/devel
> > Origin: Ubuntu
> > Maintainer: Ubuntu Developers =
<ubuntu-devel-discuss@lists.ubuntu.com>
> > Original-Maintainer: Felix Geyer <fgeyer@debian.org>
> > Bugs: https://bugs.launchpad.net/ubuntu/+filebug
> > Installed-Size: 286
> > Depends: libc6 (>=3D 2.15), libstdc++6 (>=3D 5.2)
> > Conflicts: ninja
> > Filename:
> > =
pool/universe/n/ninja-build/ninja-build_1.7.1-1~ubuntu16.04.1_amd64.de
> > b
> > Size: 91424
> > MD5sum: 6384d9c31ca18803e90b7bf3f5c3ab28
> > SHA1: ab64ea16c36a39bbfd6929351fff8e2d5768e801
> > SHA256:
> > 8f8ba3ccb7873cb264bd648437eb8e7d7abd4093254135f6830e368a25512b9f
> > SHA512:
> > =
222de7f1dc96979a9d1487f090cd138397b0f6cc935acf99166a5b6d8ba951529d9303
> > 9e6d431b85fa9abaf4285961e643a97dce747e41f76f4b874e1932c25e
> > Homepage: https://ninja-build.org/
> > Description: small build system closest in spirit to Make
> > Description-md5: 5ef1371c63de86fcf36c1ddc875d2f26
> >
> > >
> > > I guess because I=E2=80=99m using ubuntu 16.04 - somewhat old =
version, I=E2=80=99ll
> > > have to download the ninja and mesa.
> > >
> > > Can someone give me an advice on which is the best way to solve =
this?
>=20
> FYI, Ubuntu 16.04 is no longer a supported host.
>=20
> I am working on Ubuntu 16.04 with a ninja I built from source, and =
passed
> it to QEMU configure script which works fine.
>=20
> >
> > An alternative when you can't update the system packages is to use a
> > Docker container (you might need to ask the machine administrator to
> > install it).
> >
>=20
> Regards,
> Bin





