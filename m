Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D273177F87
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jul 2019 15:15:15 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrj18-0006DN-VJ
	for lists+qemu-devel@lfdr.de; Sun, 28 Jul 2019 09:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59643)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hriza-0004y7-Uv
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 09:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hrizZ-0002Pd-UA
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 09:13:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:27061)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hrizZ-0002Jl-KY
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 09:13:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jul 2019 06:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,318,1559545200"; d="scan'208";a="194965247"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2019 06:13:31 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Jul 2019 21:13:01 +0800
Message-Id: <20190728131304.1282-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH 0/3] memory-device: refine
 memory_device_get_free_addr
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
Cc: imammedo@redhat.com, david@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we iterate the memory-device list to get the available range, it is not
necessary to iterate the whole list.

1) the first non-overlap range is the proper one if no hint is provided
2) no more overlap for hinted range if tmp exceed it

Wei Yang (3):
  memory-device: not necessary to use goto for the last check
  memory-device: break the loop if no hint is provided
  memory-device: break the loop if tmp exceed the hinted range

 hw/mem/memory-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.17.1


