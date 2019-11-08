Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC60F5489
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 20:17:37 +0100 (CET)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT9lI-00033T-HW
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 14:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iT9fx-0006BU-TI
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 14:12:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iT9fw-0004Fc-4V
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 14:12:05 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:46691 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iT9fv-0002na-RW
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 14:12:04 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D24491A1F98;
 Fri,  8 Nov 2019 20:10:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id A8C981A2138;
 Fri,  8 Nov 2019 20:10:58 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] MAINTAINERS: Add a section on git infrastructure
Date: Fri,  8 Nov 2019 20:10:45 +0100
Message-Id: <1573240249-6966-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573240249-6966-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1573240249-6966-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, aleksandar.rikalo@rt-rk.com,
 alex.bennee@linaro.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

There should be a patient person maintaining gory details of
git-related files, and there is no better person for that role
than Philippe. Alex should be the reviewer for some relations
with gitdm.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 MAINTAINERS | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4964fbb..be43ccb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2664,6 +2664,23 @@ M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
 F: scripts/git-submodule.sh
=20
+GIT infrastructure
+M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+R: Alex Benn=C3=A9e <alex.bennee@linaro.org>
+S: Maintained
+F: .mailmap
+F: scripts/git.orderfile
+F: .gitignore
+F: tests/fp/.gitignore
+F: tests/fp/berkeley-softfloat-3/.gitignore
+F: tests/fp/berkeley-testfloat-3/.gitignore
+F: tests/migration/.gitignore
+F: tests/multiboot/.gitignore
+F: tests/qemu-iotests/.gitignore
+F: tests/tcg/.gitignore
+F: tests/uefi-test-tools/.gitignore
+F: ui/keycodemapdb/tests/.gitignore
+
 Sphinx documentation configuration and build machinery
 M: Peter Maydell <peter.maydell@linaro.org>
 S: Maintained
--=20
2.7.4


