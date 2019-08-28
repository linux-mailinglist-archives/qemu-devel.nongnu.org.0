Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC947A0B39
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 22:22:15 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i34SM-0005Df-6D
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 16:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i33kG-0008Uc-4R
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:36:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i33kE-0001nS-1I
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:36:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1i33kD-0001ms-Sw
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:36:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DE5018B3D83
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 19:36:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-242.rdu2.redhat.com
 [10.10.123.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5395D60F82;
 Wed, 28 Aug 2019 19:36:30 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 15:36:25 -0400
Message-Id: <20190828193628.7687-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 28 Aug 2019 19:36:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] Acceptance test x86_cpu_model_versions:
 fixes and minor improvements
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This corrects some of the messages given on failures (aligning them to
the test code), and splits a larger test into smaller and more
manageable pieces.

Cleber Rosa (3):
  Acceptance test x86_cpu_model_versions: shutdown VMs
  Acceptance test x86_cpu_model_versions: fix mismatches between test
    and messages
  Acceptance test x86_cpu_model_versions: split into smaller tests

 tests/acceptance/x86_cpu_model_versions.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

--=20
2.21.0


