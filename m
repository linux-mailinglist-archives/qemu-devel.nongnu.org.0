Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D2364FEB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 03:38:57 +0200 (CEST)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYfLs-0006kM-GK
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 21:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYfGO-0004KX-JQ; Mon, 19 Apr 2021 21:33:16 -0400
Received: from [201.28.113.2] (port=21420 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYfGM-0007Au-K0; Mon, 19 Apr 2021 21:33:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 19 Apr 2021 22:33:09 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9A5B8801107;
 Mon, 19 Apr 2021 22:33:09 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/docker: tests/tcg/ppc64le: Newer toolchain to build
 tests for PowerISA v3.1 instructions
Date: Mon, 19 Apr 2021 22:33:06 -0300
Message-Id: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2021 01:33:10.0022 (UTC)
 FILETIME=[1F25EA60:01D73585]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-ppc@nongnu.org,
 bruno.larsen@eldorado.org.br, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This series adds gcc-10 based images to enable the build of tests with Power10
instructions. Then, to put it to good use, a tests for the byte-reverse
instructions (implemented in 9d69cfa2faa7) is introduced.

Matheus Ferst (2):
  tests/docker: gcc-10 based images for ppc64{,le} tests
  tests/tcg/ppc64le: tests for brh/brw/brd

 tests/docker/Makefile.include                 |  2 ++
 .../debian-powerpc-test-cross.docker          | 17 ++++++++++++++
 tests/tcg/configure.sh                        | 12 ++++++----
 tests/tcg/ppc64/Makefile.target               |  7 ++++++
 tests/tcg/ppc64le/Makefile.target             |  7 ++++++
 tests/tcg/ppc64le/byte_reverse.c              | 22 +++++++++++++++++++
 6 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
 create mode 100644 tests/tcg/ppc64le/byte_reverse.c

-- 
2.25.1


