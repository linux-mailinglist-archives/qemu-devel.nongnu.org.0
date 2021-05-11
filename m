Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8937A93F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:28:30 +0200 (CEST)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTN7-0001P6-1l
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lgTGM-0007e2-6L
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:21:30 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:45699
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lgTGJ-0007t5-1h
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:21:28 -0400
HMM_SOURCE_IP: 172.18.0.218:36692.202759837
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.176?logid-bebc2214256e4286af42ebec4d34e1c8
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 9F103280029;
 Tue, 11 May 2021 22:21:16 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id bebc2214256e4286af42ebec4d34e1c8 for
 qemu-devel@nongnu.org; Tue May 11 22:21:14 2021
X-Transaction-ID: bebc2214256e4286af42ebec4d34e1c8
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3] make sample page count configurable 
Date: Tue, 11 May 2021 22:20:58 +0800
Message-Id: <cover.1620742417.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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

This is v3 of introducing sample pages argument to dirty rate interface 

v3:
- only add the "6.1" tag to the sample-pages field of DirtyRateInfo

v2:
- do the code clean on the basis of review by David
- add qemu version to 6.1 since which the argument introduced
- raise the upper limit of sample pages refer as MAX_SAMPLE_PAGE_COUNT

v1:
- code clean: rename the parameter of the is_sample_valid function

Hyman Huang(黄勇) (1):
  migration/dirtyrate: make sample page count configurable

 migration/dirtyrate.c | 31 +++++++++++++++++++++++++++----
 migration/dirtyrate.h |  8 +++++++-
 qapi/migration.json   | 13 ++++++++++---
 3 files changed, 44 insertions(+), 8 deletions(-)

-- 
1.8.3.1


