Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10E836B839
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:42:18 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5FR-0002X0-SL
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lb5AS-00009P-F9
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:37:09 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:39846 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lb5AR-0003Z1-2g
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:37:08 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 8E9FC60311111; Mon, 26 Apr 2021 13:37:06 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v5 cxl2.0-v3-doe 6/6] test/cdat: CXL CDAT test data
Date: Mon, 26 Apr 2021 13:37:03 -0400
Message-Id: <1619458623-14552-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619454964-10190-1-git-send-email-cbrowy@avery-design.com>
References: <1619454964-10190-1-git-send-email-cbrowy@avery-design.com>
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.399,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com,
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, jonathan.cameron@huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: hchkuo <hchkuo@avery-design.com.tw>

Pre-built CDAT table for testing, contains one CDAT header and six
CDAT entries: DSMAS, DSLBIS, DSMSCIS, DSIS, DSEMTS, and SSLBIS
respectively.

Signed-off-by: Chris Browy <cbrowy@avery-design.com>
---
 tests/data/cdat/cdat.dat | Bin 0 -> 148 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/cdat/cdat.dat

diff --git a/tests/data/cdat/cdat.dat b/tests/data/cdat/cdat.dat
new file mode 100644
index 0000000000000000000000000000000000000000..b66c5d5836bcce7490e698f9ab5071c623425c48
GIT binary patch
literal 148
ycmbQjz`($`14zJu1e^tBD1c~21`KhqG!ugem_{a;892aP794t585EF}W3U1CI069x

literal 0
HcmV?d00001

-- 
2.17.1


