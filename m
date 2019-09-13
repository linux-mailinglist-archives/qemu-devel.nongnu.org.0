Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60339B2436
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 18:36:37 +0200 (CEST)
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8oYm-0002xz-5L
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 12:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i8oXT-0002EQ-CR
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 12:35:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i8oXS-0001jx-1L
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 12:35:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i8oXR-0001jc-SB
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 12:35:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1941218CB8E7
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 16:35:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AB0B60CC0;
 Fri, 13 Sep 2019 16:35:09 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	quintela@redhat.com,
	peterx@redhat.com
Date: Fri, 13 Sep 2019 17:35:05 +0100
Message-Id: <20190913163507.1403-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 13 Sep 2019 16:35:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] migration/rdma disconnect fixes
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi,
  This fixes a deadlock that can occur on the source after
a failed RDMA migration and cleans up some warning messages
that can appear during normal completion.

https://bugzilla.redhat.com/show_bug.cgi?id=3D1746787

Dr. David Alan Gilbert (2):
  migration/rdma: Don't moan about disconnects at the end
  migration/rdma.c: Swap synchronize_rcu for call_rcu

 migration/rdma.c | 51 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 16 deletions(-)

--=20
2.21.0


