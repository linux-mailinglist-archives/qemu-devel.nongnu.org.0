Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EE769A229
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:16:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnTJ-0004ed-10; Thu, 16 Feb 2023 18:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pSnTD-0004eO-QE
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:15:20 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pSnTA-0002MF-Ti
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:15:19 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 8186F606F1;
 Fri, 17 Feb 2023 02:15:02 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7313::1:33] (unknown
 [2a02:6b8:b081:7313::1:33])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 vEvgRA0R2qM1-DsglR9oN; Fri, 17 Feb 2023 02:15:01 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676589301; bh=ZV8biU70g1NbEr/BSKodwfmfX8Bxfo90JFBqfI9t96U=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=b3Yg+L/HdS/8i8XWQFmYp/bIoXPYVuVRx5OBqGO+IHZu/G0t+0O6MLrNLBxdLVQS0
 72/2pM05Eg2rLFHB2FnAGNPStUNevQBfRLqy0ynYobCURuhOcJSXE/93BVmtJsmoVO
 HIkXR8R3+ghLQia24dhbUzdUGdKymuQ3RcCobYLo=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <16c3a6e3-fd48-a32d-9777-738928b4c75a@yandex-team.ru>
Date: Fri, 17 Feb 2023 01:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/1] vhost-user-fs: add property to allow migration
Content-Language: en-US, ru-RU
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, yc-core@yandex-team.ru, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230216140003.1103681-1-antonkuchin@yandex-team.ru>
 <20230216140003.1103681-2-antonkuchin@yandex-team.ru>
 <Y+6bbqsZZ4OPo63M@fedora>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <Y+6bbqsZZ4OPo63M@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 16/02/2023 23:09, Stefan Hajnoczi wrote:
> On Thu, Feb 16, 2023 at 04:00:03PM +0200, Anton Kuchin wrote:
>> Now any vhost-user-fs device makes VM unmigratable, that also prevents
>> qemu update without stopping the VM. In most cases that makes sense
>> because qemu has no way to transfer FUSE session state.
>>
>> But it is good to have an option for orchestrator to tune this according to
>> backend capabilities and migration configuration.
>>
>> This patch adds device property 'migration' that is 'none' by default
>> to keep old behaviour but can be set to 'external' to explicitly allow
>> migration with minimal virtio device state in migration stream if daemon
>> has some way to sync FUSE state on src and dst without help from qemu.
>>
>> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
>> ---
>>   hw/core/qdev-properties-system.c    | 10 +++++++++
>>   hw/virtio/vhost-user-fs.c           | 34 ++++++++++++++++++++++++++++-
>>   include/hw/qdev-properties-system.h |  1 +
>>   include/hw/virtio/vhost-user-fs.h   |  1 +
>>   qapi/migration.json                 | 16 ++++++++++++++
>>   5 files changed, 61 insertions(+), 1 deletion(-)
> Looks okay to me. Comments below.
>
>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
>> index d42493f630..d9b1aa2a5d 100644
>> --- a/hw/core/qdev-properties-system.c
>> +++ b/hw/core/qdev-properties-system.c
>> @@ -1143,3 +1143,13 @@ const PropertyInfo qdev_prop_uuid = {
>>       .set   = set_uuid,
>>       .set_default_value = set_default_uuid_auto,
>>   };
>> +
>> +const PropertyInfo qdev_prop_vhost_user_migration_type = {
>> +    .name = "VhostUserMigrationType",
>> +    .description = "none/external",
>> +    .enum_table = &VhostUserMigrationType_lookup,
>> +    .get = qdev_propinfo_get_enum,
>> +    .set = qdev_propinfo_set_enum,
>> +    .set_default_value = qdev_propinfo_set_default_value_enum,
>> +    .realized_set_allowed = true,
>> +};
>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>> index 83fc20e49e..e2a5b6cfdf 100644
>> --- a/hw/virtio/vhost-user-fs.c
>> +++ b/hw/virtio/vhost-user-fs.c
>> @@ -24,6 +24,7 @@
>>   #include "hw/virtio/vhost-user-fs.h"
>>   #include "monitor/monitor.h"
>>   #include "sysemu/sysemu.h"
>> +#include "qapi/qapi-types-migration.h"
>>   
>>   static const int user_feature_bits[] = {
>>       VIRTIO_F_VERSION_1,
>> @@ -298,9 +299,36 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
>>       return &fs->vhost_dev;
>>   }
>>   
>> +static int vhost_user_fs_pre_save(void *opaque)
>> +{
>> +    VHostUserFS *fs = (VHostUserFS *)opaque;
>> +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
>> +
>> +    switch (fs->migration_type) {
>> +    case VHOST_USER_MIGRATION_TYPE_NONE:
>> +        error_report("Migration is blocked by device %s", path);
>> +        break;
>> +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
>> +        return 0;
>> +    default:
>> +        error_report("Migration type '%s' is not supported by device %s",
>> +                     VhostUserMigrationType_str(fs->migration_type), path);
>> +        break;
>> +    }
>> +
>> +    return -1;
>> +}
>> +
>>   static const VMStateDescription vuf_vmstate = {
>>       .name = "vhost-user-fs",
>> -    .unmigratable = 1,
>> +    .minimum_version_id = 0,
>> +    .version_id = 0,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_VIRTIO_DEVICE,
>> +        VMSTATE_UINT8(migration_type, VHostUserFS),
> Maybe add a comment since Michael asked what the purpose of this field
> is:
>
>    /* For verifying that source/destination migration= properties match */
>    VMSTATE_UINT8(migration_type, VHostUserFS),
>
> Come to think of it...where is the code that checks the vmstate
> migration_type field matches the destination device's migration=
> property?

It's a good idea to have a comment here, thanks.
This field is not really for verifying that source and destination match.
It just describes what data is packed into the stream.
In fact this property could be different and this breaks nothing:
e.g. when we migrate from version that can export only stateless stream
to one that finally supports internal migration.

Said that I start thinking that we don't need it in the stream at all
because extra data can be detected just by presence of additional
subsection.

>
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +   .pre_save = vhost_user_fs_pre_save,
>>   };
>>   
>>   static Property vuf_properties[] = {
>> @@ -309,6 +337,10 @@ static Property vuf_properties[] = {
>>       DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
>>                          conf.num_request_queues, 1),
>>       DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
>> +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
>> +                         VHOST_USER_MIGRATION_TYPE_NONE,
>> +                         qdev_prop_vhost_user_migration_type,
>> +                         uint8_t),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
>> index 0ac327ae60..1a67591590 100644
>> --- a/include/hw/qdev-properties-system.h
>> +++ b/include/hw/qdev-properties-system.h
>> @@ -22,6 +22,7 @@ extern const PropertyInfo qdev_prop_audiodev;
>>   extern const PropertyInfo qdev_prop_off_auto_pcibar;
>>   extern const PropertyInfo qdev_prop_pcie_link_speed;
>>   extern const PropertyInfo qdev_prop_pcie_link_width;
>> +extern const PropertyInfo qdev_prop_vhost_user_migration_type;
>>   
>>   #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
>>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
>> diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
>> index 94c3aaa84e..3ebce77be5 100644
>> --- a/include/hw/virtio/vhost-user-fs.h
>> +++ b/include/hw/virtio/vhost-user-fs.h
>> @@ -40,6 +40,7 @@ struct VHostUserFS {
>>       VirtQueue **req_vqs;
>>       VirtQueue *hiprio_vq;
>>       int32_t bootindex;
>> +    uint8_t migration_type;
>>   
>>       /*< public >*/
>>   };
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index c84fa10e86..ababd605a2 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -2178,3 +2178,19 @@
>>     'data': { 'job-id': 'str',
>>               'tag': 'str',
>>               'devices': ['str'] } }
>> +
>> +##
>> +# @VhostUserMigrationType:
>> +#
>> +# Type of vhost-user device migration.
>> +#
>> +# @none: Migration is not supported, attempts to migrate with this device
>> +#        will be blocked.
>> +#
>> +# @external: Migration stream contains only virtio device state,
>> +#            deamon state should be transfered externally by orchestrator.
> s/deamon/daemon/
> s/transfered/transferred/

Will fix, thanks

>
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'enum': 'VhostUserMigrationType',
>> +  'data': [ 'none', 'external' ] }
>> -- 
>> 2.37.2
>>

