Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3D3A2C15
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:54:24 +0200 (CEST)
Received: from localhost ([::1]:52152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKCV-0005sl-8P
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lrKBL-0004M1-6Z; Thu, 10 Jun 2021 08:53:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:54173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lrKBE-00020l-GB; Thu, 10 Jun 2021 08:53:10 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EE29C7457EF;
 Thu, 10 Jun 2021 14:52:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CA0867462DB; Thu, 10 Jun 2021 14:52:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C85AC7457F0;
 Thu, 10 Jun 2021 14:52:51 +0200 (CEST)
Date: Thu, 10 Jun 2021 14:52:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: luigi burdo <intermediadc@hotmail.com>
Subject: Re: R: [RFC PATCH 0/5] ppc/Pegasos2 VOF
In-Reply-To: <AM7PR03MB6579DA01C8834EFD9EFC97F0C8359@AM7PR03MB6579.eurprd03.prod.outlook.com>
Message-ID: <a117c452-ee3b-c3f1-2932-2b1740a71fc@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <5ab75d13-2fca-17cc-b24f-e86430fdda20@ozlabs.ru>
 <a5786f77-efc1-febb-7ae2-1e9543ca2687@eik.bme.hu>
 <bb539b72-5548-d035-8089-3d49f4babc1d@ozlabs.ru> <YMHMbVo2zrV6EsZ8@yekko>,
 <b87683ec-675f-51d5-e3cb-f4f932fb2ba8@eik.bme.hu>
 <AM7PR03MB6579DA01C8834EFD9EFC97F0C8359@AM7PR03MB6579.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-86865838-1623329571=:53181"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-86865838-1623329571=:53181
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 10 Jun 2021, luigi burdo wrote:
> i dont know if you know and if in the docs is described the pegasos II can support smp dual G4 cpu.

I think theoretically the Marvell Discovery II chip can support dual CPU 
and meybe even a G5, this is described in its docs. However in practice 
this was never implemented for Pegasos2 and there was only either a G3 or 
G4 single CPU card available for it. It probably does not make much sense 
to emulate anything else than the G4 version as that's what has the most 
features that guest OSes can use. The current emulation is just enough for 
that and I don't plan to implement more of the MV64361 chip to emulate non 
existent SMP configs as probably nothing would run on it anyway so it does 
not worth the extra effort.

> Here some hystorical info about this great machine from the past Phase 5 A\BOX (kosmoplovci.net)<https://www.kosmoplovci.net/hc/hc4/tech/phase5-abox.html>.
> i remember really good that period (when i was young man)... the  caipirinha become one of my best cocktail 🙂

Maybe interesting for history behind Pegasos2 only but otherwise probably 
not too relevant to how it was actually implemented at the end which is 
what counts if you want to run existing guests OSes. This doc seems to 
describe a system that wasn't implemented but instead a similar system was 
made from off the shelf components available at the time so for emulation 
a better reference are the docs of those chips.

Regards.
BALATON Zoltan
--3866299591-86865838-1623329571=:53181--

