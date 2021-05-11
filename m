Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D037A751
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:10:42 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgS9p-0005yt-81
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lgS8N-0004ak-Tg; Tue, 11 May 2021 09:09:11 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lgS8K-0006F9-Om; Tue, 11 May 2021 09:09:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A27107457E7;
 Tue, 11 May 2021 15:09:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2A55C745709; Tue, 11 May 2021 15:09:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 290967456E3;
 Tue, 11 May 2021 15:09:05 +0200 (CEST)
Date: Tue, 11 May 2021 15:09:05 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/6] hw/southbridge: QOM'ify vt82c686 as
 VT82C686B_SOUTHBRIDGE
In-Reply-To: <6e9cad77-bb24-6c0a-f841-1f8a1f3515e6@amsat.org>
Message-ID: <211f4a16-a521-512c-ff52-aabf7a5f13@eik.bme.hu>
References: <20210511041848.2743312-1-f4bug@amsat.org>
 <ecdd9299-ec2-5049-fe1e-d3c7d261d@eik.bme.hu>
 <6e9cad77-bb24-6c0a-f841-1f8a1f3515e6@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-39243802-1620738545=:14150"
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-39243802-1620738545=:14150
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
> Hi Zoltan,
>
> On 5/11/21 1:28 PM, BALATON Zoltan wrote:
>> On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
>>> The motivation behind this series is to remove the
>>> isa_get_irq(NULL) call to simplify the ISA generic model.
>>>
>>> Since v1:
>>> - rebased on top of remotes/dg-gitlab/tags/ppc-for-6.1-20210504
>>
>> I'll try to have a look at these later but some notes: The pegasos2
>> changes are now in master so if this was before that maybe rebasing on
>> master is now enough.
>
> This is what this series does, simply rebase on top of your merged
> patches.
>
>> However I wonder if any changes to pegasos2.c is
>> needed due to changed init of the chip model or is that only affecting
>> 82c686b?
>
> There is no change in 'init' in this series, it is only QOM boilerplate
> code churn, no logical change intended.
>
>> Please also note that pegasos2 is not enabled by default due to
>> needing undistributable firmware ROM so to test it you need to enable it
>> in default-configs/devices/ppc-softmmu.mak
>
> I remember you said you were mostly interested in the VT8231, not
> the VT82C686. This series only QOM'ify the latter.

OK as I said I haven't looked at it in detail.

> What is your idea? Send the firmware off-list and explain how
> the OS works and how (what) to test?

I've already sent you this info:

https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html

but I can't write a test case so if you want to automate this and make it 
part of QEMU tests then some help with that would be appreciated.

As for the firmware, once Alexey's VOF (Virtual Open Firmware, minimial OF 
emulation in QEMU) is merged I plan to try to use that to make it possible 
to boot some guests with that so no firmware image would be needed and 
pegasos2 could be enabled by default. But for now a firmware image is 
needed as guests expect an OF environment to boot.

Regards,
BALATON Zoltan
--3866299591-39243802-1620738545=:14150--

