Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBF13FD1BB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 05:29:41 +0200 (CEST)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGwR-00058z-H9
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 23:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGuX-0002c1-3Z; Tue, 31 Aug 2021 23:27:37 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGuV-0007Hh-9h; Tue, 31 Aug 2021 23:27:36 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v1so656682plo.10;
 Tue, 31 Aug 2021 20:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxIaRIGy2yLQVHqZrjkv8e2s608+jyOQMt8P6lZwMCg=;
 b=CQu3omrTqSIHsXNEw4adBXW5hjln/6qxfise3mkk8uvDG4j1XjA+DqyjE8UzG6xk21
 XfmY25uENbnDCrDSvAWC7w5GOD2pGLB6q4r57XQWqQp8F6LoraWyePZpg4zI1yUTO1pk
 Vs0rN8cQa0RUhkEGmdBbC7cXT2KGnneObIl3GBdtna8OmwJ9ltUI+2+STaBNoOsQhQPO
 RNyhy4wxgHKvxUFQXiRdnbImhqtyG7VAMUyoXREUMJqVDw5sPbNYYGL+/9fqMd1voGE2
 M2kh/oyyb5dkM1BbDmlvmlfH5UMrA6QHSdW6G4eDaYEuH5SsktYtxF+lfVmwfAfcrYrD
 rHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxIaRIGy2yLQVHqZrjkv8e2s608+jyOQMt8P6lZwMCg=;
 b=iYuoPi0QgecnQJGPMdDCSUmAknvM8A5uELOG3PzLNcm7bBxLNV9R4ZYyGE7mjnwYRC
 6LqRx6WXC8Kn1zYDsZ/nXarMMCjXPN9zf7KMdRSMy2WiiZPffegeFR4eMHo+xzmMb2wt
 3a/gP3woxodojXnfWBsMKb6YAOSGU9QT75s33ZcO/bsD6SIgin8WPjblIHuTaaBTG4lX
 FINw3UFutqdGOcWOIM2TPkZ2I02yJxp8L6Gvx0D3gMP8yPzBk7y+zZZv7FtN8RsxqpN9
 omGniERuO/bMydVISHcVWGSOK56FJT+HznmWWZLaDY9kVOmdoCJocLNyoBYYGJN3/A3h
 ewHg==
X-Gm-Message-State: AOAM533DK6Mp395aS/jDEwpCzKF51n1N9kGGjhEIABtLc/7g55+Jo7cr
 +Gs1d6DJY8tbd7cJPYnm5qs=
X-Google-Smtp-Source: ABdhPJwCXdU+tICH3PTXTLxkDOqjRT+uVGqDZ4d3C07F1LFB+VDl7gIkfgdUzg4OOdA+4vrA5p/IKw==
X-Received: by 2002:a17:90a:588e:: with SMTP id
 j14mr9369621pji.156.1630466852881; 
 Tue, 31 Aug 2021 20:27:32 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id g2sm7174467pfo.154.2021.08.31.20.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 20:27:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/5] hw/arm: xilinx_zynq: Fix upstream U-Boot boot failure
Date: Wed,  1 Sep 2021 11:27:19 +0800
Message-Id: <20210901032724.23256-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
does not receive anything. Debugging shows that the UART input clock
frequency is zero which prevents the UART from receiving anything as.
per the logic in uart_receive().

Note the U-Boot can still output data to the UART tx fifo, which should
not happen, as the design seems to prevent the data transmission when
clock is not enabled but somehow it only applies to the Rx side.

For anyone who is interested to give a try, here is the U-Boot defconfig:
$ make xilinx_zynq_virt_defconfig

and QEMU commands to test U-Boot:
$ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
    -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0

Note U-Boot used to boot properly in QEMU 4.2.0 which is the QEMU
version used in current U-Boot's CI testing. The UART clock changes
were introduced by the following 3 commits:

38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
b636db306e06 ("hw/char/cadence_uart: add clock support")
5b49a34c6800 ("hw/arm/xilinx_zynq: connect uart clocks to slcr")

Changes in v2:
- avoid declaring variables mid-scope
- new patch: hw/char: cadence_uart: Convert to memop_with_attrs() ops
- new patch: hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read,write}()

Bin Meng (5):
  hw/misc: zynq_slcr: Correctly compute output clocks in the reset exit
    phase
  hw/char: cadence_uart: Disable transmit when input clock is disabled
  hw/char: cadence_uart: Move clock/reset check to uart_can_receive()
  hw/char: cadence_uart: Convert to memop_with_attrs() ops
  hw/char: cadence_uart: Ignore access when unclocked or in reset for
    uart_{read,write}()

 hw/char/cadence_uart.c | 53 ++++++++++++++++++++++++++++--------------
 hw/misc/zynq_slcr.c    | 31 +++++++++++++-----------
 2 files changed, 53 insertions(+), 31 deletions(-)

-- 
2.25.1


