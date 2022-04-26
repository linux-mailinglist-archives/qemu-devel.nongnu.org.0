Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E750FDD8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:56:15 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKjm-00053O-Au
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKa8-00065C-4y; Tue, 26 Apr 2022 08:46:16 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:45065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKa6-0007CJ-CO; Tue, 26 Apr 2022 08:46:15 -0400
Received: from quad ([82.142.9.138]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N6LMN-1nyDoA3lxB-016jPr; Tue, 26
 Apr 2022 14:46:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Trivial branch for 7.1 patches
Date: Tue, 26 Apr 2022 14:46:05 +0200
Message-Id: <20220426124610.639614-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ey7uDti7QYxdo4XZ74JfEGj3zumElS8RzOYyRH4bZsuibPS3TWU
 BrMT8KUzj20OMFLyPTbdY8cWEDd/GbbyvaarmCr4nt+HR+YpYORjo78bxKFfTXxX7MopPkR
 juvSRvVFRzAy87xcpTZjU9Wst2712hMStt5X6zG0zXMm1yeEgDymaEqPcq0Be9S3a7MYSeV
 qhanhBqTAF4P9WnSEV9Lw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EX/AfjcaJyU=:rPMGlklBDwNRkFdOJfJyMW
 UlxDUWZEQjbo/VOgSv+tbll0k8H3tQx9YJZq2P8Th+6vEXr9KPsSQQYwEZgonyWLVRqM9IgMZ
 MJD3G0CSKpFrfW92RKdVd+PTeTj+Ly0i2m4sPmMmneJdzlD1LU6qhAeZBfAM0KF3CeSwwX2bq
 SHFa+FU9zu4PUyk7fomL735OJd96CPbD4VrPNFAer639BU4DXOVlIuFz3lDo12pAI6hL0Obu5
 zpFNsJaVfBDKIFLCTCyx89s3frqEQI8NP4lRZ9M35nboSjNVsAwtq3Q/SrkNBFTY9vZa5poIV
 Qhmgoh3tqAuQyznNMYRaexJByfMlNOfzb6JjjWb3Ed+uYg+h8bdOb75/pxzLfQjkE/mlHhSf6
 VCyOUy/0529+9m+YVagh+ueJKM9fTNAlMAx6LkrRxpy4/5AYhEcyMTGdjCquQ1hQqoQwyiYx/
 4Hn/3TALVlTfBmP+9ZiWs+gNKdy/WzgN4vxqZxvQU2qCw8iG4FY5z5tq5efiZKfgUM05bE9JM
 USh89088QpXh5ydy2TPuLh+p1s0PKc5wqWkUXepYgBOZX/QcR2no3Pdu/l4m1YVbj+1GSqJBr
 obdXg1neYtnVc6rxRREAFThdf4NXcK4ruqbRmMvVlE0u43CiVBhEL0ZC2BuD4Sjij/08n8vmz
 Vj5+9Gl0AezqtelzBjnVfCsrUhlYGKfgwIOvg+h7uuLWIs77RudozlKHkAeOo4tKcnz8=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a1755db71e34df016ffc10aa0727360aae2c6036=
:=0D
=0D
  Merge tag 'pull-block-2022-04-25' of https://gitlab.com/hreitz/qemu into =
staging (2022-04-25 13:35:41 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.1-pu=
ll-request=0D
=0D
for you to fetch changes up to 4a89bf188a318592324769bd2bda95172c9a7091:=0D
=0D
  docs: Replace HomeBrew -> Homebrew (2022-04-26 12:40:36 +0200)=0D
=0D
----------------------------------------------------------------=0D
Pull request trivial patches 20220426=0D
=0D
----------------------------------------------------------------=0D
=0D
Eugenio P=C3=A9rez (1):=0D
  vdpa: Add missing tracing to batch mapping functions=0D
=0D
Stefan Weil (2):=0D
  docs: Replace Qemu -> QEMU=0D
  docs: Replace HomeBrew -> Homebrew=0D
=0D
Thomas Huth (1):=0D
  target/mips: Remove stale TODO file=0D
=0D
Yuval Shaia (1):=0D
  hw/pvrdma: Some cosmetic fixes=0D
=0D
 docs/about/build-platforms.rst |  4 +--=0D
 docs/pcie_sriov.txt            |  6 ++--=0D
 hw/rdma/vmw/pvrdma_main.c      |  9 +++---=0D
 hw/virtio/trace-events         |  2 ++=0D
 hw/virtio/vhost-vdpa.c         |  2 ++=0D
 target/mips/TODO               | 51 ----------------------------------=0D
 6 files changed, 14 insertions(+), 60 deletions(-)=0D
 delete mode 100644 target/mips/TODO=0D
=0D
-- =0D
2.35.1=0D
=0D

