Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F016A5E7F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX4Gt-0007c3-5r; Tue, 28 Feb 2023 13:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pX4Gq-0007Yd-KP
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:00:12 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pX4Gn-0005H3-Hr
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:00:11 -0500
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c15:2905:0:640:e5fe:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 17396600DB;
 Tue, 28 Feb 2023 20:59:59 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1321::1:31] (unknown
 [2a02:6b8:b081:1321::1:31])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id txYOIG0OguQ0-psMZdRZB; Tue, 28 Feb 2023 20:59:58 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net;
 dkim=pass
Message-ID: <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
Date: Tue, 28 Feb 2023 19:59:54 +0200
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
References: <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org> <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230228094756-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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

On 28/02/2023 16:57, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 04:30:36PM +0200, Anton Kuchin wrote:
>> I really don't understand why and what do you want to check on
>> destination.
> Yes I understand your patch controls source. Let me try to rephrase
> why I think it's better on destination.
> Here's my understanding
> - With vhost-user-fs state lives inside an external daemon.
> A- If after load you connect to the same daemon you can get migration mostly
>    for free.
> B- If you connect to a different daemon then that daemon will need
>    to pass information from original one.
>
> Is this a fair summary?
>
> Current solution is to set flag on the source meaning "I have an
> orchestration tool that will make sure that either A or B is correct".
>
> However both A and B can only be known when destination is known.
> Especially as long as what we are really trying to do is just allow qemu
> restarts, Checking the flag on load will thus achive it in a cleaner
> way, in that orchestration tool can reasonably keep the flag
> clear normally and only set it if restarting qemu locally.
>
>
> By comparison, with your approach orchestration tool will have
> to either always set the flag (risky since then we lose the
> extra check that we coded) or keep it clear and set before migration
> (complex).
>
> I hope I explained what and why I want to check.
>
> I am far from a vhost-user-fs expert so maybe I am wrong but
> I wanted to make sure I got the point across even if other
> disagree.
>

Thank you for the explanation. Now I understand your concerns.

You are right about this mechanism being a bit risky if orchestrator is
not using it properly or clunky if it is used in a safest possible way.
That's why first attempt of this feature was with migration capability
to let orchestrator choose behavior right at the moment of migration.
But it has its own problems.

We can't move this check only to destination because one of main goals
was to prevent orchestrators that are unaware of vhost-user-fs specifics
from accidentally migrating such VMs. We can't rely here entirely on
destination to block this because if VM is migrated to file and then
can't be loaded by destination there is no way to fallback and resume
the source so we need to have some kind of blocker on source by default.

Said that checking on destination would need another flag and the safe
way of using this feature would require managing two flags instead of one
making it even more fragile. So I'd prefer not to make it more complex.

In my opinion the best way to use this property by orchestrator is to
leave default unmigratable behavior at start and just before migration when
destination is known enumerate all vhost-user-fs devices and set properties
according to their backends capability with QMP like you mentioned. This
gives us single point of making the decision for each device and avoids
guessing future at VM start.
But allowing setup via command-line is valid too because some backends may
always be capable of external migration independent of hosts and don't need
the manipulations with QMP before migration at all.


