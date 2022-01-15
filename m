Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6548F954
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 21:39:27 +0100 (CET)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ppe-0003PY-Ad
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 15:39:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n8pnv-00025o-1e
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 15:37:39 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n8pnt-0002Mj-5y
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 15:37:38 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MQuPJ-1mvyBU31Ud-00O3T4; Sat, 15
 Jan 2022 21:37:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] m68k: virt: fix reboot
Date: Sat, 15 Jan 2022 21:37:22 +0100
Message-Id: <20220115203725.3834712-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yZ+o07rXCmefW0wW15hmqpx5UVulQtXmJN42vf23aR6J2ISVXPF
 mRyxYAESP0r/GfoiMFd3MdHhZzUe26Rl4RWAliQ65Gzxu4qp+5JRnR3gVUkNLQQuMA8vkae
 t1JpPOReV+u3Slg1SHVrXfYesonSaXRBbKtBfLCeqqBqVbAs3IR5N3WiPSxON3MkZOmv9Gp
 7xysTtls1HnGP5Oh6XxSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P3sDFbGrX4M=:8cYXeKdGo8iY75O5A2oySu
 AmfuRuKCr4/MOkbgoJhGqhBdOM/paXo6JN5rcOMKZ+cqHt3FlM/HkTkX/SrSUdDUxG87PYTHc
 UTNI5G2TH+nPiEtDdIgMNeLDd3F6etSHfWfYJICrzsamiEM3WR6RS5gIuuMzDyTsocME2L+sU
 jjonlQUELrGXGP30JAec0rVgzLYnsCIlv7SRtczXDlhAmatretYQ/7C6ouZfbAOjytGalQUjq
 W1s8/MvzY84oDQHu07BVnRRIWBjj7a/9PBzFYc19YwPhy0cIOfrvsxq2lZ4OTIC0Uh2UQui5p
 K+S72J9+Rim0UplrGYC/XrbHYGyX69arNJirOBaM5cvLZFcwBuI+xMJe+iOSEiHV27NXXex9g
 2BIrjd3xealoVDdYru01APVupSEiSSHHrTydXrnB0sWgf1RQBTqcARcb73VJ48ac8eW/KnGxz
 BQwhkG4YfJWNYcFmwSvjb6ZGIF3i6C/4xOIKWQ0GXDddENomP/KKJg3eSLw+K18Kb4Xd4Aa/I
 bn3ZwTcPMVL7Wv7eaOe4IUXb5UPQDvW01ExzqpUAcFCfZjAwTPbd3Ih9NJe2D7z1MkLE5opz/
 wwmlVs47h1SP00htERIt70n7Ap+SaiZwsdI9qPum/1lQC8bXraB+W2dyNfeQVHo/I6UHC2qi3
 7shKVj0p/4U5aW9LQjNRoXrymVYggiqk+RDkotlsCOstsuIe76zNuVbI1HgJ3l4xVjjo=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes the reboot of the virt-m68k machine=0D
by correctly initializing the start address and fixing=0D
the ELF kernel image.=0D
=0D
The two first patches were already sent last year and=0D
never merged:=0D
=0D
https://patchwork.kernel.org/project/qemu-devel/cover/20210429141326.69245-=
1-laurent@vivier.eu/=0D
=0D
Thanks,=0D
Laurent=0D
=0D
Laurent Vivier (2):=0D
  hw/elf_ops: clear uninitialized segment space=0D
  m68k: virt: correctly set the initial PC=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  exec/memory: Extract address_space_set() from dma_memory_set()=0D
=0D
 include/exec/memory.h | 16 ++++++++++++++++=0D
 include/hw/elf_ops.h  | 13 +++++++++++++=0D
 hw/core/loader.c      |  4 ++++=0D
 hw/m68k/virt.c        | 22 +++++++++++++++++-----=0D
 softmmu/dma-helpers.c | 15 +--------------=0D
 softmmu/physmem.c     | 19 +++++++++++++++++++=0D
 6 files changed, 70 insertions(+), 19 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

