Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B4629183E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Oct 2020 18:10:29 +0200 (CEST)
Received: from localhost ([::1]:58792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUBGO-0005Xc-JX
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 12:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB7K-0003HH-8X; Sun, 18 Oct 2020 12:01:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60454
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB7H-0004g8-8B; Sun, 18 Oct 2020 12:01:05 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB7L-0001HX-6r; Sun, 18 Oct 2020 17:01:07 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1602805637.git.balaton@eik.bme.hu>
 <005ed95d-65ee-ab36-c068-e96a773ef8ed@ilande.co.uk>
 <f26e685a-4e93-c8a5-622f-5b12c71b8ac@eik.bme.hu>
 <f614564a-e3e1-fc68-7f88-5983f5d41575@ilande.co.uk>
 <6d125f2-c936-cfa2-f180-42b8ad9ca522@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <70207aa2-b06b-50b4-9255-28795d576886@ilande.co.uk>
Date: Sun, 18 Oct 2020 17:01:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <6d125f2-c936-cfa2-f180-42b8ad9ca522@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v8 0/5] Mac Old World ROM experiment (ppc/mac_* clean ups
 and loading binary ROM)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/2020 16:56, BALATON Zoltan via wrote:

>> If you can send a v9 with the cast fixed I'll apply this to my qemu-macppc branch 
>> right away.
> 
> You could've really just edit the single cast in patch 1 before applying to change 
> the it back but I've resent the changed patch 1 as v9 also adding your R-b for your 
> convenience. Other patches are unchanged so you can take the v8 for those, I haven't 
> resent those, let me know if you want the whole series but this is really getting 
> much more work that it should be for such a simple change. (There is no cast in patch 
> 2 as I've already stated several times.)

Thanks - this has been included in the PR I just sent.


ATB,

Mark.

