Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0A3708CE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:31:17 +0200 (CEST)
Received: from localhost ([::1]:45320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcvKe-0008Nn-CC
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1lcv55-0005ax-22
 for qemu-devel@nongnu.org; Sat, 01 May 2021 15:15:11 -0400
Received: from donkey.codingfarm.de ([5.9.138.198]:42988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1lcv53-0007pU-Dr
 for qemu-devel@nongnu.org; Sat, 01 May 2021 15:15:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by donkey.codingfarm.de (Postfix) with ESMTPSA id 2071180938;
 Sat,  1 May 2021 21:06:23 +0200 (CEST)
Received: by zebra.codingfarm.de (Postfix, from userid 1000)
 id CFD0844CD5; Sat,  1 May 2021 21:06:22 +0200 (CEST)
From: =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] input-linux: Allow to toggle grab from QMP
Date: Sat,  1 May 2021 21:06:20 +0200
Message-Id: <20210501190622.153901-1-raimue@codingfarm.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=5.9.138.198;
 envelope-from=raimue@zebra.codingfarm.de; helo=donkey.codingfarm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NO_DNS_FOR_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds an grab-active bool option to input-linux objects to control
the grab state of evdev devices from QMP. The first patch fixes
a problem with multiple keyboards that was previously unlikely, as the
user will only use one device at a time. It could be merged
independently, but I am submitting them together as this becomes more
relevant when grab state can be controlled from QMP.

Rainer Müller (2):
  input-linux: Delay grab toggle if keys are pressed
  input-linux: Allow to toggle grab from QMP

 qapi/qom.json    |  3 +++
 ui/input-linux.c | 46 +++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 5 deletions(-)

-- 
2.25.1


