Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC024B06C9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 08:03:33 +0100 (CET)
Received: from localhost ([::1]:49758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI3UJ-00089T-3X
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 02:03:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI2yi-00048a-N0
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:30:53 -0500
Received: from [2607:f8b0:4864:20::1030] (port=35388
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI2yg-0005AE-AM
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:30:51 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso7621503pjg.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 22:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZALzaUZ7SlbaTTzYDcGy5xRXz4SIttfBDlCosY/wuQ=;
 b=TTsgXj3aNHb5tljfXuouYhQ+JJnzwqDjZYViJWAnfBNPtIiO02Vk+aSP1Egxy4XrFb
 FTYqxtYDlK7ZrUxZMkFTev1/rY+eUMnfGHIopzpdZwPomWSOXE8PqKXgsE5ij21k2veM
 n9eOrXN1z6ZcNbDt+5LqfrfvB1T9hYqcdt99z4RBh6tKAaKPOVS5mtlRUpvzIQdrqi4Z
 9G5xXMXi+rpkKqum/yOnSZKL76xTNkNYezlekpG3bVr9J5WfGO9TVu9/e9a4QgOzsdmv
 bAjsuUl5U+95ef2PB/f7KU7egFq4ICuoNyn6mHcVHQ6Bun+LVoYvLWRt8BkgQ5Q91ICn
 msbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZALzaUZ7SlbaTTzYDcGy5xRXz4SIttfBDlCosY/wuQ=;
 b=5pAUWC0YMSf53QsDmHCpkdpD76SfN/EOJS67JuWBhP2MqPDj7SHQAPJwK22/Dvxa7X
 hSIn84mwxQHqmHcFOK5ZhUiAkeEpmbOY+2BkNgczx3xeFpLsegpAZuZ0TBLyamJXlNiV
 gq8Z1wCM59BcYdEiTnIPA7SaSDlsxi8ouu6XQSFSOgKBSxzS9Jhi0z4pxNVUCzV5XMJk
 JWZ5TYTiyqCj3EQ68qYZWCR+k2sZDODH4TJ0H7oBI0Ix5FFKVsWKxNPG6T5jAy6splQ9
 Lv5LGV0nvBTUnSSBxRwcBzfstdduj/KW/yN6kSqcV3A/sT+14n4F9G/gN4L4t2sEwVHt
 fJfg==
X-Gm-Message-State: AOAM5302l3IrjPIN/2Pi68sJsoKk6e/0kTRlxpZHaW6Pkd5IXxgsybsY
 sKxNRw+perXGpEnaJMLRUXP59M0AzpwLQA==
X-Google-Smtp-Source: ABdhPJxtHo/9larF9BxB/AEcud0BLZDG9bNUrpRJbM1CZjVmN5wGhoen5gdHgtMiuoIhbBuwY7GKuQ==
X-Received: by 2002:a17:903:185:: with SMTP id z5mr5932424plg.94.1644474628321; 
 Wed, 09 Feb 2022 22:30:28 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id ot1sm922078pjb.22.2022.02.09.22.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:30:27 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH 0/4] OpenRISC Device Tree Support
Date: Thu, 10 Feb 2022 15:30:05 +0900
Message-Id: <20220210063009.1048751-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds device tree support for the OpenRISC SIM hardware.

The simulator will generate an FDT and pass it to the kernel.

For example:
  qemu-system-or1k -cpu or1200 -M or1k-sim \
    -kernel /home/shorne/work/linux/vmlinux \
    -initrd /home/shorne/work/linux/initramfs.cpio.gz \
    -serial mon:stdio -nographic -gdb tcp::10001 -m 32

Using the linux kernel or1ksim_defconfig we can remove the built-in
dts and the kernel will boot as expected.  The real benefit here is
being able to specify an external initrd which qemu will load into
memory and the device tree will tell the kernel where to find it.

-Stafford

Stafford Horne (4):
  hw/openrisc/openrisc_sim: Create machine state for or1ksim
  hw/openrisc/openrisc_sim: Paramatarize initialization
  hw/openrisc/openrisc_sim; Add support for loading a decice tree
  hw/openrisc/openrisc_sim: Add support for initrd loading

 hw/openrisc/openrisc_sim.c | 261 +++++++++++++++++++++++++++++++++++--
 1 file changed, 247 insertions(+), 14 deletions(-)

-- 
2.31.1


