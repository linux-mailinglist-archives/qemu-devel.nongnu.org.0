Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E870853E4C6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 15:34:07 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyCrv-0004fI-1Z
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 09:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nyC5y-0000Ff-UY
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:44:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40382 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nyC5w-0004Vv-Vj
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:44:34 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+Z29p1ishIXAA--.3714S45; 
 Mon, 06 Jun 2022 20:44:17 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, maobibo@loongson.cn,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 43/43] target/loongarch: 'make check-tcg' support
Date: Mon,  6 Jun 2022 20:43:33 +0800
Message-Id: <20220606124333.2060567-44-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
References: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+Z29p1ishIXAA--.3714S45
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4DCr43uF4UGr47Kr4DArb_yoWfCwc_Aa
 yftrZ5Cr15Kr4xC3WFgFs5CFyrAw43XFZ5Wwn8Z348Jw42qr4aqw1xAFWDur4ayw42y3Zx
 Xas7tr4xC3W8ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

From: Song Gao <gaosong@loongson.cn>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index b9ccff9067..4cc145beee 100755
--- a/configure
+++ b/configure
@@ -1832,6 +1832,7 @@ fi
 : ${cross_prefix_arm="arm-linux-gnueabihf-"}
 : ${cross_prefix_armeb="$cross_prefix_arm"}
 : ${cross_prefix_hexagon="hexagon-unknown-linux-musl-"}
+: ${cross_prefix_loongarch64="loongarch64-unknown-linux-gnu-"}
 : ${cross_prefix_hppa="hppa-linux-gnu-"}
 : ${cross_prefix_i386="i686-linux-gnu-"}
 : ${cross_prefix_m68k="m68k-linux-gnu-"}
-- 
2.31.1


