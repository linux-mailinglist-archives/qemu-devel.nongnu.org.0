Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889303D718A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:52:08 +0200 (CEST)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Iop-0004SU-LG
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1m8Inl-0003jI-Kh
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:51:01 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45240)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1m8Ink-0008F2-44
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:51:01 -0400
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7BC6440A2BA0;
 Tue, 27 Jul 2021 08:45:12 +0000 (UTC)
Subject: [PATCH v3 0/5] More record/replay acceptance tests
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Tue, 27 Jul 2021 11:45:12 +0300
Message-ID: <162737551207.1735673.5022919664900932604.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, philmd@redhat.com, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following series adds new record/replay tests to the acceptance group.

The provided tests perform kernel boot and disk image boot scenarios.
For all of them recording and replaying phases are executed.
Tests were borrowed from existing boot_linux*.py tests.

New tests include kernel boot for s390x, alpha, nios2, and openrisc,
and Linux boot with cloudinit image for x86_64.

v3 changes:
 - rebased
 - removed duplicate ppc64 test
v2 changes:
 - moved ppc64 test to the right script

---

Pavel Dovgaluk (1):
      tests/acceptance: Linux boot test for record/replay

Pavel Dovgalyuk (4):
      tests/acceptance: add replay kernel test for s390
      tests/acceptance: add replay kernel test for openrisc
      tests/acceptance: add replay kernel test for nios2
      tests/acceptance: add replay kernel test for alpha


 MAINTAINERS                       |   1 +
 tests/acceptance/replay_kernel.py |  39 ++++++++++
 tests/acceptance/replay_linux.py  | 116 ++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 tests/acceptance/replay_linux.py

--
Pavel Dovgalyuk

