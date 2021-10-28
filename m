Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9937143E053
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 13:57:48 +0200 (CEST)
Received: from localhost ([::1]:57240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg42U-0001FV-No
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 07:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tL-0001Bx-Cp
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:21 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45486)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tE-0002IY-TD
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:17 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id D65E040D403D;
 Thu, 28 Oct 2021 11:47:59 +0000 (UTC)
Subject: [PATCH 0/4] Some watchpoint-related patches
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 28 Oct 2021 14:47:59 +0300
Message-ID: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
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
Cc: pavel.dovgalyuk@ispras.ru, david@redhat.com, richard.henderson@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The series includes several watchpoint-related patches.

---

Pavel Dovgalyuk (4):
      softmmu: fix watchpoint processing in icount mode
      softmmu: remove useless condition in watchpoint check
      softmmu: fix for "after access" watchpoints
      icount: preserve cflags when custom tb is about to execute


 accel/tcg/cpu-exec.c | 10 ++++++++++
 softmmu/physmem.c    | 41 ++++++++++++++++++++---------------------
 2 files changed, 30 insertions(+), 21 deletions(-)

--
Pavel Dovgalyuk

