Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534406C8199
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:42:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjSq-0004Lb-Ln; Fri, 24 Mar 2023 11:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjSn-00042A-C2
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjSl-0001gD-I4
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ufpglkyFrIWPC2Wvy7lw0mcyi8rsW4U9LoxKgR6wvRw=;
 b=Xjc2BXpxv+U3+FtZj3uIAQGMWCEa47XsCR/8syn0+qk1e6xf2KRcKWlOtVcsyspqHpX6DF
 Gx2i+No35L71rlQ+AXHdtv62GSHxFApcx8x6n3fzMO/UuPLtlEbwNxgqgJl7+ghtLUOERv
 d3i1dwBhP/GVPN3fMiPfxbsQiUHW9jY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-lGoYOW_tMOOa6T8BIR756g-1; Fri, 24 Mar 2023 11:36:14 -0400
X-MC-Unique: lGoYOW_tMOOa6T8BIR756g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0E5D38221DD;
 Fri, 24 Mar 2023 15:36:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BDCB140EBF4;
 Fri, 24 Mar 2023 15:36:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/8] Misc patches for QEMU 8.0-rc2
Date: Fri, 24 Mar 2023 16:36:02 +0100
Message-Id: <20230324153610.224673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:

  Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-24

for you to fetch changes up to 8635a3a153da3a6712c4ee249c2bf3513cbfdbf7:

  Revert "docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation" (2023-03-24 12:10:49 +0100)

----------------------------------------------------------------
* Remove TABs in hw/ide and hw/block
* Two fixes for GCC 13
* MSYS2 CI job improvements

----------------------------------------------------------------
Cédric Le Goater (2):
      target/s390x: Fix float_comp_to_cc() prototype
      target/ppc: Fix helper_pminsn() prototype

Marc-André Lureau (1):
      ui/spice: fix compilation on win32

Philippe Mathieu-Daudé (2):
      gitlab-ci: Cover SPICE in the MSYS2 job
      cirrus-ci: Remove MSYS2 jobs duplicated with gitlab-ci

Thomas Huth (1):
      Revert "docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation"

Yeqi Fu (2):
      hw/ide: replace TABs with space
      hw/block: replace TABs with space

 MAINTAINERS                   |   3 +-
 docs/about/deprecated.rst     |   9 --
 include/hw/block/flash.h      |  20 +--
 include/hw/ide/internal.h     | 248 ++++++++++++++---------------
 target/s390x/s390x-internal.h |   3 +-
 hw/block/fdc.c                |   4 +-
 hw/block/nand.c               | 222 +++++++++++++-------------
 hw/block/onenand.c            | 128 +++++++--------
 hw/block/tc58128.c            | 136 ++++++++--------
 hw/ide/cmd646.c               |  28 ++--
 hw/ide/core.c                 |  84 +++++-----
 hw/ide/microdrive.c           | 360 +++++++++++++++++++++---------------------
 target/ppc/excp_helper.c      |   2 +-
 ui/spice-core.c               |   2 +-
 .cirrus.yml                   | 111 -------------
 .gitlab-ci.d/windows.yml      |   2 +
 16 files changed, 622 insertions(+), 740 deletions(-)
 delete mode 100644 .cirrus.yml


