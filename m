Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE01B0064
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 06:01:56 +0200 (CEST)
Received: from localhost ([::1]:56910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQNd5-0007Zs-BO
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 00:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wei.w.wang@intel.com>) id 1jQNcF-00073U-Fe
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 00:01:03 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <wei.w.wang@intel.com>) id 1jQNcD-0000iq-Hl
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 00:01:03 -0400
Received: from mga09.intel.com ([134.134.136.24]:39943)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1jQNcC-0000bQ-UK
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 00:01:01 -0400
IronPort-SDR: ifL10P3UZUPL+mb/QdVRXpJzjelveP6d/+zykw4phOMjAztqqFS5Dj3+gKlvey812hF5GLVmjw
 g7peStOKmzwQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 21:00:53 -0700
IronPort-SDR: a1oBbC/UOtemDJnn5RMpeqRX5Sj8OmeTcYK/LIssgL+9mOf9KP7AbVtobZTOVOakuQabPZTfJ6
 JtzPjAGMYWUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; d="scan'208";a="333790694"
Received: from unknown (HELO devel-ww.sh.intel.com) ([10.239.48.118])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2020 21:00:51 -0700
From: Wei Wang <wei.w.wang@intel.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 peterx@redhat.com
Subject: [PATCH v1 0/2] Migration xbzrle changes
Date: Mon, 20 Apr 2020 11:06:41 +0800
Message-Id: <1587352003-3312-1-git-send-email-wei.w.wang@intel.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=134.134.136.24; envelope-from=wei.w.wang@intel.com;
 helo=mga09.intel.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 00:00:54
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 134.134.136.24
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
Cc: gloryxiao@tencent.com, kevin.tian@intel.com, wei.w.wang@intel.com,
 yi.y.sun@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patches change/add some xbzrle statistics to give users some useful
feedbacks about the delta operations.

Wei Wang (2):
  migration/xbzrle: replace transferred xbzrle bytes with encoded bytes
  migration/xbzrle: add encoding rate

 migration/migration.c |  3 ++-
 migration/ram.c       | 49 +++++++++++++++++++++++++++++++++----------
 monitor/hmp-cmds.c    |  6 ++++--
 qapi/migration.json   | 11 ++++++----
 slirp                 |  2 +-
 5 files changed, 52 insertions(+), 19 deletions(-)

-- 
2.20.1


