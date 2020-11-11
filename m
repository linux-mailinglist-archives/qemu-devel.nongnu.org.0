Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E3F2AE546
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 02:05:36 +0100 (CET)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kceZq-00070d-Vn
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 20:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kceYw-0006Yo-Jf
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 20:04:38 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kceYt-000781-LO
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 20:04:38 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CW62B0xQJz15V3h;
 Wed, 11 Nov 2020 09:04:18 +0800 (CST)
Received: from [10.174.178.136] (10.174.178.136) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Wed, 11 Nov 2020 09:04:20 +0800
To: <qemu-devel@nongnu.org>, <virtio-fs@redhat.com>
From: Haotian Li <lihaotian9@huawei.com>
Subject: [PATCH v3 0/3] virtiofsd: fix some accessing NULL pointer problem
Message-ID: <3477d902-ace9-1aa1-531a-9d20d6e93a05@huawei.com>
Date: Wed, 11 Nov 2020 09:04:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.136]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lihaotian9@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 20:04:27
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
  We find some potential NULL pointer bugs on tools/virtiofsd.
Three patches are made to fix them

Haotian Li (3):
  tools/virtiofsd/buffer.c: check whether buf is NULL in
    fuse_bufvec_advance func
  virtiofsd: check whether lo_map_reserve returns NULL in main func
  virtiofsd: check whether strdup lo.source return NULL in main func.

 tools/virtiofsd/buffer.c         |  4 ++++
 tools/virtiofsd/passthrough_ll.c | 16 +++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

-- 

