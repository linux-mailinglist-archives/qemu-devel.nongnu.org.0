Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E033A3C6
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 10:12:57 +0100 (CET)
Received: from localhost ([::1]:37368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLMnw-0006rm-BM
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 05:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lLMIU-0000ww-Mq; Sun, 14 Mar 2021 04:40:26 -0400
Received: from sender-of-o52.zoho.in ([103.117.158.52]:2296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lLMIR-000411-6G; Sun, 14 Mar 2021 04:40:26 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615711213; cv=none; d=zohomail.in; s=zohoarc; 
 b=Iz3rbema8j6ZyDGjx7MtLXnFb7k002e7Elr7sXrvPqrmZ2so0p8L0w2Ub+ldt83Wt86BF7lvQzFBcU9mZpt/9igvphsE1IBoweqNFYCx07TjCRToPO7AZTEzW2km915pT3XudVU7RG5RZcJdAsYSw1Alri3FWDZurGUrw19Rl0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1615711213;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=bVRHk0QiKmQkSqHkNJxwzrRNe28YYjs9aZVv/6QIMac=; 
 b=Yb8IjcLFQLRmNkBepsXTRx4rzFuMG71MDF7//AFfpr3V35Y8gF6p4G/nNwXwWs+EZKPUrue8Y2cH6dFiw/gFDTPUsHG1IgfijyA+GjWOR8f+sDqnU3NVG76d6n0I0dAmBVDL8HaRs1odOpfVQBNj9rCvdwltqe6h2kapYjO56o0=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615711213; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=bVRHk0QiKmQkSqHkNJxwzrRNe28YYjs9aZVv/6QIMac=;
 b=Hv1L/a8tIf3wtoFT6OHn/ooZqNVmxALWMDjT5hnouQD0Vp7X/4U0DZYIPMqLbGIr
 2uRmjP+6m1qzIyMDCduEhOHbVFk45b2Pw4K10Beje1VPmAPmhDoPWGxYOn6oeL/nFMf
 fZsDMuYFYR3SyXsOfwtOcexeKbtvGUbd1xhSdh3I=
Received: from helium.Dlink (49.207.215.131 [49.207.215.131]) by mx.zoho.in
 with SMTPS id 1615711210355417.72999579876034;
 Sun, 14 Mar 2021 14:10:10 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org
Message-ID: <20210314083936.76269-1-vijai@behindbytes.com>
Subject: [PATCH 0/3] Add support for Shakti SoC from IIT-M
Date: Sun, 14 Mar 2021 14:09:33 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.52;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o52.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 14 Mar 2021 05:09:48 -0400
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds initial suppport for emulating shakti soc[1] running
on arty 100T.

Shakti SoC uses Shakti C class core[2] and Shakti Uart[3]

[1] https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.=
rst
[2] https://gitlab.com/shaktiproject/cores/c-class/-/blob/master/README.md
[3] https://gitlab.com/shaktiproject/uncore/devices/-/tree/master/uart_v2

Vijai Kumar K (3):
  riscv: Add initial support for Shakti C class
  hw/char: Add Shakti UART emulation
  hw/riscv: Connect Shakti UART to Shakti platform

 MAINTAINERS                                 |   9 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 hw/char/meson.build                         |   1 +
 hw/char/shakti_uart.c                       | 204 ++++++++++++++++++++
 hw/char/trace-events                        |   4 +
 hw/riscv/Kconfig                            |  10 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/shakti_c.c                         | 185 ++++++++++++++++++
 include/hw/char/shakti_uart.h               |  74 +++++++
 include/hw/riscv/shakti_c.h                 |  76 ++++++++
 target/riscv/cpu.c                          |   9 +
 target/riscv/cpu.h                          |   1 +
 12 files changed, 575 insertions(+)
 create mode 100644 hw/char/shakti_uart.c
 create mode 100644 hw/riscv/shakti_c.c
 create mode 100644 include/hw/char/shakti_uart.h
 create mode 100644 include/hw/riscv/shakti_c.h

--=20
2.25.1



