Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7062A28F9A7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 21:44:11 +0200 (CEST)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT9AY-000118-3d
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 15:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kT99N-0000Nk-Uo; Thu, 15 Oct 2020 15:42:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55914
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kT99L-0006b4-G0; Thu, 15 Oct 2020 15:42:57 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kT99F-0001vd-F7; Thu, 15 Oct 2020 20:42:52 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20201013114922.2946-1-mark.cave-ayland@ilande.co.uk>
 <20201013114922.2946-3-mark.cave-ayland@ilande.co.uk>
 <c882279b-a561-2c3a-a6b5-b27446fddb02@amsat.org>
 <79df54b3-d9e5-145e-e277-24468b121ba0@ilande.co.uk>
 <91a24667-5f72-d3d9-8e47-6453268d2b78@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <4b25afd1-0ce5-0832-a3f0-1b58b3aa7b32@ilande.co.uk>
Date: Thu, 15 Oct 2020 20:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <91a24667-5f72-d3d9-8e47-6453268d2b78@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 2/3] grackle: use qdev gpios for PCI IRQs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.019,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/2020 18:05, BALATON Zoltan via wrote:

> Hello,
> 
> Not related to this patch but while you're at it could you please take those patches 
> that are already reviewed by you from this series as well?
> 
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=186439
> 
> That would help cleaning up my tree and see which patches still need changes. Let me 
> know if these need any rebasing and point me to the tree on which I should rebase 
> them. Currently they apply to your screamer branch I think.

I've queued the grackle/uninorth patches to my qemu-macppc branch, however when I try 
to apply patches from the above series git fails with the following message:

Applying: mac_oldworld: Drop a variable, use get_system_memory() directly
error: sha1 information is lacking or useless (hw/ppc/mac_oldworld.c).
error: could not build fake ancestor

Any chance you can rebase and repost? I'm happy to take patches 3 and 4, and if my 
suggestion of casting the return address via target_ulong works then I think 1 and 2 
are also fine. The I2C stuff I can't really review, and weren't there still issues 
with the SPD data in patch 8 reporting the wrong RAM size?


ATB,

Mark.

