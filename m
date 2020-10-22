Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD55296603
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 22:33:09 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVhGm-0002R6-H5
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 16:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kVhDs-0000zy-Vq
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 16:30:08 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:51499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kVhDr-0001rZ-16
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 16:30:08 -0400
Received: from localhost.localdomain ([82.252.139.38]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MaIGB-1ksR9L3N0n-00WB0O; Thu, 22 Oct 2020 22:30:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/m68k: add vmstate structure to migrate M68kCPU
Date: Thu, 22 Oct 2020 22:29:58 +0200
Message-Id: <20201022203000.1922749-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bUMDWJkDK7mduUXAa/e2w1ntsW1vitRRi9P6+8MVgSZWIX8q7N3
 HVewYeghkpvYR6g+/RH5Isld7JADV1o2i7SNXYNhHDqH8QdQ8Bg619NNYG2S5UYjabJgyog
 mAuGdYdFRFCYP1BiC6v9oo3kveKVqhfeBoKzCssZIM6AP/wfy6sP60s6HvwQoOcJjXiONGp
 f/peCGX9ovOZFBtgowZ0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BWMqoUZlxtM=:GH2daR4cBJVBBQLnALS5NZ
 u7+pjYHjq7IyDkIKenUgyrlTH0bj4H87+6v38paDfDSvTH6YY6LrrbetTW6tsy4x7MqhliofQ
 mutO1QYc3JnzY1QdFj8vgE+7pwBqzQT5NHa0qKIBgyDJp314CGujW29CYXxXoe8T5uwKtFC1V
 2fjETGgmvq23WKgheYvfU8tpL68SxEyX/EOL9dPnTb46S11eV64idjfmPJjoST8Esn7Sl1jDz
 spzKFPa7GpGPcPdGQp0V63czQ9NjJXl93SvLooSIODpLjRJf4j3liI0LOc570o13yUE6ytUlO
 VY4WM+ewGS0o6gFTMeGsk/53t8XxAyFqaxI97tzxNUbp1ViD1F6DZ3KEQap99qyiZkkn6oTxO
 CObKA8/chxP+LpyNVzxTQC7h3rXCsFwlWotsAI4l7eGq4ktwiCVTnZpmC0zRr
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 16:30:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First patch is a cleanup patch.=0D
=0D
The second patch defines the vmstate structure for M68kCPU.=0D
=0D
I have tested the migration with my experimental machine virt-m68k.=0D
=0D
I didn't check if q800 machine type has all the needed vmstates=0D
for all the hardware devices it uses.=0D
=0D
Thanks,=0D
Laurent=0D
=0D
Laurent Vivier (2):=0D
  target/m68k: remove useless qregs array=0D
  target/m68k: Add vmstate definition for M68kCPU=0D
=0D
 target/m68k/cpu.h        |   5 +-=0D
 target/m68k/cpu.c        | 193 ++++++++++++++++++++++++++++++++++++++-=0D
 target/m68k/fpu_helper.c |  10 +-=0D
 3 files changed, 198 insertions(+), 10 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

