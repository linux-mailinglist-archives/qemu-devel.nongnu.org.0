Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812835F57E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:59:11 +0200 (CEST)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWg2w-0001C4-Cq
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lWg1w-0000RC-IC
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:58:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46878
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lWg1u-0004ER-3Y
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:58:08 -0400
Received: from host86-132-83-131.range86-132.btcentralplus.com
 ([86.132.83.131] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lWg22-0001Rk-8b; Wed, 14 Apr 2021 14:58:20 +0100
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c63bbf7e-2230-44b2-7671-086c7dacd787@ilande.co.uk>
Date: Wed, 14 Apr 2021 14:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/04/2021 13:48, Thomas Huth wrote:

> On 12/04/2021 17.32, Peter Maydell wrote:
>> Last call to note anything we need to fix for 6.0 on
>> https://wiki.qemu.org/Planning/6.0#Known_issues please.
>> The schedule is to tag rc3 tomorrow, which I would ideally like
>> to be the last rc before release. After rc3 I will only be taking
>> fixes for bugs which are absolutely critical...
> 
> Hi Peter,
> 
> I've seen some intermittend, non-reproducible crashes with usermode QEMU in some of 
> my CI runs, e.g.:
> 
> https://gitlab.com/thuth/qemu/-/jobs/1178256498#L3876
> 
> https://gitlab.com/thuth/qemu/-/jobs/1146276208#L3241
> 
> This was only with ccache enabled, so I thought that it might be related to my 
> work-in-progress ccache patches...
> 
> ... but now Cornelia reported that she has seen such a crash in one of her branches, 
> too (which is completely unrelated to my ccache patches):
> 
> https://gitlab.com/cohuck/qemu/-/jobs/1178860927#L3867
> 
> That makes me wonder whether we currently have a real problem with user-mode in the 
> master branch? Did anybody else see such problems?

I've definitely seen the same issue as Cornelia in my Gitlab CI builds for the ESP 
security fixes (first version of which appeared just before rc0). The user builds 
always fail on "run-tcg-tests-s390x-linux-user" for me.

Looking back through my gitlab CI history for the ESP patches I first see the issue 
in clang-user here:

   https://gitlab.com/mcayland/qemu/-/pipelines/278781899 (master: ec2e6e01)

and for the PR I just sent the failure is now present in build-user:

   https://gitlab.com/mcayland/qemu/-/pipelines/285320238

The last build I have that succeeded before seeing the clang-user failure is this one:

   https://gitlab.com/mcayland/qemu/-/pipelines/271328298 (master: 757acb9a)

That seems to suggest that the issue was first introduced in git master somewhere 
between 757acb9a and ec2e6e01.


ATB,

Mark.

