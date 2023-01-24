Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36833678CED
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:39:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK7L0-00009Y-Nc; Mon, 23 Jan 2023 19:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pK7Ky-00008R-0w; Mon, 23 Jan 2023 19:38:56 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pK7Kv-0007Wy-Qh; Mon, 23 Jan 2023 19:38:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E0B6D746346;
 Tue, 24 Jan 2023 01:36:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A20607462DB; Tue, 24 Jan 2023 01:36:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A0786745720;
 Tue, 24 Jan 2023 01:36:27 +0100 (CET)
Date: Tue, 24 Jan 2023 01:36:27 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 4/7] mac_newworld: Add machine types for different
 mac99 configs
In-Reply-To: <3aa7d09c-bf38-9aa2-359d-77cde3250eed@ilande.co.uk>
Message-ID: <ff78efa4-af8f-49ce-0680-c3ef06fbcd5d@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <b8aa89c354027fc71cdb93b697b139e93ac05e25.1672868854.git.balaton@eik.bme.hu>
 <ece23a2e-33a9-d2e2-14fd-097878acfa1f@ilande.co.uk>
 <61305eda-439b-800e-2265-c2c48bc21be9@eik.bme.hu>
 <23f2ba9b-97b3-25f2-2642-667238f79d11@ilande.co.uk>
 <32babb9f-7914-8910-bb99-307c3bc50e8a@eik.bme.hu>
 <3aa7d09c-bf38-9aa2-359d-77cde3250eed@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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

On Mon, 23 Jan 2023, Mark Cave-Ayland wrote:
> On 22/01/2023 21:48, BALATON Zoltan wrote:
>> On Sun, 22 Jan 2023, Mark Cave-Ayland wrote:
>>> On 11/01/2023 00:36, BALATON Zoltan wrote:
>>>> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
>>>>> On 04/01/2023 21:59, BALATON Zoltan wrote:
>>>>> Secondly it's not clear to me why you've chosen names like 
>>>>> "powermac_3_1" instead of "g4agp"? Does powermac_3_1 uniquely identify 
>>>>> the G4 AGP Sawtooth model? For QEMU it is always best to emulate real 
>>>>> machines, and whilst I understand you want to separate out the two 
>>>>> versions of the mac99 machine, having "powermac_X_Y" seems less clear to 
>>>>> me.
>>>> 
>>>> These machine model identifiers are used by Apple to uniquely identify 
>>>> (all of) their machines since new-world Macs (even modern iPads and Macs 
>>>> have them) so for Mac people this should be clearer than the informal 
>>>> names that could get a bit long and confusing as there may be slight 
>>>> differences within a family. In any case, qemu-system-ppc -M mac99 is not 
>>>> corresponding to any real Mac so I'd like the options which do emulate 
>>>> real Macs to be called in a name that show which Mac is that. For the PPC 
>>>> Macs there's some info here for example:
>>>> 
>>>> https://en.wikipedia.org/wiki/Power_Mac_G4
>>>> 
>>>> And everymac.com also has info on all Macs. There were actually more than 
>>>> one G4 PowerMac with AGP but the other one was informally called gigabit 
>>>> ethernet. So the model ID is a shorter and better way to clearly identify 
>>>> which hardware is it (and it's also referenced in the device-tree of 
>>>> these Macs).
>>> 
>>> Are you planning to work on different types of G4 Mac where this could be 
>>> confusing? Even to me "PowerMac 3.1" doesn't really tell me what model of 
>>> Mac is being emulated, whereas "g4agp" (much in the same way as g3beige) 
>>> is much more friendlier to people interested in using QEMU for Mac 
>>> emulation.
>> 
>> This is similar problem as some people like to call Mac OS X versions by 
>> number and some by big cats names. Personally I prefer version numbers 
>> because it's easy to tell which is newer or older that way without 
>> remembering a nomenclature or having to look it up every time. It would be 
>> good if others interested in this also shared their preference because if 
>> it's only us two with different views then it's hard to make a decision. I 
>> still think machine ID is better also because then these machines would be 
>> grouped in the -machine help output like the others but as long as we don't 
>> have other machines that start with a g or other Macs that have some other 
>> name it might work so I could change the naming if that's all needed for 
>> this to get in.
>
> I'd lean towards the g* naming, because not only is it more obvious to less 
> technical Mac users what is being emulated, it matches the existing precedent 
> set by g3beige.

The g3beige is not a good example as model ids were introduced with new 
world Macs and the beige G3 is one of the last old world ones which had a 
numeric ID so we can't give that a name by model ID. All later Macs though 
have a model ID which is a short and clear way to idenfify a model. Found 
a list here:

https://www.macupgrades.co.uk/store/mac_model_id/

and it even carries on for modern Macs:

https://support.apple.com/en-us/HT201634

and it's listed in System Profiler next to the model name:

https://support.apple.com/en-gb/HT201581

so it should be pretty obvious and familiar to Mac users. So I think 
anything else would be more confusing but I don't care that much as long 
as we can have a separate name for each machine we emulate. I'll take 
whatever names you come up with if that's what it takes for this patch to 
get merged. Please tell me what names you want and I'll change it if 
nobody else votes fot the names I've proposed.

Regards,
BALATON Zoltan

