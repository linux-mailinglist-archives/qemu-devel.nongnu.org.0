Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B27126C12C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 11:54:08 +0200 (CEST)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIU8d-0007pS-B9
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 05:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c418f935ac6aed9aa1dc0ceb4b19044a9b7b7968@lizzy.crudebyte.com>)
 id 1kIU79-0006Yb-HK
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 05:52:35 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c418f935ac6aed9aa1dc0ceb4b19044a9b7b7968@lizzy.crudebyte.com>)
 id 1kIU77-0000Zv-NN
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 05:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=NfMJPFHOyqNdikdMcNm3dv6BKxSuV/xvG2I7xLjgPgY=; b=euLCY
 RSGI3na/zFRfVSPgmJ32N+3h8S0GSeMdsG2JeR3O2MZdPU1kaIkNYLYRdjfuFRMecgm1Qbp/6HQvR
 4ruTOCVuVhkhR94S3q1K9GJ+I8A2+jyo+s/yTPh3SVb0x07VHp3BUAE+mmWcF/xzz6ghzVyD11jv1
 aDll0Oyfr5Yr0VTYFzt1NIl7rpAs5nK6NdlvxouI8AYTzyrjr061MuIv26m5VnbgtGUBTys0tjCbD
 NYmTXyqsrTLHWxTClMB6mC/l+nInsUjPsZj1dITdAuGYUtNNKck4k1t+iT7knhKkYDmSyqgdD4CcA
 PJVcOzIQoAXU5XWl82Zgbk3wVZDCw==;
Message-Id: <cover.1600166281.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 15 Sep 2020 12:38:01 +0200
Subject: [PULL 0/2] 9p queue
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c418f935ac6aed9aa1dc0ceb4b19044a9b7b7968@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 05:20:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

The following changes since commit 2d2c73d0e3d504a61f868e46e6abd5643f38091b:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200914-1' into staging (2020-09-14 16:03:08 +0100)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20200915

for you to fetch changes up to c418f935ac6aed9aa1dc0ceb4b19044a9b7b7968:

  9pfs: disable msize warning for synth driver (2020-09-15 12:12:03 +0200)

----------------------------------------------------------------
The intention of the following two patches is making users aware about
the negative file I/O performance impact when using a very low value
for 9P client parameter 'msize', which especially is the case if no
'msize' parameter was supplied by the user with a 9P Linux client at all.

All it does is logging a performance warning on host side (once) in
that case. By setting 'msize' on client side to any value larger than
8192 the performance warning will disappear.

See https://wiki.qemu.org/Documentation/9psetup#msize for details.

----------------------------------------------------------------
Christian Schoenebeck (2):
      9pfs: log warning if msize <= 8192
      9pfs: disable msize warning for synth driver

 fsdev/file-op-9p.h | 4 ++++
 hw/9pfs/9p-synth.c | 2 ++
 hw/9pfs/9p.c       | 9 +++++++++
 3 files changed, 15 insertions(+)

