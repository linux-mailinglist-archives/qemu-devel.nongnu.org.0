Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB07B3AC70E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:12:24 +0200 (CEST)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAY3-0007bM-H6
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1luAWt-0006ep-Iy
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:11:11 -0400
Received: from zamok.crans.org ([185.230.79.1]:50164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1luAWr-0000Uu-JK
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:11:11 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 36F56E016D; Fri, 18 Jun 2021 11:11:06 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] execlog TCG plugin to log instructions
Date: Fri, 18 Jun 2021 11:10:59 +0200
Message-Id: <20210618091101.2802534-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.230.79.1; envelope-from=erdnaxe@crans.org;
 helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

execlog is a plugin that logs executed instructions with some useful
metadata including memory access.

The output of the plugin is designed to be usable with other tools. For
example it could be used with a side-channel leakage model to create
side-channel traces from QEMU for security evaluation.

Changes since v1:
 - The output is now easier to parse.
 - Use QEMU logging API rather than FILE* to write output.
 - Don't reject memory information in user mode.
 - Merge memory information with instruction execution. Now one line
   means one instruction.
 - Add documentation.

Alexandre Iooss (2):
  contrib/plugins: add execlog to log instruction execution and memory
    access
  docs/devel: tvg-plugins: add execlog plugin description

 MAINTAINERS                |   1 +
 contrib/plugins/Makefile   |   1 +
 contrib/plugins/execlog.c  | 123 +++++++++++++++++++++++++++++++++++++
 docs/devel/tcg-plugins.rst |  22 +++++++
 4 files changed, 147 insertions(+)
 create mode 100644 contrib/plugins/execlog.c

-- 
2.25.1


