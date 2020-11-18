Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497232B8002
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:02:29 +0100 (CET)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOya-00064C-B2
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aiyutao@huawei.com>)
 id 1kfHPm-0000Ab-U3
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 01:58:02 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aiyutao@huawei.com>)
 id 1kfHPj-0000Oa-Qi
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 01:58:02 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CbYXS5BM1z15N30;
 Wed, 18 Nov 2020 14:57:28 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 18 Nov 2020
 14:57:35 +0800
From: Yutao Ai <aiyutao@huawei.com>
To: <pbonzini@redhat.com>, <berrange@redhat.com>, <ehabkost@redhat.com>
Subject: [PATCH 0/2] Fix some style problems in qom
Date: Wed, 18 Nov 2020 06:45:56 +0000
Message-ID: <20201118064558.92658-1-aiyutao@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=aiyutao@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 01:57:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Nov 2020 10:01:08 -0500
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
Cc: alex.chen@huawei.com, aiyutao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I find some style problems while using checkpatch.pl to check qom code.
And I fixed these style problems in the submit patches.

Yutao Ai (2):
  qom:open brace '{' following struct go on the same line
  qom:delete trailing whitespace

 qom/object.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

-- 
2.19.1


