Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4629673AA7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:46:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVET-0000EK-Do; Thu, 19 Jan 2023 08:45:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pIVEL-0000Bh-2W
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:45:25 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pIVEH-0003vJ-VT
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:45:24 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id BAA405E9CD;
 Thu, 19 Jan 2023 16:45:11 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8021::1:5] (unknown
 [2a02:6b8:b081:8021::1:5])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6jmJvF0WlmI1-1hhjBOQ9; Thu, 19 Jan 2023 16:45:10 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674135910; bh=velUYGUD+tT4dnfKdzOS3WCghZFVJW6KK4bfWPhXgNI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=aJobTjYC7fcVjVHPQkPiNTLuS5YUQ8zHfYGMR/jv8M0UwZG2m+CAchG9VPMF3+za/
 aPjl5CMb/G2igVsjs9AgVLEr7fmwCrTVFecGOnrCRbXuXRtpk8NVFEtvFo53PKWgGu
 ryIBWk9UldzQz2RyOXInBjp6BALKUK8bUQFIfVy4=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
Date: Thu, 19 Jan 2023 15:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Content-Language: en-US, ru-RU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 yc-core@yandex-team.ru
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <20230119074602-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230119074602-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 19/01/2023 14:51, Michael S. Tsirkin wrote:
> On Sun, Jan 15, 2023 at 07:09:03PM +0200, Anton Kuchin wrote:
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
> Isn't it possible that some backends are same and some are not?
> Shouldn't this be a device property then?
If some are not the same it is not guaranteed that correct FUSE
state is present there, so orchestrator shouldn't set the capability
because this can result in destination devices being broken (they'll
be fine after the remount in guest, but this is guest visible and is
not acceptable).

I can imagine smart orchestrator and backend that can transfer
internal FUSE state, but we are not there yet, and this would be
their responsibility then to ensure endpoint compatibility between src
and dst and set the capability (that's why I put "e.g." and "or" in
the error description).

>
>
>
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
>>   
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
>>   #
>>   # Features:
>>   # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>> @@ -492,7 +497,7 @@
>>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>>              { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>>              'validate-uuid', 'background-snapshot',
>> -           'zero-copy-send', 'postcopy-preempt'] }
>> +           'zero-copy-send', 'postcopy-preempt', 'vhost-user-fs'] }
> I kind of dislike that it's such a specific flag. Is only vhost-user-fs
> ever going to be affected? Any way to put it in a way that is more generic?
Here I agree with you: I would prefer less narrow naming too. But I
didn't manage to come up with one. Looks like many other vhost-user
devices could benefit from this so maybe "vhost-user-stateless" or
something like this would be better.
I'm not sure that other types of devices could handle reconnect to
the old endpoint as easy as vhost-user-fs, but anyway the support for
this flag needs to be implemented for each device individually.
What do you think? Any ideas would be appreciated.

>
>
>>   ##
>>   # @MigrationCapabilityStatus:
>> -- 
>> 2.34.1

