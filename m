Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A431F749
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:25:23 +0100 (CET)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2yQ-00085h-BI
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lD2xY-0007fv-MY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:24:28 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:34384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lD2xV-0008IW-5H
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:24:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CBD4C7456B8;
 Fri, 19 Feb 2021 11:24:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7BE617456B7; Fri, 19 Feb 2021 11:24:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7AA497456B4;
 Fri, 19 Feb 2021 11:24:20 +0100 (CET)
Date: Fri, 19 Feb 2021 11:24:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Remove the uses of full screen APIs
In-Reply-To: <CAMVc7JXvAt6neB2H1Bmp-HKachc3di8FpDWy3=vP2x-PDE+xxA@mail.gmail.com>
Message-ID: <0d2beba-2a74-3a36-16d3-f1bac83dedce@eik.bme.hu>
References: <20210212000540.28486-1-akihiko.odaki@gmail.com>
 <20210217130915.ihqdqxjqmbrzlvpv@sirius.home.kraxel.org>
 <CAMVc7JXvAt6neB2H1Bmp-HKachc3di8FpDWy3=vP2x-PDE+xxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1656851486-1613730107=:70998"
Content-ID: <c5c168d-bce4-8d8f-a247-b91781ef2d54@eik.bme.hu>
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
Cc: qemu Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1656851486-1613730107=:70998
Content-Type: text/plain; CHARSET=ISO-2022-JP; format=flowed
Content-ID: <e1e81c1e-d5eb-cec3-7dec-b5cb724cd37@eik.bme.hu>

On Fri, 19 Feb 2021, Akihiko Odaki wrote:
> 2021年2月17日(水) 22:09 Gerd Hoffmann <kraxel@redhat.com>:
>>
>> On Fri, Feb 12, 2021 at 09:05:40AM +0900, Akihiko Odaki wrote:
>>> The detections of full screen APIs were wrong. A detection is coded as:
>>> [NSView respondsToSelector:@selector(exitFullScreenModeWithOptions:)]
>>> but it should be:
>>> [NSView instancesRespondToSelector:@selector(exitFullScreenModeWithOptions:)]
>>>
>>> The uses of full screen APIs were also incorrect, and if you fix the
>>> detections, the full screen view stretches the video, changing the
>>> aspect ratio, even if zooming is disabled.
>>>
>>> Remove the code as it does nothing good.
>>
>> So, it's broken right now (and probably for quite a while without anyone
>> complaining).  And the attempt to fix it didn't work out very well.
>> Correct?
>
> Because the detections of APIs are wrong, the code using those APIs
> were never executed and nobody realized it was broken.

Full screen on MacOS X worked when I've last tried but that was 2 years 
ago.

> I did not seriously attempt to fix it because the APIs are no longer
> the best ways to implement fullscreen. ([NSWindow -toggleFullScreen:]
> is more favorable today.) There is not much to reuse even if
> implementing fullscreen with [NSView -enterFullScreenModeWithOptions:]
> since the code is so small.

I think there are people using QEMU to run old MacOS versions on MacOS 
X/macOS and may not follow this mailing list but I'm sure they'll complain 
once you break it.

Regards,
BALATON Zoltan

>> Just dropping the code makes sense to me then.
>>
>> Any objections or better suggestions from the macos camp?
>> If not I'll go queue it for the next UI pull request in a day or two.
>>
>> thanks,
>>   Gerd
>>
>
> Thank you for responding to my patches.
>
> Akihiko Odaki
>
>
--3866299591-1656851486-1613730107=:70998--

