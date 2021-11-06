Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E144703A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 20:46:42 +0100 (CET)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjReD-0000EL-7m
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 15:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mjRZr-0006Zs-9i
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 15:42:11 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:59951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mjRZm-0000qk-5g
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 15:42:11 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M5PyX-1miclJ3R6z-001S2f; Sat, 06
 Nov 2021 20:42:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw: m68k: add missing virt machine types
Date: Sat,  6 Nov 2021 20:41:56 +0100
Message-Id: <20211106194158.4068596-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pz6zWeAp5JUdm3Wcu257IFwZVM0+dlnKCMSDHRocsAla6+ZgLt2
 xUQSUeeAFhzduHBEjz+LRIJEmFNjcY3hCoXvenNyaD8ZJvcKFZcVLaKPolYfDc0uPHaG7/s
 T2rPqTzFk0HPKTRymmigpku+dSI8GKpAX/ddAyxKXDmEEzBBybblyxGwt6X4oZQUVfuV8p/
 JFNetPNgBRiFX2lHgTa8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:09P2Sk/TP0c=:RSCbOJL9Wjib0uhYXwage5
 9Ly4pfT2IWhCIjMZFrzVlpLJ/xwT5m1GE9ZQ8H+gagI3k0fs5GPbF6VdM7TUjcQSfr4dIkAqo
 onBKApEh4i+2FX8gEgMuG+9C19u79bm9C3O5L3dK1pyxn9eu7B58Mn8yWzDn2SkARQE2HHTth
 x6LcKJrmDXLDQjgjq/mNYeIPnNc7dxya4FgDvIEhsIWd6xEltPVpypOTJ+r7UTvspHq5lv4b7
 uJBInx8mSouSlTs8WLEBaDxSBlXP88Kiuz2v6bkz/ZNhIAVoLcPbQJXAFbB9kd6o0EYLCBKCe
 xxYuj2DJBfwyHhWau9qM16GqEetoI4JxcBbwwIJRxVRzerwPnl4l3gcW3+wNa4GMR86pOP8/B
 2LwIGOyoe98tEg8C+GRhkbYdzcx1nqP1z93G4t2xugPFCUWMCfNKJorWoh2Do/qMN4d2biqAl
 dY9Md/GOSbJFeDSWbdoZilORcJkqEGQC8zAWXZAwxJ6odaTAqNw1SmR5ubyBWMpCChPcxzBEd
 bW2KmdKJifkFKaWkbmv+vDfkgjv9S9dwN9hXkfRwny4iaj53hycBfbcY3CafjSGxIX7KtXD/f
 v2nO+nw/70NDfsgLQ9t12TacaRBm6MaQq2XjLGgs5bRUiJk+zS4EOR1jwjrf/CGaEisIZ47yz
 zYHrluxSzGWnp5Kb673pfZV+3IvflnCRAa2UgxOytT3pwqPa9iIdba/dm/CnpjbXrttU=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the machine type for 6.2, and also for 6.1 that I have=0D
missed on the previous release.=0D
=0D
Laurent Vivier (2):=0D
  hw: m68: virt: Add compat machines for 6.1=0D
  hw: m68: virt: Add compat machines for 6.2=0D
=0D
 hw/m68k/virt.c | 16 +++++++++++++++-=0D
 1 file changed, 15 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

