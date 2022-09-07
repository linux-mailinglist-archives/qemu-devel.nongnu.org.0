Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FAE5AFD0B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 09:04:48 +0200 (CEST)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVp79-0002EY-5L
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 03:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oVp2x-0000LK-QL
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 03:00:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:36347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oVp2v-00032M-Ja
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 03:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662534025; x=1694070025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f8KXX9KmoLUXQaBkJ6y2/TNV3cBZVK2hD5py6tGkxLQ=;
 b=ibFcJ975zZpPq28Z9Ynu6PdzmDJazlngHzJcysPPNEpBufZ2Fr/ueZMf
 cpp5OY08WkA1Ja3gu7YpzSoBcfoiR9WYnAOS6qwZsITwXL1QZu1fVZBD+
 BxB89Q2BjqXImVcG6VH8ZYKKh7aVADSmzu9wANNiBYp63Fcbea99zrzt8
 /kWgbRb+cFrcBO4wjXDpchQZh0owR73NpalqUsHEMwmB92ofSKI4wtAGy
 ELGCD6odsUUPu79bEF7uUQfEzf8IHrCZSCV/Ylmuxj3qKRih0OfUOD0Ac
 S6oKQj/EDADFPxdO76rH24ZdT5Jlsmbqs+hP2AvRww2nxsdcvjQe8Xl1e A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="296797730"
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; d="scan'208";a="296797730"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 00:00:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; d="scan'208";a="676049948"
Received: from trist.sh.intel.com ([10.239.160.37])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 00:00:14 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	f4bug@amsat.org,
	lei4.wang@intel.com
Subject: [PATCH] .gitignore: add .cache/ to .gitignore
Date: Wed,  7 Sep 2022 23:00:10 +0800
Message-Id: <20220907150010.2047037-1-lei4.wang@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=192.55.52.115;
 envelope-from=lei4.wang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

$PROJECT/.cache/clangd/index is the intended location for project index
data when using clangd as the language server. Ignore this directory to
keep the git status clean.

Signed-off-by: Wang, Lei <lei4.wang@intel.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 9726a778b3..8aab671265 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,5 +1,6 @@
 /GNUmakefile
 /build/
+/.cache/
 *.pyc
 .sdk
 .stgit-*
-- 
2.37.3


