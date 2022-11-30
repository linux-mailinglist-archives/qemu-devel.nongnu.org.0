Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E563CD20
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CV0-0002BF-03; Tue, 29 Nov 2022 21:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangdongdong@eswincomputing.com>)
 id 1p0CJB-0003OG-M0
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 20:54:45 -0500
Received: from azure-sdnproxy.icoremail.net ([52.237.72.81])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <zhangdongdong@eswincomputing.com>)
 id 1p0CJ9-0005PN-RH
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 20:54:45 -0500
Received: from localhost.localdomain (unknown [10.12.130.38])
 by app2 (Coremail) with SMTP id EggMCgCXaC3at4ZjYTEUAA--.25977S4;
 Wed, 30 Nov 2022 09:54:34 +0800 (CST)
From: Dongdong Zhang <zhangdongdong@eswincomputing.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com,
 Dongdong Zhang <zhangdongdong@eswincomputing.com>
Subject: [PATCH 0/1]  Fix some typos
Date: Wed, 30 Nov 2022 09:53:57 +0800
Message-Id: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EggMCgCXaC3at4ZjYTEUAA--.25977S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY87AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87
 Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
 6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72
 CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
 Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 XdbUUUUUU==
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAQEGCmOGTnAIkQAAsO
Received-SPF: pass client-ip=52.237.72.81;
 envelope-from=zhangdongdong@eswincomputing.com;
 helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Nov 2022 21:06:53 -0500
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

This patch mainly fixes some typos in the 'python' directory.

Dongdong Zhang (1):
  Fix some typos

 python/qemu/machine/console_socket.py | 2 +-
 python/qemu/machine/qtest.py          | 2 +-
 python/qemu/qmp/protocol.py           | 2 +-
 python/qemu/qmp/qmp_tui.py            | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1


