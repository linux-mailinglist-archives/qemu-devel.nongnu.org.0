Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3187616FDB0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 12:29:39 +0100 (CET)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6usk-0008PD-A5
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 06:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j6urb-0007rB-Dj
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 06:28:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j6urZ-0004W2-Jq
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 06:28:26 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:17286)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j6urZ-0004Sr-BO; Wed, 26 Feb 2020 06:28:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EEF34747DFD;
 Wed, 26 Feb 2020 12:28:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D3507747DF5; Wed, 26 Feb 2020 12:28:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D1D3E747DFA;
 Wed, 26 Feb 2020 12:28:21 +0100 (CET)
Date: Wed, 26 Feb 2020 12:28:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: [RFC PATCH v2] target/ppc: Enable hardfloat for PPC
In-Reply-To: <3539F747-145F-49CC-B494-C9794A8ABABA@gmail.com>
Message-ID: <alpine.BSF.2.22.395.2002261220230.39786@zero.eik.bme.hu>
References: <20200218171702.979F074637D@zero.eik.bme.hu>
 <CD566CEF-6844-455C-B9C7-E5DFDE50E770@gmail.com>
 <alpine.BSF.2.22.395.2002191538190.33319@zero.eik.bme.hu>
 <1BC2E9E9-A694-4ED3-BD3D-D731F23B7245@gmail.com>
 <alpine.BSF.2.22.395.2002251241080.22173@zero.eik.bme.hu>
 <3539F747-145F-49CC-B494-C9794A8ABABA@gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Feb 2020, Programmingkid wrote:
> I think a timeout takes place and that is why audio stops playing. It is 
> probably an USB OHCI issue. The other USB controller seems to work 
> better.

Which other USB controller? Maybe you could try enabling some usb_ohci* 
traces and see if they reveal anything.

>> The Amiga like OSes I'm interested in don't use multiple cores so I'm 
>> mainly interested in improving single core performance. Also I'm not 
>> sure if (part of) your problem is slow FPU preventing fast enough audio 
>> decoding then having multiple CPUs with slow FPU would help as this may 
>> use a single thread anyway.
>
> Good point. MTTCG might be the option that really helps with speed improvements.

Only if you have multithreaded workload in the guest because AFAIK MTTCG 
only runs different vcpus in parallel, it won't make single emulated CPU 
faster in any way. OSX probably can benefit from having multiple cores 
emulated but I don't think MacOS would use it apart from some apps maybe.

Regards,
BALATON Zoltan

