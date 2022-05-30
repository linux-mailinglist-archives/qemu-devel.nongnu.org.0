Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2FC538776
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:43:44 +0200 (CEST)
Received: from localhost ([::1]:49724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvkMh-0007jm-Uj
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1nvkKX-0006IE-SC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 14:41:29 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1nvkKV-00085N-Qu
 for qemu-devel@nongnu.org; Mon, 30 May 2022 14:41:29 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1nvkKK-0006e3-OH; Mon, 30 May 2022 20:41:16 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 0/2] Add myself as the maintainer for Hyper-V VMBus
Date: Mon, 30 May 2022 20:41:09 +0200
Message-Id: <cover.1653934780.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f7a1ea403e0282a7f57edd4298c4f65f24165da5:

  Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-29 16:34:56 -0700)

are available in the Git repository at:

  https://github.com/maciejsszmigiero/qemu.git tags/vmbus-maint-20220530

for you to fetch changes up to 6ede46b910ac66fd10bc169fb0a6f681429a9c5c:

  hw/hyperv/vmbus: Remove unused vmbus_load/save_req() (2022-05-30 19:49:42 +0200)

----------------------------------------------------------------

As discussed in https://lore.kernel.org/qemu-devel/4e03945d-fb92-494d-53a8-f22ee91501c9@redhat.com/
I am adding myself as the maintainer for Hyper-V VMBus, so there is some
contact point for incoming patches and somebody to review and pick up them.

The VMBus code is currently in a good shape, this pull request also
includes a single patch that has been waiting for being picked up since
November last year.

----------------------------------------------------------------

Maciej S. Szmigiero (1):
      MAINTAINERS: Add myself as the maintainer for Hyper-V VMBus

Philippe Mathieu-Daudé (1):
      hw/hyperv/vmbus: Remove unused vmbus_load/save_req()

 MAINTAINERS               |  6 +++
 hw/hyperv/vmbus.c         | 99 -----------------------------------------------
 include/hw/hyperv/vmbus.h |  3 --
 3 files changed, 6 insertions(+), 102 deletions(-)

