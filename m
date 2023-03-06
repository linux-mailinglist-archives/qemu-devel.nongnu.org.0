Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF16ACF9B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 21:56:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZHs2-00068N-Ko; Mon, 06 Mar 2023 15:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pZHs0-00066e-Hd
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:55:44 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pZHry-0001Wd-Hx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:55:44 -0500
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:57a5:0:640:1f49:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 6D3585E5E0;
 Mon,  6 Mar 2023 23:55:34 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:2e] (unknown
 [2a02:6b8:b081:6407::1:2e])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id Uthcg40OdKo0-d3iVCgxd; Mon, 06 Mar 2023 23:55:33 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass
Message-ID: <c85c067f-5bbb-ca5c-a6ba-bae1c356eef1@yandex-team.ru>
Date: Mon, 6 Mar 2023 22:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
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
References: <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <8c3c140a-3c11-ba21-0c53-9cf25928bad0@yandex-team.ru>
 <20230301101212-mutt-send-email-mst@kernel.org>
 <78299aea-4049-991b-fe89-de0d1845bdff@yandex-team.ru>
 <20230301121224-mutt-send-email-mst@kernel.org>
 <bc89a1b1-2478-7780-0d74-64aac91beed5@yandex-team.ru>
 <20230301152038-mutt-send-email-mst@kernel.org>
Content-Language: en-US, ru-RU
In-Reply-To: <20230301152038-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 01/03/2023 22:22, Michael S. Tsirkin wrote:
> On Wed, Mar 01, 2023 at 09:35:56PM +0200, Anton Kuchin wrote:
>> I do trust them :)
>> I have to, otherwise we would need to pack all the properties and
>> flags of qemu to the migration stream and validate them at
>> destination or entire migration ends up broken beyond repair if
>> orchestrators tend to do stupid things and need babysitting.
> This is not at all a crazy idea. It has some disadvantages
> too esp around cross version migration, which is why we
> don't do this yet.
>

Indeed. I know VMMs that chose this path. But as long as
qemu decided to trust orchestrators I think we'd better
keep this consistent across the codebase.

Only ivshmem_pre_load callback bothers to check device
property and virtio_net_tx_waiting_pre_load checks that
number of queue pairs doesn't exceed allowed maximum, all
other *_pre_load functions generally just initialize some
parts of state that need to be set before stream starts
loading.

