Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE552584CBB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 09:39:19 +0200 (CEST)
Received: from localhost ([::1]:47670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHKac-0004PT-Sm
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 03:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oHKSG-0008Gq-1r
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 03:30:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47418 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oHKSD-0004t3-Fm
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 03:30:39 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9GLjONiJ2lBAA--.46172S2; 
 Fri, 29 Jul 2022 15:30:20 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1 0/2] Change 'loongson3.XXX' file name and 'LS7A_XXX' macro
 name
Date: Fri, 29 Jul 2022 15:30:16 +0800
Message-Id: <20220729073018.27037-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn9GLjONiJ2lBAA--.46172S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrykKr15tFW5Ww15ury5CFg_yoW3uwb_ZF
 yfXa4rGr4jqa42qay7X3WYyFZrAa18AFn8CF1qqrs7WF13Ar15JF4DKws8uF1Y9F4UJwsa
 yr48Kr1rAr4UGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series change 'loongson3.XXX' file name and 'LS7A_XXX' macro name.

Changes for v1:
1. Rename 'loongson3.c' to 'virt.c' and change the meson.build file.
2. Rename 'loongson3.rst' to 'virt.rst'.
3. Change macro name 'LS7A_XXX' to 'VIRT_XXX'.

Xiaojuan Yang (2):
  hw/loongarch: Rename file 'loongson3.XXX' to 'virt.XXX'
  hw/loongarch: Change macro name 'LS7A_XXX' to 'VIRT_XXX'

 MAINTAINERS                          |  2 +-
 hw/loongarch/acpi-build.c            | 18 ++++-----
 hw/loongarch/meson.build             |  2 +-
 hw/loongarch/{loongson3.c => virt.c} | 56 ++++++++++++++--------------
 include/hw/loongarch/virt.h          |  8 ++--
 include/hw/pci-host/ls7a.h           | 43 ++++++++++-----------
 target/loongarch/README              |  2 +-
 7 files changed, 64 insertions(+), 67 deletions(-)
 rename hw/loongarch/{loongson3.c => virt.c} (93%)

-- 
2.31.1


