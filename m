Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4CCD9D6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 02:10:36 +0200 (CEST)
Received: from localhost ([::1]:37656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHGbj-0004hc-It
	for lists+qemu-devel@lfdr.de; Sun, 06 Oct 2019 20:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhang.lei@jp.fujitsu.com>) id 1iHGaM-000490-44
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 20:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhang.lei@jp.fujitsu.com>) id 1iHGaJ-0004CP-QP
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 20:09:09 -0400
Received: from mgwkm03.jp.fujitsu.com ([202.219.69.170]:61432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhang.lei@jp.fujitsu.com>)
 id 1iHGaI-00044d-UU
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 20:09:07 -0400
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
 mgwkm03.jp.fujitsu.com with smtp
 id 1a9a_2669_3e783ebb_7e92_47e8_a06c_4adc3808f61a;
 Mon, 07 Oct 2019 09:08:45 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
 (g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
 by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C17EAC0140
 for <qemu-devel@nongnu.org>; Mon,  7 Oct 2019 09:08:44 +0900 (JST)
Received: from G01JPEXCHKW18.g01.fujitsu.local
 (G01JPEXCHKW18.g01.fujitsu.local [10.0.194.57])
 by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id 843CA6920CA;
 Mon,  7 Oct 2019 09:08:05 +0900 (JST)
Received: from G01JPEXMBKW03.g01.fujitsu.local ([10.0.194.67]) by
 g01jpexchkw18 ([10.0.194.57]) with mapi id 14.03.0439.000; Mon, 7 Oct 2019
 09:08:05 +0900
From: "Zhang, Lei" <zhang.lei@jp.fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>
Subject: RE: [PATCH v5 0/9] target/arm/kvm: enable SVE in guests
Thread-Topic: [PATCH v5 0/9] target/arm/kvm: enable SVE in guests
Thread-Index: AdV6RRHJE9mCPXEAQM+/RKszPwAtYf//4CiA//soRtA=
Date: Mon, 7 Oct 2019 00:08:03 +0000
Message-ID: <8898674D84E3B24BA3A2D289B872026A78C99C05@G01JPEXMBKW03>
References: <8898674D84E3B24BA3A2D289B872026A78C9895A@G01JPEXMBKW03>
 <20191004065437.xrcdsvytouau5fus@kamzik.brq.redhat.com>
In-Reply-To: <20191004065437.xrcdsvytouau5fus@kamzik.brq.redhat.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.18.70.226]
Content-Type: text/plain; charset="iso-2022-jp"
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.219.69.170
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
Cc: "Mizuma, Masayoshi" <masayoshi.mizuma@fujitsu.com>, "Okamoto,
 Takayuki" <tokamoto@jp.fujitsu.com>, "Matsuyama,
 Yoshihiro" <y.matsu@jp.fujitsu.com>,
 "'qemu-devel@nongnu.org'" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jones,

> Since the problem you point out is not related to SVE, or this series, then do you
> agree to providing a tested-by for this series?

Yes.
Please add tested-by : zhang.lei@jp.fujitsu.com
Thanks for your patches.

Best Regards,
Lei Zhang

> -----Original Message-----
> From: Andrew Jones <drjones@redhat.com>
> Sent: Friday, October 04, 2019 3:55 PM
> To: Zhang, Lei/$BD%(B $BMk(B <zhang.lei@jp.fujitsu.com>
> Cc: 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>; Mizuma, Masayoshi
> <masayoshi.mizuma@fujitsu.com>; Okamoto, Takayuki/$B2,K\(B $B9b9,(B
> <tokamoto@jp.fujitsu.com>
> Subject: Re: [PATCH v5 0/9] target/arm/kvm: enable SVE in guests
> 
> On Thu, Oct 03, 2019 at 11:55:36PM +0000, Zhang, Lei wrote:
> > Hi Jones,
> >
> > Thanks for your patch.
> >
> > I have tested the v5 patch.
> >
> > All the test is passed, except one problem.
> > The problem was reported
> > in [[Qemu-devel] [RFC QEMU v2 0/2] arm/virt: Account for guest pause
> > time]
> > https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg05713.html
> 
> This problem is unrelated to SVE.
> 
> >
> > My test environment is below.
> >
> > *QEMU
> > base + v5 pathc
> >
> > base is
> >     commit 860d9048c78ce59c5903c3d5209df56f38400986
> >     Merge: 8dc5728 571a8c5
> >     Author: Peter Maydell <peter.maydell@linaro.org>
> >     Date:   Tue Sep 24 13:51:51 2019 +0100
> >
> >
> > *libvirt
> > https://github.com/andreabolognani/libvirt/tree/sve
> >
> > commit 236fb544ff8fcecfc618608b3ae2b65fc74e4d7c
> >
> > *Kernel
> > 5.3.1
> >
> > Best Regards,
> > Lei Zhang
> >
> 
> Since the problem you point out is not related to SVE, or this series, then do you
> agree to providing a tested-by for this series?
> 
> Thanks,
> drew

