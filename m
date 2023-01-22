Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B0677157
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 19:08:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJejx-00029Y-2Y; Sun, 22 Jan 2023 13:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJeju-00028e-Tf; Sun, 22 Jan 2023 13:06:46 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJejs-0002g4-Do; Sun, 22 Jan 2023 13:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MW9GjRnvqs5Vn/82FJI/36i6nshyzj0U/YMWsmcDumY=; b=STHZgACo5V1obCk+vcFq5MvYMo
 buoqPn5dD5ksP8uUQ+eej0Z9hHBmsf8JIl9nkFJk8aF7NThajI7hzu2DCGlr1IwolCg7dFFQEqLeX
 sHC1xvn3fFSTRzi0kBQzMjuCe79c0npJNc3DLN/tz8hZ6ilyyiAnc/wb7jzUWGOL0heS60CitgqLS
 r/JyVaCntbwIqSeZ2Cin5PWBRaWIvb1P1OB2PrfAPfksZVoq+5oOkXKdfQKUZJY8Binhs50gZHlwJ
 ALaV7kfENSQSxsZ0cVDKfOulpoNyndf9CTW94FJUflSsvu0BVOz6N5ghfmo7MjqQnAJJAUuoAWmmm
 bmrQEC2IEFHf3S5+saK3bxpcq5SyqQD7mbB4LHFBcWulVTNwLvEwixS2CMWGS0alqj4rGf6HG8Z9w
 86vLv1SNcsRkacW02rIJA3IFOoGIqxB5xJvkD7kqjTTwDV90lKveBc4Hl2GUNGFdQW/jT0s+/jUQQ
 oQTTjeUGCa+au2npbQYY4AnrtgnWgAitTIsdeW99zi5aMkIwAchrXVFbWhz5Yum/R4GZbyeq5cmU0
 82TyVdBSskZBfQcpA5uOyHnFWQiEwEC07JPNHJMGfu1TgtrLSVL5gdvkCEaYn4VAaQt45NiB8I7rZ
 YlLrUCf+YZdgtNX1mtfhAEk/wP75+R6zGkIXdbvRo=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJejM-00068t-QV; Sun, 22 Jan 2023 18:06:16 +0000
Message-ID: <ab9e33e5-70fc-0a76-c548-16ec787ea1af@ilande.co.uk>
Date: Sun, 22 Jan 2023 18:06:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Howard Spoelstra <hsp.cat7@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/01/2023 23:51, BALATON Zoltan wrote:

> On Thu, 12 Jan 2023, Howard Spoelstra wrote:
>> On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>>> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
>>>> On 04/01/2023 21:59, BALATON Zoltan wrote:
>>>>
>>>>> Setting emulated machine type with a property called "via" is
>>>>> confusing users so deprecate the "via" option in favour of newly added
>>>>> explicit machine types. The default via=cuda option is not a valid
>>>>> config (no real Mac has this combination of hardware) so no machine
>>>>> type could be defined for that therefore it is kept for backwards
>>>>> compatibility with older QEMU versions for now but other options
>>>>> resembling real machines are deprecated.
>>>>>
>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>
>>>> I believe that people do use -M mac99,via=cuda to run some rare versions
>>> of
>>>> MacOS in QEMU (I think possibly OS X DP and Workgroup Server?), so we
>>> would
>>>> want to keep this option somewhere.
>>>
>>> The idea is that after previous patches we now have machine types for all
>>> other via option values (that also match real Mac machines) other than
>>> via=cude but that is the default for mac99 so after the reprecation period
>>> when the via option is removed mac99 (which is the same as mac99,via=cuda)
>>> can remain for this use case (and for backward compatibility) until the
>>> other machines are fixed to not need this any more. So all via options are
>>> still available but as different machine types.
>>>
>> My 2 cents about naming:
>> It seems less important how the machines are named when their name is not
>> covering their definition. F.i. the powermac3,1 never had adb, could not be
>> equipped with a G3 cpu, did not run at 900Mhz. The closest possible
>> qemu-options based definition of a powermac3,1 (via=pmu) will not run Mac
>> OS 9.0.4 ;-) due to the 2 USB devices problem. To run that via=cuda is
>> already needed.
> 
> What does that mean? Should we aim to emulate real Macs or are we happy with the 
> Franken-Mac we have now? The names also show what we intend to emulate even though 
> the emulation may not be complete or have bugs (this is also true for other machines 
> in QEMU where a lot of them are not fully emulated, only well enough to boot guest 
> OSes).
> 
> Looks like everybody has forgotten the previous discussion and not read the docs and 
> deprecation patches where this is explained so I summarise the proposed change here 
> again:
> 
> - qemu-system-ppc -M mac99 is unchanged and works like before it just warns for the 
> via option and when using it in qemu-system-ppc64 suggesting using new machines 
> instead so these could evetually be removed next year. mac99,via=cuda is just mac99 
> so you can continue to use that, mac99 is not deprecated and don't want to remove it.
> 
> - qemu-system-ppc64 -M mac99 -> powermac7_3
> 
> - qemu-system-ppc -M mac99,via=pmu -> powermac3,1
> 
> - qemu-system-ppc64 -M mac99,via=pmu-adb -> powerbook3_2
> 
> The last one is one of the rare Macs that had adb and pmu, all others with pmu 
> usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not with mac99 hardware but 
> more similar to g3beige and no ADB ports according to 
> https://en.wikipedia.org/wiki/Power_Mac_G4#1st_generation:_Graphite
> https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)#Hardware
> 
> The PowerMac7,3 seems to be matching the PCI device listing in the comment at the 
> beginning of mac_newworld.c and also this article:
> https://www.informit.com/articles/article.aspx?p=606582
> 
> What is the 2 USB devices problem? Is it the one we've debugged before and found that 
> it's noted in a comment marked with ??? in hw/usb/hcd-ohci.c? That could be fixed if 
> there was somebody interested enough to provide a patch.
> 
> But this series does not remove the mac99 and does not even deprecate it. What it 
> deprecates are the via option to select different machine types and the automatic 
> detection of ppc64 to emulate something different which are hard to understand for 
> users and caused several misunderstandings. It's much more clear to have a separate 
> machine type for each machine we emulate even when they aren't yet complete but at 
> least we know which way to go and can compare to real hardware and fix the missing 
> parts later. Also introducing powermac7_3 to split the ppc64 mac99 would allow to 
> remove qemu-system-ppc if we wanted and only have one executable for all machines but 
> even without this it's clearer to have separate machnies for G5 and G4 macs than 
> mac99 silently behaving differently.

Ultimately the issue you are trying to solve is this, which is that -M mac99 is 
different for qemu-system-ppc and qemu-system-ppc64. Perhaps the best way to start is 
to create a new "g5niagara" machine type (including OpenBIOS) and make it a clone of 
mac_newworld.c, and then issue a warning on qemu-system-ppc64 for -M mac99.

The reason for suggesting this is that the number of users of qemu-system-ppc64 -M 
mac99 will be much smaller than those using qemu-system-ppc, which means there will 
be a lot less breakage for users. In the meantime we don't need to make a final 
decision re: machine names, yet it still gives you the freedom to work on -M mac99 
for 32-bit Macs and move it closer towards the G4 AGP model.


ATB,

Mark.

