Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B36C400
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 03:06:06 +0200 (CEST)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnus1-0004P5-3p
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 21:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51891)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnuri-0003i2-Pr
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:05:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnurh-0003iw-Vu
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:05:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:22955)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnurh-0003hN-NY
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:05:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 18:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="173028779"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga006.jf.intel.com with ESMTP; 17 Jul 2019 18:05:41 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jul 2019 09:04:54 +0800
Message-Id: <20190718010456.4234-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH v3 0/2] bitmap: refine bitmap_set
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

v3:
  * free bmap
  * all 1's set correctly
  * expand range to 2 long
  * check each possible of offset
  * add a skeleton to test both bitmap_set and bitmap_set_atomic
v2:
  * refine bitmap_set_atomic
  * add a test case

Wei Yang (2):
  bitmap: get last word mask from nr directly
  test-bitmap: add test for bitmap_set

 tests/test-bitmap.c | 55 +++++++++++++++++++++++++++++++++++++++++++++
 util/bitmap.c       |  9 +++-----
 2 files changed, 58 insertions(+), 6 deletions(-)

-- 
2.17.1


