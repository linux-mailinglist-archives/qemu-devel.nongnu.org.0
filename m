Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A760FD1DE8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 03:16:57 +0200 (CEST)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIN4a-0000w8-21
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 21:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIN2Y-00085t-Dw
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 21:14:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIN2X-000664-Ex
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 21:14:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:9554)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iIN2X-0005WK-81
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 21:14:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 18:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; d="scan'208";a="193044648"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2019 18:13:42 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com,
	peterx@redhat.com
Subject: [PATCH v2 0/2] migration/postcopy: cleanup related to postcopy
Date: Thu, 10 Oct 2019 09:13:14 +0800
Message-Id: <20191010011316.31363-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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

Refine a function name and handle on corner case related to PostcopyState.

v2:
   * remove one unnecessary patch
   * simplify corner case handling

Wei Yang (2):
  migration/postcopy: rename postcopy_ram_enable_notify to
    postcopy_ram_incoming_setup
  migration/postcopy: check PostcopyState before setting to
    POSTCOPY_INCOMING_RUNNING

 migration/postcopy-ram.c | 4 ++--
 migration/postcopy-ram.h | 2 +-
 migration/savevm.c       | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.17.1


