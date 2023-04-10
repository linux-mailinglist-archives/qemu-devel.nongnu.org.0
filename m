Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D147F6DC5A6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 12:12:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ploV1-00059U-0X; Mon, 10 Apr 2023 06:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tanxiongchuan@isrc.iscas.ac.cn>)
 id 1ploUu-000591-EQ
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:11:40 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tanxiongchuan@isrc.iscas.ac.cn>) id 1ploUr-00021N-8A
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:11:40 -0400
Received: from localhost.localdomain (unknown [223.72.42.7])
 by APP-05 (Coremail) with SMTP id zQCowAD35xTR4DNkglhzEA--.63784S2;
 Mon, 10 Apr 2023 18:11:29 +0800 (CST)
From: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
To: qemu-devel@nongnu.org
Cc: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
Subject: [PATCH 0/3] linux-user: Add some ioctls for mesa amdgpu support
Date: Mon, 10 Apr 2023 18:11:15 +0800
Message-Id: <20230410101118.59564-1-tanxiongchuan@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD35xTR4DNkglhzEA--.63784S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFW5trykWw17CFW8AFy3XFb_yoWfXFb_ZF
 W8XFyDJ3y7JF4DXFyYvw1IvrWYyFWUGr10gF1Dtry3Zw47ArWftwsYyFyUJr15GFsrCF1D
 Xw4kXw1rKw13XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbwxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6r1j6r18M7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
 Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
 1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUozVbDUUUU
X-Originating-IP: [223.72.42.7]
X-CM-SenderInfo: xwdq5xprqjuxxxdqqxxvufhxpvfd2hldfou0/
Received-SPF: none client-ip=159.226.251.25;
 envelope-from=tanxiongchuan@isrc.iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This patchset tries to add support for amdgpu driver in mesa.

DRM_IOCTL_VERSION has been implemented before, so mesa running in qemu-user will
try to communicate with kernel DRM via the ioctl interface. This patchset
implements several ioctls needed by mesa to enable hardware acceleration, which
can be enabled via the newly added --enable-linux-user-drm-amdgpu configure 
flag.

Xiongchuan Tan (3):
  linux-user: Add compile flag for amdgpu drm support
  linux-user: Add more drm ioctls for mesa
  linux-user: Add amdgpu specific drm ioctls for mesa

 configure                  |   2 +
 linux-user/ioctls.h        |  31 ++-
 linux-user/syscall.c       | 420 ++++++++++++++++++++++++++++++++++++-
 linux-user/syscall_defs.h  | 139 +++++++++++-
 linux-user/syscall_types.h |  79 +++++++
 meson.build                |   1 +
 meson_options.txt          |   3 +
 7 files changed, 670 insertions(+), 5 deletions(-)

-- 
2.40.0


