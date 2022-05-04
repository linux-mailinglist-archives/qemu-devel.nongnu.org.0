Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA46D519F14
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:15:29 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDui-0003AG-Od
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmDs6-0001k0-TI
 for qemu-devel@nongnu.org; Wed, 04 May 2022 08:12:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmDs3-0005Ls-Ag
 for qemu-devel@nongnu.org; Wed, 04 May 2022 08:12:46 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmDr7-0003c0-Bs; Wed, 04 May 2022 13:11:45 +0100
Message-ID: <e5557fcd-1754-6304-6e9a-d666c6718cf3@ilande.co.uk>
Date: Wed, 4 May 2022 13:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
 <47d4a9aa-c7e7-840b-4134-6a17307afe40@gmx.de>
 <805ac102-74a4-40fa-3064-083beade751a@ilande.co.uk>
 <d3aa2974-9c47-e762-63ae-8eaec98b7894@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <d3aa2974-9c47-e762-63ae-8eaec98b7894@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/50] hppa: general improvements and tidy-ups
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2022 16:38, Richard Henderson wrote:

> On 5/3/22 05:11, Mark Cave-Ayland wrote:
>> Thanks Helge! After a few brief experiments over the holiday weekend I'm going to 
>> send a v2 with your A-B tags, and also change the machine from "HPPA generic" to 
>> "HPPA BL160L". This will then match with both MAINTAINERS and also Linux which 
>> identifies the machine as "model 9000/778/B160L".
>>
>> Richard, any other thoughts before sending out a v2? And who should be the best 
>> person to merge it?
> 
> I have no specific comments; most of the patch set is outside my area of expertise. 
> As far as I'm concerned, it would be helpful if you sent the PR.

No worries. I've sent the updated v2 and can send a PR at the end of the week 
assuming no-one has any further comments.


ATB,

Mark.

