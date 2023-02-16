Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779069A26A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnl4-0008NR-OG; Thu, 16 Feb 2023 18:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pSnl3-0008Mu-91
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:33:45 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pSnkz-0008O2-Tf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:33:45 -0500
Received: from sas1-2d2912cdb877.qloud-c.yandex.net
 (sas1-2d2912cdb877.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:280d:0:640:2d29:12cd])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 903EF606C1
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 02:33:33 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7313::1:33] (unknown
 [2a02:6b8:b081:7313::1:33])
 by sas1-2d2912cdb877.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 VXvfIU0QWSw1-QxI5qcep; Fri, 17 Feb 2023 02:33:33 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676590413; bh=If8LhDsXrtd9DsAzVDE5QRkRqty9Q0IONc+84+JW3v0=;
 h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
 b=HcfeQpmHyuqiytgGq79SJWpuYKxvAufmrIAkgSMcLa3Rczrjb/UCA2viQzXiFceX4
 eCoSjwBXO6iMNfrZl+Te4ht498rRbpsWKwRHhgVmyAqf5TezDVZBAZhAEoG0szuwne
 DhmDJF8o1T2aq2xFAxDEbHwp+5ygYNYWSg+BGmjA=
Authentication-Results: sas1-2d2912cdb877.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d09cfa0e-dd8b-d7bd-aa75-d337243993c7@yandex-team.ru>
Date: Fri, 17 Feb 2023 01:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/1] vhost-user-fs: add property to allow migration
Content-Language: en-US, ru-RU
To: qemu-devel@nongnu.org
References: <20230216140003.1103681-1-antonkuchin@yandex-team.ru>
 <20230216140003.1103681-2-antonkuchin@yandex-team.ru>
 <87v8k1itoy.fsf@secure.mitica>
 <20230216110952-mutt-send-email-mst@kernel.org>
 <20230216111134-mutt-send-email-mst@kernel.org>
 <87zg9dfulz.fsf@secure.mitica>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <87zg9dfulz.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
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
Precedence: list
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

On 16/02/2023 18:22, Juan Quintela wrote:
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> On Thu, Feb 16, 2023 at 11:11:22AM -0500, Michael S. Tsirkin wrote:
>>> On Thu, Feb 16, 2023 at 03:14:05PM +0100, Juan Quintela wrote:
>>>> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>> Now any vhost-user-fs device makes VM unmigratable, that also prevents
>>>>> qemu update without stopping the VM. In most cases that makes sense
>>>>> because qemu has no way to transfer FUSE session state.
>>>>>
>>>>> But it is good to have an option for orchestrator to tune this according to
>>>>> backend capabilities and migration configuration.
>>>>>
>>>>> This patch adds device property 'migration' that is 'none' by default
>>>>> to keep old behaviour but can be set to 'external' to explicitly allow
>>>>> migration with minimal virtio device state in migration stream if daemon
>>>>> has some way to sync FUSE state on src and dst without help from qemu.
>>>>>
>>>>> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
>>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>>
>>>> The migration bits are correct.
>>>>
>>>> And I can think a better way to explain that one device is migrated
>>>> externally.

I'm bad at wording but I'll try to improve this one.
Suggestions will be really appreciated.

>>>>
>>>> If you have to respin:
>>>>
>>>>> +static int vhost_user_fs_pre_save(void *opaque)
>>>>> +{
>>>>> +    VHostUserFS *fs = (VHostUserFS *)opaque;
>>>> This hack is useless.

I will. Will get rid of that, thanks.

>>> meaning the cast? yes.
>>>
>>>> I know that there are still lots of code that still have it.
>>>>
>>>>
>>>> Now remember that I have no clue about vhost-user-fs.
>>>>
>>>> But this looks fishy
>>>>>   static const VMStateDescription vuf_vmstate = {
>>>>>       .name = "vhost-user-fs",
>>>>> -    .unmigratable = 1,
>>>>> +    .minimum_version_id = 0,
>>>>> +    .version_id = 0,
>>>>> +    .fields = (VMStateField[]) {
>>>>> +        VMSTATE_VIRTIO_DEVICE,
>>>>> +        VMSTATE_UINT8(migration_type, VHostUserFS),
>>>>> +        VMSTATE_END_OF_LIST()
>> In fact why do we want to migrate this property?
>> We generally don't, we only migrate state.
> See previous discussion.
> In a nutshell, we are going to have internal migration in the future
> (not done yet).
>
> Later, Juan.

I think Michael is right. We don't need it at destination to know
what data is in the stream because subsections will tell us all we
need to know.

>
>>>>> +    },
>>>>> +   .pre_save = vhost_user_fs_pre_save,
>>>>>   };
>>>>>   
>>>>>   static Property vuf_properties[] = {
>>>>> @@ -309,6 +337,10 @@ static Property vuf_properties[] = {
>>>>>       DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
>>>>>                          conf.num_request_queues, 1),
>>>>>       DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
>>>>> +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
>>>>> +                         VHOST_USER_MIGRATION_TYPE_NONE,
>>>>> +                         qdev_prop_vhost_user_migration_type,
>>>>> +                         uint8_t),
>>>>>       DEFINE_PROP_END_OF_LIST(),
>>>> We have four properties here (5 with the new migration one), and you
>>>> only migrate one.
>>>>
>>>> This looks fishy, but I don't know if it makes sense.
>>>> If they _have_ to be configured the same on source and destination, I
>>>> would transfer them and check in post_load that the values are correct.
>>>>
>>>> Later, Juan.
>>> Weird suggestion.  We generally don't do this kind of check - that
>>> would be open-coding each property. It's management's job to make
>>> sure things are consistent.
>>>
>>> -- 
>>> MST
>

