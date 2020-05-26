Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11441A49A8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Apr 2020 20:06:00 +0200 (CEST)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMy2R-0005LX-SX
	for lists+qemu-devel@lfdr.de; Fri, 10 Apr 2020 14:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jMy1Y-0004pt-RY
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 14:05:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jMy1X-00022j-8J
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 14:05:04 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:10995)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jMy1X-0001ww-2E; Fri, 10 Apr 2020 14:05:03 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DE94D747E00;
 Fri, 10 Apr 2020 20:04:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 54AE9747DCF; Fri, 10 Apr 2020 20:04:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 533B0747DFF;
 Fri, 10 Apr 2020 20:04:53 +0200 (CEST)
Date: Fri, 10 Apr 2020 20:04:53 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?GB2312?Q?=C2=DE=D3=C2=B8=D5=28Yonggang_Luo=29?= <luoyonggang@gmail.com>
Subject: Re: [RFC PATCH v2] target/ppc: Enable hardfloat for PPC
In-Reply-To: <CAE2XoE9dd3NL3sNUNhR1VhntZX37UFUv7Lqf5HbDTi_0t0_Krg@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2004101953100.33850@zero.eik.bme.hu>
References: <20200218171702.979F074637D@zero.eik.bme.hu>
 <CAE2XoE9dd3NL3sNUNhR1VhntZX37UFUv7Lqf5HbDTi_0t0_Krg@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1597789169-1586541893=:33850"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 John Arbuckle <programmingkidx@gmail.com>, qemu-ppc@nongnu.org,
 Paul Clarke <pc@us.ibm.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1597789169-1586541893=:33850
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Apr 2020, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:
> Are this stable now? I'd like to see hard float to be landed:)

If you want to see hardfloat for PPC then you should read the replies to=20
this patch which can be found here:

http://patchwork.ozlabs.org/patch/1240235/

to understand what's needed then try to implement the solution with FP=20
exceptions cached in a global that maybe could work. I won't be able to d=
o=20
that as said here:

https://lists.nongnu.org/archive/html/qemu-ppc/2020-03/msg00006.html

because I don't have time to learn all the details needed. I think others=
=20
are in the same situation so unless somebody puts in the necessary effort=
=20
this won't change.

Regards,
BALATON Zoltan
--3866299591-1597789169-1586541893=:33850--

