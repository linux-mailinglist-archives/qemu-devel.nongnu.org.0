Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08763FB937
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:47:18 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjV0-0000Ya-TL
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mKjSE-0006S8-1Y; Mon, 30 Aug 2021 11:44:10 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mKjSB-0004F2-4Q; Mon, 30 Aug 2021 11:44:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4714E746399;
 Mon, 30 Aug 2021 17:44:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C390C7457EE; Mon, 30 Aug 2021 17:44:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C199A745708;
 Mon, 30 Aug 2021 17:44:00 +0200 (CEST)
Date: Mon, 30 Aug 2021 17:44:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest
 support?
In-Reply-To: <YSyBUSxBiH+UYE/Y@yekko>
Message-ID: <341991bb-5cb4-646d-6df-10f61bb8f27b@eik.bme.hu>
References: <7r8MLHEKQicVkfT4tQLsiRXQmt_800XbV1s0mM_QJTgOY7XadpiRcD4HizmXByPaZRsMQV2WbNKDfKU-PdVo3ZO9JC6fJ0MF5LM_j5a2fgA=@protonmail.com>
 <20210827170113.5f4ed260@bahia.lan>
 <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
 <YSyBUSxBiH+UYE/Y@yekko>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1735879432-1630338240=:43404"
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
Cc: qemu-ppc@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1735879432-1630338240=:43404
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 30 Aug 2021, David Gibson wrote:
> On Sun, Aug 29, 2021 at 04:09:54AM +0000, Joseph wrote:
>> Hi Mark, Cédric, Greg at the openbsd-ppc ML,
>>
>> It is great to talk to you. Thank you for taking on the conversation.
>>
>> Right, OpenBSD implements powernv meaning it runs on bare metal on
>> Power9, that is great.
>>
>> What I wanted to ask about with this thread is:
>>
>> To have the same utility of Power9 as of AMD64, it would be great to
>> have a high speed virtualizer, like what OpenBSD's VMM or Linux' KVM-
>> QEMU accomplish on AMD64.
>>
>> Linux KVM-QEMU supports Power9 already so that's a great start: One
>> runs Linux powernv bare metal on Power9 hardware. Each VM is a
>> KVM-QEMU instance.
>>
>> Is there any way today to make Linux-KVM-QEMU as VM host run
>> OpenBSD as a high speed (say >90% of bare metal performance, here
>> presume KVM uses PCIe passthrough) VM guest -
>
> I'm afraid this is more or less impossible, without adding
> PAPR/pseries support to OpenBSD.  The fundamental problem is that the
> virtualization facilities on the POWER chip don't really allow
> efficient full hardware virtualization, only para-virtualization and
> PAPR is that para-virtualized environment.
>
> That's why the "powernv" machine type doesn't utilize KVM and is fully
> emulated and therefore slow.  It might be possible to use the
> "powernv" machine type with the "PR" implementation of KVM - that's a
> KVM implementation which works by running the entire guest in
> userspace and emulating all privileged instructions.  But:
>
> * KVM PR doesn't currently work properly on POWER9, and getting it
>   working would be a significant amount of work
> * The way KVM PR works means it's very fiddly to get right, so it's
>   unlikely to ever be suitable for production work
> * Depending on host and guest cpu models there might be a few corner
>   cases it can never get exactly right

Out of curiosity what are the problems with KVM-PR on POWER9 currently and 
what are the corner cases that it can never get right? This info may be 
useful for those interested in fixing and using it and having it listed 
here may save time debugging some known problems.

Regards,
BALATON Zoltan
--3866299591-1735879432-1630338240=:43404--

