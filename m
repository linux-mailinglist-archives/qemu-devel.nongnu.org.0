Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F6AEEAB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 17:43:00 +0200 (CEST)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7iIF-0003Nm-5T
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 11:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pl@kamp.de>) id 1i7iGZ-0002FD-Nx
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pl@kamp.de>) id 1i7iGY-0004R0-Ga
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:41:15 -0400
Received: from kerio.kamp.de ([195.62.97.192]:60395)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pl@kamp.de>) id 1i7iGY-0004Pq-3V
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:41:14 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 17:41:08 +0200
Received: (qmail 7073 invoked from network); 10 Sep 2019 15:41:11 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 10 Sep 2019 15:41:11 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 786BF13D876; Tue, 10 Sep 2019 17:41:11 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Date: Tue, 10 Sep 2019 17:41:08 +0200
Message-Id: <20190910154110.6905-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.62.97.192
Subject: [Qemu-devel] [PATCH V2 0/2] add support for nfs_umount
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ronniesahlberg@gmail.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add support for NFSv3 umount call. V2 adds a patch that fixes
the order of the aio teardown. The addition of the NFS umount
call unmasked that bug.

Peter Lieven (2):
  block/nfs: tear down aio before nfs_close
  block/nfs: add support for nfs_umount

 block/nfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.17.1



