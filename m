Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EFE6A7463
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:36:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXSFK-00084Q-5w; Wed, 01 Mar 2023 14:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pXSFH-000841-R1
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:36:11 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pXSFF-0003aA-8X
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:36:11 -0500
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:57a5:0:640:1f49:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 0EEB160076;
 Wed,  1 Mar 2023 22:36:02 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b415::1:1a] (unknown
 [2a02:6b8:b081:b415::1:1a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id vZbfZ60OouQ0-A31ZeBPZ; Wed, 01 Mar 2023 22:36:00 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass
Message-ID: <bc89a1b1-2478-7780-0d74-64aac91beed5@yandex-team.ru>
Date: Wed, 1 Mar 2023 21:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US, ru-RU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
References: <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora> <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <8c3c140a-3c11-ba21-0c53-9cf25928bad0@yandex-team.ru>
 <20230301101212-mutt-send-email-mst@kernel.org>
 <78299aea-4049-991b-fe89-de0d1845bdff@yandex-team.ru>
 <20230301121224-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230301121224-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 01/03/2023 19:17, Michael S. Tsirkin wrote:
> On Wed, Mar 01, 2023 at 06:04:31PM +0200, Anton Kuchin wrote:
>> On 01/03/2023 17:24, Michael S. Tsirkin wrote:
>>> On Wed, Mar 01, 2023 at 05:07:28PM +0200, Anton Kuchin wrote:
>>>> On 28/02/2023 23:24, Michael S. Tsirkin wrote:
>>>>> On Tue, Feb 28, 2023 at 07:59:54PM +0200, Anton Kuchin wrote:
>>>>>> On 28/02/2023 16:57, Michael S. Tsirkin wrote:
>>>>>>> On Tue, Feb 28, 2023 at 04:30:36PM +0200, Anton Kuchin wrote:
>>>>>>>> I really don't understand why and what do you want to check on
>>>>>>>> destination.
>>>>>>> Yes I understand your patch controls source. Let me try to rephrase
>>>>>>> why I think it's better on destination.
>>>>>>> Here's my understanding
>>>>>>> - With vhost-user-fs state lives inside an external daemon.
>>>>>>> A- If after load you connect to the same daemon you can get migration mostly
>>>>>>>       for free.
>>>>>>> B- If you connect to a different daemon then that daemon will need
>>>>>>>       to pass information from original one.
>>>>>>>
>>>>>>> Is this a fair summary?
>>>>>>>
>>>>>>> Current solution is to set flag on the source meaning "I have an
>>>>>>> orchestration tool that will make sure that either A or B is correct".
>>>>>>>
>>>>>>> However both A and B can only be known when destination is known.
>>>>>>> Especially as long as what we are really trying to do is just allow qemu
>>>>>>> restarts, Checking the flag on load will thus achive it in a cleaner
>>>>>>> way, in that orchestration tool can reasonably keep the flag
>>>>>>> clear normally and only set it if restarting qemu locally.
>>>>>>>
>>>>>>>
>>>>>>> By comparison, with your approach orchestration tool will have
>>>>>>> to either always set the flag (risky since then we lose the
>>>>>>> extra check that we coded) or keep it clear and set before migration
>>>>>>> (complex).
>>>>>>>
>>>>>>> I hope I explained what and why I want to check.
>>>>>>>
>>>>>>> I am far from a vhost-user-fs expert so maybe I am wrong but
>>>>>>> I wanted to make sure I got the point across even if other
>>>>>>> disagree.
>>>>>>>
>>>>>> Thank you for the explanation. Now I understand your concerns.
>>>>>>
>>>>>> You are right about this mechanism being a bit risky if orchestrator is
>>>>>> not using it properly or clunky if it is used in a safest possible way.
>>>>>> That's why first attempt of this feature was with migration capability
>>>>>> to let orchestrator choose behavior right at the moment of migration.
>>>>>> But it has its own problems.
>>>>>>
>>>>>> We can't move this check only to destination because one of main goals
>>>>>> was to prevent orchestrators that are unaware of vhost-user-fs specifics
>>>>>> from accidentally migrating such VMs. We can't rely here entirely on
>>>>>> destination to block this because if VM is migrated to file and then
>>>>>> can't be loaded by destination there is no way to fallback and resume
>>>>>> the source so we need to have some kind of blocker on source by default.
>>>>> Interesting.  Why is there no way? Just load it back on source? Isn't
>>>>> this how any other load failure is managed? Because for sure you
>>>>> need to manage these, they will happen.
>>>> Because source can be already terminated
>>> So start it again.
>> What is the difference between restarting the source and restarting
>> the destination to retry migration? If stream is correct it can be
>> loaded by destination if it is broken it won't be accepted at source too.
> No.  First, destination has a different qemu version. Second file
> can be corrupted in transfer. Third transfer can fail. Etc ...
>
>
>
>>>> and if load is not supported by
>>>> orchestrator and backend stream can't be loaded on source too.
>>> How can an orchestrator not support load but support migration?
>> I was talking about orchestrators that rely on old device behavior
>> of blocking migration. They could attempt migration anyway and check if
>> it was blocked that is far from ideal but was OK and safe, and now this
>> becomes dangerous because state can be lost and VM becomes unloadable.
>>
>>>> So we need to
>>>> ensure that only orchestrators that know what they are doing explicitly
>>>> enable
>>>> the feature are allowed to start migration.
>>> that seems par for the course - if you want to use a feature you better
>>> have an idea about how to do it.
>>>
>>> If orchestrator is doing things like migrating to file
>>> then scp that file, then it better be prepared to
>>> restart VM on source because sometimes it will fail
>>> on destination.
>>>
>>> And an orchestrator that is not clever enough to do it, then it
>>> just should not come up with funky ways to do migration.
>>>
>>>
>>>>>> Said that checking on destination would need another flag and the safe
>>>>>> way of using this feature would require managing two flags instead of one
>>>>>> making it even more fragile. So I'd prefer not to make it more complex.
>>>>>>
>>>>>> In my opinion the best way to use this property by orchestrator is to
>>>>>> leave default unmigratable behavior at start and just before migration when
>>>>>> destination is known enumerate all vhost-user-fs devices and set properties
>>>>>> according to their backends capability with QMP like you mentioned. This
>>>>>> gives us single point of making the decision for each device and avoids
>>>>>> guessing future at VM start.
>>>>> this means that you need to remember what the values were and then
>>>>> any failure on destination requires you to go back and set them
>>>>> to original values. With possibility of crashes on the orchestrator
>>>>> you also need to recall the temporary values in some file ...
>>>>> This is huge complexity much worse than two flags.
>>>>>
>>>>> Assuming we need two let's see whether just reload on source is good
>>>>> enough.
>>>> Reload on source can't be guaranteed to work too. And even if we could
>>>> guarantee it to work then we would also need to setup its incoming migration
>>>> type in case outgoing migration fails.
>>> Since it's local you naturally just set it to allow load. It's trivial - just
>>> a command line property no games with QOM and no state.
>> It is not too hard but it adds complexity
>>
>>>> If orchestrator crashes and restarts it can revert flags for all devices
>>> revert to what?
>> To default migration=none, and set correct value before next migration
>> attempt.
>>
>>>> or can rely on next migration code to setup them correctly because they have
>>>> no effect between migrations anyway.
>>> but the whole reason we have this stuff is to protect against
>>> an orchestrator that forgets to do it.
>> No, it is to protect orchestrators that doesn't even know this feature
>> exists.
>>
>>>> Reverting migration that failed on destination is not an easy task too.
>>>> It seems to be much more complicated than refusing to migrate on source.
>>> It is only more complicated because you do not consider that
>>> migration can fail even if QEMU allows it.
>>>
>>> Imagine that you start playing with features through QOM.
>>> Now you start migration, it fails for some reason (e.g. a network
>>> issue), and you are left with a misconfigured feature.
>>>
>>> Your answer is basically that we don't need this protection at all,
>>> we can trust orchestrators to do the right thing.
>>> In that case just drop the blocker and be done with it.
>> Yes, we don't need to protect from orchestrators. But we need to protect
>> unaware orchestrators.
> Right. You just trust orchestrators to do the right thing more than I do :)
> I feel they will blindly set flag and then we are back to square one.
> I feel it's less likely with load because load already has a slightly
> different command line.

I do trust them :)
I have to, otherwise we would need to pack all the properties and
flags of qemu to the migration stream and validate them at
destination or entire migration ends up broken beyond repair if
orchestrators tend to do stupid things and need babysitting.

Virtio-fs is not an easy-to-miss case when implementing its
migration in the orchestrator. It is not the one that usually
works but sometimes breaks because of inflight request in unlucky
state of processing. If destination daemon doesn't have context
from the source mounted directory will fail all IO-requests
and will transfer to broken state immediately at first request
spamming dmesg with errors. Not delayed or probabilistic errors.

>
> In fact, if we wanted to we could fail qemu if the property is set
> but VM is started and not migrated.

I don't know. This still feels like taking away too much responsibility
from the orchestrator and putting additional restrictions just not
to let the management software screw up in a weird way.
And forcing to immediately migrate if migration flag is set is even
more restrictive.

>
>
>
>>>> I believe we should perform sanity checks if we have data but engineering
>>>> additional checks and putting extra restrictions just to prevent
>>>> orchestrator
>>>> from doing wrong things is an overkill.
>>> Exactly. The check on source is such an overkill - your problem
>>> is not on source, source has no issue sending the VM. Your problem is
>>> on destination - it can not get the data from daemon since the daemon
>>> is not local.
>>>
>>>
>>>>>> But allowing setup via command-line is valid too because some backends may
>>>>>> always be capable of external migration independent of hosts and don't need
>>>>>> the manipulations with QMP before migration at all.
>>>>> I am much more worried that the realistic schenario is hard to manage
>>>>> safely than about theoretical state migrating backends that don't exist.
>>>>>
>>>>>

