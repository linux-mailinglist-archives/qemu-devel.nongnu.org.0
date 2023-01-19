Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4906738E2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:44:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUGk-0002o8-1M; Thu, 19 Jan 2023 07:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pIUGh-0002li-Am
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:43:47 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pIUGe-0000MN-5L
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:43:47 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2D4495FD72;
 Thu, 19 Jan 2023 15:43:30 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8021::1:5] (unknown
 [2a02:6b8:b081:8021::1:5])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 8hlvmN0W5Gk1-JVT7TY6P; Thu, 19 Jan 2023 15:43:29 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674132209; bh=BWNkhAKJXuhAAGlK/K9RdhJ2pRCT04PXtqEb9E3GPWg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=rCYNAHyt2yypDvXqsas4k7ev3edq2CiQ59yX1pO/1txz8kyt6nPKGI5fEhQK9CWJR
 u6Vhk0lemEhuXRr9s1nJIc33snjOaE5fXWJKSnzVhpUpTNrCuRKLoo+qCvs6qoFWa/
 dEwIaJD9uD50rx9QWDM/FBe5otMCGy0d96n/ZXHk=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <0d57cc40-693b-b36c-a135-fdac60dd00ec@yandex-team.ru>
Date: Thu, 19 Jan 2023 14:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 yc-core@yandex-team.ru, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 18/01/2023 17:52, Stefan Hajnoczi wrote:
> On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>> Now any vhost-user-fs device makes VM unmigratable, that also prevents
>> qemu update without stopping the VM. In most cases that makes sense
>> because qemu has no way to transfer FUSE session state.
>>
>> But we can give an option to orchestrator to override this if it can
>> guarantee that state will be preserved (e.g. it uses migration to
>> update qemu and dst will run on the same host as src and use the same
>> socket endpoints).
>>
>> This patch keeps default behavior that prevents migration with such devices
>> but adds migration capability 'vhost-user-fs' to explicitly allow migration.
>>
>> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
>> ---
>>   hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
>>   qapi/migration.json       |  7 ++++++-
>>   2 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>> index f5049735ac..13d920423e 100644
>> --- a/hw/virtio/vhost-user-fs.c
>> +++ b/hw/virtio/vhost-user-fs.c
>> @@ -24,6 +24,7 @@
>>   #include "hw/virtio/vhost-user-fs.h"
>>   #include "monitor/monitor.h"
>>   #include "sysemu/sysemu.h"
>> +#include "migration/migration.h"
>>
>>   static const int user_feature_bits[] = {
>>       VIRTIO_F_VERSION_1,
>> @@ -298,9 +299,31 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
>>       return &fs->vhost_dev;
>>   }
>>
>> +static int vhost_user_fs_pre_save(void *opaque)
>> +{
>> +    MigrationState *s = migrate_get_current();
>> +
>> +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
>> +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
>> +                     "state of backend to be preserved. If orchestrator can "
>> +                     "guarantee this (e.g. dst connects to the same backend "
>> +                     "instance or backend state is migrated) set 'vhost-user-fs' "
>> +                     "migration capability to true to enable migration.");
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static const VMStateDescription vuf_vmstate = {
>>       .name = "vhost-user-fs",
>> -    .unmigratable = 1,
>> +    .minimum_version_id = 0,
>> +    .version_id = 0,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_VIRTIO_DEVICE,
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +   .pre_save = vhost_user_fs_pre_save,
>>   };
> Will it be possible to extend this vmstate when virtiofsd adds support
> for stateful migration without breaking migration compatibility?
>
> If not, then I think a marker field should be added to the vmstate:
> 0 - stateless/reconnect migration (the approach you're adding in this patch)
> 1 - stateful migration (future virtiofsd feature)
>
> When the field is 0 there are no further vmstate fields and we trust
> that the destination vhost-user-fs server already has the necessary
> state.
>
> When the field is 1 there are additional vmstate fields that contain
> the virtiofsd state.
>
> The goal is for QEMU to support 3 migration modes, depending on the
> vhost-user-fs server:
> 1. No migration support.
> 2. Stateless migration.
> 3. Stateful migration.

Sure. These vmstate fields are very generic and mandatory for any
virtio device. If in future more state can be transfer in migration
stream the vmstate can be extended with additional fields. This can
be done with new subsections and/or bumping version_id.

The main purpose of this patch is to allow update VM to newer version
of qemu via local migration without disruption to guest. And future
versions hopefully could pack more state from external environment
to migration stream.


>
>>   static Property vuf_properties[] = {
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 88ecf86ac8..9a229ea884 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -477,6 +477,11 @@
>>   #                    will be handled faster.  This is a performance feature and
>>   #                    should not affect the correctness of postcopy migration.
>>   #                    (since 7.1)
>> +# @vhost-user-fs: If enabled, the migration process will allow migration of
>> +#                 vhost-user-fs devices, this should be enabled only when
>> +#                 backend can preserve local FUSE state e.g. for qemu update
>> +#                 when dst reconects to the same endpoints after migration.
>> +#                 (since 8.0)
> This is global but a guest can have multiple vhost-user-fs devices
> connected to different servers.
AFAIK vhost-user requires unix socket and memory shared from guest so
devices can't be connected to different servers, just to different
endpoints on current host.

>
> I would add a qdev property to the device instead of introducing a
> migration capability. The property would enable "stateless migration".
> When the property is not set, migration would be prohibited.
I did thought about that, but this is really not a property of device,
this is the capability of management software and applies to exactly one
particular migration process that it initiates. It should not persist
across migration or be otherwise stored in device.

The idea here is that orchestrator can ensure destination qemu will
run on the same host, will reconnect to the same unix sockets and only
then sets the flag (because inside qemu we can't know anything about
the destination).
This is somewhat similar to ignore-shared migration capability when
qemu avoids saving and loading guest memory that is stores in shmem
because it will be picked up by destination process right where source
left it.

>>   #
>>   # Features:
>>   # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>> @@ -492,7 +497,7 @@
>>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>>              { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>>              'validate-uuid', 'background-snapshot',
>> -           'zero-copy-send', 'postcopy-preempt'] }
>> +           'zero-copy-send', 'postcopy-preempt', 'vhost-user-fs'] }
>>
>>   ##
>>   # @MigrationCapabilityStatus:
>> --
>> 2.34.1
>>
>>

