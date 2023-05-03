Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45A6F4E0D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:14:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu07W-0006Oo-Kp; Tue, 02 May 2023 20:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pu07H-0006Li-QQ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 20:13:08 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pu07F-0003bn-9v
 for qemu-devel@nongnu.org; Tue, 02 May 2023 20:13:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03DE162489;
 Wed,  3 May 2023 00:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C191CC433D2;
 Wed,  3 May 2023 00:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683072775;
 bh=Hc+CK4izg6ZeLNij4MNVlF/J5A1K6THQoQ0eR+ndnKo=;
 h=Date:From:To:cc:Subject:From;
 b=aHJ3VuqGiZV94MaGH5LuLKWIct5GoY+8SvNYy+OtvnpYwd+Pur5gRa8gVsjlmhKuP
 adGPw8wywgufFn8M74klObYxVWhFGGVv/6yniOPljzywTu3zeTmOo+mZPPL8UeOll7
 +ChQ6GjY+7zdv9VCav/U/lan7dEc6AFOxa4OuiYBuUmI2MflveZPLS8kkfVo9Z0X4Y
 RspjcK/jV7+4IDYVaniLMM7ChV6284zRt+MJUqaxjqtl4k0qishaJQzrDw26Uj6GC8
 l5zLEI++S2Mkx/WWMP7YuhMB/hpIuTaqq69yxCZRL3lOCKo0dxuHIko2K+nt391qCZ
 t1IdMXkzoorzA==
Date: Tue, 2 May 2023 17:12:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: peter.maydell@linaro.org
cc: sstabellini@kernel.org, qemu-devel@nongnu.org, vikram.garhwal@amd.com
Subject: [PULL v3 0/10] xenpvh3-tag
Message-ID: <alpine.DEB.2.22.394.2305021708010.974517@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

Vikram fixed the gitlab test problem, so now all the tests should
succeed. There were no changes to the QEMU code. I am resending the pull
request (I rebased it on staging, no conflicts.)

For reference this was the previous pull request:
https://marc.info/?l=qemu-devel&m=167641819725964

Cheers,

Stefano


The following changes since commit 4ebc33f3f3b656ebf62112daca6aa0f8019b4891:

  Merge tag 'pull-tcg-20230502-2' of https://gitlab.com/rth7680/qemu into staging (2023-05-02 21:18:45 +0100)

are available in the Git repository at:

  https://gitlab.com/sstabellini/qemu xenpvh3-tag

for you to fetch changes up to bc618c54318cbc2fcb9decf9d4c193cc336a0dbc:

  meson.build: enable xenpv machine build for ARM (2023-05-02 17:04:54 -0700)

----------------------------------------------------------------
Stefano Stabellini (5):
      hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
      xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common
      include/hw/xen/xen_common: return error from xen_create_ioreq_server
      hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
      meson.build: do not set have_xen_pci_passthrough for aarch64 targets

Vikram Garhwal (5):
      hw/i386/xen/: move xen-mapcache.c to hw/xen/
      hw/i386/xen: rearrange xen_hvm_init_pc
      hw/xen/xen-hvm-common: Use g_new and error_report
      hw/arm: introduce xenpvh machine
      meson.build: enable xenpv machine build for ARM

 docs/system/arm/xenpvh.rst       |   34 ++
 docs/system/target-arm.rst       |    1 +
 hw/arm/meson.build               |    2 +
 hw/arm/xen_arm.c                 |  181 +++++++
 hw/i386/meson.build              |    1 +
 hw/i386/xen/meson.build          |    1 -
 hw/i386/xen/trace-events         |   19 -
 hw/i386/xen/xen-hvm.c            | 1075 ++++----------------------------------
 hw/xen/meson.build               |    7 +
 hw/xen/trace-events              |   19 +
 hw/xen/xen-hvm-common.c          |  879 +++++++++++++++++++++++++++++++
 hw/{i386 => }/xen/xen-mapcache.c |    0
 include/hw/arm/xen_arch_hvm.h    |    9 +
 include/hw/i386/xen_arch_hvm.h   |   11 +
 include/hw/xen/arch_hvm.h        |    5 +
 include/hw/xen/xen-hvm-common.h  |   99 ++++
 include/hw/xen/xen_native.h      |   13 +-
 meson.build                      |    4 +-
 18 files changed, 1350 insertions(+), 1010 deletions(-)
 create mode 100644 docs/system/arm/xenpvh.rst
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/xen/xen-hvm-common.c
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)
 create mode 100644 include/hw/arm/xen_arch_hvm.h
 create mode 100644 include/hw/i386/xen_arch_hvm.h
 create mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen-hvm-common.h

