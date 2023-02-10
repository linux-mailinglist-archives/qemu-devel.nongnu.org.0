Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA269208E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:10:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQU6B-0006Xr-4C; Fri, 10 Feb 2023 09:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pQU65-0006XV-V2
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:09:53 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pQU62-0004oj-8W
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:09:53 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 4A764605F8;
 Fri, 10 Feb 2023 17:09:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6526::1:16] (unknown
 [2a02:6b8:b081:6526::1:16])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 N9gRIG0OauQ1-PI9v89lF; Fri, 10 Feb 2023 17:09:42 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676038182; bh=iQUMmiYg8q5EjVNnHY2R0hmR+Ef0hIz0iAkEZmVFabQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Fg0430JRW2joJI0OZRKHbAxs2HhyH6wcjZAZim2FtBF/nKTw4+kwWu2X8PYEi1AUf
 a22dfsfNJat08FZ89oXjal2Iw48yV9E2OCsjqbpaepM+WzI1ckqbJ29QGaecNnFUV2
 vPqImdE3EWNtzo++TFzpVdwX3HZScB5nV2TdTZAs=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <626f6e7c-07e4-4aa7-3cce-b96d9fd96d33@yandex-team.ru>
Date: Fri, 10 Feb 2023 16:09:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Content-Language: en-US, ru-RU
To: quintela@redhat.com
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 yc-core@yandex-team.ru, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
 <0d57cc40-693b-b36c-a135-fdac60dd00ec@yandex-team.ru>
 <CAJSP0QUXB0kgsCSsmi8dpnJFYho2cR_2Liep=pGmp6WzDZ_7pw@mail.gmail.com>
 <d6bf0b9a-a167-817d-2c17-c2e472961155@yandex-team.ru>
 <CAJSP0QXXe6KgLN2PJvi-5GqcELhUKJPB2pUARL2ktO9TQYAq=g@mail.gmail.com>
 <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru>
 <87h6w5ea1m.fsf@secure.mitica>
 <ed9832ec-eaf0-68a4-b7c1-9f1691ab149e@yandex-team.ru>
 <874js4v151.fsf@secure.mitica>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <874js4v151.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 02/02/2023 11:59, Juan Quintela wrote:
> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>> On 01/02/2023 16:26, Juan Quintela wrote:
>>> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>> On 19/01/2023 18:02, Stefan Hajnoczi wrote:
>>>>> On Thu, 19 Jan 2023 at 10:29, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>>> On 19/01/2023 16:30, Stefan Hajnoczi wrote:
>>>>>>> On Thu, 19 Jan 2023 at 07:43, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>>>>> On 18/01/2023 17:52, Stefan Hajnoczi wrote:
>>>>>>>>> On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>> Once told that, I think that you are making your live harder in the
>>> future when you add the other migratable devices.
>>>
>>> I am assuming here that your "underlying device" is:
>>>
>>> enum VhostUserFSType {
>>>       VHOST_USER_NO_MIGRATABLE = 0,
>>>       // The one we are doing here
>>>       VHOST_USER_EXTERNAL_MIGRATABLE,
>>>       // The one you describe for the future
>>>       VHOST_USER_INTERNAL_MIGRATABLE,
>>> };
>>>
>>> struct VHostUserFS {
>>>       /*< private >*/
>>>       VirtIODevice parent;
>>>       VHostUserFSConf conf;
>>>       struct vhost_virtqueue *vhost_vqs;
>>>       struct vhost_dev vhost_dev;
>>>       VhostUserState vhost_user;
>>>       VirtQueue **req_vqs;
>>>       VirtQueue *hiprio_vq;
>>>       int32_t bootindex;
>>>       enum migration_type;
>>>       /*< public >*/
>>> };
>>>
>>>
>>> static int vhost_user_fs_pre_save(void *opaque)
>>> {
>>>       VHostUserFS *s = opaque;
>>>
>>>       if (s->migration_type == VHOST_USER_NO_MIGRATABLE)) {
>>>           error_report("Migration of vhost-user-fs devices requires internal FUSE "
>>>                        "state of backend to be preserved. If orchestrator can "
>>>                        "guarantee this (e.g. dst connects to the same backend "
>>>                        "instance or backend state is migrated) set 'vhost-user-fs' "
>>>                        "migration capability to true to enable migration.");
>>>           return -1;
>>>       }
>>>       if (s->migration_type == VHOST_USER_EXTERNAL_MIGRATABLE) {
>>>           return 0;
>>>       }
>>>       if (s->migration_type == VHOST_USER_INTERNAL_MIGRATABLE) {
>>>           error_report("still not implemented");
>>>           return -1;
>>>       }
>>>       assert("we don't reach here");
>>> }
>>>
>>> Your initial vmstateDescription
>>>
>>> static const VMStateDescription vuf_vmstate = {
>>>       .name = "vhost-user-fs",
>>>       .unmigratable = 1,
>>>       .minimum_version_id = 0,
>>>       .version_id = 0,
>>>       .fields = (VMStateField[]) {
>>>           VMSTATE_INT8(migration_type, struct VHostUserFS),
>>>           VMSTATE_VIRTIO_DEVICE,
>>>           VMSTATE_END_OF_LIST()
>>>       },
>>>       .pre_save = vhost_user_fs_pre_save,
>>> };
>>>
>>> And later you change it to something like:
>>>
>>> static bool vhost_fs_user_internal_state_needed(void *opaque)
>>> {
>>>       VHostUserFS *s = opaque;
>>>
>>>       return s->migration_type == VMOST_USER_INTERNAL_MIGRATABLE;
>>> }
>>>
>>> static const VMStateDescription vmstate_vhost_user_fs_internal_sub = {
>>>       .name = "vhost-user-fs/internal",
>>>       .version_id = 1,
>>>       .minimum_version_id = 1,
>>>       .needed = &vhost_fs_user_internal_state_needed,
>>>       .fields = (VMStateField[]) {
>>>           .... // Whatever
>>>           VMSTATE_END_OF_LIST()
>>>       }
>>> };
>>>
>>> static const VMStateDescription vuf_vmstate = {
>>>       .name = "vhost-user-fs",
>>>       .minimum_version_id = 0,
>>>       .version_id = 0,
>>>       .fields = (VMStateField[]) {
>>>           VMSTATE_INT8(migration_type, struct VHostUserFS),
>>>           VMSTATE_VIRTIO_DEVICE,
>>>           VMSTATE_END_OF_LIST()
>>>       },
>>>       .pre_save = vhost_user_fs_pre_save,
>>>       .subsections = (const VMStateDescription*[]) {
>>>           &vmstate_vhost_user_fs_internal_sub,
>>>           NULL
>>>       }
>>> };
>>>
>>> And you are done.
>>>
>>> I will propose to use a property to set migration_type, but I didn't
>>> want to write the code right now.

I have a little problem with implementation here and need an advice:

Can we make this property adjustable at runtime after device was realized?
There is a statement in qemu wiki [1] that makes me think this is possible
but I couldn't find any code for it or example in other devices.
 > "Properties are, by default, locked while the device is realized. 
Exceptions
 > can be made by the devices themselves in order to implement a way for 
a user
 > to interact with a device while it is realized."

Or is your idea just to set this property once at construction and keep it
constant for device lifetime?

[1] https://wiki.qemu.org/Features/QOM

>>>
>>> I think that this proposal will make Stephan happy, and it is just
>>> adding and extra uint8_t that is helpul to implement everything.
>> That is exactly the approach I'm trying to implement it right now. Single
>> flag can be convenient for orchestrator but makes it too hard to account in
>> all cases for all devices on qemu side without breaking future
>> compatibility.
>> So I'm rewriting it with properties.
> Nice.  That would be my proposal.  Just a bit complicated for a proof of concetp.
>
>> BTW do you think each vhost-user device should have its own enum of
>> migration
>> types or maybe we could make them common for all device types?
> I will put it for vhost-user, because as far as I know nobody else is
> asking for this functionality.

I mean do we need it for all vhost-user devices or only for vhost-user-fs
that I'm implementing now?

>
> The most similar device that I can think of right now is vfio devices.
> But they are implemeting callbacks to save hardware device state, and
> they go device by device, i.e. there is nothing general there.
>
> Later, Juan.
>

