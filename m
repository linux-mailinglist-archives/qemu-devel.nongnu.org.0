Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFAF3E07C3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:39:52 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLnz-0001QB-Cb
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mBLm7-0007mH-6r
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:37:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54404
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mBLm5-0000oa-ER
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:37:54 -0400
Received: from host109-153-84-5.range109-153.btcentralplus.com ([109.153.84.5]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mBLll-000CBH-8J; Wed, 04 Aug 2021 19:37:37 +0100
To: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <162810031138.1167212.50563546711940033@amd.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1a4afd24-cd22-29c7-6eab-79735d9860b9@ilande.co.uk>
Date: Wed, 4 Aug 2021 19:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <162810031138.1167212.50563546711940033@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 109.153.84.5
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [ANNOUNCE] QEMU 6.1.0-rc2 is now available
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.132,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/08/2021 19:05, Michael Roth wrote:

> Hello,
> 
> On behalf of the QEMU Team, I'd like to announce the availability of the
> third release candidate for the QEMU 6.1 release.  This release is meant
> for testing purposes and should not be used in a production environment.
> 
>    http://download.qemu-project.org/qemu-6.1.0-rc2.tar.xz
>    http://download.qemu-project.org/qemu-6.1.0-rc2.tar.xz.sig
> 
> You can help improve the quality of the QEMU 6.1 release by testing this
> release and reporting bugs on Launchpad:
> 
>    https://bugs.launchpad.net/qemu/

Since the project is moving away from reporting bugs on Launchpad, are you able to 
update the text template to point to the issue tracker on gitlab instead?

     https://gitlab.com/qemu-project/qemu/-/issues

> The release plan, as well a documented known issues for release
> candidates, are available at:
> 
>    http://wiki.qemu.org/Planning/6.1
> 
> Please add entries to the ChangeLog for the 6.1 release below:
> 
>    http://wiki.qemu.org/ChangeLog/6.1
> 
> Thank you to everyone involved!


ATB,

Mark.

