Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1992B4162DC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:18:33 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTRQc-000702-Kh
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTRCX-00064X-67
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:03:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49284
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTRCU-00080z-7m
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:03:55 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTRCG-0006EH-22; Thu, 23 Sep 2021 17:03:44 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-15-mark.cave-ayland@ilande.co.uk>
 <db1b7f79-1442-a6fb-e1f6-c956f2dd9cb3@vivier.eu>
 <63b200b3-1690-cec2-d54b-7366073c64f3@ilande.co.uk>
 <d571c96a-a00d-ae89-f92f-9db2d4b5d068@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1c46dd7d-6e2c-05cd-e74c-3749389bbd46@ilande.co.uk>
Date: Thu, 23 Sep 2021 17:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d571c96a-a00d-ae89-f92f-9db2d4b5d068@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 14/20] mac-nubus-bridge: rename MacNubusState to
 MacNubusBridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/2021 14:53, Laurent Vivier wrote:

> Le 23/09/2021 à 14:50, Mark Cave-Ayland a écrit :
>> On 23/09/2021 11:35, Laurent Vivier wrote:
>>
>>> Le 23/09/2021 à 11:13, Mark Cave-Ayland a écrit :
>>>> This better reflects that the mac-nubus-bridge device is derived from the
>>>> nubus-bridge device, and that the structure represents the state of the bridge
>>>> device and not the Nubus itself. Also update the comment in the file header to
>>>> reflect that mac-nubus-bridge is specific to the Macintosh.
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>    hw/nubus/mac-nubus-bridge.c         | 8 +++++---
>>>>    include/hw/nubus/mac-nubus-bridge.h | 4 ++--
>>>>    2 files changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>
>>>
>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>>
>>> (it could be merged with previous one)
>>
>> I like to try and keep renames on a per-device basis if possible, even if it's just to help rebasing
>> during development.
> 
> Ok. No problem.
> 
>> Other than that, is there anything else outstanding you think would require a v6 series?
> 
> Except if you want to address comments from Philippe, I can collect this series and send a PR.

Okay I see there are a couple more comments on v5 - let me take a quick look.


ATB,

Mark.

