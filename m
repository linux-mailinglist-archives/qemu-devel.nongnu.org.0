Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBF6BF167
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 20:04:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdFLt-0001fl-Fb; Fri, 17 Mar 2023 15:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pdFLr-0001dX-1v
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 15:02:55 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pdFLo-0007MP-IG
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 15:02:54 -0400
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:ae0e:0:640:6e49:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 7CFBC60534;
 Fri, 17 Mar 2023 22:02:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b68e::1:34] (unknown
 [2a02:6b8:b081:b68e::1:34])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id c2rfWU0Oi8c0-ZNgomhQl; Fri, 17 Mar 2023 22:02:42 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679079762; bh=atoonpkq3IJ2La7naowo9a/0fBLKS7sTrPxqbv5SS+c=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=QPLhrhstKkHRk5XMBJ8FLJtvlxX/VxPUFHwcTDShN+pToPHRB7d9d8kvFioVYDw7P
 u1aEsg1IFKTpKT2RJ2wTwKBUuL9aBX3GVonKEPYY42xzdhTT4Vjq8KdfZD1MXNv3hh
 V9+xeTb0n7koEkvqhbBX98V9lZ3wVXr4bVX+nSg0=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <66485897-4b7c-ec86-93ad-9ce62ce57606@yandex-team.ru>
Date: Fri, 17 Mar 2023 21:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US, ru-RU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
References: <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org> <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230301102757-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230301102757-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 01/03/2023 17:33, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 07:59:54PM +0200, Anton Kuchin wrote:
>> We can't rely here entirely on
>> destination to block this because if VM is migrated to file and then
>> can't be loaded by destination there is no way to fallback and resume
>> the source so we need to have some kind of blocker on source by default.
> So I commented about a fallback. IMO it's just orchestrator being silly:
> don't kill source qemu until you have made sure destination loaded the
> file, or re-load it, and all will be well.

I agree that it is always better to keep source alive until destination
is loaded and ready to take-off. But in some cases resources are limited
or strictly partitioned so we can't keep two VMs alive at the same time
so the bast option is to check all we need on the source to make sure
destination will run.
Off the top of my head host-size VM would need entire additional host to
migrate properly and lots of memory streaming that can cause huge downtime,
but if memory is in shmem local migration to update qemu can take as much
as just saving device state to file and running new qemu to load devices,
take-over memory and continue running guest.

>
> But a bigger issue that this highlights is simply that if migrating to
> file you have no idea at all where will the file be loaded.  Maybe some
> orchestrators know but I don't see how we can be sure all of them know.
> The only time where we know whether the file is loaded on the same host
> where it was saved is when we actually load it.
>

Yes. Migration to file requires orchestrator to be well aware of what
it is doing because file always contains only part of the state. This
is hard but sometimes there are no other good options.

