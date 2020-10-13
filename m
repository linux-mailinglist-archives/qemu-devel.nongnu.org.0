Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFA28D66E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 00:31:17 +0200 (CEST)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSSpA-0008Bl-Ea
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 18:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kSSn5-0006hc-OE; Tue, 13 Oct 2020 18:29:07 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kSSn3-00085u-1W; Tue, 13 Oct 2020 18:29:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0139074760B;
 Wed, 14 Oct 2020 00:29:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C6FB6747608; Wed, 14 Oct 2020 00:28:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C5844747600;
 Wed, 14 Oct 2020 00:28:59 +0200 (CEST)
Date: Wed, 14 Oct 2020 00:28:59 +0200 (CEST)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 8/8] mac_oldworld: Add SPD data to cover RAM
In-Reply-To: <b78024b4-7d9b-9670-66af-24b6bc97a5a8@eik.bme.hu>
Message-ID: <1a93fb66-7252-352-4954-208b78616a38@eik.bme.hu>
References: <cover.1593456926.git.balaton@eik.bme.hu>
 <9f5f44878dc0f60b073201e657d6e4dcc940f68c.1593456926.git.balaton@eik.bme.hu>
 <5f4c18c1-80ff-f605-fdd7-7ae474443690@amsat.org>
 <b78024b4-7d9b-9670-66af-24b6bc97a5a8@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2146972407-1602628139=:80018"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2146972407-1602628139=:80018
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 14 Oct 2020, BALATON Zoltan via wrote:
> On Tue, 13 Oct 2020, Philippe Mathieu-Daudé wrote:
>> On 6/29/20 8:55 PM, BALATON Zoltan wrote:
>>> This patch is more complex as it should be which I intend to fix once
>>> agreement can be made on how to get back the necessary functionality
>>> removed by previous patches. See in this thread:
>>> https://lists.nongnu.org/archive/html/qemu-devel/2020-06/msg08710.html
>>> 
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>
> I plan to rewrite this patch eliminating this part and un-breaking 
> spd_data_generate() instead to allow it to signal an error again so we don't 
> need to duplicate part of it here to avoid aborting. (You may remember the 
> thread where this was discussed in, I don't have a link to it now.) So just

Oh, I actually have the link in the commit message... Maybe I should also 
read what I write sometimes.

Regards,
BALATON Zoltan
--3866299591-2146972407-1602628139=:80018--

