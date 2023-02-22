Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5269F780
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqpS-00054r-NX; Wed, 22 Feb 2023 10:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUqpQ-00054U-Pk
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:14:44 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUqpN-0008LB-Q3
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:14:44 -0500
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c15:2905:0:640:e5fe:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 263505FEBA;
 Wed, 22 Feb 2023 18:14:35 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:a532::1:1e] (unknown
 [2a02:6b8:b081:a532::1:1e])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id VEQGWC0KhiE0-2AzK8GgR; Wed, 22 Feb 2023 18:14:33 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net;
 dkim=pass
Message-ID: <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
Date: Wed, 22 Feb 2023 18:14:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US
To: Anton Kuchin <antonkuchin@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>
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
 <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

On 22.02.23 17:25, Anton Kuchin wrote:
>>>> +static int vhost_user_fs_pre_save(void *opaque)
>>>> +{
>>>> +    VHostUserFS *fs = opaque;
>>>> +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
>>>> +
>>>> +    switch (fs->migration_type) {
>>>> +    case VHOST_USER_MIGRATION_TYPE_NONE:
>>>> +        error_report("Migration is blocked by device %s", path);
>>>> +        break;
>>>> +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
>>>> +        return 0;
>>>> +    default:
>>>> +        error_report("Migration type '%s' is not supported by device %s",
>>>> +                     VhostUserMigrationType_str(fs->migration_type), path);
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return -1;
>>>> +}
>>> Should we also add this as .pre_load, to force user select correct migration_type on target too?
>> In fact, I would claim we only want pre_load.
>> When qemu is started on destination we know where it's migrated
>> from so this flag can be set.
>> When qemu is started on source we generally do not yet know so
>> we don't know whether it's safe to set this flag.

But destination is a "source" for next migration, so there shouldn't be real difference.
The new property has ".realized_set_allowed = true", so, as I understand it may be changed at any time, so that's not a problem.

> 
> This property selects if VM can migrate and if it can what should qemu put
> to the migration stream. So we select on source what type of migration is
> allowed for this VM, destination can't check anything at load time.

OK, so the new field "migration" regulates only outgoing migration and do nothing for incoming. On incoming migration the migration stream itself defines the type of device migration.
Worth mentioning in doc?

-- 
Best regards,
Vladimir


