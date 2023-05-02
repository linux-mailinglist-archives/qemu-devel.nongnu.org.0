Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5C6F4016
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmEm-0004zw-Vw; Tue, 02 May 2023 05:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEk-0004z2-2m
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:23:54 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEi-0003zM-JL
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019431; bh=bQQvCx31M4vekj2rknUKPAqUmbQz4GRIzBFReFyfIzI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=HxooxGhAkIY7cGYiBmJsUqtPn6TIO9yvZWf/WPsU8LEQ85P51gxgOE9xZC930G3Z7
 OlsQTf6VlQbU0uAeRIVgomOp9aDNNaJ/CCxmLcll7UI0wGG45ddPfnPqq5q5yb0n1v
 Z/qQQdBSUXpHTPEv2pqEwhtjHZclAk765TC0m96ei90j7mPXxXAjd9WAmwr95aiN9+
 UNf5Ua2UukbLzgxHbE5ig1YrWegPfq1484e3ULCb1Ged6wRs9ajG9F8Co1aJ/ld9F+
 csdMfTVNUAA1gdSIL3i0xacidriUM8ZQgFyZjTwuj8Za0MCwfwJs/jaklpXUacW4uE
 fUJJV86FXAQxw==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 3B4F526337E1;
 Tue,  2 May 2023 09:23:48 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 02/12] simpletrace: Annotate magic constants from QEMU code
Date: Tue,  2 May 2023 11:23:29 +0200
Message-Id: <20230502092339.27341-3-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5ye3mee2UTaR4haVwc9YY3PFB5RqNemA
X-Proofpoint-ORIG-GUID: 5ye3mee2UTaR4haVwc9YY3PFB5RqNemA
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1030 mlxlogscore=613 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305020080
Received-SPF: pass client-ip=17.58.23.196; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021701.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mads Ynddal <m.ynddal@samsung.com>

It wasn't clear where the constants and structs came from, so I added
comments to help.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 9211caaec1..7ba805443d 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -15,15 +15,15 @@
 from tracetool import read_events, Event
 from tracetool.backend.simple import is_string
 
-header_event_id = 0xffffffffffffffff
-header_magic    = 0xf2b177cb0aa429b4
-dropped_event_id = 0xfffffffffffffffe
+header_event_id = 0xffffffffffffffff # trace/simple.c::HEADER_EVENT_ID
+header_magic    = 0xf2b177cb0aa429b4 # trace/simple.c::HEADER_MAGIC
+dropped_event_id = 0xfffffffffffffffe # trace/simple.c::DROPPED_EVENT_ID
 
-record_type_mapping = 0
-record_type_event = 1
+record_type_mapping = 0 # trace/simple.c::TRACE_RECORD_TYPE_MAPPING
+record_type_event = 1 # trace/simple.c::TRACE_RECORD_TYPE_EVENT
 
-log_header_fmt = '=QQQ'
-rec_header_fmt = '=QQII'
+log_header_fmt = '=QQQ' # trace/simple.c::TraceLogHeader
+rec_header_fmt = '=QQII' # trace/simple.c::TraceRecord
 
 def read_header(fobj, hfmt):
     '''Read a trace record header'''
-- 
2.38.1


