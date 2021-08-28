Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB033FA795
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 23:21:26 +0200 (CEST)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK5lU-00072z-Tv
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 17:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mK5kc-0006N0-UE
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 17:20:30 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mK5kY-0002Cl-1Z
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 17:20:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9D1FB746353;
 Sat, 28 Aug 2021 23:20:20 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2BFB37457EE; Sat, 28 Aug 2021 23:20:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 289FF745708;
 Sat, 28 Aug 2021 23:20:20 +0200 (CEST)
Date: Sat, 28 Aug 2021 23:20:20 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Subject: Re: vgabios with voodoo3 suppirt for Bochs
In-Reply-To: <CA+rFky7sOGWZW5wVcmJCeE-CWBZ-WK=3h5=oOKv9VzfDwhmiBA@mail.gmail.com>
Message-ID: <5e5c2f95-efa-950-1b93-433dd3304dec@eik.bme.hu>
References: <CA+rFky7sOGWZW5wVcmJCeE-CWBZ-WK=3h5=oOKv9VzfDwhmiBA@mail.gmail.com>
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 28 Aug 2021, Andrew Randrianasulu wrote:
> Hello and sorry for possible interruption.
>
> I was browsing various projects and found Bochs 2.7 was released on August,
> 1 2021 [0] together with vgabios 0.8a
>
> http://www.nongnu.org/vgabios/
>
> "2021-06-03 vruppert Version 0.8a of the LGPL'd VGABios with Voodoo Banshee
> for Bochs and Cirrus support for Bochs and Qemu is available now. This
> version will be included in the next Bochs release."
>
> not really usable in qemu directly (at least voodoo3 part?) but might be
> interesting for someone looking into gpu suppirt in qemu - supported or
> future vga cards...

It can be used and I've found it can be useful with some old board 
firmwares (such as sam460ex and pegasos2) that cannot run QEMU's vgabios. 
See here for more explanation:

https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2#h3-Known.20issues

It's not really needed to boot OSes as you can also get output from 
firmware via serial but if you want to get output like on real hardware 
this real mode VGA BIOS could be used as a work around.

Regards,
BALATON Zoltan

> [0] https://svn.code.sf.net/p/bochs/code/tags/REL_2_7_FINAL/bochs/CHANGES


