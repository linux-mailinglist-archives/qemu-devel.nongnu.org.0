Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088431D261
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 22:58:18 +0100 (CET)
Received: from localhost ([::1]:57046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC8ML-00021s-7a
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 16:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lC8LM-0001NB-As
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 16:57:16 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39754
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lC8LK-0007ey-OJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 16:57:16 -0500
Received: from host86-150-128-218.range86-150.btcentralplus.com
 ([86.150.128.218] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lC8Lk-0007dG-TF; Tue, 16 Feb 2021 21:57:41 +0000
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210215102149.20513-1-peter.maydell@linaro.org>
 <5b91b4f1-f557-ca74-9e68-8f860cac76c7@ilande.co.uk>
 <CAFEAcA-QP8-hc1i-fgy--=R1K99ubxRDX38Q1QrVrzQm+aMbew@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6fc7b6cd-6e36-cd21-cf8a-b9de904c8f51@ilande.co.uk>
Date: Tue, 16 Feb 2021 21:57:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-QP8-hc1i-fgy--=R1K99ubxRDX38Q1QrVrzQm+aMbew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.150.128.218
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/display/tcx: Drop unnecessary code for handling BGR
 format outputs
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2021 10:11, Peter Maydell wrote:

>> Would you like this to go via a qemu-sparc PR or is it easier to go as part of a
>> group alongside your other display surface patches via target-arm.next?
> 
> I'm happy either way -- if you don't happen to have anything else
> queued up for sparc I can just put it in with the arm queue.

Nothing at the moment. I'm not sure whether the ESP patches will go via qemu-sparc or 
Laurent's m68k queue, and the ESP series is probably large enough by itself already. 
So if you've got a pending PR feel free to add it in, otherwise I'll have a look 
post-ESP :)


ATB,

Mark.

