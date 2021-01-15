Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC722F7DDA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:14:06 +0100 (CET)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PrZ-0007U5-CY
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l0PN2-0002bI-0o
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:42:32 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l0PMz-0003Yc-VG
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:42:31 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-kwCQqN5gPsKl674xer467g-1; Fri, 15 Jan 2021 08:42:26 -0500
X-MC-Unique: kwCQqN5gPsKl674xer467g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2D4A107ACF8;
 Fri, 15 Jan 2021 13:42:25 +0000 (UTC)
Received: from bahia.lan (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D76E10013C0;
 Fri, 15 Jan 2021 13:42:25 +0000 (UTC)
Subject: [PATCH] MAINTAINERS: Update 9pfs tree URL
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 15 Jan 2021 14:42:24 +0100
Message-ID: <161071814430.152031.14540382419012818908.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've already moved my repositories to gitlab for extra CI coverage,
and I won't use the ones at github anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 MAINTAINERS |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cb0656aec3d4..21038d3fdfce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1828,7 +1828,7 @@ X: hw/9pfs/xen-9p*
 F: fsdev/
 F: docs/interop/virtfs-proxy-helper.rst
 F: tests/qtest/virtio-9p-test.c
-T: git https://github.com/gkurz/qemu.git 9p-next
+T: git https://gitlab.com/gkurz/qemu.git 9p-next
=20
 virtio-blk
 M: Stefan Hajnoczi <stefanha@redhat.com>



