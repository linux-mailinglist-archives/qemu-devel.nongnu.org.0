Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B23345EBE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:59:32 +0100 (CET)
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgd9-0000kx-V0
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOgbC-0006uz-6L; Tue, 23 Mar 2021 08:57:30 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:63696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOgbA-0005fD-Dn; Tue, 23 Mar 2021 08:57:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EEACF746351;
 Tue, 23 Mar 2021 13:57:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CEFAD74632F; Tue, 23 Mar 2021 13:57:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CDCC4746344;
 Tue, 23 Mar 2021 13:57:25 +0100 (CET)
Date: Tue, 23 Mar 2021 13:57:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v10 0/7] Pegasos2 emulation
In-Reply-To: <YFk5acXxW6Mdmr+2@yekko.fritz.box>
Message-ID: <344d1375-eb5e-31fb-5cbf-407497684fe0@eik.bme.hu>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <YFk5acXxW6Mdmr+2@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021, David Gibson wrote:
> On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
>> Hello,
>>
>> This is adding a new PPC board called pegasos2. More info on it can be
>> found at:
>>
>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>
>> Currently it needs a firmware ROM image that I cannot include due to
>> original copyright holder (bPlan) did not release it under a free
>> licence but I have plans to write a replacement in the future. With
>> the original board firmware it can boot MorphOS now as:
>>
>> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile="" -serial stdio
>>
>> then enter "boot cd boot.img" at the firmware "ok" prompt as described
>> in the MorphOS.readme. To boot Linux use same command line with e.g.
>> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
>> "boot cd install/pegasos"
>>
>> The last patch adds the actual board code after previous patches
>> adding VT8231 and MV64361 system controller chip emulation.
>
> I've applied 1..5 to a new ppc-for-6.1 branch.  Sorry it didn't make
> it for 6.0, I just didn't have time to look this over until too late.

Thanks but maybe you should wait if the dropped original first patch can 
be reviewed now and brought back. It would be easier for me to resubmit 
whole series rebased than port the dropped patch on top of a partly 
applied series. Also first patches without the last two is not much useful 
as the vt8231 model these add would not be used by anything else.

Regards,
BALATON Zoltan

