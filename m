Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55735675BB8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 18:38:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIvKh-0005Id-Hw; Fri, 20 Jan 2023 12:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pIvKc-0005IJ-Eu
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:37:39 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pIvKZ-0000GF-Jf
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:37:37 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 5ED9A60C31;
 Fri, 20 Jan 2023 20:37:22 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8021::1:5] (unknown
 [2a02:6b8:b081:8021::1:5])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 IbrdxY0WkuQ1-hnLp8kDa; Fri, 20 Jan 2023 20:37:21 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674236241; bh=dOvVtdaeeyK1LOgfmtNybXEUy0fvlZGEyCmvWzvz/Xs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=svkphipgPeb4TGf0NAbOOLCWawQkVEvi/uExOxRwiekQ2cw954KHxZevQEVDBasdx
 OwZ/9psWnsAY1kaW9QP7vgFXtLJNEpGCbfj2ugLzjYN8VkrdXIuJGdKKUO7Zepl9cZ
 0WK3Vka1NfZSnOXxnADNaZNv2r1IZw70npqwlGGY=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
Date: Fri, 20 Jan 2023 19:37:18 +0200
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
 <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
 <20230120085534-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230120085534-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 20/01/2023 15:58, Michael S. Tsirkin wrote:
> On Thu, Jan 19, 2023 at 03:45:06PM +0200, Anton Kuchin wrote:
>> On 19/01/2023 14:51, Michael S. Tsirkin wrote:
>>> On Sun, Jan 15, 2023 at 07:09:03PM +0200, Anton Kuchin wrote:
>>>> Now any vhost-user-fs device makes VM unmigratable, that also prevents
>>>> qemu update without stopping the VM. In most cases that makes sense
>>>> because qemu has no way to transfer FUSE session state.
>>>>
>>>> But we can give an option to orchestrator to override this if it can
>>>> guarantee that state will be preserved (e.g. it uses migration to
>>>> update qemu and dst will run on the same host as src and use the same
>>>> socket endpoints).
>>>>
>>>> This patch keeps default behavior that prevents migration with such devices
>>>> but adds migration capability 'vhost-user-fs' to explicitly allow migration.
>>>>
>>>> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
>>>> ---
>>>>    hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
>>>>    qapi/migration.json       |  7 ++++++-
>>>>    2 files changed, 30 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>>>> index f5049735ac..13d920423e 100644
>>>> --- a/hw/virtio/vhost-user-fs.c
>>>> +++ b/hw/virtio/vhost-user-fs.c
>>>> @@ -24,6 +24,7 @@
>>>>    #include "hw/virtio/vhost-user-fs.h"
>>>>    #include "monitor/monitor.h"
>>>>    #include "sysemu/sysemu.h"
>>>> +#include "migration/migration.h"
>>>>    static const int user_feature_bits[] = {
>>>>        VIRTIO_F_VERSION_1,
>>>> @@ -298,9 +299,31 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
>>>>        return &fs->vhost_dev;
>>>>    }
>>>> +static int vhost_user_fs_pre_save(void *opaque)
>>>> +{
>>>> +    MigrationState *s = migrate_get_current();
>>>> +
>>>> +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
>>>> +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
>>>> +                     "state of backend to be preserved. If orchestrator can "
>>>> +                     "guarantee this (e.g. dst connects to the same backend "
>>>> +                     "instance or backend state is migrated) set 'vhost-user-fs' "
>>>> +                     "migration capability to true to enable migration.");
>>> Isn't it possible that some backends are same and some are not?
>>> Shouldn't this be a device property then?
>> If some are not the same it is not guaranteed that correct FUSE
>> state is present there, so orchestrator shouldn't set the capability
>> because this can result in destination devices being broken (they'll
>> be fine after the remount in guest, but this is guest visible and is
>> not acceptable).
>>
>> I can imagine smart orchestrator and backend that can transfer
>> internal FUSE state, but we are not there yet, and this would be
>> their responsibility then to ensure endpoint compatibility between src
>> and dst and set the capability (that's why I put "e.g." and "or" in
>> the error description).
> So instead of relying on the orchestrator how about making it a device
> property?

We have to rely on the orchestrator here and I can't see how a property
can help us with this: same device can be migratable or not depending
on if the destination is the same host, what features backend supports,
how management software works and other factors of environment that
are not accessible from qemu or backend daemon.
So in the end we'll end up with orchestrator having to setup flags for
each device before each migration based on information only it can
have - in my opinion this is worse than just giving the orchestrator
a single flag that it can set after calculating the decision for
the particular migration that it organizes.

>
>
>>>
>>>
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static const VMStateDescription vuf_vmstate = {
>>>>        .name = "vhost-user-fs",
>>>> -    .unmigratable = 1,
>>>> +    .minimum_version_id = 0,
>>>> +    .version_id = 0,
>>>> +    .fields = (VMStateField[]) {
>>>> +        VMSTATE_VIRTIO_DEVICE,
>>>> +        VMSTATE_END_OF_LIST()
>>>> +    },
>>>> +   .pre_save = vhost_user_fs_pre_save,
>>>>    };
>>>>    static Property vuf_properties[] = {
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index 88ecf86ac8..9a229ea884 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -477,6 +477,11 @@
>>>>    #                    will be handled faster.  This is a performance feature and
>>>>    #                    should not affect the correctness of postcopy migration.
>>>>    #                    (since 7.1)
>>>> +# @vhost-user-fs: If enabled, the migration process will allow migration of
>>>> +#                 vhost-user-fs devices, this should be enabled only when
>>>> +#                 backend can preserve local FUSE state e.g. for qemu update
>>>> +#                 when dst reconects to the same endpoints after migration.
>>>> +#                 (since 8.0)
>>>>    #
>>>>    # Features:
>>>>    # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>>>> @@ -492,7 +497,7 @@
>>>>               'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>>>>               { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>>>>               'validate-uuid', 'background-snapshot',
>>>> -           'zero-copy-send', 'postcopy-preempt'] }
>>>> +           'zero-copy-send', 'postcopy-preempt', 'vhost-user-fs'] }
>>> I kind of dislike that it's such a specific flag. Is only vhost-user-fs
>>> ever going to be affected? Any way to put it in a way that is more generic?
>> Here I agree with you: I would prefer less narrow naming too. But I
>> didn't manage to come up with one. Looks like many other vhost-user
>> devices could benefit from this so maybe "vhost-user-stateless" or
>> something like this would be better.
>> I'm not sure that other types of devices could handle reconnect to
>> the old endpoint as easy as vhost-user-fs, but anyway the support for
>> this flag needs to be implemented for each device individually.
>> What do you think? Any ideas would be appreciated.
> Let's try to create a better description of when this flag should be
> set. Then shorten it up to create the name.

This flag should be set when qemu don't need to worry about any
external state stored in vhost-user daemons during migration:
don't fail migration, just pack generic virtio device states to
migration stream and orchestrator guarantees that the rest of the
state will be present at the destination to restore full context and
continue running.

>
>>>
>>>>    ##
>>>>    # @MigrationCapabilityStatus:
>>>> -- 
>>>> 2.34.1

