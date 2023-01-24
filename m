Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0908C678D65
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 02:27:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK85E-0000UL-Me; Mon, 23 Jan 2023 20:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pK85B-0000Tl-U7; Mon, 23 Jan 2023 20:26:41 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pK858-0006Hd-KA; Mon, 23 Jan 2023 20:26:41 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C82D77470B2;
 Tue, 24 Jan 2023 02:24:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6A533746346; Tue, 24 Jan 2023 02:24:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 684BA746377;
 Tue, 24 Jan 2023 02:24:10 +0100 (CET)
Date: Tue, 24 Jan 2023 02:24:10 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: Howard Spoelstra <hsp.cat7@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
Message-ID: <09a640d2-4a9c-a512-70cf-faff6defd585@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
 <ab9e33e5-70fc-0a76-c548-16ec787ea1af@ilande.co.uk>
 <ed8ee369-c9a8-7853-3b65-7361fefc3c63@eik.bme.hu>
 <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 23 Jan 2023, Mark Cave-Ayland wrote:
> On 22/01/2023 22:07, BALATON Zoltan wrote:
>> On Sun, 22 Jan 2023, Mark Cave-Ayland wrote:
>>> On 12/01/2023 23:51, BALATON Zoltan wrote:
>>>> On Thu, 12 Jan 2023, Howard Spoelstra wrote:
>>>>> On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan <balaton@eik.bme.hu> 
>>>>> wrote:
>>>>>> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
>>>>>>> On 04/01/2023 21:59, BALATON Zoltan wrote:
>>>> - qemu-system-ppc -M mac99 is unchanged and works like before it just 
>>>> warns for the via option and when using it in qemu-system-ppc64 
>>>> suggesting using new machines instead so these could evetually be removed 
>>>> next year. mac99,via=cuda is just mac99 so you can continue to use that, 
>>>> mac99 is not deprecated and don't want to remove it.
>>>> 
>>>> - qemu-system-ppc64 -M mac99 -> powermac7_3
>>>> 
>>>> - qemu-system-ppc -M mac99,via=pmu -> powermac3,1
>>>> 
>>>> - qemu-system-ppc64 -M mac99,via=pmu-adb -> powerbook3_2
>
> FWIW this information would be useful in the cover letter once we decide the 
> way forward. Also as a reviewer, it is hard to keep track of all the changes 
> if the series are constantly changing and with no changelog on the cover 
> letter, which is why it takes me a while to review them.

As a maintainer you could help reducing the size of the series and patches 
under review by queuing the patches that are already reviewed then 
hopefully there are only a few left to discuss. One reason for changing 
the series was to omit patches you've dismissed right away and move the 
ones reviewed or those you were less resistant about to the front so you 
could easily merge them and reduce the size of the remaining series that 
I'll have to roll and respin later. So queueing those you're already OK 
with could help making this clearer.

>>>> The last one is one of the rare Macs that had adb and pmu, all others 
>>>> with pmu usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not with 
>>>> mac99 hardware but more similar to g3beige and no ADB ports according to 
>>>> https://en.wikipedia.org/wiki/Power_Mac_G4#1st_generation:_Graphite
>>>> https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)#Hardware
>>>> 
>>>> The PowerMac7,3 seems to be matching the PCI device listing in the 
>>>> comment at the beginning of mac_newworld.c and also this article:
>>>> https://www.informit.com/articles/article.aspx?p=606582
>>>> 
>>>> What is the 2 USB devices problem? Is it the one we've debugged before 
>>>> and found that it's noted in a comment marked with ??? in 
>>>> hw/usb/hcd-ohci.c? That could be fixed if there was somebody interested 
>>>> enough to provide a patch.
>>>> 
>>>> But this series does not remove the mac99 and does not even deprecate it. 
>>>> What it deprecates are the via option to select different machine types 
>>>> and the automatic detection of ppc64 to emulate something different which 
>>>> are hard to understand for users and caused several misunderstandings. 
>>>> It's much more clear to have a separate machine type for each machine we 
>>>> emulate even when they aren't yet complete but at least we know which way 
>>>> to go and can compare to real hardware and fix the missing parts later. 
>>>> Also introducing powermac7_3 to split the ppc64 mac99 would allow to 
>>>> remove qemu-system-ppc if we wanted and only have one executable for all 
>>>> machines but even without this it's clearer to have separate machnies for 
>>>> G5 and G4 macs than mac99 silently behaving differently.
>>> 
>>> Ultimately the issue you are trying to solve is this, which is that -M 
>>> mac99 is different for qemu-system-ppc and qemu-system-ppc64. Perhaps the 
>>> best way to start is to create a new "g5niagara" machine type (including 
>>> OpenBIOS) and make it a clone of mac_newworld.c, and then issue a warning 
>>> on qemu-system-ppc64 for -M mac99.
>> 
>> I don't get what you mean. Patch 4 introduces a new machine type called 
>> powermac7_3 (or g5niagara if you want) which is a clone of mac99 and then 
>> issues the warning to deprecate qemu-system-ppc64 -M mac99 in patch 5. Did 
>> you actually test these patches at all?
>
> More specifically, what I'm suggesting as well as creating a new machine name 
> is that we clone mac_newworld.c into a separate file for the 64-bit Mac 
> machine, declare it as compiled for PPC64 only, and put the deprecation 
> there. By creating a separate file and separate machine type for OpenBIOS, it 
> gives you the freedom to make changes to mac99 to move it towards a G4 AGP 
> without having to worry about affecting any existing 64-bit users.

This would create a lot of duplicated code and increase the nunber of 
machines to maintain so I don't think this is a good idea at this point. I 
also don't want to change any of these machines now. The mac99.via=pmu is 
sufficiently close to PowerMac3,1 already. All I want is to have separate 
machine names for the machines we emulate. This is to

1. resolve the confusion this causes to usesrs
2. allow deprecating old ways of specifying these so we can eventually get 
rid of those
3. and this will also allow later to split the implementation if we need 
to or add new machines from scratch that will fit in the new naming

So what you propose is not needed now and don't see why you think it would 
be needed just to resolve the names now.

>>> The reason for suggesting this is that the number of users of 
>>> qemu-system-ppc64 -M mac99 will be much smaller than those using 
>>> qemu-system-ppc, which means there will be a lot less breakage for users. 
>>> In
>> 
>> Except those who mean to use ppc mac99 but think that they should use 
>> qemu-system-ppc64 on 64 bit Windows which is probably the highest number of 
>> users currently. I've cc'd you on the last instance of this but can dig up 
>> some more from last year and look at the emaculation.com forum or ask 
>> Howard how many times that happens. So after these patches users can still 
>> use qemu-system-ppc -M mac99 as before without a warning but will get 
>> warned for qemu-system-ppc64 -M mac99 to use powernac7_3 instead.
>
> We're saying the same thing here, no?

I don't know. If we were saying the same why are you not happy with the 
patch? I probably don't get what your concern is. To me it looks like you 
just resist any change without a clear reason and try to come up with 
excuses why not to merge these patches. My point was that this patch 
should not break any command lines for anybody, it will just issue 
warnings for the via option and ppc64 mac99 telling users to use new 
-machine options instead. They can keep using ppc mac99 without a warning 
and it can be either kept as it is for backwards compatibility or 
deprecated later once the other machines are better. If your concern was 
that it might break something for somebody then it's not likely as this 
does not change the machines' implementation just adds explicit names for 
those which are currently only accessible by options and defaults.

Spliting the ppc and ppc64 mac99 as you say would increase the chance of 
it breaking in the future because you'll then need to make every change in 
two places and if you forget it's easier to break. So this patch leaves 
the implementation shared but adds separate names so they can be split as 
at a later point without addecting users but no need to do that change 
now. Just separating the name is enough and it has less chance to break 
anything.

>>> the meantime we don't need to make a final decision re: machine names, yet 
>>> it still gives you the freedom to work on -M mac99 for 32-bit Macs and 
>>> move it closer towards the G4 AGP model.
>> 
>> That's a different issue you're mixing in here. One issue is mac99 
>> emulating different machines with ppc and pcc64, this is solved as above. 
>> Another issue is that ppc mac99 is not a real mac, to get the hardware to 
>> match the device tree OpenBIOS tells the guest it is you have to use 
>> mac99,via=pmu which no user can guess. I want to rename this to simply 
>> powermac3_1 and get rid of the via option eventually and make these 
>> separate machines which is much more clear to the user. The implementation 
>> remains the same, but we're free to change that later once the naming is 
>> resolved. So I think we should decide on naming now and start deprecating 
>> old names (which are ppc64 mac99 and macc99 with via option so we only 
>> leave mac99 as before and all other variants will become -machine options). 
>> What part of this is not clear to you. I feel like despite trying to 
>> explain it for the third time we're still not on the same page.
>
> The default was set to mac99,via=cuda since that was the original 
> implementation and via=pmu broke booting some images (unfortunately I can't 
> remember the detail right now). Ultimately my aim was to fix the remaining 
> bugs and switch the mac99 default to via=pmu, but due to various changes in 
> the past couple of years my available time to work on QEMU is considerably 
> reduced.
>
> What I see you are effectively asking for is a new machine which is currently 
> equivalent to -M mac99,via=pmu that you wish to diverge towards a real G4 AGP 
> machine, right?

No I don't want it to diverge just to be available as a machine option 
instead of a cryptic option that nobody can find out without being told. 
If you now do qemu-system-ppc64 -machine help you'll see:

$ qemu-system-ppc64 -machine help
Supported machines are:
40p                  IBM RS/6000 7020 (40p)
bamboo               bamboo
g3beige              Heathrow based PowerMAC
mac99                Mac99 based PowerMAC
mpc8544ds            mpc8544ds
none                 empty machine
pegasos2             Genesi/bPlan Pegasos II
powernv10            IBM PowerNV (Non-Virtualized) POWER10
powernv8             IBM PowerNV (Non-Virtualized) POWER8
[...]

How do you know how to emulate a G5 Mac and a G4 Mac? You don't without 
reading docs (which nobody does) or asking (which nobody does either). 
Instead they try mac99 and find it does not work and abandon it. After 
this patch you'll get:

$ qemu-system-ppc64 -machine help
Supported machines are:
40p                  IBM RS/6000 7020 (40p)
bamboo               bamboo
g3beige              Heathrow based PowerMAC
mac99                Mac99 based PowerMAC
mpc8544ds            mpc8544ds
none                 empty machine
pegasos2             Genesi/bPlan Pegasos II
powerbook3_2         Apple PowerBook G4 Titanium (Mercury)
powermac3_1          Apple Power Mac G4 AGP (Sawtooth)
powermac7_3          Apple Power Mac G5 (Niagara)
powernv10            IBM PowerNV (Non-Virtualized) POWER10
powernv8             IBM PowerNV (Non-Virtualized) POWER8

and specifying the -machine option will give you the right machine right 
away. I really don't know what is so hard to get about this that I have to 
ecplain it all over again for 3 months now since I've first submitted 
these.

Regards,
BALATON Zoltan

