Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E135D300
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 00:23:38 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW4y0-0003S3-RS
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 18:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4tr-0002SE-Ud
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:19:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44032
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4tl-0001ye-JY
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:19:15 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4ts-0004D5-9c; Mon, 12 Apr 2021 23:19:26 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <dabec806-51e3-5f3c-463b-0ac7f5ba854a@ilande.co.uk>
 <CAFEAcA8=G=O58FCaZBUqpqtFGaAYJT=PsDnEYjHu0qEGL22oBQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8c70d683-0cda-d251-33cd-1255b8a4c909@ilande.co.uk>
Date: Mon, 12 Apr 2021 23:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=G=O58FCaZBUqpqtFGaAYJT=PsDnEYjHu0qEGL22oBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.103.9
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/04/2021 20:40, Peter Maydell wrote:

> On Mon, 12 Apr 2021 at 19:44, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 12/04/2021 16:32, Peter Maydell wrote:
>>
>>> Last call to note anything we need to fix for 6.0 on
>>> https://wiki.qemu.org/Planning/6.0#Known_issues please.
>>> The schedule is to tag rc3 tomorrow, which I would ideally like
>>> to be the last rc before release. After rc3 I will only be taking
>>> fixes for bugs which are absolutely critical...
>>
>> Thanks for reviewing one of the patches from the ESP security patchset earlier.
>>
>> Should I send a PR for the ESP security patchset and the acceptance test fix?
>> Unfortunately the timing of the holidays has meant that these are missing a review
>> from a SCSI maintainer but IMO both of these are worthy for 6.0.
> 
> Yes, please do. If you could add your missing copyright line to
> the comment in the new file in patch 12 as well that would be great.

All done. I've added the copyright to patch 12 (along with yours and Phil's R-B tags) 
so it will appear in the upcoming PR.


ATB,

Mark.

