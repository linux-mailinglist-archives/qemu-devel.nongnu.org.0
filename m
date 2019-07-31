Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A117C7C53A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 16:44:13 +0200 (CEST)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hspps-0002Q8-BU
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 10:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44746)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hspp4-0001CL-Q9
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:43:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hspp4-0000v7-0m
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:43:22 -0400
Received: from mga01.intel.com ([192.55.52.88]:63828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hspp3-0000rq-OB
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:43:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 07:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="174776039"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 31 Jul 2019 07:43:13 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 22:42:23 +0800
Message-Id: <20190731144225.3784-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-devel] [PATCH 0/2] migration/qemu-file: cleanup and refine
 qemu-file
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

Two cleanup:

Patch #1 make code consistent on calling add_to_iovec
Patch #2 refine the code to handle the case when buf already flushed

Wei Yang (2):
  migration/qemu-file: remove check on writev_buffer in
    qemu_put_compression_data
  migration/qemu-file: fix potential buf waste for extra buf_index
    adjustment

 migration/qemu-file.c | 44 +++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

-- 
2.17.1


