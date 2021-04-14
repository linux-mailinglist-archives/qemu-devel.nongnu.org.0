Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9435F8E9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:29:46 +0200 (CEST)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiOf-0004GI-Jp
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lWiLF-0001Pg-Kx
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:26:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47100
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lWiLD-00031X-Gf
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:26:13 -0400
Received: from host86-132-83-131.range86-132.btcentralplus.com
 ([86.132.83.131] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lWiLN-0002Xe-PR; Wed, 14 Apr 2021 17:26:27 +0100
To: Cornelia Huck <cohuck@redhat.com>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
 <c63bbf7e-2230-44b2-7671-086c7dacd787@ilande.co.uk>
 <7760731b-ae34-89aa-a5de-65828ec9ae79@ilande.co.uk>
 <20210414163642.54bccd52.cohuck@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <e017bad5-b984-2eb0-1a3b-c0f0c735ae18@ilande.co.uk>
Date: Wed, 14 Apr 2021 17:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210414163642.54bccd52.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/04/2021 15:36, Cornelia Huck wrote:

> On Wed, 14 Apr 2021 15:15:04 +0100
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> 
>> On 14/04/2021 14:57, Mark Cave-Ayland wrote:
>>
>>> I've definitely seen the same issue as Cornelia in my Gitlab CI builds for the ESP
>>> security fixes (first version of which appeared just before rc0). The user builds
>>> always fail on "run-tcg-tests-s390x-linux-user" for me.
>>
>> Commit 23fff7a17f lies within that range and certainly feels like it could be
>> relevant to the above failure:
>>
>>
>> commit 23fff7a17f47420797ac6480147941612152a9ad
>> Author: Andreas Krebbel <krebbel@linux.ibm.com>
>> Date:   Wed Mar 24 19:51:28 2021 +0100
>>
>>       linux-user/s390x: Use the guest pointer for the sigreturn stub
>>
>>       When setting up the pointer for the sigreturn stub in the return
>>       address register (r14) we currently use the host frame address instead
>>       of the guest frame address.
>>
>>       Note: This only caused problems if Qemu has been built with
>>       --disable-pie (as it is in distros nowadays). Otherwise guest_base
>>       defaults to 0 hiding the actual problem.
>>
>>       Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
>>       Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>       Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>       Message-Id: <20210324185128.63971-1-krebbel@linux.ibm.com>
>>       Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>
>>
>> I'll try pushing a test build to Gitlab CI with a revert for that patch on top and
>> see if it succeeds for me...
> 
> Hm. I'm actually seeing it sometimes succeeding, and sometimes failing.
> I'm wondering if there's something else at play here...

That could also be possible, and it may be that I have just been unlucky with my 
builds. Even if it isn't particularly conclusive I can report back that my test 
Gitlab CI build with a revert of the above patch did pass clang-user and build-user: 
https://gitlab.com/mcayland/qemu/-/pipelines/286332527.


ATB,

Mark.

