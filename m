Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5535E69F694
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:26:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUq4P-00011b-A5; Wed, 22 Feb 2023 09:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pUq4J-00011P-AD
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:26:03 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pUq4H-0003jv-6p
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:26:03 -0500
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:57a5:0:640:1f49:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 66F195FDA9;
 Wed, 22 Feb 2023 17:25:54 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1228::1:38] (unknown
 [2a02:6b8:b081:1228::1:38])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id nPPxSA0KguQ0-JULdnauA; Wed, 22 Feb 2023 17:25:52 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass
Message-ID: <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
Date: Wed, 22 Feb 2023 16:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US, ru-RU
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 virtio-fs@redhat.com, Eric Blake <eblake@redhat.com>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
 <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
 <20230222074214-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230222074214-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.102,
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

On 22/02/2023 14:43, Michael S. Tsirkin wrote:
> On Wed, Feb 22, 2023 at 03:20:00PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On 17.02.23 20:00, Anton Kuchin wrote:
>>> Migration of vhost-user-fs device requires transfer of FUSE internal state
>>> from backend. There is no standard way to do it now so by default migration
>>> must be blocked. But if this state can be externally transferred by
>>> orchestrator give it an option to explicitly allow migration.
>>>
>>> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
>>> ---
>>>    hw/core/qdev-properties-system.c    | 10 +++++++++
>>>    hw/virtio/vhost-user-fs.c           | 32 ++++++++++++++++++++++++++++-
>>>    include/hw/qdev-properties-system.h |  1 +
>>>    include/hw/virtio/vhost-user-fs.h   |  2 ++
>>>    qapi/migration.json                 | 16 +++++++++++++++
>>>    5 files changed, 60 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
>>> index d42493f630..d9b1aa2a5d 100644
>>> --- a/hw/core/qdev-properties-system.c
>>> +++ b/hw/core/qdev-properties-system.c
>>> @@ -1143,3 +1143,13 @@ const PropertyInfo qdev_prop_uuid = {
>>>        .set   = set_uuid,
>>>        .set_default_value = set_default_uuid_auto,
>>>    };
>>> +
>>> +const PropertyInfo qdev_prop_vhost_user_migration_type = {
>>> +    .name = "VhostUserMigrationType",
>>> +    .description = "none/external",
>>> +    .enum_table = &VhostUserMigrationType_lookup,
>>> +    .get = qdev_propinfo_get_enum,
>>> +    .set = qdev_propinfo_set_enum,
>>> +    .set_default_value = qdev_propinfo_set_default_value_enum,
>>> +    .realized_set_allowed = true,
>>> +};
>>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>>> index 83fc20e49e..7deb9df5ec 100644
>>> --- a/hw/virtio/vhost-user-fs.c
>>> +++ b/hw/virtio/vhost-user-fs.c
>>> @@ -298,9 +298,35 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
>>>        return &fs->vhost_dev;
>>>    }
>>> +static int vhost_user_fs_pre_save(void *opaque)
>>> +{
>>> +    VHostUserFS *fs = opaque;
>>> +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
>>> +
>>> +    switch (fs->migration_type) {
>>> +    case VHOST_USER_MIGRATION_TYPE_NONE:
>>> +        error_report("Migration is blocked by device %s", path);
>>> +        break;
>>> +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
>>> +        return 0;
>>> +    default:
>>> +        error_report("Migration type '%s' is not supported by device %s",
>>> +                     VhostUserMigrationType_str(fs->migration_type), path);
>>> +        break;
>>> +    }
>>> +
>>> +    return -1;
>>> +}
>> Should we also add this as .pre_load, to force user select correct migration_type on target too?
> In fact, I would claim we only want pre_load.
> When qemu is started on destination we know where it's migrated
> from so this flag can be set.
> When qemu is started on source we generally do not yet know so
> we don't know whether it's safe to set this flag.

This property selects if VM can migrate and if it can what should qemu put
to the migration stream. So we select on source what type of migration is
allowed for this VM, destination can't check anything at load time.

>
>
>>> +
>>>    static const VMStateDescription vuf_vmstate = {
>>>        .name = "vhost-user-fs",
>>> -    .unmigratable = 1,
>>> +    .minimum_version_id = 0,
>>> +    .version_id = 0,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_VIRTIO_DEVICE,
>>> +        VMSTATE_END_OF_LIST()
>>> +    },
>>> +   .pre_save = vhost_user_fs_pre_save,
>>>    };
>>>    static Property vuf_properties[] = {
>>> @@ -309,6 +335,10 @@ static Property vuf_properties[] = {
>>>        DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
>>>                           conf.num_request_queues, 1),
>>>        DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
>>> +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
>>> +                         VHOST_USER_MIGRATION_TYPE_NONE,
>>> +                         qdev_prop_vhost_user_migration_type,
>>> +                         VhostUserMigrationType),
>> 1. I see, other similar qdev_prop_* use DEFINE_PROP_SIGNED
>> 2. All of them except only qdev_prop_fdc_drive_type, define also a convenient macro in include/hw/qdev-properties-system.h
>>
>> should we follow these patterns?
>>
>>
>> -- 
>> Best regards,
>> Vladimir

