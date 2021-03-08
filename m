Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62023312E7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:08:47 +0100 (CET)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIR4-00076p-Q3
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJIOt-0004xv-El; Mon, 08 Mar 2021 11:06:31 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJIOp-0002yE-Sn; Mon, 08 Mar 2021 11:06:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5A6CD746334;
 Mon,  8 Mar 2021 17:06:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1C6597456B7; Mon,  8 Mar 2021 17:06:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1B0997456B4;
 Mon,  8 Mar 2021 17:06:21 +0100 (CET)
Date: Mon, 8 Mar 2021 17:06:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 6/6] hw/ppc: Add emulation of Genesi/bPlan Pegasos
 II
In-Reply-To: <bac27957-6321-36cf-4389-5d4530b20b38@amsat.org>
Message-ID: <96463620-5b5-3ce-d541-b46288ff6575@eik.bme.hu>
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <848089b1c91e0c28eb7c52ccdc55dc870eb49dc0.1614282457.git.balaton@eik.bme.hu>
 <97399e18-3217-40db-5021-702371d196bc@amsat.org>
 <c0403b8b-fee1-11e2-a8d0-2af36f66c9@eik.bme.hu>
 <YD7Wl/21vn7Dkizg@yekko.fritz.box>
 <bc813a4-51f6-7893-1cff-294e231f743@eik.bme.hu>
 <8d55999-396-9f7a-6dc-88b1761d1e9e@eik.bme.hu>
 <bac27957-6321-36cf-4389-5d4530b20b38@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1246156763-1615219155=:2434"
Content-ID: <17c5dba9-5b21-e07c-7de5-b88bbbf9401d@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1246156763-1615219155=:2434
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <813f82f6-3e83-2e19-b4e1-52eb5f977cc@eik.bme.hu>

On Mon, 8 Mar 2021, Philippe Mathieu-Daudé wrote:
> On 3/8/21 12:45 PM, BALATON Zoltan wrote:
>> Ping? Is there anything that needs a respin that you're waiting for or
>> you just did not yet have the time yet to merge this series?
>
> I asked you to split patch 4:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg786871.html

I did that in v5 and you've reviewed it I think, (Just replied to the ping 
message sent for v4 but I've also sent a v5 meanwhile and this ping was 
meant for that, sorry for the confusion).

> If you can get Paolo to Ack patch #1 and split patch 4, I'm

He was cc'd on all this and haven't answered so far so I guess he doesn't 
care about it.

> OK to queue the VIA patches via the MIPS tree, letting this
> single one for the PPC tree.

There's also the MV64361 patch that's only used by pegasos2 so may be PPC 
specific and the other VT8231 patches are useless without these last two. 
I hope David will be able to take the series so I'd wait a bit for his 
answer on what he prefers.

Thank you,
BALATON Zoltan
--3866299591-1246156763-1615219155=:2434--

