Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8686EC30DD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 12:05:35 +0200 (CEST)
Received: from localhost ([::1]:39942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFF2D-0002WZ-Uu
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 06:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iFEzl-0001Ms-UG
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:03:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iFEzk-00060H-OM
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:03:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:56932)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iFEzk-0005zM-H0
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:03:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 03:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="220948907"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2019 03:02:57 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 0/3] migration/postcopy: cleanup related to postcopy
Date: Tue,  1 Oct 2019 18:01:19 +0800
Message-Id: <20191001100122.17730-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first one just tries to make function name more easy for reading and
understanding.

The next two patches are related to PostcopyState.

Wei Yang (3):
  migration/postcopy: rename postcopy_ram_enable_notify to
    postcopy_ram_incoming_setup
  migration/postcopy: not necessary to do postcopy_ram_incoming_cleanup
    when state is ADVISE
  migration/postcopy: handle POSTCOPY_INCOMING_RUNNING corner case
    properly

 migration/migration.c    |  3 +--
 migration/postcopy-ram.c | 17 +++++++++++------
 migration/postcopy-ram.h |  5 +++--
 migration/savevm.c       | 13 +++++++------
 4 files changed, 22 insertions(+), 16 deletions(-)

-- 
2.17.1


