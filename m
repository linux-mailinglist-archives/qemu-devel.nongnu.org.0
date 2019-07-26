Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC1676B21
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 16:10:39 +0200 (CEST)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr0vd-00059o-NC
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 10:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37189)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ptoscano@redhat.com>) id 1hr0v7-0003oe-Qf
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 10:10:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ptoscano@redhat.com>) id 1hr0v7-0007hn-0G
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 10:10:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49596)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ptoscano@redhat.com>)
 id 1hr0v4-0007ao-0x; Fri, 26 Jul 2019 10:10:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C317730A6973;
 Fri, 26 Jul 2019 14:09:59 +0000 (UTC)
Received: from lindworm.usersys.redhat.com (unknown [10.43.2.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE316012D;
 Fri, 26 Jul 2019 14:09:57 +0000 (UTC)
From: Pino Toscano <ptoscano@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Fri, 26 Jul 2019 16:09:52 +0200
Message-Id: <20190726140954.31921-1-ptoscano@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 26 Jul 2019 14:09:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] ssh: add password and privkey auth methods
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
Cc: kwolf@redhat.com, ptoscano@redhat.com, pkrempa@redhat.com,
 rjones@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two patches add the password and private key authentication
methods to the ssh block driver, using secure objects for
passwords/passphrases.

Pino Toscano (2):
  ssh: implement password authentication
  ssh: implement private key authentication

 block/ssh.c                  | 133 ++++++++++++++++++++++++++++++++++-
 block/trace-events           |   2 +
 docs/qemu-block-drivers.texi |  15 +++-
 qapi/block-core.json         |  13 +++-
 tests/qemu-iotests/207.out   |   2 +-
 5 files changed, 158 insertions(+), 7 deletions(-)

--=20
2.21.0


