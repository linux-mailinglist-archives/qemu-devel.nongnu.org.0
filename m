Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E004CE573
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 16:11:03 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQW3e-0000X6-Ap
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 10:10:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW2K-0008HV-7b
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:09:36 -0500
Received: from [2001:41c9:1:41f::167] (port=59080
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW2I-0006Z0-O5
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:09:35 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW1f-0008Oy-GQ; Sat, 05 Mar 2022 15:08:55 +0000
Message-ID: <fd5b81bf-786a-4cf8-5901-4740793a7cff@ilande.co.uk>
Date: Sat, 5 Mar 2022 15:09:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, laurent@vivier.eu, qemu-devel@nongnu.org
References: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
 <97fe5156-d103-8af6-ab9c-cef21d7f5d18@gmail.com>
 <f5345278-d6d6-6499-2e0b-cd26461ae97f@ilande.co.uk>
In-Reply-To: <f5345278-d6d6-6499-2e0b-cd26461ae97f@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 00/12] mos6522: switch to gpios, add control line
 edge-triggering and extra debugging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 05/03/2022 14:51, Mark Cave-Ayland wrote:

> On 05/03/2022 14:34, Philippe Mathieu-Daudé wrote:
> 
>> On 5/3/22 15:10, Mark Cave-Ayland wrote:
>>> Here is another patchset taken from my series to enable MacOS to boot on the q800
>>> machine.
>>
>>> v3:
>>> - Rebase onto master
>>> - Add R-B tags from Laurent
>>
>> It seems you missed all my R-b...
> 
> Apologies Phil, looks like I missed a couple. Patch 7 already has your R-B with your 
> suggested change, so it's just patches 1 and 3 that I think I missed?

Looks like it's 1, 3 and 10 which I missed your R-b tags for. I'll send as a v4 
shortly, and sorry once again.


ATB,

Mark.

