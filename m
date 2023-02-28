Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F696A5AD9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:32:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX10S-0001BV-GA; Tue, 28 Feb 2023 09:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pX10N-000198-RQ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:30:59 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pX10L-0005Ki-6J
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:30:59 -0500
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:ae0e:0:640:6e49:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 726B560604;
 Tue, 28 Feb 2023 17:30:41 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1321::1:31] (unknown
 [2a02:6b8:b081:1321::1:31])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id aUVRu80OjqM0-AO7XIuIE; Tue, 28 Feb 2023 17:30:40 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass
Message-ID: <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
Date: Tue, 28 Feb 2023 16:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US, ru-RU
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
References: <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
 <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org> <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230224034258-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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

On 24/02/2023 10:47, Michael S. Tsirkin wrote:
> On Thu, Feb 23, 2023 at 04:24:43PM -0500, Stefan Hajnoczi wrote:
>> On Thu, Feb 23, 2023 at 02:36:33AM -0500, Michael S. Tsirkin wrote:
>>> On Wed, Feb 22, 2023 at 03:21:42PM -0500, Michael S. Tsirkin wrote:
>>>> On Wed, Feb 22, 2023 at 08:25:19PM +0200, Anton Kuchin wrote:
>>>>> On 22/02/2023 19:12, Michael S. Tsirkin wrote:
>>>>>> On Wed, Feb 22, 2023 at 07:05:47PM +0200, Anton Kuchin wrote:
>>>>>>> On 22/02/2023 18:51, Michael S. Tsirkin wrote:
>>>>>>>> On Wed, Feb 22, 2023 at 06:49:10PM +0200, Anton Kuchin wrote:
>>>>>>>>> On 22/02/2023 17:14, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>>>>> On 22.02.23 17:25, Anton Kuchin wrote:
>>>>>>>>>>>>>> +static int vhost_user_fs_pre_save(void *opaque)
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +    VHostUserFS *fs = opaque;
>>>>>>>>>>>>>> +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    switch (fs->migration_type) {
>>>>>>>>>>>>>> +    case VHOST_USER_MIGRATION_TYPE_NONE:
>>>>>>>>>>>>>> +        error_report("Migration is blocked by device %s", path);
>>>>>>>>>>>>>> +        break;
>>>>>>>>>>>>>> +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
>>>>>>>>>>>>>> +        return 0;
>>>>>>>>>>>>>> +    default:
>>>>>>>>>>>>>> +        error_report("Migration type '%s' is not
>>>>>>>>>>>>>> supported by device %s",
>>>>>>>>>>>>>> + VhostUserMigrationType_str(fs->migration_type), path);
>>>>>>>>>>>>>> +        break;
>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    return -1;
>>>>>>>>>>>>>> +}
>>>>>>>>>>>>> Should we also add this as .pre_load, to force user select
>>>>>>>>>>>>> correct migration_type on target too?
>>>>>>>>>>>> In fact, I would claim we only want pre_load.
>>>>>>>>>>>> When qemu is started on destination we know where it's migrated
>>>>>>>>>>>> from so this flag can be set.
>>>>>>>>>>>> When qemu is started on source we generally do not yet know so
>>>>>>>>>>>> we don't know whether it's safe to set this flag.
>>>>>>>>>> But destination is a "source" for next migration, so there shouldn't be
>>>>>>>>>> real difference.
>>>>>>>>>> The new property has ".realized_set_allowed = true", so, as I understand
>>>>>>>>>> it may be changed at any time, so that's not a problem.
>>>>>>>>> Yes, exactly. So destination's property sets not how it will handle this
>>>>>>>>> incoming
>>>>>>>>> migration but the future outgoing one.
>>>>>>>> How do you know where you are going to migrate though?
>>>>>>>> I think you don't.
>>>>>>>> Setting it on source is better since we know where we
>>>>>>>> are migrating from.
>>>>>>> Yes, I don't know where I'm going to migrate to. This is why property
>>>>>>> affects only how source saves state on outgoing migration.
>>>>>> Um. I don't get the logic.
>>>>> For this feature to work we need orchestrator to manage the migration. And
>>>>> we
>>>>> generally assume that it is responsibility of orchestrator to ensure
>>>>> matching
>>>>> properties on source and destination.
>>>>> As orchestrator manages both sides of migration it can set option (and we
>>>>> can
>>>>> check it) on either source or destination. Now it's not important which side
>>>>> we
>>>>> select, because now the option is essentially binary allow/deny (but IMHO it
>>>>> is much better to refuse source to migrate than find later that state can't
>>>>> be
>>>>> loaded by destination, in case of file migration this becomes especially
>>>>> painful).
>>>>>
>>>>> But there are plans to add internal migration option (extract FUSE state
>>>>> from
>>>>> backend and transfer it in QEMU migration stream), and that's where
>>>>> setting/checking
>>>>> on source becomes important because it will rely on this property to decide
>>>>> if
>>>>> extra state form backend needs to be put in the migration stream subsection.
>>>>
>>>> If we do internal migration that will be a different property
>>>> which has to match on source *and* destination.
>>>>
>>>>
>>>>> If you are concerned about orchestrator breaking assumption of matching
>>>>> properties
>>>>> on source and destination this is not really supported AFAIK but I don't
>>>>> think we
>>>>> need to punish it for this, maybe it has its reasons: I can imagine scenario
>>>>> where orchestrator could want to migrate from source with
>>>>> 'migration=external'
>>>>> to destination with 'migration=none' to ensure that destination can't be
>>>>> migrated further.
>>>> No. I am concerned about a simple practical matter:
>>>> - I decide to restart qemu on the same host - so I need to enable
>>>>    migration
>>>> - Later I decide to migrate qemu to another host - this should be
>>>>    blocked
>>>>
>>>>
>>>> Property on source does not satisfy both at the same time.
>>>> Property on destination does.
>>>
>>> Stefan what's your take on this? Should we move this from
>>> save to load hook?
>> This property can be changed on the source at runtime via qom-set, so
>> you don't need to predict the future. The device can be started from an
>> incoming migration with "external" and then set to "stateful" migration
>> to migrate to another host later on.
> And then you are supposed to change it back if migration fails?
> External tool failures have to be handled ...
> How likely is all this fragile dance not to have bugs?
>
> And all of this effort for what? Just to make the case of a buggy
> management tool fail a bit faster - is it really worth it?
>
> Compare to setting it on destination where you can set it
> on command line or through qom and forget about it.
> No?

I really don't understand why and what do you want to check on
destination. This option is supposed to control outgoing migration
only, just to be compatible and extensible for future migration
implementations.
It doesn't affectin any way the ability to load migration stream on
destination.
Destination can decide if the stream can be loaded based only on the
information present in the migration stream and not on the device
properties.

So qemu with this patch can load any stream generated by qemu with
this patch because there is only one supported mode "external" and
I don't see why we shouldn't allow this.

And when "internal" mode is added newer qemu will support loading
both full and partial types of streams depending on what data is
present in the stream (and this is controlled by orchestrator that
is setting option on source side).
Future "internal" option is not planned to deprecate "external"
but they both will be valid and coexist simultaneously allowing
management to pick one or the other.

So having faster fail on source if something is misconfigured is
just a good side-effect we get for free, but not the real purpose.

There can be some benefit in creating all devices with "migration=none"
by default and enabling required type of migration just before it
is about to happen if orchestrator wants to be protected from
wrong migrations. This may be a little too much but if orchestrator
wants it can force such type of double-check and avoid guessing future
migration type when there will be more than one type supported.

>
>> Anton, can you share the virtiofsd patches so we have a full picture of
>> how "external" migration works? I'd like to understand the workflow and
>> also how it can be extended when "stateful" migration is added.
>>
>>>>
>>>>>>
>>>>>>>>>>> This property selects if VM can migrate and if it can what should
>>>>>>>>>>> qemu put
>>>>>>>>>>> to the migration stream. So we select on source what type of
>>>>>>>>>>> migration is
>>>>>>>>>>> allowed for this VM, destination can't check anything at load time.
>>>>>>>>>> OK, so the new field "migration" regulates only outgoing migration and
>>>>>>>>>> do nothing for incoming. On incoming migration the migration stream
>>>>>>>>>> itself defines the type of device migration.
>>>>>>>>>> Worth mentioning in doc?
>>>>>>>>> Good point. I don't think this deserves a respin but if I have to send v4
>>>>>>>>> I'll include
>>>>>>>>> clarification in it.
>

