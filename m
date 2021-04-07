Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B592E356B35
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:29:50 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU6NZ-0005F4-9Q
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lU6Mn-0004kp-K2; Wed, 07 Apr 2021 07:29:01 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:51682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lU6Mj-0000gs-R1; Wed, 07 Apr 2021 07:28:59 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id CE6F12E1538;
 Wed,  7 Apr 2021 14:28:52 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 6hNJkupufK-Sq0K5n0U; Wed, 07 Apr 2021 14:28:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617794932; bh=tuu+UBMCJxFHR03hpfUf/Y7yfS7R1pdgvCLqmIzv2Oo=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=nvUh6Ov5pdOC+EmodoHhNcUhsboAY7qSzfNMNfG5kanI65TlKKf19IRQjd4/oQeuG
 wFBmSL8jPasqrltDojzR2mXSbvxgA8INWkRq06uJsJB0CZDNhLnbQewsC/ogbYL+SK
 CL0ww8rsWyPlgxq6qCIYoINnJK1zjYkI5qJjVKec=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8216::1:1b])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ukS7haEh27-SqpqtYpW; Wed, 07 Apr 2021 14:28:52 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 7 Apr 2021 14:28:49 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 02/14] block/nbd: nbd_co_establish_connection(): drop
 unused errp
Message-ID: <YG2XcSb86J/XprGx@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com, den@openvz.org
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
 <20210407104637.36033-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407104637.36033-3-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 07, 2021 at 01:46:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are going to refactor connection logic to make it more
> understandable. Every bit that we can simplify in advance will help.
> Drop errp for now, it's unused anyway. We'll probably reimplement it in
> future.

Although I agree that this passing errors around is a bit of an
overkill, my problem with NBD client is that it's notoriously silent
about problems it expeirences, and those errors never pop up in logs.

Given that these errors are not guest-triggerable, and probably indicate
serious problems at the infrastructure level, instead of endlessly
passing them around (as in the code ATM) or dropping them on the floor
(as you propose in the patch) I'd much rather log them immediately when
encountering.

I have a patch to that end, I'll try to port it on top of your series.

Thanks,
Roman.

