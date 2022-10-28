Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18C611145
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:25:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOQO-0000Un-SS; Fri, 28 Oct 2022 08:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooOPY-0007RR-N1; Fri, 28 Oct 2022 08:24:32 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooOPU-0002Yl-Nm; Fri, 28 Oct 2022 08:24:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8D55075A15C;
 Fri, 28 Oct 2022 14:24:24 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 245DA75A159; Fri, 28 Oct 2022 14:24:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 22BEB75A135;
 Fri, 28 Oct 2022 14:24:24 +0200 (CEST)
Date: Fri, 28 Oct 2022 14:24:24 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v4 00/19] Misc ppc/mac machines clean up
In-Reply-To: <557fdfb3-cd05-948b-03f8-6347d7436532@ilande.co.uk>
Message-ID: <ed5f8b6f-ee9e-dc8e-914d-acf785876116@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <557fdfb3-cd05-948b-03f8-6347d7436532@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
> On 25/10/2022 17:44, BALATON Zoltan wrote:
>> Since only one week is left until freeze starts I've included some
>> more patches in this version that I've intended to submit after the
>> clean ups but we're running out of time now. The last 3 patches could
>> be squashed together, I've just split these up because I expect
>> resistence from Mark to any changes so maybe it's easier to digest
>> piece by piece and can cherry pick parts easier this way but ideally
>> these should be in one patch.
>> 
>> I'd appreciate very much if this series would get in before the
>> freeze, it is very discouraging to spend time with something that gets
>> ignored and then postponed for the rest of the year just to start
>> again the same in January. This might be a reason why not many people
>> contribute to this part of QEMU besides that maybe only a few people
>> are still interested so those who are interested should be served
>> better to not scare them off even more.
>> 
>> Regards,
>> BALATON Zoltan
>> 
>> v4: Add some more patches that I've found since v3 or was intended in
>> separate series
>> v3: Some more patch spliting and changes I've noticed and address more
>> review comments
>> v2: Split some patches and add a few more I've noticed now and address
>> review comments
>
> Oh wait, there's already a v4 with even more changes in? This is really 
> confusing as a reviewer...

I've intended to submit these last patches as a separate series after the 
simple clean ups but that series were under review for so long that I had 
to include these now to have a chance to meet the freeze deadline. Ideally 
the simple clean ups should not have taken more than 2 weeks then we had 
another 2 weeks for these.

Regards,
BALATON Zoltan

