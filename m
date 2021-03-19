Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6C3422D4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 18:07:15 +0100 (CET)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNIag-0002dC-Gw
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 13:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lNIYW-0001NB-QW
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:05:00 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:33311
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lNIYT-0005P7-Br
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:05:00 -0400
HMM_SOURCE_IP: 172.18.0.218:13666.34118327
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.62?logid-61a2bfaf6f1f43f0bece1c1269eaae30
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id B601A280084;
 Sat, 20 Mar 2021 01:04:47 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 61a2bfaf6f1f43f0bece1c1269eaae30 for
 qemu-devel@nongnu.org; Sat Mar 20 01:04:50 2021
X-Transaction-ID: 61a2bfaf6f1f43f0bece1c1269eaae30
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v1] introduce multifd into guestperf 
Date: Sat, 20 Mar 2021 01:04:27 +0800
Message-Id: <cover.1616171924.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?=
 <huangy81@chinatelecom.cn>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

This is the v1 of guestperf multifd migration support

It is merely the same as the original patch, just change the maintainer,
since the ./scripts/get_maintainer.pl do not get the maintainer of 
tests/migration before this patch:
https://lore.kernel.org/qemu-devel/842e7cbd-a444-04ac-35d5-168c6415441e@redhat.com/

Guestperf tool does not cover the multifd-enabled migration currently, it
is worth supporting so that developers can analysis the migration performance
with all kinds of migration. 

Please review, thanks.

Hyman (1):
  tests/migration: introduce multifd into guestperf

 tests/migration/guestperf/comparison.py | 14 ++++++++++++++
 tests/migration/guestperf/engine.py     | 16 ++++++++++++++++
 tests/migration/guestperf/scenario.py   | 12 ++++++++++--
 tests/migration/guestperf/shell.py      | 10 +++++++++-
 4 files changed, 49 insertions(+), 3 deletions(-)

-- 
1.8.3.1


