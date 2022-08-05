Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93858AE84
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 18:54:05 +0200 (CEST)
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK0aK-0000xP-KU
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 12:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oK0Wf-0005b7-0N; Fri, 05 Aug 2022 12:50:18 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:20919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oK0Wb-00061P-A3; Fri, 05 Aug 2022 12:50:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 18CB7746396;
 Fri,  5 Aug 2022 18:50:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CE1C474638A; Fri,  5 Aug 2022 18:50:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CB9D8746381;
 Fri,  5 Aug 2022 18:50:08 +0200 (CEST)
Date: Fri, 5 Aug 2022 18:50:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
In-Reply-To: <CAFEAcA8qBMUY+an+-i7x2i98iATjMN7m89rGsSwEV90sH-iCdg@mail.gmail.com>
Message-ID: <ceb063e-b796-a5b1-5bd1-4cd81c5ed2d@eik.bme.hu>
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
 <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
 <743ea55a-915e-5991-5d7c-ef00ee307ee9@kaod.org>
 <a992199c-b51d-6baa-b91b-4959ec4a46e8@eik.bme.hu>
 <CAFEAcA8qBMUY+an+-i7x2i98iATjMN7m89rGsSwEV90sH-iCdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-179746773-1659718208=:12534"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--3866299591-179746773-1659718208=:12534
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 5 Aug 2022, Peter Maydell wrote:
> On Fri, 5 Aug 2022 at 13:55, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> I know this is a mess curently but QOM is full of boilerplate code which
>> is confusing for new people and makes it hard to undestand the code. So
>> cutting down the boilerplate and making things simpler would help people
>> who want to get started with QEMU development. If adding a property was
>> 3-4 additional lines I wouldn't care but if it makes the code
>> significantly more complex and thus harder to understand at a glance then
>> I'd rather avoid it if possible and stick to simple terms.
>
> I agree that QOM's boilerplate is not nice at all, but if
> you do something other than the "standard QOM boilerplate"
> solution to a problem then you make it harder for people who
> at least know what the standard QOM approach is to figure out
> why the code is doing what it does.

True, unless what we do instead is simpler so it's obvious what it's 
doing. Also you've said that needing a link is often a sign that there's 
something wrong with the modeling so maybe it can be avoided changing how 
we model things. I think that's the case here. If we had:

struct PPC4xxMachineState { /* abstract */
     MachineState parent_obj;

     PPC4xxSoc soc;
}

which we use for all 4xx machnies that use the devices QOMified here and

struct PPC4xxSocState { /* abstract */
     DeviceState parent_obj;

     PowerPCCPU cpu;
     /* other common devices shared by 405 and 440
      * (probably most of them), may need to add int ram_banks to allow
      * different size ram_memories arrays, etc. but this can be done later
      * when doing 440 SoC state and only have the cpu here for now */
}

struct PPC405SocState {
     PPC4xxSocState parent_obj;

     /* devices specific to 405 same as proposed Ppc405SoCState */
}

and likewise for PPC440SocState which could be done in a different series 
taking care of 440 machines later. Then we could more cleanly model the 
sharing of code between 4xx SoCs (this series only considered 405 but this 
is enangled with 440 so we should take into account that too), This also 
allows to get the cpu without a link with something like:

PPC4XX_MACHINE(current_machine /* or qdev_get_machine() */)->soc.cpu

This is pretty clear if you look at the object class definitions and 
avoids needing to link things together by hand.

If this is not clear yet or Cédric does not want to do it now I may try it 
once he publishes the latest version of this series or as a follow up once 
it's merged but if I could get across what I mean and not too much changes 
maybe it could be considered so we don't have too many iterations on this.

I understand Cédric may not want to touch bamboo or sam460ex and mostly 
cares for 405 to add hotfoot but what I propose does not need going all 
the way with the 440 machines, only introduce the QOM classes now so that 
it could be used later bur not break the 440 machines now. We may even get 
away with just adding a PowerPCCPU *cpu; to PPC4xxMachineState for now 
which can be set in the machine init func that creates the cpu before 
other devices, then we may not need PPC4xxSocState abstract class for now 
but maybe it's clearer with the abstract SoC class that can be filled in 
later with common stuff shared by all 4xx machines.

Regards,
BALATON Zoltan
--3866299591-179746773-1659718208=:12534--

