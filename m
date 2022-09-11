Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0BA5B5094
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:27:32 +0200 (CEST)
Received: from localhost ([::1]:56486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRfz-0007U0-T9
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRYy-0005D5-52; Sun, 11 Sep 2022 14:20:12 -0400
Received: from mout.gmx.net ([212.227.15.15]:47367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRYv-0003TQ-HN; Sun, 11 Sep 2022 14:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920406;
 bh=AARGy+7IEcYeYprBUgBFIvLoiMcHea1YT1cf6+UW2qw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Ua23FJgbrGgMCe4q2v0fqndfBapB6qMXkwnfLuQ2Gldwbz2f3aIpK3mTPhNVKPWZq
 lniIGoG2dwGhkmEe8hqU6xWKQueL4ZSbUuKwnpcmm+V2jk0IG6Ge/r/rgrmTxfT7Vd
 1pVJmB7erznluhSAtSXkxN22fIK7Wvrp57RnrSQc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MhlKs-1p2Oak1mBk-00dpTa; Sun, 11 Sep 2022 20:20:06 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Arwed Meyer <arwed.meyer@gmx.de>
Subject: [PATCH v2 0/5] Make serial msmouse work
Date: Sun, 11 Sep 2022 20:18:35 +0200
Message-Id: <20220911181840.8933-1-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8waPjDpHzLH5qi2fX0GsuUDaudxdJ7Yy4sfKn2Xt+1ZbcIFWYUb
 fX/ve+ph/6Do2xOBhoTyYBMvWObHhpctKxlW/80DOs/mzHH5vz9SCFg1zWpiuyX7gsqPGy7
 dvfIcsl31pf1JxzHHC3sA9pC7haFARCmRmkaEmF9l+Y47May4ZIcjbENjAsh60+/2UI+o19
 FPaNV0uYn1vn8nEPmfTaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:chIZAU1/yaU=:mdDATNsDmfdjwHY7GvXWYA
 NxUFSJu2xFN73NgewwqLHUhUpsNPN4ZdD1E3WwIzkCblrgDX3qv6jha6ltt/m+yw2cChPUui/
 ci48+RXZ8qmrKGxqyDr2XFgZaAIGjDw8ewkzfdzUSkMx2f+hfe6leUMXlPdIDt1UQLz7AlJZr
 GtJd1uXXRnYlCJxLZbMrERr0J1/ZWi/D52A6/oEoVsgdy+1jHfc0NYaytGYDRBoEVt76AGHjm
 iDG9SCONsxWTdF2IbPZT4n4vO5uzfn6l40jQ1e1p7nxM9+I5h7oGWZyVn8RK6uMNMNxJ/fLFD
 BHKxPr+mlnzH12mPyjdDGFDPlyXv6j6EATXmRziHGninkmLHa/bZ4/KSMqxjr6Zv5FLjjPL20
 LKp60NfLk5px3lHCAwBNxlw23gEaWGDqnXgBs71nxZ+et3PfKG2kgAJT1WZbLpXoV505iixVX
 XbOulTaiflWGZqspymTBjZmujgqIo7pbefbKoVHqv2q8mtdOwTDTphgq22rWcJLkAnWIcjwgN
 SiNCFBzDkNCLMWb9bosmIm340YglXY7ZjYYwlvVRdJHixTZ9prprgOqDSshoD7ArDmAVdgdfu
 FTUPUD1mZ72/cvaggbBK19nYeCKYsK1YyzW09B3rO+LB7leCeRcBtvFnXFyDtq0CgbjvotOXq
 /eZuPvBCTpRCWKhYiuVa8051CDyB4fz4YCHLdXNtOLogomCv8AB9TEy/c5YQULawYA1qhmwpq
 +n002u2qXT4Z0qoPb8y8P3vs5wp9/UuFZtU3Cj2QvqAQyIH/iaDNYBBPABBxhgsFNpcV4VwYT
 oWW4vqPphESDpOrT50VGGiijJuzA5sjHBdY5ogu2i1hq8VcQBS/2SELVVVT1SV1OEabUAaPaW
 EtkPp9dbH4BR7o/TaEhJg8t5nBFItCFNU0FTtrp6Ms27g6+X9op6foVSZ+Xb86R9b8yOZJtmM
 OdpjmGaTDc+ZpklsX/T5fJQxiH33EIL96RT+JYg/b2ORlDnRu8MfVkbF7CKRXpS+2bPzYne/T
 UErZ8HVbMqhguVqINf/0a8hKVNWVThtDSFBjCGz9ZJiTBkv6QPQE/GRiE15nBpvfUZjfbVUGv
 iNoBPl5m2pTPVSL4QsW65zAsDG8wZfSGqJAg006sJov0G/oGMt6eF4aJ8c+4ARxcOrcsTCtlJ
 leXDO/3IkDkRaUrwU1GHOXZMZd
Received-SPF: pass client-ip=212.227.15.15; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches makes `-serial msmouse` work in practice.

Tested with FreeDOS/CTMouse driver `ctmouse /V` which identifies a
Logitech compatible 3 button mouse.
It will probably run as well with any other compatible serial mouse
driver on Windows 9x etc.

Arwed Meyer (5):
  msmouse: Handle mouse reset
  chardev: src buffer const for write functions
  msmouse: Use fifo8 instead of array
  msmouse: Add pnp data
  serial: Allow unaligned i/o access

 chardev/char.c          |   4 +-
 chardev/msmouse.c       | 150 +++++++++++++++++++++++++++++++++-------
 hw/char/serial.c        |   3 +
 include/chardev/char.h  |   4 +-
 include/sysemu/replay.h |   2 +-
 replay/replay-char.c    |   2 +-
 stubs/replay-tools.c    |   2 +-
 7 files changed, 134 insertions(+), 33 deletions(-)

=2D-
2.34.1


