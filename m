Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B93634A8
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 12:39:56 +0200 (CEST)
Received: from localhost ([::1]:37898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY4qI-0003tG-M1
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 06:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lY4or-0003IV-53
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 06:38:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51894
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lY4ol-0008Lg-R2
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 06:38:24 -0400
Received: from host86-132-83-131.range86-132.btcentralplus.com
 ([86.132.83.131] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lY4ow-0007L3-1o; Sun, 18 Apr 2021 11:38:35 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
 <c63bbf7e-2230-44b2-7671-086c7dacd787@ilande.co.uk>
 <CAFEAcA9Q7q5eoE+qBOY9LYQnnaccSfMux=fOzb3+BtRWjXm6gw@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <b7912545-96b8-70b7-21b2-578808051f14@ilande.co.uk>
Date: Sun, 18 Apr 2021 11:38:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Q7q5eoE+qBOY9LYQnnaccSfMux=fOzb3+BtRWjXm6gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.83.131
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: any remaining for-6.0 issues?
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/04/2021 20:46, Peter Maydell wrote:

>> On 14/04/2021 13:48, Thomas Huth wrote:
>>> I've seen some intermittend, non-reproducible crashes with usermode QEMU in some of
>>> my CI runs, e.g.:
>>>
>>> https://gitlab.com/thuth/qemu/-/jobs/1178256498#L3876
>>>
>>> https://gitlab.com/thuth/qemu/-/jobs/1146276208#L3241
>>>
>>> This was only with ccache enabled, so I thought that it might be related to my
>>> work-in-progress ccache patches...
>>>
>>> ... but now Cornelia reported that she has seen such a crash in one of her branches,
>>> too (which is completely unrelated to my ccache patches):
>>>
>>> https://gitlab.com/cohuck/qemu/-/jobs/1178860927#L3867
>>>
>>> That makes me wonder whether we currently have a real problem with user-mode in the
>>> master branch? Did anybody else see such problems?
>>
>> I've definitely seen the same issue as Cornelia in my Gitlab CI builds for the ESP
>> security fixes (first version of which appeared just before rc0). The user builds
>> always fail on "run-tcg-tests-s390x-linux-user" for me.
> 
> Do we have any better understanding yet of the cause here?
> (I ask because I think we're going to need an rc4 for other reasons,
> so if there's a ready-to-go fix then we could consider it.)

I don't think so. I tried a run with a possible candidate patch reverted (see 
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02345.html) but Cornelia's 
response indicates that the result is still inconclusive :(


ATB,

Mark.

