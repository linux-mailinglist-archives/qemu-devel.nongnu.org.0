Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C92372384
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:19:48 +0200 (CEST)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhqt-0001Ut-H3
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhI3-00023u-If
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhHz-000792-Lc
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620081822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VKwa7ptClcnRom5kppDRU4BTRc6DZhsAUJTRhQ1gBJ4=;
 b=iOZj1HuTvribOaNzZMOzs1WfnC6Z4JXBfC1ex9lmk2VpUFVkVpEf+E2d3eOCSgfEX/YhTr
 Yx1bdWvM9JlZ8K6vbXgyJ5bJqCVo2tFQUiAWXk4WNCw/+sifGbzYs3npnjCDHG5ax5f5+0
 1dOP3LPTX3MgTZlblt/R9OCaY+jkG7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-yGK8jGLiPkGrHtILCKa7sw-1; Mon, 03 May 2021 18:43:38 -0400
X-MC-Unique: yGK8jGLiPkGrHtILCKa7sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6696107ACE8
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 22:43:37 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-131.gru2.redhat.com
 [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C2E860937;
 Mon,  3 May 2021 22:43:29 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] tests/acceptance: Introducing the ConsoleMixIn
Date: Mon,  3 May 2021 19:43:19 -0300
Message-Id: <20210503224326.206208-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: willianr@redhat.com, philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The avocado_qemu package provides the following methods to interact with the
guest via console, which are mainly used on the acceptance boot tests:

 exec_command(), exec_command_and_wait_for_pattern(), wait_for_console_pattern(),
 interrupt_interactive_console_until_pattern()

Those methods are loosely defined in avocado_qemu/__init__.py. Because that file is expected to
grow, I thought that for the sake of keeping it organized it would be better to logically group
them. So in this series I create the ConsoleMixIn class to be the new home for the console
methods. An alternative approach could be to create a separated package, however because
they are just a few methods at the moment, I prefered not to break avocado_qemu into smaller pieces.

As the "MixIn" in the name implies, the class is meant to be used as a mixin on the test class. Here
I am following an idea introduced by Cleber in [1].

This series was tested on CI (https://gitlab.com/wainersm/qemu/-/pipelines/296412039)

[1] http://next.patchew.org/QEMU/20210412044644.55083-1-crosa@redhat.com/

Wainer dos Santos Moschetta (7):
  tests/acceptance: Introduce the ConsoleMixIn class
  tests/acceptance: Move exec_command to ConsoleMixIn
  tests/acceptance: Move exec_command_and_wait_for_pattern to
    ConsoleMixIn
  tests/acceptance: Sun4uMachine: Remove dependency to LinuxKernelTest
  tests/acceptance: replay_kernel: Remove unused
    wait_for_console_pattern
  tests/acceptance: Move wait_for_console_pattern to ConsoleMixIn
  tests/acceptance: Move _console_interaction to ConsoleMixIn

 tests/acceptance/avocado_qemu/__init__.py    | 161 +++++++++----------
 tests/acceptance/boot_linux_console.py       | 133 ++++++++-------
 tests/acceptance/boot_xen.py                 |   5 +-
 tests/acceptance/linux_ssh_mips_malta.py     |   8 +-
 tests/acceptance/machine_arm_canona1100.py   |   6 +-
 tests/acceptance/machine_arm_integratorcp.py |   8 +-
 tests/acceptance/machine_arm_n8x0.py         |   6 +-
 tests/acceptance/machine_microblaze.py       |   8 +-
 tests/acceptance/machine_mips_loongson3v.py  |   6 +-
 tests/acceptance/machine_mips_malta.py       |   6 +-
 tests/acceptance/machine_ppc.py              |  10 +-
 tests/acceptance/machine_rx_gdbsim.py        |  15 +-
 tests/acceptance/machine_s390_ccw_virtio.py  |  79 +++++----
 tests/acceptance/machine_sparc64_sun4u.py    |  13 +-
 tests/acceptance/machine_sparc_leon3.py      |   8 +-
 tests/acceptance/multiprocess.py             |  14 +-
 tests/acceptance/ppc_prep_40p.py             |  16 +-
 tests/acceptance/replay_kernel.py            |   1 -
 tests/acceptance/virtio-gpu.py               |  16 +-
 tests/acceptance/virtiofs_submounts.py       |   1 -
 20 files changed, 249 insertions(+), 271 deletions(-)

-- 
2.29.2


