Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF2307421
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:52:07 +0100 (CET)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l54uE-00047F-NQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l54t3-0003a2-Nr
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:50:53 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34478
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l54t1-00051L-OS
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:50:53 -0500
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l54tD-0000Wz-8K; Thu, 28 Jan 2021 10:51:06 +0000
To: Bug 1913505 <1913505@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <161180131265.32409.4817508561083668447.malonedeb@chaenomeles.canonical.com>
 <161183002642.31514.6656082378231332865.malone@chaenomeles.canonical.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f6a31704-9af0-f95e-cf65-e51849437ffa@ilande.co.uk>
Date: Thu, 28 Jan 2021 10:50:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161183002642.31514.6656082378231332865.malone@chaenomeles.canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [Bug 1913505] Re: Windows XP slow on Apple M1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/2021 10:33, Peter Maydell wrote:

> Is the install that slow on some other hardware (useful comparisons: x86
> Mac; x86 Linux; AArch64 Linux) ?

Could it be related to excess TLB flushing? Possible related bug report here: 
https://bugs.launchpad.net/qemu/+bug/1883593.


ATB,

Mark.

