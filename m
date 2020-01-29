Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4189814C8D8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 11:40:39 +0100 (CET)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwkly-0004Bx-BP
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 05:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iwkl9-0003hT-MA
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:39:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iwkl8-0007S2-QB
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:39:47 -0500
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:34559)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iwkl8-0007Ex-KW
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:39:46 -0500
Received: from player711.ha.ovh.net (unknown [10.108.35.27])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id D09A321B201
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 11:39:36 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id E9E20EA13277;
 Wed, 29 Jan 2020 10:39:32 +0000 (UTC)
Subject: Re: Assertion triggers with power8e_v2.1-powernv-cpu-core
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <5937c35c-e290-5b7a-18f4-05a5149b58c5@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <db907c1e-9a67-0eeb-ef18-c710e68cd311@kaod.org>
Date: Wed, 29 Jan 2020 11:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5937c35c-e290-5b7a-18f4-05a5149b58c5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6982831224923392998
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.57.129
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/20 11:31 AM, Thomas Huth wrote:
> FYI, scripts/device-crash-test reported an assertion, triggerable like this:
> 
> $ qemu-system-ppc64 -machine ppce500 -device power8e_v2.1-powernv-cpu-core
> qemu-system-ppc64: hw/ppc/pnv_core.c:221: pnv_core_realize: Assertion
> `pc->chip' failed.
> Aborted (core dumped)
> 
> Of course using that CPU is not possible on ppce500, but there should be
> a proper error message instead of that assertion.
> 
> Does anybody have an idea what's the best place to fix this issue?

The cores should be instantiated by a PowerNV chip. So may be we
should fix this issue with :

@@ -325,6 +325,7 @@ static void pnv_core_class_init(ObjectCl
     dc->realize = pnv_core_realize;
     dc->unrealize = pnv_core_unrealize;
     device_class_set_props(dc, pnv_core_properties);
+    dc->user_creatable = false;
 }
 
 #define DEFINE_PNV_CORE_TYPE(family, cpu_model) \


I think that most of the PowerNV devices are not user creatable.

C.

