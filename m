Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A62F74E0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:06:44 +0100 (CET)
Received: from localhost ([::1]:41232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0L46-0002zY-Uz
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l0L2v-0002HC-24
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:05:29 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:46399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l0L2q-0004kF-LM
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:05:28 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-bcbdr7hyPmiEY3mXuZx4fQ-1; Fri, 15 Jan 2021 04:05:18 -0500
X-MC-Unique: bcbdr7hyPmiEY3mXuZx4fQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8AD5107ACF8;
 Fri, 15 Jan 2021 09:05:16 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9272B779F4;
 Fri, 15 Jan 2021 09:05:15 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] 9p security fix 2021-01-15
Date: Fri, 15 Jan 2021 10:05:06 +0100
Message-Id: <20210115090507.108064-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7c79721606be11b5bc556449e5bcbc331ef6867d=
:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210113' =
into staging (2021-01-14 09:54:29 +0000)

are available in the Git repository at:

  https://gitlab.com/gkurz/qemu.git tags/9p-next-2021-01-15

for you to fetch changes up to 89fbea8737e8f7b954745a1ffc4238d377055305:

  9pfs: Fully restart unreclaim loop (CVE-2021-20181) (2021-01-15 08:44:28 =
+0100)

----------------------------------------------------------------
Fix for CVE-2021-20181

----------------------------------------------------------------
Greg Kurz (1):
      9pfs: Fully restart unreclaim loop (CVE-2021-20181)

 hw/9pfs/9p.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
--=20
2.26.2


