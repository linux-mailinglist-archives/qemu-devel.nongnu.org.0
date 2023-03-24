Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBA36C810F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:21:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfirQ-0007dy-B2; Fri, 24 Mar 2023 10:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfirO-0007dZ-Ub
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:57:42 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfirN-0002VK-8m
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679669861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mHQB4DgoKl+SempK7VJJ1DUHwKhl1C/VT7AEjSaBYeU=;
 b=Y7k1gFRApMmpzcQ2hXM8nT2b6MexUqKjaWRL83PKqStOqVD9WtRB1SHN
 MdsIq9ukRUH2r1cdICOI6UWvE3w96mwnTBoB18baGpO/I61PvkX2aIQ3w
 KQKYRucr/Hk0w5Alttuvoi+a74Yipy6sySacW3Ug0huBfXXK8r0N9ULMO o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104622255
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:3LD3YK2KEeImWq4mL/bD5b1xkn2cJEfYwER7XKvMYLTBsI5bp2EDz
 zNNCm6EaPrfYGfxfdwkPNuypE4Eu57Sx9AxHAs+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLmdt8
 uQWBCoxRz+Bh+KfnbPmavJtiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ0JwBzC/
 D+bl4j/KkwHNuGb72qMzimpgMDvrR+iVZ8ASZTto5aGh3XMnzdOWXX6T2CTufSlh1T4XttOJ
 0EQ/gIqrK477kvtScPyNzWhrXuZ+xIRRddUO+s97g6L1+zT+QnxO4QfZmcfMpp87pZwHGF0k
 AbTxLsFGACDrpW6T1Ga7rm4tw+bFioVLUZfZHIkVgoKtoyLTJ4Isv7fcjpyOPfr0YyrR2yqm
 GjiQDsW3OtK05NSv0mv1RWe2m/3+MCUJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnuNOvzjxp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGM6F4AusILZSX0Mcebhr5d7Ox0pZUM6Py/DqyEBjawSsEZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGfuR4YIhIf0/llKeHr5NuYLHMwhinQs/s7inlUX4uVdfDVbJIYo43KymNbhjtvzf8FuOo
 76y9aKikn1ibQE3WQGPmaZ7ELzABSVT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:UWAkv6DDipdEDunlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; d="scan'208";a="104622255"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 0/2] xen queue
Date: Fri, 24 Mar 2023 14:56:11 +0000
Message-ID: <20230324145613.41502-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=prvs=440da7b32=anthony.perard@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:

  Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20230324

for you to fetch changes up to 670d8c6ebf7a2c425575bbd6fbaeb27d21edd6c6:

  hw/xenpv: Initialize Xen backend operations (2023-03-24 14:52:14 +0000)

----------------------------------------------------------------
Xen queue

- fix guest creation when -xen-domid-restrict is used.
- fix Xen PV guest creation.

----------------------------------------------------------------
David Woodhouse (2):
      accel/xen: Fix DM state change notification in dm_restrict mode
      hw/xenpv: Initialize Xen backend operations

 accel/xen/xen-all.c       | 27 ++++++++++-----------------
 hw/xenpv/xen_machine_pv.c |  2 ++
 2 files changed, 12 insertions(+), 17 deletions(-)

