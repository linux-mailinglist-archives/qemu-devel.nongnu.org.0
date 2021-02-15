Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD131BC2D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:22:56 +0100 (CET)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfiB-0001lI-Fq
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXV-0007pT-E0; Mon, 15 Feb 2021 10:11:55 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXO-00052o-Rf; Mon, 15 Feb 2021 10:11:51 -0500
Received: by mail-ed1-x531.google.com with SMTP id y18so8375235edw.13;
 Mon, 15 Feb 2021 07:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GmPOyYhtMaQGLeUL8TQFwbbYMxSl6yrfYp58gXklU0I=;
 b=s4JR5BmoowEqqMVFLip4nIYyDaZKMRVik7N0t3KXRPEdAMrFj8/SQXUFxtNn+er6St
 kGmVoSbKhdcieRYUakZeaJzZonKdsBbrXE+caSjgHkNPQq0PD5U7kImHAY96aIeLgFT9
 jAoOMBovgpaRGAD9j2bOejrPD1SrSNOmlqGxWF2BKMMpGIGpNwr2Cd6V3I23UIm3ZVWc
 9u3AS7+5I8ljiJvn4QjyEvrVRb3xfTstRcVje0+lqpQg2SMYfy48iCHT1qVF3e5Yjgxg
 tfOeEWAYtLk3rzQrNbcRAxLpPpxdvft1sGL1dXqeWd4Ugya63qqhb2cTGHWtnOjecF64
 6cHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GmPOyYhtMaQGLeUL8TQFwbbYMxSl6yrfYp58gXklU0I=;
 b=eDesSu3goy9sEt5tkVS6grrIpjI0XSguK11MASCS5WgO+uyrhMZ4VQmed2uNL6JzT9
 DUxhU2IP9FcdBpa2d+BXEsreC13zZW6VAGtVxQJ/DcKKibrO/+EE3i/UdnoOr2SUxmiI
 1cpN1rTG2hhcY2TLwtY24OmlwWpRO1rRar3Ovtylp3M63uExpL9/nWwWgC+wXJiiVr0l
 KRHXfmhhTitQ5j55MIW9SZSJYlokHbC+QD2Qu9pVaFV11A7h89M+He7Edu0zNNuukOrr
 gWqH28qj5rSk3fCHd2t+6Ev00ffkXWXNjVfmKHRzKZka/RBY2WxwCQLdCb/uOK8+0vL0
 Rq1g==
X-Gm-Message-State: AOAM530MvnnvcjJiwoSY8tVEO2Gn0ZE1SQBQRKMu+AXebj/n76jmSAxD
 8MLNJEEZbfr1ZczPJj2+WJM=
X-Google-Smtp-Source: ABdhPJwja0kpqBJljvb3c+czPkWdLYxSFunQypCmncNOZdrpGcHkZhc18T3tW5UclPDovrnF1AdEHA==
X-Received: by 2002:aa7:d50b:: with SMTP id y11mr3685180edq.288.1613401904823; 
 Mon, 15 Feb 2021 07:11:44 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id gz14sm10813069ejc.105.2021.02.15.07.11.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 07:11:44 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH 3/4] hw/sd: sdhci: Correctly set the controller status for ADMA
Date: Mon, 15 Feb 2021 23:11:10 +0800
Message-Id: <1613401871-59515-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
References: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When an ADMA transfer is started, the codes forget to set the
controller status to indicate a transfer is in progress.

With this fix, the following 2 reproducers:

https://paste.debian.net/plain/1185136
https://paste.debian.net/plain/1185141

cannot be reproduced with the following QEMU command line:

$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
      -nodefaults -device sdhci-pci,sd-spec-version=3 \
      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
      -device sd-card,drive=mydrive -qtest stdio

Cc: qemu-stable@nongnu.org
Fixes: CVE-2020-17380
Fixes: CVE-2020-25085
Fixes: CVE-2021-3409
Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
Reported-by: Muhammad Ramdhan
Reported-by: Sergej Schumilo (Ruhr-University Bochum)
Reported-by: Simon Wrner (Ruhr-University Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 05cb281..0b0ca6f 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -769,7 +769,9 @@ static void sdhci_do_adma(SDHCIState *s)
 
         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
+            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
             if (s->trnmod & SDHC_TRNS_READ) {
+                s->prnsts |= SDHC_DOING_READ;
                 while (length) {
                     if (s->data_count == 0) {
                         sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -797,6 +799,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     }
                 }
             } else {
+                s->prnsts |= SDHC_DOING_WRITE;
                 while (length) {
                     begin = s->data_count;
                     if ((length + begin) < block_size) {
-- 
2.7.4


