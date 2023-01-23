Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF7678A52
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 23:08:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK4xY-0007oS-Ur; Mon, 23 Jan 2023 17:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK4xX-0007nC-U7; Mon, 23 Jan 2023 17:06:35 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK4xU-0007uz-Sk; Mon, 23 Jan 2023 17:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TjzB/zJ+4hupJsMLVj5rYNX+b/06ye7oEhXI1Ms5h/4=; b=d1dEkLda5HM02y2R8capYQHgRQ
 Fx8EuXv1YpR7EDUNUYViKquExLolSk1u9VBFt37K0ENl2zdkAB2Cnr1vDeh4ykVdijUE353D5IWFw
 zFioXOkO+a17p5VQ+4wtHS8KaLrELskxwYOFV1UEOOa+Ajy8fdb57fyxa9wysB64QKDC6munAAvZG
 UmosYjD7hRjfbjQMWIBmrU2chf7i60gU1NtdJhVmIwgeB8rU9pMOUF1g8UDJrcjXMiJ0+RLKK9Smf
 UWkowTeLf410XJ5VNhkdEz/ev8A4wnfBgV1lrJ/+PBkukRB0L0a+D+6ZoQIXx6UhlJp6FdLc84abm
 tpfnJG5ZowbZp+9EvakjMLNhb6j40KfbKLv83jMunv+Q7n8pdXfXSc/75Lwg7m0fwJB/1qhRjQtgB
 0b/a/BFANPcW40Gw8mhmX8VLp9s+o2FO1Wu5HEcx7Ug8lAogTozWSvWWga0tvhY7pqfIICQISTSxL
 BdF/qYGQQc/WvDTPYpD4wzqalQYTQ1wrwWjqcaQJT/8yICg2ENCC9GPbs6vXvlG+eQRxb36XV2qiW
 FChChKVpnwpPMIWox3ivDbB8f+dhP3tX2IxJnNMBJ01YoVENR2Jhvm63qQbidDhfzidOI1+tHPCg5
 ETtt9MbORpNGaNhhBVOMyXBWTzb0+9nhirFlluWiU=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK4wz-0001KJ-5Q; Mon, 23 Jan 2023 22:06:05 +0000
Message-ID: <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
Date: Mon, 23 Jan 2023 22:06:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Howard Spoelstra <hsp.cat7@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
 <ab9e33e5-70fc-0a76-c548-16ec787ea1af@ilande.co.uk>
 <ed8ee369-c9a8-7853-3b65-7361fefc3c63@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <ed8ee369-c9a8-7853-3b65-7361fefc3c63@eik.bme.hu>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 22/01/2023 22:07, BALATON Zoltan wrote:

> On Sun, 22 Jan 2023, Mark Cave-Ayland wrote:
>> On 12/01/2023 23:51, BALATON Zoltan wrote:
>>> On Thu, 12 Jan 2023, Howard Spoelstra wrote:
>>>> On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
>>>>>> On 04/01/2023 21:59, BALATON Zoltan wrote:
>>>>>>> Setting emulated machine type with a property called "via" is
>>>>>>> confusing users so deprecate the "via" option in favour of newly added
>>>>>>> explicit machine types. The default via=cuda option is not a valid
>>>>>>> config (no real Mac has this combination of hardware) so no machine
>>>>>>> type could be defined for that therefore it is kept for backwards
>>>>>>> compatibility with older QEMU versions for now but other options
>>>>>>> resembling real machines are deprecated.
>>>>>>>
>>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>
>>>>>> I believe that people do use -M mac99,via=cuda to run some rare versions
>>>>> of
>>>>>> MacOS in QEMU (I think possibly OS X DP and Workgroup Server?), so we
>>>>> would
>>>>>> want to keep this option somewhere.
>>>>>
>>>>> The idea is that after previous patches we now have machine types for all
>>>>> other via option values (that also match real Mac machines) other than
>>>>> via=cude but that is the default for mac99 so after the reprecation period
>>>>> when the via option is removed mac99 (which is the same as mac99,via=cuda)
>>>>> can remain for this use case (and for backward compatibility) until the
>>>>> other machines are fixed to not need this any more. So all via options are
>>>>> still available but as different machine types.
>>>>>
>>>> My 2 cents about naming:
>>>> It seems less important how the machines are named when their name is not
>>>> covering their definition. F.i. the powermac3,1 never had adb, could not be
>>>> equipped with a G3 cpu, did not run at 900Mhz. The closest possible
>>>> qemu-options based definition of a powermac3,1 (via=pmu) will not run Mac
>>>> OS 9.0.4 ;-) due to the 2 USB devices problem. To run that via=cuda is
>>>> already needed.
>>>
>>> What does that mean? Should we aim to emulate real Macs or are we happy with the 
>>> Franken-Mac we have now? The names also show what we intend to emulate even though 
>>> the emulation may not be complete or have bugs (this is also true for other 
>>> machines in QEMU where a lot of them are not fully emulated, only well enough to 
>>> boot guest OSes).
>>>
>>> Looks like everybody has forgotten the previous discussion and not read the docs 
>>> and deprecation patches where this is explained so I summarise the proposed change 
>>> here again:
>>>
>>> - qemu-system-ppc -M mac99 is unchanged and works like before it just warns for 
>>> the via option and when using it in qemu-system-ppc64 suggesting using new 
>>> machines instead so these could evetually be removed next year. mac99,via=cuda is 
>>> just mac99 so you can continue to use that, mac99 is not deprecated and don't want 
>>> to remove it.
>>>
>>> - qemu-system-ppc64 -M mac99 -> powermac7_3
>>>
>>> - qemu-system-ppc -M mac99,via=pmu -> powermac3,1
>>>
>>> - qemu-system-ppc64 -M mac99,via=pmu-adb -> powerbook3_2

FWIW this information would be useful in the cover letter once we decide the way 
forward. Also as a reviewer, it is hard to keep track of all the changes if the 
series are constantly changing and with no changelog on the cover letter, which is 
why it takes me a while to review them.

>>> The last one is one of the rare Macs that had adb and pmu, all others with pmu 
>>> usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not with mac99 hardware 
>>> but more similar to g3beige and no ADB ports according to 
>>> https://en.wikipedia.org/wiki/Power_Mac_G4#1st_generation:_Graphite
>>> https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)#Hardware
>>>
>>> The PowerMac7,3 seems to be matching the PCI device listing in the comment at the 
>>> beginning of mac_newworld.c and also this article:
>>> https://www.informit.com/articles/article.aspx?p=606582
>>>
>>> What is the 2 USB devices problem? Is it the one we've debugged before and found 
>>> that it's noted in a comment marked with ??? in hw/usb/hcd-ohci.c? That could be 
>>> fixed if there was somebody interested enough to provide a patch.
>>>
>>> But this series does not remove the mac99 and does not even deprecate it. What it 
>>> deprecates are the via option to select different machine types and the automatic 
>>> detection of ppc64 to emulate something different which are hard to understand for 
>>> users and caused several misunderstandings. It's much more clear to have a 
>>> separate machine type for each machine we emulate even when they aren't yet 
>>> complete but at least we know which way to go and can compare to real hardware and 
>>> fix the missing parts later. Also introducing powermac7_3 to split the ppc64 mac99 
>>> would allow to remove qemu-system-ppc if we wanted and only have one executable 
>>> for all machines but even without this it's clearer to have separate machnies for 
>>> G5 and G4 macs than mac99 silently behaving differently.
>>
>> Ultimately the issue you are trying to solve is this, which is that -M mac99 is 
>> different for qemu-system-ppc and qemu-system-ppc64. Perhaps the best way to start 
>> is to create a new "g5niagara" machine type (including OpenBIOS) and make it a 
>> clone of mac_newworld.c, and then issue a warning on qemu-system-ppc64 for -M mac99.
> 
> I don't get what you mean. Patch 4 introduces a new machine type called powermac7_3 
> (or g5niagara if you want) which is a clone of mac99 and then issues the warning to 
> deprecate qemu-system-ppc64 -M mac99 in patch 5. Did you actually test these patches 
> at all?

More specifically, what I'm suggesting as well as creating a new machine name is that 
we clone mac_newworld.c into a separate file for the 64-bit Mac machine, declare it 
as compiled for PPC64 only, and put the deprecation there. By creating a separate 
file and separate machine type for OpenBIOS, it gives you the freedom to make changes 
to mac99 to move it towards a G4 AGP without having to worry about affecting any 
existing 64-bit users.

>> The reason for suggesting this is that the number of users of qemu-system-ppc64 -M 
>> mac99 will be much smaller than those using qemu-system-ppc, which means there will 
>> be a lot less breakage for users. In
> 
> Except those who mean to use ppc mac99 but think that they should use 
> qemu-system-ppc64 on 64 bit Windows which is probably the highest number of users 
> currently. I've cc'd you on the last instance of this but can dig up some more from 
> last year and look at the emaculation.com forum or ask Howard how many times that 
> happens. So after these patches users can still use qemu-system-ppc -M mac99 as 
> before without a warning but will get warned for qemu-system-ppc64 -M mac99 to use 
> powernac7_3 instead.

We're saying the same thing here, no?

>> the meantime we don't need to make a final decision re: machine names, yet it still 
>> gives you the freedom to work on -M mac99 for 32-bit Macs and move it closer 
>> towards the G4 AGP model.
> 
> That's a different issue you're mixing in here. One issue is mac99 emulating 
> different machines with ppc and pcc64, this is solved as above. Another issue is that 
> ppc mac99 is not a real mac, to get the hardware to match the device tree OpenBIOS 
> tells the guest it is you have to use mac99,via=pmu which no user can guess. I want 
> to rename this to simply powermac3_1 and get rid of the via option eventually and 
> make these separate machines which is much more clear to the user. The implementation 
> remains the same, but we're free to change that later once the naming is resolved. So 
> I think we should decide on naming now and start deprecating old names (which are 
> ppc64 mac99 and macc99 with via option so we only leave mac99 as before and all other 
> variants will become -machine options). What part of this is not clear to you. I feel 
> like despite trying to explain it for the third time we're still not on the same page.

The default was set to mac99,via=cuda since that was the original implementation and 
via=pmu broke booting some images (unfortunately I can't remember the detail right 
now). Ultimately my aim was to fix the remaining bugs and switch the mac99 default to 
via=pmu, but due to various changes in the past couple of years my available time to 
work on QEMU is considerably reduced.

What I see you are effectively asking for is a new machine which is currently 
equivalent to -M mac99,via=pmu that you wish to diverge towards a real G4 AGP 
machine, right?


ATB,

Mark.

