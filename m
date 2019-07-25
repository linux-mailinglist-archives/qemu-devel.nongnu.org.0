Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BF374284
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 02:21:27 +0200 (CEST)
Received: from localhost ([::1]:55044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqRVd-0006zh-Mh
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 20:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40430)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqRVA-00065A-DM
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:20:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqRV9-0001a6-H0
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:20:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:22099)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hqRV9-0001Zy-9e
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:20:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 17:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,304,1559545200"; d="scan'208";a="177817216"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2019 17:20:52 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 08:20:21 +0800
Message-Id: <20190725002023.2335-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [PATCH v2 0/2] migration: cleanup ram_load
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two cleanup for ram_load:

* return -EINVAL for version_id mismatch
* extract ram_load_precopy for better readability

v2: fix a comment

Wei Yang (2):
  migration: return -EINVAL directly when version_id mismatch
  migration: extract ram_load_precopy

 migration/ram.c | 73 +++++++++++++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 27 deletions(-)

-- 
2.17.1


