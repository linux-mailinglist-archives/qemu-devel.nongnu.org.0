Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FE66E73A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 20:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHrsR-0000CQ-7R; Tue, 17 Jan 2023 14:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pHrsO-0000Bf-V1; Tue, 17 Jan 2023 14:44:08 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pHrsN-0001HA-FX; Tue, 17 Jan 2023 14:44:08 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2594F11EF48;
 Tue, 17 Jan 2023 19:44:06 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Tue, 17 Jan 2023 19:44:05 +0000
Subject: [PATCH qemu v2 0/3] ARM: Add support for V8M special registers in GDB
 stub
MIME-Version: 1.0
Message-ID: <167398464577.10345.18365355650640365165-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
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
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Patch 1/3 was already accepted, but it seems is not in master yet.

Comments addressed in patches 2 and 3.
Let me know if you'd like me to split out a separate commit
for renaming arm_v7m_get_sp_ptr.

David Reiss (3):
  target/arm: Unify checking for M Main Extension in MRS/MSR
  target/arm/gdbstub: Support reading M system registers from GDB
  target/arm/gdbstub: Support reading M security extension registers
    from GDB

 target/arm/cpu.h      |  25 ++++-
 target/arm/gdbstub.c  | 241 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/m_helper.c |  51 +++++----
 3 files changed, 296 insertions(+), 21 deletions(-)

-- 
2.34.5

