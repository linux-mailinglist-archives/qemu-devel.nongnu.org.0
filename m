Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFEA2E2E14
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 12:58:29 +0100 (CET)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kt8DL-0007Kd-Fq
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 06:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>) id 1kt85y-00065b-5J
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 06:50:50 -0500
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2]:57779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>) id 1kt85p-00067Y-67
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 06:50:49 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8620322172;
 Sat, 26 Dec 2020 12:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1608983433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EcnV8lBx5vpKTSpgPTuWXH3kwfaYOHUgIN1EuJaWnMk=;
 b=lJZlnqw+J+LKyPYVfd2xSfs74keFaJXpUKBSAsecujyIwqE3XsvCTtDBWKxYcVhC1T7o1z
 9tbjRefJJeTvaoBd3F/5zrEIHQd1kOAF2xiKy9wNAo68Ywq7b+/aXDrK6MNarVItqkcLO0
 FLfGPY3nmEaYGWAHt4O789Tr7LkeQGU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 26 Dec 2020 12:50:32 +0100
From: Michael Walle <michael@walle.cc>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Deprecation of the LM32 target
In-Reply-To: <d8bbe81c-3446-8d83-3f34-f29156cf4f01@physik.fu-berlin.de>
References: <49c3d04e-a94c-cf77-4df9-5ceb8c9c7f80@physik.fu-berlin.de>
 <86690c16-3bc9-9c77-f720-64db14d0cf72@redhat.com>
 <d8bbe81c-3446-8d83-3f34-f29156cf4f01@physik.fu-berlin.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <57299bc6cf222a3e9b71fd26d81cd3e3@walle.cc>
X-Sender: michael@walle.cc
Received-SPF: pass client-ip=2a01:4f8:151:8464::1:2;
 envelope-from=michael@walle.cc; helo=ssl.serverraum.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Am 2020-12-26 10:06, schrieb John Paul Adrian Glaubitz:
> Hello!
> 
> On 12/26/20 9:39 AM, Thomas Huth wrote:
>> the problem is not that the target CPU is old, but rather that 
>> according to the (former?) maintainer, there are no users left:
>> 
>>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg605024.html
>> 
>> So it got marked as deprecated in this commit here:
>> 
>>  https://git.qemu.org/?p=qemu.git;a=commitdiff;h=d84980051229fa43c96b3
>> 
>> Without maintainer and without users, there is no point in keeping 
>> this target, is there?
> 
> I'm not sure how you determine whether there are people using the code
> or not. There
> is no really user tracking in QEMU, is there?

That is correct, one cannot know if there are actually users of the
milkymist board or the lattice eval board. These are the two only
supported boards. The (or I should better say "my") main purpose to
add a qemu target for milkymist was to help the developers of the
board, e.g. to ease debugging, etc. But development has stopped
long time ago [1]. I've never seen a request to add a new board.

> And the maintainer's claim that RISC-V takes over makes no sense
> either.

I've meant the ecosystem around the SoC. LM32 on linux never took of,
mostly because there is no MMU (we've worked on one though). There is
no official lm32 support in linux and g++ support is broken (or never
even worked). While for RISC-V there is huge userbase building all sorts
of tooling.

There is a project called LiteX [2], some sort of toolbox to build your
own SoC, which supports the LM32 as a CPU component. But I've never seen
anyone trying to add a board to qemu.

> The point of
> emulators is to be able to run old and existing software. If a target 
> had only a
> justification to exist while it's commercially viable, you would have
> to remove 90% of the targets in QEMU.
> I mean, the whole point of an emulator is being able to run existing
> code on modern hardware,
> usually because the old hardware is no longer available. And as long
> as the target is
> functional, I don't see a point in taking away the functionality.

I'm not arguing against this. In fact, I'd also like to keep the lm32
qemu target, but I personally don't have any time for that anymore. And
I don't know if its fair to put the burdon of unmaintained boards to all
the qemu developers. There are a lot of test cases for the LM32
target, but these only cover the CPU instructions. The last time I've
looked audio was broken. So without anyone caring about the target, it
won't also be much help for the user either.

-michael

[1] 
https://github.com/m-labs/milkymist/commit/7d944d3dcffb5e528a44937b10123ff65a0aecbc
[2] https://github.com/enjoy-digital/litex

