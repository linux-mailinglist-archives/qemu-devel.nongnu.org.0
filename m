Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB8582C73
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:46:40 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkBA-00023G-I4
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGk1g-0003rN-49; Wed, 27 Jul 2022 12:36:49 -0400
Received: from [200.168.210.66] (port=61870 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGk1c-0007pB-RV; Wed, 27 Jul 2022 12:36:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 27 Jul 2022 13:36:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 98584800058;
 Wed, 27 Jul 2022 13:36:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PATCH 0/8] Patch series to set up a ppc64le CI
Date: Wed, 27 Jul 2022 13:36:24 -0300
Message-Id: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jul 2022 16:36:37.0860 (UTC)
 FILETIME=[0ACBD240:01D8A1D7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This patch series aim to make easier to set up a compilation and CI
environment in PPC64 and PPC64LE machines.

The first 2 patches is a fix not related to ppc64.
Patch 3 and 4 also affect some other architectures.
Patches 5 to 7 are adding Power specific additions.

Patch 8 is a RFC for a current way to run the docker tests in PPC64LE.

Lucas Mateus Castro(alqotel) (8):
  tests/docker: Fix alpine dockerfile
  scripts/ci/setup: ninja missing from build-environment
  scripts/ci/setup: Fix libxen requirements
  scripts/ci/setup: spice-server only on x86 aarch64
  scripts/ci/setup: Add ppc64le to vars.yml template
  scripts/ci/setup: Add Fedora to build-environment.yml
  scripts/ci/setup: Added debian to build-environment.yml
  tests/docker: Selective line reading by python script

 scripts/ci/setup/build-environment.yml | 54 +++++++++++++++++++++-----
 scripts/ci/setup/vars.yml.template     |  1 +
 tests/docker/docker.py                 | 15 +++++--
 tests/docker/dockerfiles/alpine.docker |  3 ++
 4 files changed, 61 insertions(+), 12 deletions(-)

-- 
2.25.1


