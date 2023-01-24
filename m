Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0D6791B0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:13:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKDUM-0002ha-Mu; Tue, 24 Jan 2023 02:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pKDUE-0002gi-1u
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:12:54 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pKDUB-0002iI-QT
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:12:53 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id C692544C100F;
 Tue, 24 Jan 2023 07:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru C692544C100F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674544343;
 bh=xgbQ6vkad/Mteopn4TRf+8UdgsTO80beI+Yxr5EOPF4=;
 h=Subject:From:To:Cc:Date:From;
 b=qz7t3dO53jaewAw0zBvoB5dcM6n/5CYyNyp1e7abE7DsHe0IE6nGWCMbp39PCgLLl
 JacTBTpbBhOQSiLiZbU3HT9UZD0CplaSDR8n3pgwWRsd2v/WA7WzOC9VIbEFQXoRUu
 tPUVlVzvOfveM6aPhEBmIzngfhAh2Fi5LFga3Sig=
Subject: [PATCH v2 0/5] AVR target fixes
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Tue, 24 Jan 2023 10:12:23 +0300
Message-ID: <167454434356.3686700.6888237867240722060.stgit@pasha-ThinkPad-X280>
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

This set of patches includes multiple changes for AVR target.

v2 changes:
 - fixed instruction translation in icount mode

---

Pavel Dovgalyuk (5):
      target/avr: fix long address calculation
      target/avr: implement small RAM/large RAM feature
      target/avr: fix avr features processing
      target/avr: fix interrupt processing
      target/avr: enable icount mode


 target/avr/cpu.h       |  6 ++-
 target/avr/helper.c    |  4 +-
 target/avr/translate.c | 93 +++++++++++++++++++++++++++++++-----------
 3 files changed, 75 insertions(+), 28 deletions(-)

--
Pavel Dovgalyuk

