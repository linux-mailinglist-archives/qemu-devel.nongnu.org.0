Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EC758A14A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:33:38 +0200 (CEST)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgbB-0002Yy-MV
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJgUN-0003T7-20; Thu, 04 Aug 2022 15:26:36 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:48410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJgUJ-0003ID-Ue; Thu, 04 Aug 2022 15:26:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7FC9E746324;
 Thu,  4 Aug 2022 21:26:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 41BDE7462D3; Thu,  4 Aug 2022 21:26:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3E9E0745702;
 Thu,  4 Aug 2022 21:26:29 +0200 (CEST)
Date: Thu, 4 Aug 2022 21:26:29 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
In-Reply-To: <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
Message-ID: <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
 <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
 <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-545938044-1659641189=:19081"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-545938044-1659641189=:19081
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 4 Aug 2022, Peter Maydell wrote:
> On Thu, 4 Aug 2022 at 19:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> I was trying to find out how to do it but I don't understand QOM enough to
>> answer the simple question of how to get the cpu object from QOM. My
>> guesses are:
>>
>> object_resolve_path_type("/machine", TYPE_POWERPC_CPU, NULL)

Out of curiosity would this work though to get the cpu or if not why not 
and what would be a preferred way? I could not find this out from reading 
the object.h comments, the docs/deve/qom.rst, nor searching the code.

>> or maybe
>>
>> object_resolve_path_at(OBJECT(dev)->parent, "cpu")
>>
>> or how do these functions work and what is the preferred way to retrieve
>> an object from the QOM tree? This is what I hoped someone with more
>> understanding of QOM could answer.
>
> The standard approach that we use elsewhere in the tree for handling
> "this device needs to have a pointer to a CPU object or whatever"
> is "the device has a QOM link property, and the SoC sets that
> property when it creates the device".
>
> There are other ways it could in theory be done, but there is
> benefit in consistency, and "define and set the property" is

If this is the preferred way then so be it, I just don't like it because I 
think this is too many boilerplate code that could be avoided. This series:

  9 files changed, 894 insertions(+), 652 deletions(-)

  and that's including removing all of the taihu machine; the file where 
the QOMification is done:

  hw/ppc/ppc405_uc.c              | 799 +++++++++++++++++++-------------

Ideally introducing QOM should make it simpler not more complex. Four of 
the QOMified devices only have a property defined at all because of this 
cpu link that's only used once in the realize method to register DCRs. 
This is about 10 lines of code each. If there was a simple way to get the 
cpu object from these realize methods then we could get rid of all these 
properties and save about 40-50 lines and make these simpler.

> straightforward. It also means the device object doesn't have
> to know anything about the way the SoC container is laid out.

We only need the cpu object so we don't need to know the soc container if 
there's a way to get it otherwise I just don't know how QOM works and was 
trying to find a way to get to the cpu object. Maybe it's simpler than 
that.

If there's no simple way or you and Cédric think it isn't worth the effort 
then I'm also OK with it but if there's a way to make this simpler I'd be 
happy to get rid of things that make it harder to read and understand code 
or allow making mistakes more easily. I take whatever decision you make so 
won't say this again, I think I've explained my point now.

Regards,
BALATON Zoltan

> (It's usually worth looking at whether there are cleanups
> that could mean the device doesn't have to have a pointer to
> that other object at all -- but that isn't always the case,
> or the cleanups would be a big job in their own right that
> are better not tangled up with QOMification.)
>
> thanks
> -- PMM
>
>
--3866299591-545938044-1659641189=:19081--

