Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4434C630C4E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 06:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owGpv-0006zZ-9B; Sat, 19 Nov 2022 00:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1owGpt-0006zC-06
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:56:17 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1owGpq-0003CP-Sj
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:56:16 -0500
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id F1D7740737C4;
 Sat, 19 Nov 2022 05:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru F1D7740737C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1668837349;
 bh=tvDVP/2PljTlxbNcIqNhtTEhjvOVZD0w+/RbkjOl7/A=;
 h=Subject:From:To:Cc:Date:From;
 b=Tig4vcks4Qogf2KZEy/IKyI0V3Vn6EzUGxg11i3dRK/oVXNVW/ZVg9ZHeh44ZoKEU
 gHi7NhSnF96Y8Zo1Lr1HUivgxvpRyoTzspO13xoGSkPk/4XWY7uSHU7lJbmDfS2vyM
 a9+05F2XN1Pc+p9NCiVVdloiqz3NCRnsmB/0VRqs=
Subject: [PATCH 0/4] AVR target fixes
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Sat, 19 Nov 2022 08:55:48 +0300
Message-ID: <166883734868.1540909.6779276759642478650.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

---

Pavel Dovgalyuk (4):
      target/avr: fix long address calculation
      target/avr: implement small RAM/large RAM feature
      target/avr: fix avr features processing
      target/avr: fix interrupt processing


 target/avr/cpu.h       |  6 ++--
 target/avr/helper.c    |  4 +--
 target/avr/translate.c | 63 ++++++++++++++++++++++++++----------------
 3 files changed, 45 insertions(+), 28 deletions(-)

--
Pavel Dovgalyuk

