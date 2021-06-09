Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE12D3A1020
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:29:42 +0200 (CEST)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvSv-0005J3-SS
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lqvRU-0004Rt-TE; Wed, 09 Jun 2021 06:28:12 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lqvRR-0004bF-Vc; Wed, 09 Jun 2021 06:28:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 506FC74570E;
 Wed,  9 Jun 2021 12:28:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2D08574570B; Wed,  9 Jun 2021 12:28:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2BCAF7456B4;
 Wed,  9 Jun 2021 12:28:07 +0200 (CEST)
Date: Wed, 9 Jun 2021 12:28:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [RFC PATCH 0/5] ppc/Pegasos2 VOF
In-Reply-To: <5ab75d13-2fca-17cc-b24f-e86430fdda20@ozlabs.ru>
Message-ID: <a5786f77-efc1-febb-7ae2-1e9543ca2687@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <5ab75d13-2fca-17cc-b24f-e86430fdda20@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Jun 2021, Alexey Kardashevskiy wrote:
> On 6/7/21 01:46, BALATON Zoltan wrote:
>> Based-on: <20210520090557.435689-1-aik@ozlabs.ru>
>> ^ That is v20 of Alexey's VOF patch
>> 
>> Hello,
>> 
>> Posting these for early review now. I plan to rebase on the next VOF
>> patch that hopefully fixes those points that I had to circumvent in
>> patch 1 for now. I've reported these before but now all of those that
>> are needed for pegasos2 are in one place. Other points I've reported
>> could be clean ups but not sttictly needed.
>> 
>> With this series on top of VOF v20 I can now boot Linux and MorphOS on
>> pegasos2 without needing a firmware blob so I hope this is enough to
>> get this board in 6.1 and also have it enabled so users can start
>> using it. That means that VOF will also be merged by then. This now
>> gives VOF another use case that may help it getting finished.
>> 
>> I've also updated my development tree with this series here:
>> 
>> https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
>> 
>> Please review so I can do any needed changes together with the rebase
>> on next VOF patch so we don't miss 6.1 this time.
>
>
> It would help if you provided the disk or/and kernel or/and initramdisk 
> images and the example command line to give this a try. And said a few words 
> who is this Pegasos2 guy :) The series looks ok to me otherwise. Thanks,

These were in the original series adding this board:

https://patchew.org/QEMU/cover.1616680239.git.balaton@eik.bme.hu/

For testing I've used the kernel from debian 8.11.0 powerpc iso which is 
known to work on real hardware and MorphOS demo iso available from 
www.morphos-team.net. For debian look into install/pegasos to find the 
right vmlinuz-chrp.initrd kernel, for MorphOS use the boot.img from root 
of the iso as -kernel.

What's still missing is some rtas functions like get-time-of-day. Are 
these any kind of standard and is there a doc about their parameters and 
returns or I'll heave to find out from kernel sources? I plan to add these 
later but not needed to get it boot.

Regards,
BALATON Zoltan

