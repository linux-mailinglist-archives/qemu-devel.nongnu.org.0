Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA83227A4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:17:54 +0100 (CET)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETpJ-0002zU-Sl
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lETlP-0001Qr-47; Tue, 23 Feb 2021 04:13:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:63909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lETlM-0003k7-S5; Tue, 23 Feb 2021 04:13:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A46C37462D3;
 Tue, 23 Feb 2021 10:13:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7DDD77456B7; Tue, 23 Feb 2021 10:13:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7C2467456B4;
 Tue, 23 Feb 2021 10:13:46 +0100 (CET)
Date: Tue, 23 Feb 2021 10:13:46 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 5/6] hw/pci-host: Add emulation of Marvell MV64361
 PPC system controller
In-Reply-To: <YDSHOJMkkM4WTDyo@yekko.fritz.box>
Message-ID: <16feacb2-a183-8c66-59d3-abe4dca374f2@eik.bme.hu>
References: <cover.1614007326.git.balaton@eik.bme.hu>
 <a18959c44349a5c5845e388a0e43a8bd04472b45.1614007326.git.balaton@eik.bme.hu>
 <YDSHOJMkkM4WTDyo@yekko.fritz.box>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021, David Gibson wrote:
> On Mon, Feb 22, 2021 at 04:22:06PM +0100, BALATON Zoltan wrote:
>> The Marvell Discovery II aka. MV64361 is a PowerPC system controller
>> chip that is used on the pegasos2 PPC board. This adds emulation of it
>> that models the device enough to boot guests on this board. The
>> mv643xx.h header with register definitions is taken from Linux 4.15.10
>> only fixing end of line white space errors and removing not needed
>> parts, it's otherwise keeps Linux formatting.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> This needs to go before the previous patch to avoid bisect breakage,
> doesn't it?

Yes this is 5/6 and that's 6/6 but sending the patches at once sometimes 
mixes up their order if you sort by receive time.

Regards,
BALATON Zoltan

