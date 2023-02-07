Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7622868DF08
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRrn-0001Hs-6K; Tue, 07 Feb 2023 12:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPRrh-0001HP-8I
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:34:48 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPRrf-0003T9-F5
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:34:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 907D6745712;
 Tue,  7 Feb 2023 18:32:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1A4F4745706; Tue,  7 Feb 2023 18:32:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 18F537456E3;
 Tue,  7 Feb 2023 18:32:11 +0100 (CET)
Date: Tue, 7 Feb 2023 18:32:11 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: [PATCH 1/6] usb/ohci: Code style fix comments
In-Reply-To: <CAFEAcA_+6S_ny-PKq9xzhzcEb_NZE2JgFVA+LaYnQdchgOO3Hg@mail.gmail.com>
Message-ID: <4ebf0dfc-6500-d735-be84-c51b20038c89@eik.bme.hu>
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <12159564d95e6cdfc78611234f4c478184be425c.1675193329.git.balaton@eik.bme.hu>
 <CAFEAcA_+6S_ny-PKq9xzhzcEb_NZE2JgFVA+LaYnQdchgOO3Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Feb 2023, Peter Maydell wrote:
> On Tue, 31 Jan 2023 at 19:39, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/usb/hcd-ohci.c | 99 +++++++++++++++++++++++------------------------
>>  1 file changed, 49 insertions(+), 50 deletions(-)
>>
>
>> -/* Bitfields for the first word of an Endpoint Desciptor.  */
>> +/* Bitfields for the first word of an Endpoint Desciptor. */
>
> We should fix the typos here in all these: it's Descriptor.
> But that's a separate patch,  I guess.

And Philippe already had a patch that does that so hope Gerd can rebase 
and add that when merging or Philippe can resubmit based on these.

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks,
BALATON Zoltan

