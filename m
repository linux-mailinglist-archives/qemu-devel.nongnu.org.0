Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581149B4A8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:11:33 +0100 (CET)
Received: from localhost ([::1]:32820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCLbf-0000Pz-R1
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:11:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCL6A-0000bk-6A
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:39:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:12328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCL64-0006oB-H8
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:38:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E897D74570D;
 Tue, 25 Jan 2022 13:38:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C1AD07456E3; Tue, 25 Jan 2022 13:38:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C043F7456FE;
 Tue, 25 Jan 2022 13:38:27 +0100 (CET)
Date: Tue, 25 Jan 2022 13:38:27 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/5] Misc OHCI clean ups
In-Reply-To: <20220125102725.d4gx5cilfirhmqne@sirius.home.kraxel.org>
Message-ID: <2464bf2b-43e6-388-85a4-857640e5a6@eik.bme.hu>
References: <cover.1642339238.git.balaton@eik.bme.hu>
 <a56cff-a9e2-365a-9d85-62f46560a7c5@eik.bme.hu>
 <20220125074430.5krdc75rn3a3nca3@sirius.home.kraxel.org>
 <20220125102725.d4gx5cilfirhmqne@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jan 2022, Gerd Hoffmann wrote:
> On Tue, Jan 25, 2022 at 08:44:30AM +0100, Gerd Hoffmann wrote:
>> On Mon, Jan 24, 2022 at 06:09:12PM +0100, BALATON Zoltan wrote:
>>> On Sun, 16 Jan 2022, BALATON Zoltan wrote:
>>>> Hello,
>>>>
>>>> I have these patches from last October when we've looked at what
>>>> causes problems with mac99 and USB. We've found the main problem is
>>>> likely not allowing pending packets per endpoint which we did not fix
>>>> but these patches came out of debugging that and trying to improve the
>>>> device model so eventually the real problem could be fixed more
>>>> easily. So these are just clean ups and fixing one potential issue
>>>> with isochronous transfers breaking pending async packet but it does
>>>> not solve all problems OHCI currently has. I'm sending it anyway as I
>>>> don't plan to work further on this so this series could be taken as is
>>>> for now.
>>>
>>> Ping?
>>
>> Queued now.
>
> Oops, have to take that back, checkpatch throws errors:
>
> HEAD is now at 00abd6f54a24 usb/ohci: Don't use packet from OHCIState for isochronous transfers
>
> error: no note found for object 00abd6f54a246db5877ceb466755374b297d97cf.
> ERROR: braces {} are necessary for all arms of this statement
> #131: FILE: hw/usb/hcd-ohci.c:1115:
> +                if (ohci_service_iso_td(ohci, &ed))
> [...]
>
> total: 1 errors, 0 warnings, 153 lines checked
>
> Please check all patches & resend.

Sorry, I'll resend. I usually run checkpatch before submitting and I think 
I've checked these when first sent them and haven't got the error but 
maybe this was a last minute change. Not sure how it was missed.

Regards,
BALATON Zoltan

