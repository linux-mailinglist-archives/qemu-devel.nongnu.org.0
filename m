Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C11534E1F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:35:39 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBmE-0002f8-7S
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nuBWi-0001j2-MV
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:19:38 -0400
Received: from mout.gmx.net ([212.227.15.18]:39173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nuBWe-0006AF-SQ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653563967;
 bh=PDkJHlkacvDmSJx967aXw1whJM7JNb0x5C4HDGlemVs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=DmGvy2XCXw9V00ONjwh3j+dCx30UAThoib4pASq1SQHracOsCMXw8Kwwn736uYx3o
 CdZjIwt9Itsz0k6s/fAwdo/jLJJCeQFiXsNfXIFXqpeNWNUWz0sADZm8Wg5yEvoy/m
 f6z3L2sN1rv0vUAFW704zaNmU+h6GuX6NrbALgew=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.234]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1nvaIG2ehX-007Usy; Thu, 26
 May 2022 13:19:27 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 0/2] hppa: Fix serial port pass-through
Date: Thu, 26 May 2022 13:19:24 +0200
Message-Id: <20220526111926.19603-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6cqCaizy7dfl866o858UlqtNFIk3E9fowVIdlYg/Xh5dK8XISex
 ah/rK2eMZPX1ZfDTuf4eSQjiJ0nXzxg7FfVLcZjyuk+JueFSTpkMhY8onN7W60urksthIiq
 lu9Qx788OpdtvXneeG6mksQQoYMKxjcZYkrtncHDVyBcdZ7fJ7TmCLPJv/6WdrsTLwu8HCv
 gUXtgfdzOwU+4eWhKF1QQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UWYttbrRjac=:7FHhYV36NURZelJ5sOq5MP
 lnej7eLl7Tmd3348aZCXsbHFXZ/ny0hE6jTCGk7Y9Q2+/zdAX6qj90l3t6PUHuVPR351l4XJo
 5VHkbwvCC5ttcbIMf7d/VwpmbQiOQhTr66xaN7zKCLYzSfqb0gvAf4XmD+5gD4gOsqt2OMRCz
 KO82QrgLSZzuAgFB0mMX/rnW8WTT8+x8YlJTKoiimzpNQEqUQOqr9WojykGVup2RfetclEFlO
 IRKMW72IpW7ytcXUqB1MVpTFdCY3CiL0KBea2Q3o3NSCzsDIV8qYXcBwuT3/iJjYDtnD8+J6v
 P0c0ADPHE7ludPKforIlI2UdnogX3ftj9x5wYlmosbMRkxp9PxZBdLuQQQfAXIfGhoGIOs0EC
 srWjBUDT+DsNw1qfHP+475OIR7o/5+m3/b2cG5RO838+eTZWdGVXLA6BXQs5iOEuw6wqhjBSo
 4oEKlCpZYVaVdzGRCwyDipnK/gokvGJ9UZPNbNGDmXfNkolZQWpnrtEbGmn+lvGAh3a3PEDHr
 AmW9VrY2pDm6+4dvAmD344QZGtIDOs3MdOI7F2mcWYg100LFFwZAF+5CYzuGkdO78KIM4fn4d
 QN6IjMDc5Sk9bVezlWw98+BQYzuKQkOITd6ak8h6BSRqo6XPVXNsHW5ZBSEeOu3l0tjwrHKNg
 6tLxmwU4+VH1OZHjpxKSayCuwSsXGGdBExFWm81bJBzBai3lJgD5DngCtm0B7xi5wcnCYoUUi
 KJZGeUBTv0WPJC8Zs3N90cQ9hCYrA6QBDn5xcYu6x/4J4I76rnUrIYXSUJFQbQoO0eiclWy2u
 HvFjsE2X/RyG06BVt7nlxzTHNMV6DA0kHwXePfMvdXkyjLLTnqR9vZCkXReQGPu50SYoVZjqA
 UoG/rk77XGRyOP8n177dXCX23KdOLusiqG4TRVIxHuM4xjbv77BPk2uFakGYgTuk0F2hB64L1
 6+XrYyvpV6H/s1NOIPV/VFjyZ9THaHgtVz6dLSaUYdY3qnOFJ7sdh9JGCZOdoLu+BDp6uxQTu
 v2IwSI7PFF7KAg1QWljBxP/eNcCR9cq9a0w6GhW7QyQ4MKbCa61Rx28GeqkQ6KrAp01BG7O6K
 LNViL7wdqWc/+BbhTpLplH0Ti2Mz0K3CJkyueEiqG291H/qI7L0ODj3oA==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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

This series fixes the SeaBIOS-hppa firmware and the serial ports setup cod=
e in
qemu so that it reflects the real hardware and now allows serial
port-passthrough from the host to guests.

Tested with Linux guests.

Signed-off-by: Helge Deller <deller@gmx.de>

Helge Deller (2):
  New SeaBIOS-hppa version 6
  hppa: Fix serial port pass-through

 hw/hppa/hppa_hardware.h   |  10 ++++++++--
 hw/hppa/machine.c         |  17 +++++++----------
 pc-bios/hppa-firmware.img | Bin 719040 -> 719368 bytes
 roms/seabios-hppa         |   2 +-
 4 files changed, 16 insertions(+), 13 deletions(-)

=2D-
2.35.3


