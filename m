Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF8CB2AE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 02:16:46 +0200 (CEST)
Received: from localhost ([::1]:41422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGBH2-0003e8-IU
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 20:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iGAd0-0004ND-Pm
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 19:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iGAct-0004zD-Ii
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 19:35:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60680)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iGAce-0004ns-2v; Thu, 03 Oct 2019 19:35:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B7CC3018761;
 Thu,  3 Oct 2019 23:34:58 +0000 (UTC)
Received: from [10.18.17.165] (dhcp-17-165.bos.redhat.com [10.18.17.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 465125C1D6;
 Thu,  3 Oct 2019 23:34:57 +0000 (UTC)
Subject: Re: bitmap migration bug with -drive while block mirror runs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Krempa <pkrempa@redhat.com>
References: <315cff78-dcdb-a3ce-2742-da3cc9f0ca97@redhat.com>
 <d897c755-40e7-6392-23e3-c06b1a371f28@virtuozzo.com>
 <4bc910ef-0bec-cfd6-89f6-a93d35367218@redhat.com>
 <9431d242-bfe1-b9db-17d0-6c1a280a05da@virtuozzo.com>
 <e112c85a-684f-5721-2da7-d23312c9e487@redhat.com>
 <20191002104600.GC6129@angien.pipo.sk>
 <73dcfdd5-ede2-250e-4680-7c1408c5a3c3@redhat.com>
 <7b0ea320-4c77-2b0f-7f12-615aa0a6d8cd@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <53da72e0-d265-8d0f-e47c-8338c43081e3@redhat.com>
Date: Thu, 3 Oct 2019 19:34:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <7b0ea320-4c77-2b0f-7f12-615aa0a6d8cd@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 03 Oct 2019 23:34:58 +0000 (UTC)
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/3/19 6:14 AM, Vladimir Sementsov-Ogievskiy wrote:
> 03.10.2019 0:35, John Snow wrote:
>> On 10/2/19 6:46 AM, Peter Krempa wrote:
>>
>> [ * poof * ]
>>
>>>
>>> I'd like to re-iterate that the necessity to keep node names same on
>>> both sides of migration is unexpected, undocumented and in some cases
>>> impossible.
>>>
>>> If you want to mandate that they must be kept the same please document
>>> it and also note the following:
>>>
>>> - during migrations the storage layout may change e.g. a backing chain
>>>    may become flattened, thus keeping node names stable beyond the top
>>>    layer is impossible
>>>
>>
>> The struct and layout of the graph is entirely unrelated to the
>> requirement that a bitmap attached to a node with a name on the source
>> needs to have a node with the same name on the destination. It's an
>> addressability requirement only.
>>
>> Change it entirely to a new drive if you want, move it up or down the
>> graph, it doesn't matter.
>>
>> Libvirt is in the best position to understand where bitmaps already are
>> and where it wants them to go.
>>
>>> - in some cases (readonly image in a cdrom not present on destination,
>>>    thus not relevant here probably) it may even become impossible to
>>>    create any node thus keeping the top node may be impossible
>>>
>>
>> It's not mandatory to recreate the graph exactly. Consider what you are
>> saying:
>>
>> - Libvirt adds a bitmap to node "N"
>> - Libvirt asks QEMU for bitmap migration
>> - Libvirt migrates to a QEMU instance that not only does not have a node
>> "N", but has no analogous node at all!
>>
>> I believe this is right to fail as there is no way to fulfill the
>> request as-is.
>>
>> (More below if you feel it's valid to migrate only some bitmaps.)
>>
>>> - it should be documented when and why this happens and how management
>>>    tools are supposed to do it
>>>
>>
>> OK, agreed, and I am sorry that our existing story has been hand-wavey.
>>
>> Let me tell you the exact specifics of the current broken logic so you
>> can understand the requirements as they exist right now.
>>
>> 1. Bitmaps attempt to use their device name to migrate, if available.
>> This covers 99% of use cases where a bitmap was added to a node that was
>> attached directly to a device model.
>>
>> This includes almost all usual cases: bitmaps loaded from qcow2 files,
>> bitmaps added via QMP to a root node, bitmaps added via QMP to a drive name.
>>
>> (It does not include cases where bitmaps are intentionally added to
>> nodes that aren't a device root. Libvirt, I believe, can simply never do
>> this and it will never come up.)
>>
>> 2. If a device name isn't available because this bitmap is not attached
>> to a root OR the BB does not have a name, we migrate using the node name.
>>
>> 3. No attention is paid whatsoever to whether a node name is
>> automatically generated or not. In effect, if the device name lookup
>> fails we currently "trust" that the node name is something meaningful.
>>
>> 4. The bug as I originally perceived of it relates specifically to our
>> failure to resolve the device name after graph manipulations.
>>
>>
>> Under these rules, if we "fixed" #4, node-names wouldn't show up in the
>> stream at all if you never attached a bitmap to a non-root node. This is
>> probably what you expected.
>>
>> Node-names only feature in cases where we can't find a device/drive
>> name, which is:
>> A. When a bitmap is attached to a non-root node specifically. Libvirt
>> can simply never do this!
>> B. When under a graph transformation for drive-mirror; point #4 above.
>>
>>
>> The workaround for this bug if we don't find a good policy:
>>
>> 1. Use blockdev.
>> 2. Give explicit, semantic names to the root nodes that represent the drive.
>> 3. Any name used to add a bitmap must appear on the destination in a
>> migration.
>>
>>
>>> - please let me know what's actually expected, since libvirt
>>>    didn't enable blockdev yet we can fix any unexpected expectations
>>>
>>
>> I have been and will continue to be diligent in CCing you and libvirt list.
>>
>> At the moment I am still leaning towards the idea that libvirt should
>> expect that any bitmaps attached to a node with an explicit node-name
>> will want to use those names to migrate, but that we might be able to
>> limit the cases such that you will be able to avoid the circumstance
>> entirely.
>>
>> However, QEMU's actual implementation is that they are node object. QEMU
>> is ill-equipped to make semantic decisions about what the bitmaps "mean"
>> or "represent"; the name is unfortunately the most explicit identifier
>> we have to convey what bitmap we are talking about.
>>
>> It will be libvirt's job to use node names to help facilitate QEMU's
>> transfer of these objects during migration in a semantically helpful way.
>>
>>> - Document it so that the expectations don't change after this.
>>>
>>
>> OK. I will take charge on this, once we reach a consensus.
>>
>>> - Ideally node names will not be bound to anything and freely
>>>    changeable. If necessary we can provide a map to qemu during migration
>>>    which is probably less painful and more straightforward than keeping
>>>    them in sync somehow ...
>>
>> Why do you want node names to be freely manipulable?
>>
>> The only constraint we've actually added is that a root node (that has a
>> bitmap) attached to a device needs to have a name that is available on
>> the target.
>>
>> (Oh, and, that the virtual size of that target matches the source.)
>>
>>>
>>
>>
>>
>> Phew. In terms of non-direct replies to Peter's questions above, I've
>> written out like a dozen failed replies to this, so I'm still quite
>> confused but need to work on other things today.
>>
>> I currently think that:
>>
>>
>> 1. If a user uses block-dirty-bitmap-add, we have some sense of where
>> they wanted the bitmap to go in the graph because they specified a name.
>> Migration, if left as an automatic (opt-in) process, should try to
>> migrate in-kind:
>>
>> - If the user used a drive name, try to use a drive name to migrate. If
>> there is no drive name and our node name is autogenerated, we cannot
>> migrate this bitmap.
>> - If the user used an explicit, non-generated node name, use the node
>> name. If the user used an implicit node-name, we need to try to resolve
>> the device name again. If that's not possible, the bitmap cannot be
>> migrated.
>>
> 
> Personally, I don't like the idea of separating auto-generated node-names from
> user specified.. But I inderstand that there is a risk of selecting wrong node
> on target because of this..
> 

The way I see it, we know an auto-generated node name will never be
correct, but an explicitly specified one represents an explicit user
configuration.

It's wrong to use generated names for migration details, but it's never
wrong to use explicit configuration.

So I believe they are /already/ distinct in nature. We even already have
code that can tell them apart.

> Also, I'm afraid we can't rely on which name user used when created bitmap, as
> we don't want to store this information into qcow2, when we shutdown vm..
> 

Right, I was thinking about this as I wrote my long email, but believe
that it poses no real problem in the "no explicit mapping" default case.

There are four cases here:

- The bitmap is loaded to a root node with an explicit name
- The bitmap is loaded to a non-root node with an explicit name

The blockdev case with persistence. The name represents explicit user
configuration and can be relied upon in the destination.

- The bitmap is loaded to a root node with an implicit name, with a named BB

The -drive case. The named BB represents the explicit user configuration
and can be relied upon.

- The bitmap is loaded to a non-root node with an implicit name.

There is no known explicit user configuration that identifies the node
this bitmap is attached to; it cannot be migrated without an explicit
override mapping.


Why I like this approach:
- We always use explicit user configuration.
- We do not attempt to migrate bitmaps that were not explicitly
positioned by the user without further configuration.

>>
>> This implies that QEMU will try to "guess" where bitmaps go when using
>> -drive/-device, but will rely on explicit configuration when using
>> blockdev. I think the spirit of this idea is correct.
>>
>> (Vladimir: this is indeed different from EITHER of my suggested
>> resolution orders over the last two days.)
>>
>>
>>
>> 2. I like Vladimir's idea of providing a "default" migration approach,
>> but allowing libvirt to override some features of it if necessary.
>>
>> Overrides that I think will be helpful in alleviating any pain in the
>> long term:
>>
>> - Whitelists / Blacklists
>>
>> The ability to provide either a whitelist or a blacklist for bitmaps
>> that we desire to migrate. The default can continue to be: "All bitmaps
>> with a name." This will allow libvirt to drop bitmaps at its discretion
>> if it performs a block graph reconfiguration on migration and the bitmap
>> is no longer semantically relevant or appropriate for whatever reason.
>> This is superior to explicitly deleting bitmaps or dropping nodes in
>> order to have a valid recourse on failed migrations.
>>
>>
>> - The ability to override specific mappings on an as-needed basis. I
>> believe the default resolution mechanism should be one that behaves like
>> I specify above; but if that resolution is untenable for some reason,
>> you can specify a remapping if you really require.
>>
>> I am actually hoping that remapping is actually not necessary, because I
>> think it's sufficient to use node-names to explicitly direct bitmaps to
>> their intended targets.
>>
>> But if we truly do need that power, I'm open to providing an interface
>> to specify it.
>>
>>
>>
>> I hope everyone is as confused as I am, now.
>> --js
>>
> 
> I now feel myself closer to the idea that node-names are a property of running
> Qemu instance, and may change after vm restart or migration. We may add/remove
> drives which are including persistent dirty bitmaps, so node-name is not a
> persistent property of the bitmap. Note, that we store bitmap names in qcow2,
> but we never store node-name.
> 

You're right that node-names aren't an indelible property of the bitmap
itself in the same way that granularity and size are.

However, I do think that node-names are a run-time attribute  of bitmaps
in that bitmaps have an "address" -- their (node, name) pair -- that has
always served as their identifier in the QMP API.

To say that this is an internal detail is misleading, I think. It has
always been the single most visible identifier of bitmaps at runtime.

Does it make sense to think that a bitmap you added with "add
node-name=NodeX bitmap=MyBitmap" would do anything other than associate
with NodeX on the destination?

That's surprising to me.

> Therefore, I think it's OK to drop node-name default matching at all, because:
> 
> 1. We don't need it for backward compatibility, as it never worked, because of
> autogeneration of node-names.

Well, part of it worked. I always tested with explicitly named nodes on
both ends of the migration because I assumed that this was a reasonable
constraint -- I expected it to break if you named them incorrectly.
That's not too different from how migration works already: If you
misconfigure the target, it's going to go poorly.

What I never tested was a configuration that accidentally sent a
generated node-name, which is something that I am adamant we must
prevent. However, on this subject and related to your point below:

> 2. It may lead to occasional migration of the bitmap to wrong node, which may
> lead to some kind of corrupted backup. (it's always safer to drop bitmap than to
> wrongly migrate it)
> 
> So, I'd leave default to migrate bitmaps in root node (may be, though some filters)
> by Blk node name. And don't touch node-names.
> 

... I'm actually OK with this approach for right now, provided that we
ensure the drive-mirror case works again. This is apparently quite
complex and I'm okay with taking the time to make sure we all agree.

However, this might cause a regression for anyone relying on named node
migrations already; we should be careful there.

> ====
> 
> If we implement migration-set-bitmaps-mapping qmp command, I think it should
> override the default, so that blk names are not involved at all. And this map
> should define the whole bitmaps migration picture, without any defaults, like this:
> 
> MigrationMap = [ MigrationEntry, ... ]
> MigrationEntry = { MigrationSource, MigrationTarget }
> MigrationSource = NodeName (means all bitmaps from the node) | {NodeName, BitmapName}
> MigrationTarget = NodeName | Null (means remove the bitmap)
> 
> All named bitmaps must be covered by this definition, otherwise - return error.
> 

I like this grammar. If we wind up wanting or needing this, this is a
good start.

> The definition is extendable, if we decide at some point to allow to change bitmap name
> or to change properties (persistence, enabled) it will be possible.
> 

Sometimes I like the idea of an overlay configuration where you don't
have to specify the entire mapping, but instead just extend a default
behavior with the ability to specify the entire mapping.

Libvirt, of course, would naturally always specify the entire
configuration explicitly.

In my vision:

- QEMU migrates any bitmap it has a "concrete name" for that was
unambiguously provided directly by the user.
- For bitmaps with ambiguous locations (no named BB direct ancestor, no
explicit node-name) we cannot migrate without further config; fail.
- QEMU allows as-needed mappings/overrides on a per-bitmap basis to
change behavior as desired.

Why I like this approach:
- It actually doesn't involve any magic; it's using only explicit user
configuration.
- The defaults are arguably correct for any situation that does not
incur an error during initialization.
- It does not involve any values that were guessed without user input,
so the migration should not be dangerous. If the user gets the node
names wrong on the destination, that is explicitly their fault for
asking for the wrong thing.
- It allows a user to engage a bitmap migration with less scaffolding to
accomplish it. If it is at all possible, I prefer an API that does not
require extremely verbose configuration to operate in normative cases. I
recognize that this is not always possible.

If you are worried that some defaults might "slip through" without
getting overridden, it's always OK to add a "nodefaults" flag so that
libvirt can be solidly assured that is in complete and total control of
every last detail.

(But, if it's simpler to say that manual configuration is always "all or
nothing" for the sake of implementation, that's a good reason not to do
something fancier. I'm just stating my preference in terms of what I
like as a user.)

> ====
> 
> If it's a problem for libvirt to keep same node-names, why should we insist?
> 
> 

Is it really a problem? If libvirt requests migration of bitmaps, those
bitmaps need to go somewhere. Even if it constructs a different graph
for valid reasons, it should still understand which qcow2 nodes
correlate to which other qcow2 nodes and name them accordingly.

I don't see why this is actually a terrible constraint. Even in our
mapping proposal we're still using node-names.


So here's a summary of where I stand right now:

- I want an API in QEMU that doesn't require libvirt.

- I want to accommodate libvirt, but don't understand the requirement
that node-names must be ephemeral.

- I would like to define a set of default behaviors (when bitmap
migration is enabled) that migrates only bitmaps it is confident it can
do so correctly and error out when it cannot.

- I'd like to amend the bitmap device name resolution to accommodate the
drive-mirror case.

- Acknowledging that there might be cases where the defaults just simply
aren't powerful enough, allow a manual configuration that allows us to
select or deselect bitmaps and explicitly set their destination node-name.


Sorry to have typed so many words about this; the path forward was not
necessarily clear and we all live in quite different timezones.

--js

