Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595243BA990
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:44:28 +0200 (CEST)
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzikl-0007Vr-FI
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lzijh-0006C4-HF
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:43:21 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lzije-0000pb-Sb
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:43:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 93DDD7457E5;
 Sat,  3 Jul 2021 18:43:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 659B774570B; Sat,  3 Jul 2021 18:43:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 643487456E3;
 Sat,  3 Jul 2021 18:43:16 +0200 (CEST)
Date: Sat, 3 Jul 2021 18:43:16 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Subject: Re: Getting started developing
In-Reply-To: <CAK7rcp-VAb2H5xZsvdcATOyMTRQKRBuSWKv8vY_HaDoZ-uiS9w@mail.gmail.com>
Message-ID: <9f7455cb-90fa-a71b-7781-308dbb96be20@eik.bme.hu>
References: <CAK7rcp-VAb2H5xZsvdcATOyMTRQKRBuSWKv8vY_HaDoZ-uiS9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 3 Jul 2021, Kenneth Adam Miller wrote:
> I just wanted to ask how I can get started developing other than just
> starting building? QEMU is a huge project, and getting familiar with all of
> the source and stuff is a lot of work. Probably, it wouldn't be helpful to
> know the entire source, but just what I need.

If you go to https://www.qemu.org/contribute/ there's a link to the wiki:

https://wiki.qemu.org/Documentation/GettingStartedDevelopers

where there are a few links to some docs. I've also gathered these links:

https://osdn.net/projects/qmiga/wiki/DeveloperTips

> I want to add a new system target for an architecture in which non-user
> mode instructions might be used. In my case, I am reading the documentation
> at qemu-project.gitlab.io/qemu/devel/*, and I find that some of it is good
> for getting started because it tells about the roles of different build
> targets. At the current time though, I feel like I'm so far at the
> beginning that I don't know what question to ask to help myself best. Is
> there any way to know in more detail how a system target would both share
> and differ from one architecture to another? For example, the same devices
> may be present from arm to x86, but this isn't true for how the processor
> works. Also, is there any reference on the execution lineage or data
> structures used?

Probably the easiest is to find a simple machine in QEMU that is similar 
to what you want and look at how that's implemented. At the beginning QOM 
boilerplate code might be confusing but it's just how QEMU defines objects 
in C so reading up on QOM and QDev might help to understand how to write 
and instantiate those objects then the code becomes more readable.

Hope this helps.

Regards,
BALATON Zoltan

