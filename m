Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCF6A6FEE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:41:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOZ8-0006N6-J3; Wed, 01 Mar 2023 10:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pXOZ5-0006KE-Rm
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:40:23 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pXOZ3-0005DP-CC
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:40:23 -0500
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:1fac:0:640:45b5:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id ABABD60287;
 Wed,  1 Mar 2023 18:40:13 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b415::1:1a] (unknown
 [2a02:6b8:b081:b415::1:1a])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 9eXFU50OeSw0-fD0eAl8f; Wed, 01 Mar 2023 18:40:12 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass
Message-ID: <39577b2c-71ec-5e83-d796-2c4fe3d1fc10@yandex-team.ru>
Date: Wed, 1 Mar 2023 17:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US, ru-RU
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
References: <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org> <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <e1f45021-071c-b8c4-69bd-85f8c29c669a@yandex-team.ru>
 <20230301094424-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230301094424-mutt-send-email-mst@kernel.org>
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


On 01/03/2023 16:46, Michael S. Tsirkin wrote:
> On Wed, Mar 01, 2023 at 05:03:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On 01.03.23 00:24, Michael S. Tsirkin wrote:
>>>> Said that checking on destination would need another flag and the safe
>>>> way of using this feature would require managing two flags instead of one
>>>> making it even more fragile. So I'd prefer not to make it more complex.
>>>>
>>>> In my opinion the best way to use this property by orchestrator is to
>>>> leave default unmigratable behavior at start and just before migration when
>>>> destination is known enumerate all vhost-user-fs devices and set properties
>>>> according to their backends capability with QMP like you mentioned. This
>>>> gives us single point of making the decision for each device and avoids
>>>> guessing future at VM start.
>>> this means that you need to remember what the values were and then
>>> any failure on destination requires you to go back and set them
>>> to original values.
>> Why do we need to restore old values?
> To get back to where you were before you were starting migration.
>
>> For me, this new property is a kind of per-device migration
>> capability. Do we care to restore migration capabilities to the values
>> that they had before setting them for failed migration? We don't need
>> it, as we just always set capabilities as we want before each
>> migration. Same thing for this new property: just set it properly
>> before migration and you don't need to care about restoring it after
>> failed migration attempt.
> If you really trust your management then we can just remove the
> migration blocker and be done with it. All this song and dance
> with changing properties is to catch errors. If one has to
> carefully play with QOM to achieve the desired result then
> IMHO we failed in this.

To be honest I would prefer just removing blocker because if orchestrator
doesn't know what it is doing it has lots of different ways to break
things and we can't do anything about it.
Just like vhost-user-scsi always allows migration since the day it was
introduced without additional checks and relies on the orchestrator.
But migration was blocked for vhost-user-fs when it was initially merged
and it is bad to change this contract now.

This property here is not only to block migration by default and catch
errors but really to select migration type. External migration can be
sometimes preferred even after internal is implemented because it requires
less calls to backend to extract internal state, less code to execute in
order to save and restore daemon state.
And this also will allow compatibility with old VMs that support only
external migration to move to internal migration without reboot someday
when it is implemented.

So catching errors in not the only purpose of this property, but it 
definitely
allows us to catch some obvious ones.

>
>>> With possibility of crashes on the orchestrator
>>> you also need to recall the temporary values in some file ...
>>> This is huge complexity much worse than two flags.
>>>
>>> Assuming we need two let's see whether just reload on source is good
>>> enough.
>>>
>> -- 
>> Best regards,
>> Vladimir

