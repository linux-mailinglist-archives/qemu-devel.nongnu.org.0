Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C01304D88
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 01:43:53 +0100 (CET)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Yw4-00078e-Gt
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 19:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <110bef3595cb841dfa1b86733c174ac9774eb37e@lizzy.crudebyte.com>)
 id 1l4YtW-00062d-8X
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:41:14 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:51471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <110bef3595cb841dfa1b86733c174ac9774eb37e@lizzy.crudebyte.com>)
 id 1l4YtU-0007rP-Im
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=rRNnqx/f2O/bJZQ/C/qhYZTykLu/mP/cdPSwOolEn7M=; b=Dkqui
 PTU5TOTRvIa65wsDZQgKRxHJJTc0SoA4u9l9UiV4Bn86i+mdAAM2Q/665yGnO73532p3Uezfv+4iJ
 Fr2e6KnWqKtdafKDC/Y+xtHTobLxSCS4qABYgR+2Vyncv4OpgKJP/ysu2XXcKSxmluUmgGhS+VrNA
 Meaafx1IsUG3ttP85lgaIF1vVjGDDRLdJAMk/JovryRsID2fdLe8VqA5v8zmrYMmoXiKx8xEnzKbs
 gnx7xM+Cb6jlqC30BxcUrQONIWa2HUgmuXE6DAf47c2kB8RJIjLo+CQHZ+NgZunjS37PkNOelmM4X
 6XnWdYWLp3d5K8a1Ig5PI7l5kJheg==;
Message-Id: <cover.1611704181.git.qemu_oss@crudebyte.com>
Date: Wed, 27 Jan 2021 00:36:21 +0100
Subject: [PATCH 0/5] enhance debugging with qtest framework
To: qemu-devel@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=110bef3595cb841dfa1b86733c174ac9774eb37e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

This series is a follow-up of the following previous series:
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02251.html
The 9p patches of the previous series have already been merged.

This series consists of 2 parts:

1. libqos patch 1 removes a limitation of the qtest/libqos subsystem:
   support for more than one device using the same (official) QEMU device
   name.

   Like discussed in the previous series, if nobody finds this patch useful
   then just ignore it. I needed it in the previou series before but
   eventually decided for a different approach and personally don't need it
   in near future.

2. Patches 2 to 5 enhance debugging issues with the qtest framework. I would
   appreciate if they got merged, because I still find them useful while
   working on new test cases.

Changes of these patches from derived series:

  * Squashed previous patches 1 & 2 -> [patch 1].

  * Dropped ANSI color escape sequences [patch 3].

  * Squashed previous patches 4 & 5 -> [patch 3].

  * Extended commit log to provide more details about purpose [patch 4].

Christian Schoenebeck (5):
  libqos/qgraph: add qos_node_create_driver_named()
  libqos/qgraph_internal: add qos_printf() and qos_printf_literal()
  tests/qtest/qos-test: dump qos graph if verbose
  tests/qtest/qos-test: dump environment variables if verbose
  tests/qtest/qos-test: dump QEMU command if verbose

 tests/qtest/libqos/qgraph.c          | 99 +++++++++++++++++++++++++++-
 tests/qtest/libqos/qgraph.h          | 36 ++++++++++
 tests/qtest/libqos/qgraph_internal.h | 12 ++++
 tests/qtest/qos-test.c               | 15 ++++-
 4 files changed, 158 insertions(+), 4 deletions(-)

-- 
2.20.1


