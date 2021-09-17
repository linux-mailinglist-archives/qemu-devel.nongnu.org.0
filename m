Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C840EE50
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 02:19:01 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR1am-0005o2-R1
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 20:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR1XX-0003Yq-Rc
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 20:15:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:56721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR1XO-0002rA-JJ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 20:15:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="222743995"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="222743995"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 17:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="434688331"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.202])
 by orsmga003.jf.intel.com with ESMTP; 16 Sep 2021 17:15:24 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] ui/gtk-egl: fix for untab/tab problem
Date: Thu, 16 Sep 2021 17:13:16 -0700
Message-Id: <20210917001320.6515-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=dongwon.kim@intel.com; helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes several problems happening while doing VC untab/tab.

Dongwon Kim (4):
  ui/gtk-egl: un-tab and re-tab should destroy egl surface and context
  ui/gtk-egl: make sure the right context is set as the current
  ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound
  ui/gtk-egl: guest fb texture needs to be regenerated when
    reinitializing egl

 ui/gtk-egl.c | 10 ++++++++++
 ui/gtk.c     | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.17.1


