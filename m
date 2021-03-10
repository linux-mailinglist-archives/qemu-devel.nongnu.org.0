Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2668333346
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 03:49:47 +0100 (CET)
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJouw-0002CE-GL
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 21:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJott-0001cG-8T; Tue, 09 Mar 2021 21:48:41 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:52994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJotq-0004cU-7z; Tue, 09 Mar 2021 21:48:41 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 865F07456B8;
 Wed, 10 Mar 2021 03:48:35 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 64F8F7456B7; Wed, 10 Mar 2021 03:48:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 62F457456B4;
 Wed, 10 Mar 2021 03:48:35 +0100 (CET)
Date: Wed, 10 Mar 2021 03:48:35 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
In-Reply-To: <58da423e-ca71-1ee0-c0a5-ec70408375fd@amsat.org>
Message-ID: <a3f4ed26-adff-fd69-73af-1f08c7e91d6@eik.bme.hu>
References: <20210302080531.913802-1-f4bug@amsat.org>
 <5d3abcbd-99f0-0c43-4493-9881a38ae980@amsat.org>
 <8494e9f1-b4d9-10bb-451d-54807d4c1deb@eik.bme.hu>
 <58da423e-ca71-1ee0-c0a5-ec70408375fd@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1470605049-1615344515=:20835"
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1470605049-1615344515=:20835
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Mar 2021, Philippe Mathieu-Daudé wrote:
> On 3/10/21 12:41 AM, BALATON Zoltan wrote:
>> On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
>>> ping for review?
>>
>> This is included in my pegasos2 series as 6/8 replacing half of a
>> similar patch from my original version. Since I've reported it I don't
>> think I should be also reviewing it but it's quite trivial so may not
>> need that much review.
>
> Forwarding a patch doesn't mean you have reviewed it :/

I guess it does mean I agree with it and really don't see how another line 
with my name would make it any better when it already has my Suggested-by 
and Signed-off-by. An R-b tag probably really only helps for patches that 
are more complex than one line that the maintainter can easily check.

> If you can provide a formal R-b tag, then I can queue this or the
> one in your series.

The two are the same. If you commit this first my series can be easily 
rebased by dropping that patch or it will get committed as part of the 
series. At this point I think it's easiest if David takes the whole series 
than if you take a few of them then I have to rebase again and part of the 
series goes in via another tree. As the freeze is nearing I'd like 
somebody take the whole series so if you can ack the vt82c686 parts I 
think you don't need to do anything more which is what you said before 
you'd prefer.

I'll fix the errp you've noticed and repost. Adding any more to the series 
now would need starting review again which would risk missing the freeze. 
So unless it's needed to accept the series as it is I'd leave any other 
improvements for later after this pegasos2 series is merged.

Regards,
BALATON Zoltan

> Thanks,
>
> Phil.
>
>
--3866299591-1470605049-1615344515=:20835--

