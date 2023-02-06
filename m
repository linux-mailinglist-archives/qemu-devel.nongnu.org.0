Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184D68C930
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:14:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9kn-0003Oy-3k; Mon, 06 Feb 2023 17:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9kk-0003Ol-Nn
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:14:22 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9kj-00007t-4S
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WrwRorH2PiZFi0QA9bKxOPcAeT57o3a3dy1NxINN6s8=; b=f67r7FHzsY3ToTlyG19J2F7Ips
 NXFTVCv7Nq3yrGyPO2JRPn+u1pg/lp4iThLzpF+/X2xgMWcgWr2sUSp9h58U+kzpqE6ebEzONA9Fn
 XE04AnZXUtfKfGTSIbcOi1nJZ3mwA277jHuFVzdRybO76VAWL20yz/KFdvRbY8ijOcN4RyKY/uGc0
 xH/wLAe6mb6V8tCxfJTo05+R4TVnxQ7VB06KR+MjD7M0I4wG8GvGqpYseZPLDHLUj3rNIYy3F9ZIL
 tOE/3gHkUygwEEufKOOVTM1bjEcOgRPA61hLZZ0b2NOylx76MPDdCwCUkkPrj9oBkf+8nOBBIAv+f
 BoPv/ze3uiFAWE6qvwl5aWJA/GDWlmBRrtb3lvyYFfdsBb6J8c42Kbn3EYv/tLJl432xJopW+CpfZ
 AqtQSQTUiY1KjAYX4pzYhpGiKC5JuZFxUZN1TY8IwZT1od5RMcdCu1k5ecnW3rhQy4hPmly5wGhYr
 tbb6QQMahWDYq42iB0JKNLE3nhsm4kOElw1mwb6wlSY6aKr4+7rZtms+G6wi1DfE68SgFRY9SIOoe
 BF9/YOTo4D1XZGdg5wUyy1eZwM8JlfQPH/fxFizYdPPYJ3vEDbM7mzm77iJYKmRI3LVIEidpONeH7
 v/pLEmuflkAaMWvsw4SAG6a4XhdtoBgKlqfjWqayE=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9kD-0003FY-I7; Mon, 06 Feb 2023 22:13:49 +0000
Message-ID: <17b6324b-1d40-2416-3d50-5b908923d7e9@ilande.co.uk>
Date: Mon, 6 Feb 2023 22:14:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <35205d94-c19a-f41c-899c-89214296075c@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <35205d94-c19a-f41c-899c-89214296075c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: hw/misc/mos6522: What is VIA_TIMER_FREQ value?
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 06/02/2023 16:22, Philippe Mathieu-Daudé wrote:

> Hi Mark & Laurent,
> 
> In commit d811d61fbc6 Mark defined VIA_TIMER_FREQ as 4700000 / 6
> (783333.33) and in commit 6dca62a0000 Laurent defined it as 783360.
> 
> What is the correct value?
> 
> Could we define it once in include/hw/misc/mac_via.h or
> even include/hw/misc/mos6522.h?
> 
> Thanks,
> 
> Phil.

Hi Phil,

The 6522 VIA has a 16-bit counter which is driven by an external clock crystal which 
is set to 783kHz for Macs. Commit 6dca62a0000 is the correct value since that was 
given in the Macintosh hardware documentation, and needs to be accurate since it was 
used for timing in older Macs. The value in commit d811d61fbc6 came from Ben, and it 
may be that this is how it is implemented on real PMU hardware by dividing a 4.7MHz 
clock for compatibility purposes: certainly newer Macs have a much more accurate 
hardware timer that would be used by the OS instead.


ATB,

Mark.

