Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A333A6698B9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:37:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKDb-0004bY-R2; Fri, 13 Jan 2023 08:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pGKDL-0004X2-2T; Fri, 13 Jan 2023 08:35:32 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pGKDI-0003jN-ED; Fri, 13 Jan 2023 08:35:22 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E98AC746361;
 Fri, 13 Jan 2023 14:32:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A548B74634B; Fri, 13 Jan 2023 14:32:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A2F82745712;
 Fri, 13 Jan 2023 14:32:57 +0100 (CET)
Date: Fri, 13 Jan 2023 14:32:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASEoLF=6qMXk_WBeeG3LpuWH9hYkQNNKT25ZMocx=vEAxg@mail.gmail.com>
Message-ID: <d0db1c0f-622e-3c05-eb3e-cac4295fe2c0@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
 <CABLmASEoLF=6qMXk_WBeeG3LpuWH9hYkQNNKT25ZMocx=vEAxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Fri, 13 Jan 2023, Howard Spoelstra wrote:
> On Fri, Jan 13, 2023 at 12:53 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> The names also show what we intend to
>> emulate even though the emulation may not be complete or have bugs (this
>> is also true for other machines in QEMU where a lot of them are not fully
>> emulated, only well enough to boot guest OSes).
>>
>
>> Looks like everybody has forgotten the previous discussion and not read
>> the docs and deprecation patches where this is explained so I summarise
>> the proposed change here again:
>>
> No, I haven't forgotten that discussion. FWIW (as I cannot contribute): I
> personally do not oppose a name change, the new names seem more
> descriptive. I tested your patches and they behave as they should. The
> functionality does not change. However, my simple point was what's in a
> name when the underlying machine does not reflect what the name implies.

In case of powermac3_1 (currently mac99,via=pmu) it does resemble the 
PowerMac3,1 G4 AGP machine. It's also what the device tree says and the 
emulated hardware corresponds to that machine, apart from some missing 
pieces (like I2C) and known bugs in some (like USB) it aims to emulate 
that machine but it's currently hidden in the obscure via option of mac99 
which ny default is some non-existent Mac like machine with cuda. It's 
much easier for users not having inside knowledge of QEMU to get a machine 
type which clearly says what it emulates. If we ever want to run firmware 
ROM from the real machine we also want to make sure we emulate a real 
machine. I've done some steps in that direction before and submitted RFC 
patches that could get to an OF prompt with some debugger tweaking and 
could eventually made to work but it needs Mark's screamer series to get 
finished and some rewrite of the macio emulation to add I2C cleanly so 
it's stalled currently but maybe one day we'll get there.

For powermac7,3 it is what qemu-system-ppc64 -M mac99 currently aims to 
emulate evidenced by the comment at the beginning and that it adds U3 
chipset instead of Uninorth but currently only Linux boots on this 
machine. It may need some more fixes to get other OSes running starting 
with the device tree. I think the way for that is to move device tree 
creation to QEMU similar to what other PPC machines do. I have plans for 
that but it's blocked by not being able to contribute to OpenBIOS as most 
of my patches are disliked by Mark but I'll keep trying.

The powerboot3,2 is one hardware I could find info on having PMU and ADB 
and it's the same era as the PowerMac3,1 so has similar hardware but not 
sure why this combination is even there. What guest needs this that cannot 
run with either mac99 or powermac3,1?

> It is not my place to comment on a possible development agenda. I can only
> tell you what I'd like and point out issues.
>
>> - qemu-system-ppc -M mac99 is unchanged and works like before it just
>> warns for the via option and when using it in qemu-system-ppc64 suggesting
>> using new machines instead so these could evetually be removed next year.
>> mac99,via=cuda is just mac99 so you can continue to use that, mac99 is
>> not deprecated and don't want to remove it.
>>
>> - qemu-system-ppc64 -M mac99 -> powermac7_3
>>
>> - qemu-system-ppc -M mac99,via=pmu -> powermac3,1
>>
>> - qemu-system-ppc64 -M mac99,via=pmu-adb -> powerbook3_2
>>
>> The last one is one of the rare Macs that had adb and pmu, all others with
>> pmu usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not with mac99
>> hardware but more similar to g3beige and no ADB ports according to
>> https://en.wikipedia.org/wiki/Power_Mac_G4#1st_generation:_Graphite
>> https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)#Hardware
>>
>> The PowerMac7,3 seems to be matching the PCI device listing in the comment
>> at the beginning of mac_newworld.c and also this article:
>> https://www.informit.com/articles/article.aspx?p=606582
>>
>> What is the 2 USB devices problem? Is it the one we've debugged before and
>> found that it's noted in a comment marked with ??? in hw/usb/hcd-ohci.c?
>> That could be fixed if there was somebody interested enough to provide a
>> patch.
>>
>
> It is not about passing through USB devices and active packets per
> endpoint. The powermac3,1 has two 2 USB 1.1 ports. However, when booting
> Mac OS 9.0.4 with via=pmu it will support only one (the kbd).  When started
> with via=cuda -usb -device usb-kbd -device usb-mouse it will support the
> first-mentioned usb-kbd. When kbd and mouse arguments are reversed it
> supports the other device ;-)

Is this something that happens on real hardware as well or is it some bug 
in emulation somewhere? If the drivers on this OS keep active packets on 
different endpoints then it's the same issue we've discovered with USB 
pass through of audio devices that also need this feature. If it's 
something else it may be fixable but we need to understand first what 
causes the issue.

Regards,
BALATON Zoltan

