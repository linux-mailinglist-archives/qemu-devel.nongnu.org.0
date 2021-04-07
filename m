Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F5356B7A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:44:49 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU6c4-0003dx-FI
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lU6Zk-0002ad-LE; Wed, 07 Apr 2021 07:42:25 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:42588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lU6Zg-0000Om-8L; Wed, 07 Apr 2021 07:42:22 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 97EC92E1998;
 Wed,  7 Apr 2021 14:42:12 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 azUsfk9zkN-gB0Chl4T; Wed, 07 Apr 2021 14:42:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617795732; bh=yKbeNXrYJoiZq6/pW5O8CgpTaVfGTR44NFaNQ+kpENg=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=YvnfzmWG2Pa+Sv53Cxc0Qb8iWQLnI2ntyvlXERKw1kuYD/YnTt07qhHz3nAe/JO9D
 KASCq4jB6mwr1bbtTaHZunjyLG9mg2VwdYWFsOPXKRJaki5kS5DJuWqmj2KWfCsH+G
 L1Ain2uegDxwgrrTUykC4CvV/f5zqK0d8kqjz8DI=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8216::1:1b])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bFfW4YJRfO-gBomvDU5; Wed, 07 Apr 2021 14:42:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 7 Apr 2021 14:42:08 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 03/14] block/nbd: drop unused NBDConnectThread::err field
Message-ID: <YG2akBHjJyoPSm12@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com, den@openvz.org
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
 <20210407104637.36033-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407104637.36033-4-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wed, Apr 07, 2021 at 01:46:26PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> The field is used only to free it. Let's drop it for now for
> simplicity.

Well, it's *now* (after your patch 2) only used to free it.  This makes
the reconnect process even further concealed from the user: the client
may be struggling to re-establish the connection but you'll never know
when looking at the logs.

As I wrote in my comment to patch 2 I believe these errors need to be
logged.  Whether to do it directly in the reconnection thread or punt it
to the spawner of it is another matter; I'd personally prefer to do
logging in the original bdrv context as it allows to (easier) tag the
log messages with the indication of which connection is suffering.

Thanks,
Roman.

