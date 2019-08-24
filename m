Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7AB9BEFF
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Aug 2019 19:30:20 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Zrn-00089g-3h
	for lists+qemu-devel@lfdr.de; Sat, 24 Aug 2019 13:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i1Zpq-0006uX-Id
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 13:28:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i1Zpp-0008Pw-39
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 13:28:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54652)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1i1Zpo-0008PJ-Uk
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 13:28:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B19473082126;
 Sat, 24 Aug 2019 17:28:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37CAC608A5;
 Sat, 24 Aug 2019 17:28:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 12:28:11 -0500
Message-Id: <20190824172813.29720-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Sat, 24 Aug 2019 17:28:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] nbd: tolerate more errors to extension
 requests
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
Cc: vsementsov@virtuozzo.com, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1;
- new patch 1
- adjust patch 2 to not set errp when not in strict mode

Eric Blake (2):
  nbd: Use g_autofree in a few places
  nbd: Tolerate more errors to structured reply request

 block/nbd.c      | 11 +++----
 nbd/client.c     | 85 +++++++++++++++++++++++-------------------------
 nbd/server.c     | 12 +++----
 nbd/trace-events |  2 +-
 4 files changed, 49 insertions(+), 61 deletions(-)

--=20
2.21.0


