Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB344D48C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:00:02 +0100 (CET)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6sD-0008KY-Lh
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml6nX-0007Is-Va
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:12 -0500
Received: from mail.ispras.ru ([83.149.199.84]:44956)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml6nV-0008Nx-Mo
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:11 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id B103E40A2BC1;
 Thu, 11 Nov 2021 09:55:03 +0000 (UTC)
Subject: [PATCH v2 0/3] Some watchpoint-related patches
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Nov 2021 12:55:03 +0300
Message-ID: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: pavel.dovgalyuk@ispras.ru, david@redhat.com, richard.henderson@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The series includes several watchpoint-related patches.

v2 changes:
 - added patch to fix races with interrupts
 - added patch to process watchpoints-on-stack
 - removed upstreamed patches

---

Pavel Dovgalyuk (3):
      icount: preserve cflags when custom tb is about to execute
      softmmu: fix watchpoint-interrupt races
      softmmu: fix watchpoints on memory used by vCPU internals


 accel/tcg/cpu-exec.c |  5 +++++
 softmmu/physmem.c    | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

--
Pavel Dovgalyuk

