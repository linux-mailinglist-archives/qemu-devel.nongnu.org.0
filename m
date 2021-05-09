Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DA377592
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 07:01:59 +0200 (CEST)
Received: from localhost ([::1]:42616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfbZm-0001Dr-As
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 01:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lfbXL-0000Dr-Nt
 for qemu-devel@nongnu.org; Sun, 09 May 2021 00:59:27 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:35254
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lfbXJ-00038A-Ck
 for qemu-devel@nongnu.org; Sun, 09 May 2021 00:59:27 -0400
HMM_SOURCE_IP: 172.18.0.48:38286.1053259207
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.176?logid-af031413614441dfa86a5a68a29d1972
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id C212D2800A8;
 Sun,  9 May 2021 12:59:15 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id af031413614441dfa86a5a68a29d1972 for
 qemu-devel@nongnu.org; Sun May  9 12:59:13 2021
X-Transaction-ID: af031413614441dfa86a5a68a29d1972
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2] make sample page count configurable 
Date: Sun,  9 May 2021 12:58:58 +0800
Message-Id: <cover.1620536022.git.huangy81@chinatelecom.cn>
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

This is v2 of introducing sample pages argument to dirty rate interface 

v2:
- do the code clean on the basis of review by David
- add qemu version to 6.1 since which the argument introduced
- raise the upper limit of sample pages refer as MAX_SAMPLE_PAGE_COUNT

v1:
- code clean: rename the parameter of the is_sample_valid function 

Hyman Huang(黄勇) (1):
  migration/dirtyrate: make sample page count configurable

 migration/dirtyrate.c | 31 ++++++++++++++++---
 migration/dirtyrate.h |  8 ++++-
 qapi/migration.json   | 85 ++++++++++++++++++++++++++++-----------------------
 3 files changed, 80 insertions(+), 44 deletions(-)

-- 
1.8.3.1


