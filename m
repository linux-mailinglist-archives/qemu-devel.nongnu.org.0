Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C326F938
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 11:26:31 +0200 (CEST)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJCf0-0001Xs-3f
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 05:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kJCcy-0000F1-HP
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 05:24:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:42394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kJCcv-0004Pi-9M
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 05:24:24 -0400
IronPort-SDR: cjzugyUeudmAsqMQ+3eiheSIuTSRkHRpgOCeiSgz0fySULciS7K7jeQFMKGV8kckI+6rOtU2vt
 /iqA26ONoFgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="244733371"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="244733371"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 02:24:14 -0700
IronPort-SDR: UjXvPhpXbkbdzZoUrB5QTQUuoJseLkZX+OdGJZY0tfdlrAaFKjW2XvMRPYe/Q0ax2xxcUpmF8v
 PdH0Ba7XnN8Q==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="484130665"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 02:24:12 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 0/4] Several optimization and bugfix for COLO compare.
Date: Fri, 18 Sep 2020 17:21:59 +0800
Message-Id: <20200918092203.20384-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 05:24:15
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Add COLO secondary old packet detection and fix some bugs.

Zhang Chen (4):
  net/colo-compare.c: Fix compare_timeout format issue
  net/colo-compare.c: Change the timer clock type
  net/colo-compare.c: Add secondary old packet detection
  net/colo-compare.c: Increase default queued packet scan frequency

 net/colo-compare.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

-- 
2.17.1


