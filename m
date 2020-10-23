Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33193296DF4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 13:51:02 +0200 (CEST)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVvb3-0007mo-7M
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 07:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ee01926a11b1f9bffcd6cdec0961dd9d1882da71@lizzy.crudebyte.com>)
 id 1kVvY0-0003si-GJ
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:47:52 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:45537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ee01926a11b1f9bffcd6cdec0961dd9d1882da71@lizzy.crudebyte.com>)
 id 1kVvXh-0004GW-OY
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=9yD19keIkp51kv1y74QDaQabTucgjzlqCLausHOKVt0=; b=S+Z0n
 IyE8z5DTLnGZ4/W3L7F2Qx2CouuF1GYwm5KP/oKxRDuxKCM1kAPba2SpbX2zXESpR+XetrqpR6adq
 nDXUfeAql7KFgQ32tpnzBXR+BQVvAJrCDdkmEDym0X/V8sV+ZvqCS2JQ0WcL728+DBZ/8/AQYk9D5
 6yci627V+oVKsdsx3tL4T7MpjlLcL2KjdDtrfOBH7C2zYH6PPoKMybs/lCFy78OxtYAXAu+lGm51J
 wMGYmtmduXTRONWvDWnu9DuEGRwGUpBnshltOcLKxkARlaw/sy6R2MopY8+NrysJYNWbksJMZ0E+/
 3YeneZ4Xea6AM248N5GXSO1wgxnTQ==;
Message-Id: <cover.1603452058.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 23 Oct 2020 13:20:58 +0200
Subject: [PULL 00/13] 9p queue 2020-10-23
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=ee01926a11b1f9bffcd6cdec0961dd9d1882da71@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 07:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 4c5b97bfd0dd54dc27717ae8d1cd10e14eef1430:

  Merge remote-tracking branch 'remotes/kraxel/tags/modules-20201022-pull-request' into staging (2020-10-22 12:33:21 +0100)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20201023

for you to fetch changes up to ee01926a11b1f9bffcd6cdec0961dd9d1882da71:

  tests/9pfs: add local Tunlinkat hard link test (2020-10-22 20:26:33 +0200)

----------------------------------------------------------------
9pfs: more tests using local fs driver

Only 9pfs test case changes this time:

* Refactor: Rename functions to make top-level test functions fs_*()
  easily distinguishable from utility test functions do_*().

* Refactor: Drop unnecessary function arguments in utility test
  functions.

* More test cases using the 9pfs 'local' filesystem driver backend,
  namely for the following 9p requests: Tunlinkat, Tlcreate, Tsymlink
  and Tlink.

----------------------------------------------------------------
Christian Schoenebeck (8):
      tests/9pfs: simplify do_mkdir()
      tests/9pfs: add local Tunlinkat directory test
      tests/9pfs: add local Tlcreate test
      tests/9pfs: add local Tunlinkat file test
      tests/9pfs: add local Tsymlink test
      tests/9pfs: add local Tunlinkat symlink test
      tests/9pfs: add local Tlink test
      tests/9pfs: add local Tunlinkat hard link test

Greg Kurz (5):
      tests/9pfs: Factor out do_version() helper
      tests/9pfs: Set alloc in fs_create_dir()
      tests/9pfs: Factor out do_attach() helper
      tests/9pfs: Turn fs_readdir_split() into a helper
      tests/9pfs: Turn fs_mkdir() into a helper

 tests/qtest/virtio-9p-test.c | 467 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 431 insertions(+), 36 deletions(-)

