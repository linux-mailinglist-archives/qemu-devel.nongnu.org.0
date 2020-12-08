Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09792D23F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 07:54:03 +0100 (CET)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmWss-0005St-Cv
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 01:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmWro-00051u-7N
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 01:52:56 -0500
Received: from smtp.h3c.com ([60.191.123.50]:58148 helo=h3cspam02-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmWrl-0004rm-7h
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 01:52:55 -0500
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([10.8.0.66])
 by h3cspam02-ex.h3c.com with ESMTP id 0B86qUPb061394;
 Tue, 8 Dec 2020 14:52:30 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from localhost.localdomain (10.125.33.161) by
 DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 8 Dec 2020 14:52:32 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: [PATCH 0/2] savevm: Delete stale snapshots in save_snapshot()
Date: Tue, 8 Dec 2020 14:53:34 +0800
Message-ID: <1607410416-13563-1-git-send-email-tu.guoyi@h3c.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.125.33.161]
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66)
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 0B86qUPb061394
Received-SPF: pass client-ip=60.191.123.50; envelope-from=tu.guoyi@h3c.com;
 helo=h3cspam02-ex.h3c.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: tuguoyi@outlook.com, qemu-devel@nongnu.org, Tuguoyi <tu.guoyi@h3c.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two patches just clear dead code and delete stale snapshots
in case of error in save_snapshot()

Tuguoyi (2):
  savevm: Remove dead code in save_snapshot()
  savevm: Delete snapshots just created in case of error

 migration/savevm.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.7.4


