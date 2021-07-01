Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFAB3B913E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 13:37:15 +0200 (CEST)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyv0L-0001Rs-MT
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 07:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lyuzJ-00082P-SP; Thu, 01 Jul 2021 07:36:09 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:36857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lyuzE-00051x-Rc; Thu, 01 Jul 2021 07:36:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 92B4974570B;
 Thu,  1 Jul 2021 13:35:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 52347745709; Thu,  1 Jul 2021 13:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 505157456B4;
 Thu,  1 Jul 2021 13:35:58 +0200 (CEST)
Date: Thu, 1 Jul 2021 13:35:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 0/4] ppc/Pegasos2: Firmware replacement using VOF
In-Reply-To: <cover.1624811233.git.balaton@eik.bme.hu>
Message-ID: <a72a7538-e571-efae-27b-3cec1493441@eik.bme.hu>
References: <cover.1624811233.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Jun 2021, BALATON Zoltan wrote:
> Based-on: <20210625055155.2252896-1-aik@ozlabs.ru>
> ^ That is v22 of Alexey's VOF patch
>
> With this series on top of VOF v22 I can now boot Linux and MorphOS on
> pegasos2 without a firmware blob so I hope this is enough to get this
> board in 6.1 and also have it enabled so people can start using it
> eventually (a lot of people don't compile their QEMU but rely on
> binaries from distros and other sources). Provided that VOF will also
> be merged by then. This gives VOF another use case that may help it
> getting merged at last.
>
> Further info and example command lines can be found at
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2

Ping? Freeze is coming and this would be the second release pegasos2 
misses (after it missed 6.0) if this is not in the next pull request so 
that's why I'm pushing.

Regards,
BALATON Zoltan


> BALATON Zoltan (4):
>  ppc/pegasos2: Introduce Pegasos2MachineState structure
>  target/ppc: Allow virtual hypervisor on CPU without HV
>  ppc/pegasos2: Use Virtual Open Firmware as firmware replacement
>  ppc/pegasos2: Implement some RTAS functions with VOF
>
> default-configs/devices/ppc-softmmu.mak |   2 +-
> hw/ppc/Kconfig                          |   1 +
> hw/ppc/pegasos2.c                       | 783 +++++++++++++++++++++++-
> target/ppc/cpu.c                        |   2 +-
> 4 files changed, 771 insertions(+), 17 deletions(-)
>
>

