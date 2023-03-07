Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C0B6AFAD1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 01:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZhDD-0002ja-C6; Tue, 07 Mar 2023 18:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZhD9-0002f6-GP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:59:15 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZhD7-0004mS-JV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ijLDxbd3oBQ/IBgzgS5tr8Gon8/7dW/g7XYoo1Agk8Y=; b=aXoK/NhZ/rUss07GFX8z8jlKPP
 FYmwZyfvvEVUK3L27AG5/79Hy9LIs6m/78DlHig2V0noZpEw6lyANGnGfGpbiUEgED07mvj5rWJ2O
 MnVuJuIqQ1euU0A//Hek5RdHvcTGLoM5IBt7wEIN4RpMrd1Il+f9m+uSCUH0nBQ5nL7V6kZotdTxP
 mXfdqNGhtuqQgv84ekcaZTvfzy+ozivhSB4m0afGTXeClew1VALizfQTqIXMXiv/bDitUR2AY0mk+
 X1NEDP7lln70Rmk2WJYlh670apNbo4ihA4HBj7FTGfKi23YT6EU7yePFeS9x7B+o7LUZanfeMak9Y
 ABWfQ0EV1oEEqeX3TbuGlqGUFRMYjKyhHlw1WUdvZ1DzD3viW2rWeWCPG1oeyAb16K0bAHRHDJ/8u
 7qxtcXec9gjSYfIvfiS7cZGg4szf53bAHikZo0rV822N6iqB6xRh7q/voTDG17tboCBgv1uRtDimi
 4jKKxCmd+oLylR1PhqZgIBdWpBkSVgJ6njmH/+bUJe1ZNehCTrO17DQiDjvRUac9H8e8fXpOFTLmm
 TFdjpbhZzUtIvj1uMXtr7kUoFBEm3mqKs1OmJgN7hgrQgHfDKl7lTuQyOK+JJOhwp/OTAcX5EU2OO
 Hh5zT5qiOxs36QVLKH+t/HAiAQMknXPjFiq8LkWhE=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZhCT-000Bvp-Al; Tue, 07 Mar 2023 23:58:33 +0000
Message-ID: <544123d9-b0da-bcfa-d06e-e93fa6ca3580@ilande.co.uk>
Date: Tue, 7 Mar 2023 23:59:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, richard.henderson@linaro.org, anjo@rev.ng
References: <83144281-4b2d-4bd6-b8f3-345e4b795f5a@ilande.co.uk>
 <27d01c39-190a-28a6-b161-b79d3492229c@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <27d01c39-190a-28a6-b161-b79d3492229c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: sh4-linux-user compile failure
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 23:52, Philippe Mathieu-Daudé wrote:

> On 8/3/23 00:46, Mark Cave-Ayland wrote:
>> Hi Richard/Anton,
>>
>> It looks as if a compile failure has crept into sh4-linux-user, most likely related 
>> to the recent TARGET_TB_PCREL/CF_PCREL changes:
> 
> 
>> In file included from ../accel/tcg/tb-hash.h:26,
>>                   from ../accel/tcg/tb-maint.c:28:
>> ../accel/tcg/tb-jmp-cache.h:24:5: error: "TARGET_TB_PCREL" is not defined, 
>> evaluates to 0 [-Werror=undef]
>>     24 | #if TARGET_TB_PCREL
>>        |     ^~~~~~~~~~~~~~~
> 
> Your tree seems desync / out of date:
> 
> $ git grep TARGET_TB_PCREL a2b5f8b8ab
> $

Hmmm I just did a standard "git pull" and rebuild as normal, although this time I did 
a full build for all targets for testing. Maybe there's something old left in the 
build/ directory that's causing a problem? I'll throw everything away and see if that 
fixes it.


ATB,

Mark.

