Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BD53A2A25
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:26:27 +0200 (CEST)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIpO-0000YY-9A
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lrInv-0007Cy-Em
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:24:55 -0400
Received: from mail.ispras.ru ([83.149.199.84]:55498)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lrInt-00039q-CD
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:24:55 -0400
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3B20B407625A;
 Thu, 10 Jun 2021 11:24:39 +0000 (UTC)
Subject: [PATCH 0/6] More record/replay acceptance tests
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Jun 2021 14:24:37 +0300
Message-ID: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
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

New tests include kernel boot for s390x, ppc64, alpha, nios2, and openrisc,
and Linux boot with cloudinit image for x86_64.

---

Pavel Dovgaluk (1):
      tests/acceptance: Linux boot test for record/replay

Pavel Dovgalyuk (5):
      tests/acceptance: add replay kernel test for s390
      tests/acceptance: add replay kernel test for ppc64
      tests/acceptance: add replay kernel test for openrisc
      tests/acceptance: add replay kernel test for nios2
      tests/acceptance: add replay kernel test for alpha


 MAINTAINERS                            |   1 +
 tests/acceptance/boot_linux_console.py |  12 +++
 tests/acceptance/replay_kernel.py      |  39 +++++++++
 tests/acceptance/replay_linux.py       | 116 +++++++++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 tests/acceptance/replay_linux.py

--
Pavel Dovgalyuk

