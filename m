Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA179CCD1D
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 00:28:12 +0200 (CEST)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGsX5-0007Hh-Qv
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 18:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGsBe-0001x6-IN
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGsBd-0007A8-Hg
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:21412)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGsBd-00079u-AX
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 15:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; d="scan'208";a="191915366"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2019 15:05:58 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 0/4] migration: trivial cleanup and refine
Date: Sun,  6 Oct 2019 06:05:13 +0800
Message-Id: <20191005220517.24029-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set contains several cleanup and refine for migration.

    simplify some calculation
    reuse the result
    fix typo in comment
    provide error message when failed

Wei Yang (4):
  migration/ram: only possible bit set in invalid_flags is
    RAM_SAVE_FLAG_COMPRESS_PAGE
  migration/postcopy: fix typo in mark_postcopy_blocktime_begin's
    comment
  migration: pass in_postcopy instead of check state again
  migration: report SaveStateEntry id and name on failure

 migration/migration.c    | 3 +--
 migration/postcopy-ram.c | 8 +++++---
 migration/ram.c          | 5 +----
 migration/savevm.c       | 2 ++
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.17.1


