Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5574E532F87
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:21:53 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYEC-0000ur-E6
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYCc-0008KN-Nf; Tue, 24 May 2022 13:20:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYCa-0005u7-VA; Tue, 24 May 2022 13:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1wsh6fKAWRgaJulWZL8xCU/ms5PKQhxkXyxoe5NQ2BU=; b=KBKEjDMxZyPpqtkOAowzcpGv6/
 TP/mVU9wNA6UtX5BLOW47CRUNCtqdfvHek7AXHYR25LQUFBl84IG1TuJXMPU9YaElTg03a/ijCHFV
 bT3hHplRce/VR9yjcG7i/vUrCsBRDqV28ygS0vaW4c7zSx56N6aaB9yjgCwsgLI4btIemBJQE1fxH
 xqhkr9hIJ2ydtSLHpl4hXiti9qNtJVyISOZdk7uEl55+x7V4196yweOwoPPZACzKY3QgON4iHDrWw
 Qfd1Hp6F9XKafGTO+tf42q4Di5aw3elAXzF/gTmdFOAH/Qyk5+neJUClGcKV4KyiET0FpC4I7Mp/P
 OGZlTqStIPq/K+JYSuM1pOUU1kW3y0S6OE/Llg2cRH3q2BzS0efNmDAm/DpEyIU6kBGYWh029bTLV
 Nvan2Ih4H2CxlPxay89dfxSu47apB/lLAUc/NYzj8DmGl+z2jnX18rd2WiutQLuzfwcijAQ1jDyTC
 TyTtn+avM9PMtEms9z0H5NxETEtwCZI58ONv8nfYGjMQ5ceusgbcwk+Eq3a5umPzwLEx1TY9MIrd0
 hO5hkZPiqaei0gWlORfsXKM49y1NwrPUCTbaGHT2LXMf8J9l8AlzXCAVK8aIYCPAp64TWDS5vsdWY
 aLGHPMsjCIik53vc1sLMYPWis7mqRDrhdYysv1QYk=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYBL-000AWi-Lp; Tue, 24 May 2022 18:18:59 +0100
Message-ID: <bdf51239-7b32-66f7-9d42-46b2cbbb8a6d@ilande.co.uk>
Date: Tue, 24 May 2022 18:19:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-10-mark.cave-ayland@ilande.co.uk>
 <b3c11eaa-7549-1695-6987-c181141c576f@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <b3c11eaa-7549-1695-6987-c181141c576f@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 09/50] ps2: remove duplicate setting of scancode_set in
 ps2_kbd_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/05/2022 23:22, Philippe Mathieu-Daudé via wrote:

> On 22/5/22 20:17, Mark Cave-Ayland wrote:
>> The default value for scancode_set is already set in ps2_reset() so there is no
> 
> ps2_reset -> ps2_reset_keyboard ?

Ah yes, it's just a typo in the commit message where ps2_reset() should be changed to 
ps2_kbd_reset(). I can fix this for v2.

>> need to duplicate this in ps2_kbd_init().
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/ps2.c | 1 -
>>   1 file changed, 1 deletion(-)

ATB,

Mark.

