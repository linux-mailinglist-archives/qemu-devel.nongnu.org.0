Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA02D6B746
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 09:12:17 +0200 (CEST)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hne6q-0005hw-Lj
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 03:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hne6V-0004re-SY
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 03:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hne6U-0003rt-SY
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 03:11:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:63222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hne6U-0003qg-Kd
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 03:11:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 00:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; d="scan'208";a="158376944"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga007.jf.intel.com with ESMTP; 17 Jul 2019 00:11:51 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 15:11:12 +0800
Message-Id: <20190717071114.14772-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH v2 0/2] bitmap: refine bitmap_set
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
Cc: quintela@redhat.com, corentincj@iksaif.net, pl@kamp.de, peterx@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1 refine bitmap_set a little.
Patch 2 add related test case to bitmap_set.

v2:
  * refine bitmap_set_atomic
  * add a test case

Wei Yang (2):
  bitmap: get last word mask from nr directly
  test-bitmap: add test for bitmap_set

 tests/test-bitmap.c | 33 +++++++++++++++++++++++++++++++++
 util/bitmap.c       |  9 +++------
 2 files changed, 36 insertions(+), 6 deletions(-)

-- 
2.17.1


