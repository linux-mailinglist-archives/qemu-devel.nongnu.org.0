Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D666A8F56
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:42:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvMD-0002WK-LN; Thu, 02 Mar 2023 21:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pXvMA-0002V8-VP
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:41:14 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pXvM7-0004hL-Ac
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:41:14 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxldhBXgFkxXcHAA--.13877S3;
 Fri, 03 Mar 2023 10:41:05 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbL4_XgFkx4lHAA--.60313S2; 
 Fri, 03 Mar 2023 10:41:03 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL 0/5] loongarch-to-apply queue
Date: Fri,  3 Mar 2023 10:40:58 +0800
Message-Id: <20230303024103.356250-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxbL4_XgFkx4lHAA--.60313S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KrWUWFW7Kw4xWr1kGry5CFg_yoW8XrWUpr
 W3CrnrGr48Gr9rJrs2q345XFn8Jrs7Gr12qF17X348CF47Zr1UXr1fJrZ5XFyUXa48Jr1F
 qF1rA3yUXF1UZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 262312d7ba6e2966acedb4f9c134fd19176b4083:

  Merge tag 'pull-testing-next-010323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-02 13:02:53 +0000)

are available in the Git repository at:

  https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20230303

for you to fetch changes up to 0d588c4f999699a430b32c563fe9ccc1710b8fd7:

  hw/loongarch/virt: add system_powerdown hmp command support (2023-03-03 09:37:30 +0800)

----------------------------------------------------------------
pull-loongarch-20230303

----------------------------------------------------------------
Bibo Mao (1):
      hw/loongarch/virt: rename PCH_PIC_IRQ_OFFSET with VIRT_GSI_BASE

Song Gao (4):
      loongarch: Add smbios command line option.
      docs/system/loongarch: update loongson3.rst and rename it to virt.rst
      target/loongarch: Implement Chip Configuraiton Version Register(0x0000)
      hw/loongarch/virt: add system_powerdown hmp command support

 docs/system/loongarch/{loongson3.rst => virt.rst} | 97 +++++++++--------------
 hw/loongarch/acpi-build.c                         |  3 +-
 hw/loongarch/virt.c                               | 20 ++++-
 include/hw/loongarch/virt.h                       |  1 +
 include/hw/pci-host/ls7a.h                        | 17 ++--
 qemu-options.hx                                   |  2 +-
 target/loongarch/cpu.c                            |  2 +
 target/loongarch/cpu.h                            |  1 +
 8 files changed, 70 insertions(+), 73 deletions(-)
 rename docs/system/loongarch/{loongson3.rst => virt.rst} (51%)


