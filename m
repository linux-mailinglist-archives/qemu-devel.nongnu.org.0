Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DFA189745
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 09:33:54 +0100 (CET)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEU9B-0000Le-Nm
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 04:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1jEU84-0007ys-Ub
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 04:32:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1jEU83-0005Hh-8t
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 04:32:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:46253)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1jEU83-0003Vo-0e
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 04:32:43 -0400
IronPort-SDR: CgP6E2jYsrH03sUfRnWKS6x+j6VnrR1/JagaMmqae0ztpQjqjz1+BpCpD0l0YveajqIZAVCHRw
 UU6LoJrBsLIw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 01:32:31 -0700
IronPort-SDR: OFq+im5XYHmAiAT6cpHI6gB5kits1aWQGMhx0jGWTZPT1WaC2XAmaUyB80B4lPjXPGhr/j0Or6
 DYejUyLU9VRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="444090104"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2020 01:32:29 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] net/colo-compare.c: Expose COLO-compare parameters to
 users
Date: Wed, 18 Mar 2020 16:23:18 +0800
Message-Id: <20200318082320.20768-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.31
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
Cc: Daniel Cho <danielcho@qnap.com>, Zhang Chen <chen.zhang@intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Make a way to config COLO "compare_timeout" and "expired_scan_cycle" parameters
according to user's scenarios and environments.

V2:
 - Rebased on upstream.
 - Fixed typos.

Zhang Chen (2):
  net/colo-compare.c: Expose "compare_timeout" to users
  net/colo-compare.c: Expose "expired_scan_cycle" to users

 net/colo-compare.c | 95 +++++++++++++++++++++++++++++++++++++++++++---
 qemu-options.hx    | 10 +++--
 2 files changed, 97 insertions(+), 8 deletions(-)

-- 
2.17.1


