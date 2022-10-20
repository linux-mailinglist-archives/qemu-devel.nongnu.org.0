Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D4605B22
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:30:24 +0200 (CEST)
Received: from localhost ([::1]:34518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRsb-00079T-Mi
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:30:21 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRsb-0006RZ-83
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1olRhP-0004Y8-0p; Thu, 20 Oct 2022 05:18:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:63699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1olRhM-0005Sl-1H; Thu, 20 Oct 2022 05:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666257524; x=1697793524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cw2kfMSp+kNWHjSP/FmMa70PbwhZ5kjdd+wg9g+eGVQ=;
 b=mkObqM1BeViN2eR1K+5E1PSoqhiHGaeATghUmWRpOltSvBbIuzcecV2l
 5zHq8nF+rt0EmWDRWQIUq9WSuF4PpKtsjOx5JjdJl8RoSUDPpekk0RiMK
 3LLUeOxTFj3MMU/Cp7AqXQwOJ0/E2k1fb1ULgoT5+TKhoZptQ+aYYeOJE
 h0BGHSVDEqX6aRr/RUDCwdhKTu6Gy+kmgTb15P5kXmZIRVcfbnpw5OIVf
 V3hhT/a84E2aCfTQc2x5e/oyjWFpyacbOLfqU7GZyIlnHtP+bcXI1hMVN
 6o4EYx+etvn1lIoaCZ1UCipFn4FYsQfyu+VP+scF7uy/UJdyAapn2XUcd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306652271"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="306652271"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 02:18:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="874890329"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="874890329"
Received: from lei.sh.intel.com ([10.239.160.148])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 02:18:34 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Subject: [PATCH] .gitignore: add multiple items to .gitignore
Date: Thu, 20 Oct 2022 17:19:21 +0000
Message-Id: <20221020171921.1078533-1-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lei4.wang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.256, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add /.vscode/, .clang-format and .gdb_history to .gitignore because:

 - For VSCode, workspace settings as well as debugging and task
 configurations are stored at the root in a .vscode folder;
 - For ClangFormat, the .clang-format file is searched relative to
 the current working directory when reading stdin;
 - For GDB, GDB command history file defaults to the value of the
 environment variable GDBHISTFILE, or to ./.gdb_history if this
 variable is not set.

Signed-off-by: Wang, Lei <lei4.wang@intel.com>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index 8aab671265..61fa39967b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,10 +1,13 @@
 /GNUmakefile
 /build/
 /.cache/
+/.vscode/
 *.pyc
 .sdk
 .stgit-*
 .git-submodule-status
+.clang-format
+.gdb_history
 cscope.*
 tags
 TAGS
-- 
2.34.1


