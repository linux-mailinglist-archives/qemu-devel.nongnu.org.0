Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39411F6C6
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Dec 2019 08:22:28 +0100 (CET)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igOEV-0000pN-Et
	for lists+qemu-devel@lfdr.de; Sun, 15 Dec 2019 02:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igOD6-0008IY-UQ
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 02:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igOD4-0006Wh-9Y
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 02:20:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27454
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igOD3-0006Ur-Rs
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 02:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576394456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WGmLDxaS1NmzoYdgqZpJheMtBdJ9K0TNan1OBA+rUb8=;
 b=bmXKHTB6QJ8R3ntVBBUpVMb7ti25bHEW2bxqDVELdFvAtwnO6GGHAfJaK7HH2etQUjnRlt
 lL2IXOToOtIf1B6WK2KRwh8gZRuks2iYYWLzwEMgli0kb9JZ4N5F/iUSNlIrKex+8H1NVR
 ufW8Q1kDBRex7TAr6A4hO6u/29NzGlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-hJ8Ds1FZMEiVxP8jDHUHMQ-1; Sun, 15 Dec 2019 02:20:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BDC7DBF6;
 Sun, 15 Dec 2019 07:20:53 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6B78384;
 Sun, 15 Dec 2019 07:20:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH v2 0/2] hw/timer/m48t59: Convert to trace events
Date: Sun, 15 Dec 2019 08:20:43 +0100
Message-Id: <20191215072045.7198-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: hJ8Ds1FZMEiVxP8jDHUHMQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Another trivial cleanup series.

v2: Rebased on 4.2

Philippe Mathieu-Daud=C3=A9 (2):
  MAINTAINERS: Add missing m48t59 files to the PReP section
  hw/timer/m48t59: Convert debug printf()s to trace events

 hw/rtc/m48t59-internal.h |  5 -----
 hw/rtc/m48t59.c          | 11 +++++------
 MAINTAINERS              |  2 ++
 hw/rtc/trace-events      |  6 ++++++
 4 files changed, 13 insertions(+), 11 deletions(-)

--=20
2.21.0


