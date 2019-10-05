Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C1CCA32
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Oct 2019 15:52:38 +0200 (CEST)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGkU7-0000u4-OF
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 09:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGkSb-0008VW-3y
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 09:51:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGkSa-0002P7-6a
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 09:51:00 -0400
Received: from mga17.intel.com ([192.55.52.151]:55818)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGkSZ-0002Lv-W1
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 09:51:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 06:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,260,1566889200"; d="scan'208";a="276324067"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 05 Oct 2019 06:50:51 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 0/2] migration/postcopy: map tmp and large zero page in setup
 stage
Date: Sat,  5 Oct 2019 21:50:19 +0800
Message-Id: <20191005135021.21721-1-richardw.yang@linux.intel.com>
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

Currently we map these page when we want to use it, while this may be a
little late.

To make the code consistency, these two patches move the map into
postcopy_ram_incoming_setup.

Wei Yang (2):
  migration/postcopy: allocate tmp_page in setup stage
  migration/postcopy: map large zero page in
    postcopy_ram_incoming_setup()

 migration/postcopy-ram.c | 74 +++++++++++++++-------------------------
 migration/postcopy-ram.h |  7 ----
 migration/ram.c          |  2 +-
 3 files changed, 28 insertions(+), 55 deletions(-)

-- 
2.17.1


