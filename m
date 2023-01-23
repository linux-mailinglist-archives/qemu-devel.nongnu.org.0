Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B731D6789C7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 22:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK4UJ-00011L-EU; Mon, 23 Jan 2023 16:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK4UH-00010t-Lw; Mon, 23 Jan 2023 16:36:21 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK4UE-00034C-Na; Mon, 23 Jan 2023 16:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qGQfTIasMe/eGDP3lDgRqDcdXOcLSKg/4gfKXmsA+rk=; b=vpDh0FgY+u+9hAPki6hEN4xlfN
 hUqVf5R5xrGdTLWWRZrCOh+SKwhBnfxdTE2qpWgN57jsstnM2GAukpWvZqSSizDUMyfAn4sITZ5Ly
 YzAfgYBaymqxAqJsIO+Y1R2Xuy8k96AYF3hVt1MPWwWKQHWlerq6SCs4f4pv+3mdgW4jZrGwLwOFi
 hzJoFa2xYb3UMEnKnXpebhM3h/2jRoCEnJW5IaFBVEPe1cqbXqy30OVgcDI+8HyVxIuRMA14HsIzs
 Mq+/geBkf40iaA4XgvXyLGPFTHvMWx/qtkanbkmhabYTI2W+Vv7Dbrr+RF9a5Soqg3EY9+YjNI58N
 GtIzjrh1ijFG+x5bUPU52iVhZ5csQkhVr1TXznpFbDHhFQ/ZNqoTg3uv2WpFWRMCRZOVU1JtHtN2f
 5FmUhgjtk5XaUaMEFObMv+Wo9JAdqdGBHY2tGMRceVmVaMz1EZ/DeG6o6iFpUMd/4+KIF/HWl1ILL
 XHhu3GP5UgRloYdkZOgqEuJRMiOw0rPW77Bk2q5/YD5lscaJlbYPaHEUKd3M5Rdhx07Yi7ZagQecb
 xGGIuDLQXGzx1DUAJ/2EDra03n17qIkm4djzPMpI0WG6d9exf2fT2V3C1CRQFHiuJ/NILt2X9nLtj
 Oy2+7l3zmrS3VryQbGvDzvHAX+vWKGiPyxC8+e26A=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK4Ti-0001Bn-6b; Mon, 23 Jan 2023 21:35:50 +0000
Message-ID: <3aa7d09c-bf38-9aa2-359d-77cde3250eed@ilande.co.uk>
Date: Mon, 23 Jan 2023 21:36:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <b8aa89c354027fc71cdb93b697b139e93ac05e25.1672868854.git.balaton@eik.bme.hu>
 <ece23a2e-33a9-d2e2-14fd-097878acfa1f@ilande.co.uk>
 <61305eda-439b-800e-2265-c2c48bc21be9@eik.bme.hu>
 <23f2ba9b-97b3-25f2-2642-667238f79d11@ilande.co.uk>
 <32babb9f-7914-8910-bb99-307c3bc50e8a@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <32babb9f-7914-8910-bb99-307c3bc50e8a@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 4/7] mac_newworld: Add machine types for different
 mac99 configs
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

On 22/01/2023 21:48, BALATON Zoltan wrote:

> On Sun, 22 Jan 2023, Mark Cave-Ayland wrote:
>> On 11/01/2023 00:36, BALATON Zoltan wrote:
>>> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
>>>> On 04/01/2023 21:59, BALATON Zoltan wrote:
>>>>> The mac99 machine emulates different machines depending on machine
>>>>> properties or even if it is run as qemu-system-ppc64 or
>>>>> qemu-system-ppc. This is very confusing for users and many hours were
>>>>> lost trying to explain it or finding out why commands users came up
>>>>> with are not working as expected. (E.g. Windows users might think
>>>>> qemu-system-ppc64 is just the 64 bit version of qemu-system-ppc and
>>>>> then fail to boot a 32 bit OS with -M mac99 trying to follow an
>>>>> example that had qemu-system-ppc.) To avoid such confusion, add
>>>>> explicit machine types for the different configs which will work the
>>>>> same with both qemu-system-ppc and qemu-system-ppc64 and also make the
>>>>> command line clearer for new users.
>>>>>
>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>
>>>> Some thoughts on this: the first is that not everyone agrees that for 
>>>> qemu-system-X that X represents the target. There were previous discussion where 
>>>> some KVM people assumed X represented the host, i.e. ppc64 was the binary that 
>>>> ran all PPC guests but with hardware acceleration for ppc64 guests on ppc64 
>>>> hosts. This was a while ago, so it may be worth starting a thread on qemu-devel 
>>>> to see what the current consensus is.
>>>
>>> I don't see how this is relevant to this series, Also likely not the case any more 
>>> as qemu-system-ppc and qemu-system-ppc64 share most of the code since a while with 
>>> ppc64 including the config of ppc and adding more machines.
>>
>> Well the patch defines the powermac 7.3 machine just for TARGET_PPC64, no? So 
>> you're making the assumption qemu-system-ppc64 represents a 64-bit target rather 
>> than a 64-bit host.
> 
> I'm not making that assumption, it's already there:
> 
> $ qemu-system-ppc -machine help
> Supported machines are:
> 40p                  IBM RS/6000 7020 (40p)
> bamboo               bamboo
> g3beige              Heathrow based PowerMAC (default)
> mac99                Mac99 based PowerMAC
> mpc8544ds            mpc8544ds
> none                 empty machine
> pegasos2             Genesi/bPlan Pegasos II
> ppce500              generic paravirt e500 platform
> ref405ep             ref405ep
> sam460ex             aCube Sam460ex
> virtex-ml507         Xilinx Virtex ML507 reference design
> 
> $ qemu-system-ppc64 -machine help
> Supported machines are:
> 40p                  IBM RS/6000 7020 (40p)
> bamboo               bamboo
> g3beige              Heathrow based PowerMAC
> mac99                Mac99 based PowerMAC
> mpc8544ds            mpc8544ds
> none                 empty machine
> pegasos2             Genesi/bPlan Pegasos II
> powernv10            IBM PowerNV (Non-Virtualized) POWER10
> powernv8             IBM PowerNV (Non-Virtualized) POWER8
> powernv              IBM PowerNV (Non-Virtualized) POWER9 (alias of  powernv9)
> powernv9             IBM PowerNV (Non-Virtualized) POWER9
> ppce500              generic paravirt e500 platform
> pseries-2.1          pSeries Logical Partition (PAPR compliant)
> [lots of different pseries versions omitted here]
> pseries              pSeries Logical Partition (PAPR compliant) (alias of pseries-8.0)
> pseries-8.0          pSeries Logical Partition (PAPR compliant) (default)
> ref405ep             ref405ep
> sam460ex             aCube Sam460ex
> virtex-ml507         Xilinx Virtex ML507 reference design
> 
> It makes no sense to define it for qemu-system-ppc as that version does not have G5 
> and 64 bit CPUs compiled in. Cf. qemu-system-ppc -cpu help and qemu-system-ppc64 -cpu 
> help or target/ppc/cpu-models.c so I don't know what you're talking about.

I did a quick ask around online, and the general consensus was that it references the 
target (see https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg00757.html for 
one of the more recent discussions about this as why this isn't always clear). 
However as you point out the 64-bit CPU isn't available for qemu-system-ppc so you're 
right that won't be an issue here.

>>>> Secondly it's not clear to me why you've chosen names like "powermac_3_1" instead 
>>>> of "g4agp"? Does powermac_3_1 uniquely identify the G4 AGP Sawtooth model? For 
>>>> QEMU it is always best to emulate real machines, and whilst I understand you want 
>>>> to separate out the two versions of the mac99 machine, having "powermac_X_Y" 
>>>> seems less clear to me.
>>>
>>> These machine model identifiers are used by Apple to uniquely identify (all of) 
>>> their machines since new-world Macs (even modern iPads and Macs have them) so for 
>>> Mac people this should be clearer than the informal names that could get a bit 
>>> long and confusing as there may be slight differences within a family. In any 
>>> case, qemu-system-ppc -M mac99 is not corresponding to any real Mac so I'd like 
>>> the options which do emulate real Macs to be called in a name that show which Mac 
>>> is that. For the PPC Macs there's some info here for example:
>>>
>>> https://en.wikipedia.org/wiki/Power_Mac_G4
>>>
>>> And everymac.com also has info on all Macs. There were actually more than one G4 
>>> PowerMac with AGP but the other one was informally called gigabit ethernet. So the 
>>> model ID is a shorter and better way to clearly identify which hardware is it (and 
>>> it's also referenced in the device-tree of these Macs).
>>
>> Are you planning to work on different types of G4 Mac where this could be 
>> confusing? Even to me "PowerMac 3.1" doesn't really tell me what model of Mac is 
>> being emulated, whereas "g4agp" (much in the same way as g3beige) is much more 
>> friendlier to people interested in using QEMU for Mac emulation.
> 
> This is similar problem as some people like to call Mac OS X versions by number and 
> some by big cats names. Personally I prefer version numbers because it's easy to tell 
> which is newer or older that way without remembering a nomenclature or having to look 
> it up every time. It would be good if others interested in this also shared their 
> preference because if it's only us two with different views then it's hard to make a 
> decision. I still think machine ID is better also because then these machines would 
> be grouped in the -machine help output like the others but as long as we don't have 
> other machines that start with a g or other Macs that have some other name it might 
> work so I could change the naming if that's all needed for this to get in.

I'd lean towards the g* naming, because not only is it more obvious to less technical 
Mac users what is being emulated, it matches the existing precedent set by g3beige.

>>>> Finally can you post links to the device trees that you are using for each of the 
>>>> new machine types so that we have a clear reference point for future changes to 
>>>> the QEMU Mac machines? Even better include the links in the comments for each 
>>>> machine so that the information is easily visible for developers.
>>>
>>> I still have those I've posted over the past 8 years when I made changes to 
>>> OpenBIOS to make the device-tree closer to real machine. I've downloaded it back 
>>> then, don't know where to find it now but searching for e.g. "PowerMac3,1" 
>>> "device-tree" should get some results.
>>
>> Nothing shows up for me, I'm afraid (remember that Google searches are unique to 
>> each user). If you want argue for changing the QEMU machines, then we should agree 
>> on the reference device model for future changes.
> 
> Sigh, maybe search your list archives instead of Googls. Also it's "PowerMac3,1" 
> where I've converted the comma to underscre for qemu command line parsing so became 
> powermac3_1 not powermac_3_1. Try searching with quotes to reduce the number of false 
> results.
> 
> - mac99 (via=cuda) does not exist so no real device tree for this needed
> 
> - powermac3_1 (currently mac99,via=pmu) I've sent links years ago e.g.:
> https://mail.coreboot.org/pipermail/openbios/2016-February/009145.html
> but you still keep asking

Right, because old documentation like this is slowly disappearing from the internet. 
We should consider a patch to add those public links into the source files so there 
is a (hopefully) long-term reference to them.

> - powermac7_3 (ppc64 mac99) The expected hardware is listed in a comment in 
> mac_newworld.c also it adds a 970fx CPU and according to 
> https://en.wikipedia.org/wiki/Power_Mac_G5 PowerMac7,3 was the first version with 
> 970fx so I think that was the target for whoever started it back then. These G5 Macs 
> are probably still around so you should be able to ask someone to get a device tree 
> dump, I've only seen Linux hardware listings:
> https://gist.github.com/tomari/3689297 
> https://forum.ubuntu-fr.org/viewtopic.php?id=2026003 (last post)
> 
> -powerbook3_2 (mac99,via=pmi-adb) this is rare as Macs with PMU usually have USB and 
> not ADB; only the first PowerBooks had an ADB trackpad (but no outside ports AFAIK). 
> All other Macs with ADB had CUDA so I'm not even sure we need this option but if we 
> want it then the first PowerBooks are candidates, I've picked the lowest number for 
> 1st gen Titanium PowerBook from here:
> https://en.wikipedia.org/wiki/PowerBook_G4
> and e.g. these links confirm it had ADB:
> https://forums.freebsd.org/threads/12-powerbook-g4-867mhz-xorg-doesnt-work.37815/
> http://macos9lives.com/smforum/index.php/topic,4781.msg41380.html?PHPSESSID=75b23dcb4c042b51c6dddd311cff2341#msg41380 
> 
> 
> It would be tough to come up with a name for the powerbook3_2 though as these were 
> called Early 2001 Titanium PowerBook G4 or code name Mercury but even Mac fanatics 
> probably couldn't tell that was a powerbook if you call it g4mercury so I'm open to 
> votes on naming but hard to be convinced there's anything simpler and more 
> straightforward than using machine id which is usually also listed everywhere for these.

The question really is which OSs use -M mac99,via=cuda and -M mac99,via=pmu-adb, and 
what real machines were intended to boot them. Howard, perhaps you have better 
knowledge of this?


ATB,

Mark.

