Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A035A45
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 12:11:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYSst-0000mk-SA
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 06:11:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYSr9-0008HN-OS
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYSr8-0007az-Hh
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:09:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:47174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYSr8-0007Yt-9R; Wed, 05 Jun 2019 06:09:18 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYSr3-0000xT-OZ; Wed, 05 Jun 2019 13:09:13 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 13:09:11 +0300
Message-Id: <20190605100913.34972-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/2] nbd: enable keepalive
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
	mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is a suggestion to enable keepalive option to track server availablity.

Vladimir Sementsov-Ogievskiy (2):
  io/channel: add qio_channel_set_keepalive
  nbd-client: enable TCP keepalive

 include/io/channel.h | 13 +++++++++++++
 block/nbd-client.c   |  1 +
 io/channel-socket.c  | 19 +++++++++++++++++++
 io/channel.c         | 14 ++++++++++++++
 4 files changed, 47 insertions(+)

-- 
2.18.0


