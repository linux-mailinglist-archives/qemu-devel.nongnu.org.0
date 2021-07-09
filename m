Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448163C2A61
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:31:56 +0200 (CEST)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xAB-0000o1-6p
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6v-00060K-53; Fri, 09 Jul 2021 16:28:33 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:56503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6t-0007Sg-Fy; Fri, 09 Jul 2021 16:28:32 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M9WqY-1m7RIF2Y2W-005cuN; Fri, 09
 Jul 2021 22:28:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Trivial branch for 6.1 patches
Date: Fri,  9 Jul 2021 22:28:15 +0200
Message-Id: <20210709202824.578187-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D4UKHd6FQGck7gfqC2fMotfn0vKuzKvZrx+qIv4lRACAw8JvZ+F
 EymqJzXHxACi3sYwqRvf6xeRBvXHmxEs7jWz4DbaBB+e5Fl2VQmK7we8if4pi+HgvIqP2/w
 LZgAQxro6O7eAl/bHmKtiO8639Wbtu+n3Yw/tjeRfwCdWo2+gaMqRoRwFj1pnrHjsqyQi4m
 KuXTPTcDAFo0Gn/0dPUhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vAfaYdMYASI=:5NfXoqfr79RUZuVTTe3HGJ
 LgOnslnR29D02cjkwHvCroxrMJjwa24L46OGLRjvscUFtz9HwMH/k6gIUH/iNAuRVDonhR4b7
 Og/9nJKhDRzWtXfoRn0SQ5YwoijWKzx1ZbQXlnMrciM8b3O0cZP1gL8Jp5t6ASJq8P+4TGPXi
 BBm0yt0TcD2m1j3t3CbHMah+Wftx55EfIh7TLXf0ULLMfftgzAxb+XJelAOmeexPP822nPmTk
 wX85FRaGaY+P7bFMjv+3NRYU8Ur3PDyb932aFm7K9VXgHFk2mM8Nmxk4oy/5wPO1KkbJF/65T
 lKWHER6LrrwJTfJxcSZf0nPK/5Gy+xSYJDNmwQzh+wQrDcne4XFYV67eF3LKRqAeD+fM94qv2
 ntqHIML9uZdai1NLKtqzCRZFns/yr9FcV7ZybBYgcrCoB1R6uCUaJ9bSkbG9WgGGDGZnGf+fE
 y9Z+blVuEItcEYoDyH3qlTCO9GsZc0ROt1BvUOoVDHVdBQV8eALVKQR7AeFhohS+txQGQGKRq
 rDhbilu/ycMaHbw+Rg/sAm+Fg/VYjLEqKNonOrArKQtTjrrrb+JbbR5behi5plYGL72GBosq/
 Qd0KOAq2ksnmfo7/QrCKF42SQ0ej6XzajBak7hK1ydS3D0JUs9uWkmDMYonUH7Dc9jAO2ddiK
 eTD1OemwPJQitdlEEjsnm9Zn+RfhP+WOUfL+MlFo/RmglgFV93L5LnMG6sE4DJDH6qWtI6nk4
 y+qEAOiYskKC7qGuEU1hxZli2JOQ2caO/OPEu9UD/JHvmTRZiv6yQNZdvAawL38o76A6cnknH
 URdyyzXIqtRmJsCsm1CuMiiRepw3cmzzP2PPpwkUFRZopnpGqQQPyFeHBAFdrH/b1fwBQxc
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging=
 (2021-07-09 14:30:01 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request=
=0D
=0D
for you to fetch changes up to e28ffe90fde5702aa8716ac2fa1b4116cdcc9e61:=0D
=0D
  util/guest-random: Fix size arg to tail memcpy (2021-07-09 18:42:46 +0200=
)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches pull request 20210709=0D
=0D
----------------------------------------------------------------=0D
=0D
Hubert Jasudowicz (1):=0D
  virtiofsd: Add missing newline in error message=0D
=0D
Li Zhijian (1):=0D
  misc: Remove redundant new line in perror()=0D
=0D
Mark Nelson (1):=0D
  util/guest-random: Fix size arg to tail memcpy=0D
=0D
Markus Armbruster (1):=0D
  qemu-option: Drop dead assertion=0D
=0D
Olaf Hering (1):=0D
  migration: fix typo in mig_throttle_guest_down comment=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  memory: Display MemoryRegion name in read/write ops trace events=0D
  misc: Fix "havn't" typo=0D
  hw/virtio: Document *_should_notify() are called within=0D
    rcu_read_lock()=0D
=0D
Thomas Huth (1):=0D
  target/xtensa/xtensa-semi: Fix compilation problem on Haiku=0D
=0D
 hw/usb/desc-msos.c            |  2 +-=0D
 hw/virtio/virtio.c            |  2 +=0D
 migration/ram.c               |  2 +-=0D
 migration/rdma.c              |  2 +-=0D
 softmmu/cpus.c                |  2 +-=0D
 softmmu/memory.c              | 12 +++--=0D
 softmmu/trace-events          |  4 +-=0D
 target/s390x/translate.c      |  6 ++-=0D
 target/xtensa/xtensa-semi.c   | 84 ++++++++++++++++-------------------=0D
 tcg/arm/tcg-target.c.inc      |  6 ++-=0D
 tcg/sparc/tcg-target.c.inc    |  6 ++-=0D
 tcg/tcg-op.c                  |  2 +-=0D
 tools/virtiofsd/fuse_virtio.c |  2 +-=0D
 util/guest-random.c           |  2 +-=0D
 util/qemu-option.c            |  2 -=0D
 15 files changed, 70 insertions(+), 66 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

