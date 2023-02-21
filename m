Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5C69DC7E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOWV-0007fa-PL; Tue, 21 Feb 2023 04:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWT-0007eG-M8
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:17 -0500
Received: from mr85p00im-ztdg06011201.me.com ([17.58.23.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWR-0005TV-Pl
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1676970073; bh=bQQvCx31M4vekj2rknUKPAqUmbQz4GRIzBFReFyfIzI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=C3Nv3AxnpGK/VQYYVWV9QUhvTPMeLYbY1WCrW9RDYG+VZYgw+tZAJcLMkJHUZG/IB
 LzE3q1nK3Lx4ojOnyY7+mLKgboeTo4qH1DOMjQa39Iyqml4TL40oHjK1JNVdFNYAZ4
 aqnzA+ccTSkoXcCF3rHgGeFCFpyPyHRC/69mIrUTt2TA1cjNRE/iFHunq/W0G/cKrh
 7jHhQJCEPUanqZ1i7eVonJTVhudf/IspcNUtDDIaQHnJew4fTPveLNnBgASgRzWztd
 6tGBS+rQE+MUdC8F1S8JQFmGLTA4nc9/QJ9JZGnldU28EdMJY43pdA/idA02tW78An
 W2YagmTwhumKQ==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 6D273962D74;
 Tue, 21 Feb 2023 09:01:12 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH 2/9] simpletrace: Annotate magic constants from QEMU code
Date: Tue, 21 Feb 2023 10:00:57 +0100
Message-Id: <20230221090104.86103-3-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221090104.86103-1-mads@ynddal.dk>
References: <20230221090104.86103-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YvsUpDWk8GUSHxtJ99gzUCmHliWViw5e
X-Proofpoint-GUID: YvsUpDWk8GUSHxtJ99gzUCmHliWViw5e
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=614
 phishscore=0 adultscore=0 spamscore=0 clxscore=1030 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302210078
Received-SPF: pass client-ip=17.58.23.181; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06011201.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


