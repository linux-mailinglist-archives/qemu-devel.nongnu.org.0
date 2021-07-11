Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B73C3EEF
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 21:59:23 +0200 (CEST)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2fbm-0003yO-Au
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 15:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2fag-0003Is-IL
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 15:58:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56542
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2fae-0006ut-V8
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 15:58:14 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2faS-0009tl-40; Sun, 11 Jul 2021 20:58:04 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210711103612.2661521-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6ba02e03-ae68-066e-6d9b-95f685205b1d@ilande.co.uk>
Date: Sun, 11 Jul 2021 20:58:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210711103612.2661521-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 0/5] dp8393x: fixes and improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.631,
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/07/2021 11:36, Philippe Mathieu-Daudé wrote:

> Hi Mark,
> 
> This should be the last respin.
> 
> Since v3:
> - dropped worrying patches
> - squashed migration patch
> - added tags
> 
> Patch #3 (dp8393x: Store CAM registers as 16-bit) still
> misses your S-o-b tag.
> 
> Based-on mips-next.
> 
> Mark Cave-Ayland (1):
>    dp8393x: don't force 32-bit register access
> 
> Philippe Mathieu-Daudé (4):
>    dp8393x: Replace address_space_rw(is_write=1) by address_space_write()
>    dp8393x: Replace 0x40 magic value by SONIC_REG16_COUNT definition
>    dp8393x: Store CAM registers as 16-bit
>    dp8393x: Rewrite dp8393x_get() / dp8393x_put()
> 
>   hw/net/dp8393x.c | 206 ++++++++++++++++++++---------------------------
>   1 file changed, 87 insertions(+), 119 deletions(-)

Thanks Phil. A small typo in the subject line of patch 2, but otherwise this series 
passes my local tests (assuming "dp8393x: fix CAM descriptor entry index" is already 
applied to mips-next).

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

