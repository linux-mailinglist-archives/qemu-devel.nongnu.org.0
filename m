Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9403A2CCD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:19:56 +0200 (CEST)
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKbD-0006Rs-Kq
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lrKYC-0000uf-BY
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:16:49 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:57840 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lrKYA-0001JS-Tj
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:16:48 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 83A5960311111; Thu, 10 Jun 2021 09:16:46 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v6 cxl2.0-v6-doe 6/6] test/cdat: CXL CDAT test data
Date: Thu, 10 Jun 2021 09:16:44 -0400
Message-Id: <1623331004-18651-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
References: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.398,
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
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com, f4bug@amsat.org,
 hchkuo@avery-design.com.tw, tyshao@avery-design.com.tw,
 jonathan.cameron@huawei.com, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: hchkuo <hchkuo@avery-design.com.tw>

Pre-built CDAT table for testing, contains one CDAT header and six
CDAT entries: DSMAS, DSLBIS, DSMSCIS, DSIS, DSEMTS, and SSLBIS
respectively.

Signed-off-by: hchkuo <hchkuo@avery-design.com.tw>
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


