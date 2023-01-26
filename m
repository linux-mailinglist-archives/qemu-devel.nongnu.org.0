Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5AC67CD8F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL37I-0001PW-Hu; Thu, 26 Jan 2023 09:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pL37G-0001PO-Po
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:20:38 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pL37E-00088S-IX
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:20:38 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 79AE85F01B;
 Thu, 26 Jan 2023 17:20:28 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b5b8::1:8] (unknown
 [2a02:6b8:b081:b5b8::1:8])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 OKRM430QX8c1-JI5m7uWQ; Thu, 26 Jan 2023 17:20:27 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674742827; bh=usHkwP9CTC23WzDx4Lh0qFG4ZtMXseINEaOo2hr4zpA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=pNow/AWTSnNRTDkLnQUiOR4EP0vvpYKjMEvSWx+FHxUFmfeuYA87WZdDI+IBkkDwg
 31SXPdbC6CaKcCOB83Tpc7RIM7CKUhA0r0D6PaBbWognPNkp8ZtK8y5flOUTq28TcH
 e7mETdkowDTm/3og2S6OnoXOBvSB0wuoR31WQRYQ=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <64c249a5-98c2-24a0-d036-c76bb2f0a19a@yandex-team.ru>
Date: Thu, 26 Jan 2023 16:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Content-Language: en-US, ru-RU
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <Y9GG+EXX03TAvWDS@fedora>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <Y9GG+EXX03TAvWDS@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 25/01/2023 21:46, Stefan Hajnoczi wrote:
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
> Hi Anton,
> Sorry for holding up your work with the discussions that we had. I still
> feel it's important to agree on command-line and/or vhost-user protocol
> changes that will be able to support non-migratable, stateless
> migration/reconnect, and stateful migration vhost-user-fs back-ends. All
> three will exist.
>
> As a next step, could you share your code that implements the QEMU side
> of stateless migration?
>
> I think that will make it clearer whether a command-line option
> (migration capability or per-device) is sufficient or whether the
> vhost-user protocol needs to be extended.
>
> If the vhost-user protocol is extended then maybe no user-visible
> changes are necessary. QEMU will know if the vhost-user-fs backend
> supports migration and which type of migration. It can block migration
> in cases where it's not possible.
>
> Thanks,
> Stefan


Thank you, Stefan,

That's OK. The discussion is very helpful and showed me some parts
that should to be checked to make sure no harm is done by this feature.
I needed some time to step back, review my approach to this feature
with all valuable feedback and ideas that were suggested and check
what other backend implementations can or can't do.
I'll answer today the emails with questions that were addressed to me.

This is all the code that QEMU needs to support stateless migration.
Do you mean backend and/or orchestrator parts?

I'll think of how protocol extension can help us make this feature
transparent to users.


