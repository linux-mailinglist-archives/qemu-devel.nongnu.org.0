Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4867DC3D63
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 18:59:48 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFLV5-0002k3-0b
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 12:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iFKvi-0004h3-VD
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iFKvf-0000jr-SN
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:23:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57700)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iFKvZ-0000f3-L4; Tue, 01 Oct 2019 12:23:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D398C3084045;
 Tue,  1 Oct 2019 16:23:04 +0000 (UTC)
Received: from [10.10.120.126] (ovpn-120-126.rdu2.redhat.com [10.10.120.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9277B5D9CC;
 Tue,  1 Oct 2019 16:23:03 +0000 (UTC)
Subject: Re: bitmap migration bug with -drive while block mirror runs
To: Kevin Wolf <kwolf@redhat.com>
References: <315cff78-dcdb-a3ce-2742-da3cc9f0ca97@redhat.com>
 <f84745dc-68df-c10a-a91b-a28498e54870@virtuozzo.com>
 <20191001095416.GC4688@linux.fritz.box>
 <c051fd5c-31be-c98b-8155-70fe1b6c1283@redhat.com>
 <20191001155859.GE4688@linux.fritz.box>
From: John Snow <jsnow@redhat.com>
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2114e2a7-8cf7-ce27-6d84-00526fd2ab04@redhat.com>
Date: Tue, 1 Oct 2019 12:23:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191001155859.GE4688@linux.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 01 Oct 2019 16:23:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/1/19 11:58 AM, Kevin Wolf wrote:
> Am 01.10.2019 um 17:09 hat John Snow geschrieben:
>>
>>
>> On 10/1/19 5:54 AM, Kevin Wolf wrote:
>>> Am 01.10.2019 um 10:57 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 01.10.2019 3:09, John Snow wrote:
>>>>> Hi folks, I identified a problem with the migration code that Red Hat QE
>>>>> found and thought you'd like to see it:
>>>>>
>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1652424#c20
>>>>>
>>>>> Very, very briefly: drive-mirror inserts a filter node that changes what
>>>>> bdrv_get_device_or_node_name() returns, which causes a migration problem.
>>>>>
>>>>>
>>>>> Ignorant question #1: Can we multi-parent the filter node and
>>>>> source-node? It looks like at the moment both consider their only parent
>>>>> to be the block-job and don't have a link back to their parents otherwise.
>>>>>
>>>>>
>>>>> Otherwise: I have a lot of cloudy ideas on how to solve this, but
>>>>> ultimately what we want is to be able to find the "addressable" name for
>>>>> the node the bitmap is attached to, which would be the name of the first
>>>>> ancestor node that isn't a filter. (OR, the name of the block-backend
>>>>> above that node.)
>>>>
>>>>
>>>> Better would be to migrate by node-name only.. But am I right that
>>>> node-names are different on source and destination? Or this situation
>>>> changed?
>>>
>>> Traditionally, I think migration assumes that frontends (guest devices)
>>> must match exactly, but backends may and usually will differ.
>>>
>>> Of course, dirty bitmaps are a backend feature that isn't really related
>>> to guest devices, so this doesn't really work out any more in your case.
>>> BlockBackend names are unusable for this purpose (especially as we're
>>> moving towards anonymous BlockBackends everywhere), which I guess
>>> essentially means node-name is the only option left.
>>>
>>
>> The problem as I see it involves API stability.
>>
>> We allow block-dirty-bitmap-add against e.g. "drive1" through the
>> block-backend name (the name of the "drive" as the user sees it.)
>>
>> Of course, once you start mirror, you aren't able to access that bitmap
>> through that namepair anymore -- the "address" of the bitmap has "changed"!
>>
>> (In actual fact, the bitmap always had two addresses; and simply we lost
>> an alias -- but it's the one that the user likely used to create the
>> bitmap, so that's bad.)
> 
> So if I understand correctly, the problem is that without a filter, in
> some setups we get a usable BlockBackend name like "drive1", but when a
> filter is added, we return the node-name instead which is
> auto-generated and will be different on the destination.
> 
> Looking at the ChildRole documentation:
> 
>     /* Returns a name that is supposedly more useful for human users than the
>      * node name for identifying the node in question (in particular, a BB
>      * name), or NULL if the parent can't provide a better name. */
>     const char *(*get_name)(BdrvChild *child);
> 
> I'd argue that a BlockBackend name is more useful for a human user even
> across filter, so I'd support a .get_name implementation for a filter
> child role (which Max wanted to introduce anyway for his filter series).
> 
> Of course, if you have a function that is made to return a convenient
> text for human users, and you use it for a stable ABI like the migration
> stream, this is an idea that would certainly have caused an entertaining
> Linus rant in the good old kernel times.
> 
>>> Is bitmap migration something that must be enabled explicitly or does
>>> it happen automatically? If it's explicit, then making an additional
>>> requirement (matching node-names) shouldn't be a problem.
>>
>> This means that bitmap migration becomes a blockdev-only feature.
> 
> I meant this more as the preferred way for the future rather than the
> only thing supported.
> 

My confusion then is how do you get the node-names to match *without*
using blockdev?

Or maybe I misunderstand.

We can always use explicit node-names whenever available, but if we
don't make blockdev a requirement, we need a fallback to determine an
addressable name.

> But Peter has actually mentioned that for libvirt it will be
> blockdev-only anyway. So do we even have a good reason to invest much
> for the non-blockdev case?
> 
> Maybe making it blockdev-only is actually pretty reasonable.
> 
>> Serious question: do we have plans to formally deprecate things like
>> -drive and mandate a blockdev workflow, or otherwise work to unify the
>> actual graph that gets created between the two methods?
> 
> It's high on my wishlist, though we can't before libvirt uses blockdev.
> 
> Maybe something to talk about at KVM Forum?
> 

Yes, please!

I've not well-understood the trajectory the block graph is taking. I
even wrote a graph visualization so I could understand the problem.

I think I have a better grip on what we have *currently* right now, so
I'd be keen to hear your roadmap for what we want to have and how it
ties into the CLI and QAPI.

>>>>> A simple way to do this might be a "child_unfiltered" BdrvChild role
>>>>> that simply bypasses the filter that was inserted and serves no real
>>>>> purpose other than to allow the child to have a parent link and find who
>>>>> it's """real""" parent is.
>>>>>
>>>>> Because of flushing, reopen, sync, drain &c &c &c I'm not sure how
>>>>> feasible this quick idea might be, though.
>>>>>
>>>>>
>>>>> - Corollary fix #1: call error_setg if the bitmap node name that's about
>>>>> to go over the wire is an autogenerated node: this is never correct!
>>>>>
>>>>> (Why not? because the target is incapable of matching the node-name
>>>>> because they are randomly generated AND you cannot specify node-names
>>>>> with # prefixes as they are especially reserved!
>>>>>
>>>>> (This raises a related problem: if you explicitly add bitmaps to nodes
>>>>> with autogenerated names, you will be unable to migrate them.))
>>>>>
>>>>
>>>> In other words, we need a well defined way to match nodes on source and destination,
>>>> keeping in mind filters, to migrate bitmaps correctly.
>>>>
>>
>> Yes, exactly.
>>
>>>> Hm, did you thought about bitmaps in filters? It's not a problem to create bitmap in
>>>> mirror-top filter during mirror job:)
>>>>
>>>> Or what about bitmaps in Quorum children? Or what about bitmap in qcow2 file child bs?
>>>>
>>>> If node-names are different on source and destination, what is the same? Top blk name
>>>> and bdrv-children names (I recently saw Max's idea to check node "path" in iotest).
>>>
>>> blk_name has to be assumed to be "". The BdrvChild path changes when
>>> filters are inserted (and inserting filters on the destination that
>>> aren't present on the source, or vice versa, sounds like something that
>>> should just work).
>>>
>>> So both parts of this are not great ways for addressing nodes.
>>>
>>>> So, actually node is migration-addressable, if path <blk-name>/root[/child-name] to the
>>>> defines this node directly (we must not have children with same name for some node in
>>>> the path).
>>>>
>>>> And I think it's a correct way to define node in migration stream - by path.
>>>
>>> I'm afraid node-name is the only thing that could possibly work reliably
>>> for identifying nodes.
>>>
>>> Kevin
>>>
>>
>> It sounds like you are saying that bitmaps must become a blockdev-only
>> feature.
> 
> More like we can't rely on BlockBackend names in a blockdev setup.

Agree; so this discussion is now mostly about what the fallback looks like.

> BlockBackend names can work in a purely traditional setup if we make
> some effort to find the block backend even with filters in bettwen, but
> they aren't universal even then. And node-names work in the blockdev
> case, but they aren't universal either.
> 
> But as I said above, you made me wonder whether making it a
> blockdev-only feature wouldn't actually be a good idea.
> 

O:-) It's the most logically consistent, but we should figure out how to
make new CLI sugar that helps make our story consistent. Or get rid of
the CLI sugar, I guess.

(I kind of like sugar, perhaps infamously, but if our view is that QEMU
is a library and API and nothing more, the sugar can go and be replaced
by sugar in binding libraries that provide said sugar.)

>> I'm not sure if I have arrived at that conclusion yet, but it's at least
>> inarguable that with blockdev it's a lot simpler to guarantee correctness.
>>
>> However, we still have -cdrom and -hda and -drive and any number of
>> sugars that I think we aren't committed to getting rid of yet... (or ever?)
> 
> -hda and -cdrom currently have hard-coded BlockBackend names. I don't
> see what would stop us from changing this to hard-coded node names.
> 

Ideally, I'd see something like -hda and -cdrom become strict sugar for
-drive, which becomes strict sugar for -device/-blockdevice.

So that everything is using the same mechanisms and is well-defined.

I guess. Perhaps.

Let's really talk very seriously about this at KVM Forum -- it aligns
with some pet projects I want to investigate; namely simplifying the
QEMU CLI such that we can generate better documentation.

> -drive is something that we probably need to remove in its current form
> and introduce something new that is both user-friendly and powerful.
> Actually, we should probably add the replacement first. :-)
> 

Great! Looking forward to Lyon.

--js

