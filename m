Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C58717C2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 14:08:56 +0200 (CEST)
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hptbD-0001VZ-9H
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 08:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36313)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hptao-0000a7-1I
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:08:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hptak-00037Q-9q
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:08:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40338)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hptak-00034O-4x; Tue, 23 Jul 2019 08:08:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E55BD2F8BE3;
 Tue, 23 Jul 2019 12:08:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-56.brq.redhat.com [10.40.204.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8DD661352;
 Tue, 23 Jul 2019 12:08:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 14:08:14 +0200
Message-Id: <20190723120816.1361-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 23 Jul 2019 12:08:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.2 0/2] target/riscv/pmp: Convert to trace
 events
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
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial convertion, suggested on
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg04728.html

Philippe Mathieu-Daud=C3=A9 (2):
  target/riscv/pmp: Restrict priviledged PMP to system-mode emulation
  target/riscv/pmp: Convert qemu_log_mask(LOG_TRACE) to trace events

 target/riscv/Makefile.objs |  3 ++-
 target/riscv/pmp.c         | 35 ++++++++++-------------------------
 target/riscv/trace-events  |  6 ++++++
 3 files changed, 18 insertions(+), 26 deletions(-)

--=20
2.20.1


