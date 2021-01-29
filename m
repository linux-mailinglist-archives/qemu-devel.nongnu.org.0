Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D230870E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:34:36 +0100 (CET)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PEh-0006Zk-R2
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PCw-00050l-VA; Fri, 29 Jan 2021 03:32:47 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:40089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PCu-0002Pt-H4; Fri, 29 Jan 2021 03:32:46 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M60HD-1l2OP53XB5-007VYg; Fri, 29 Jan 2021 09:32:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Trivial branch for 6.0 patches
Date: Fri, 29 Jan 2021 09:32:32 +0100
Message-Id: <20210129083236.584238-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rnAQn+D2cj0SiB9PSDsQYFelovRNWiAmcszV47KErlFcVEe+iJa
 RgdwPy9ozahhqamP3udDtoRKflaAnR/1zygOtop0uW/TW6Obn/5nkDrE6fHEv9dpw9iEH9A
 Lx1sNaOU+ARtqyR9rNd5q1OGrErfS33ES/llVh3tV1Oc/G6kY+gvb+UMhPxIVaEz2eUpzd5
 jbEtMZULHJ5QUt8tY83nA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2tBEqMPA/7k=:ze7wvtc3hdjs3AGl5GMrVC
 4AaodRN2iHzHO12/R0TFdbCXoiAL0o2bzUyKSVGxb9L7V7SAteQTO8vLl7EUfT+p/ARI/EXVT
 3N0bC4PskInDTlgUkDPr1T0io7O4Mu1yIYuc+pmQLAPZP2M1m9Ni1K9E0cEvbrCGtcV2INY2R
 flStj4OdCD+djjZY/Z2PG+HMwoqdQubfHPQcNm1UY62+HHvTOMxH9SUTdM6Z99g+b2rPgFRXz
 NzKsfPdX28FLoVGhMM28Qd89fz821d2NO9pXSVlwdtx7XMIWwkZUaIS9BYVymMfmRhlO9pTlk
 7T5cFpZBfxj2WNYUlXKN1T89sCLwmA1Z4vA8zt0ACEav6nTXB2qQZStgykERCJriflOj2WIBG
 3o6QrABJ3znPsjy6bmPL3P1xfts6tecue+5gKWP/+Cul01o9G1eeA+74bK1OyJTDsrvoziEur
 dUA4Km0AiQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-=
25=3D=0D
-1' into staging (2021-01-26 09:51:02 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request=
=0D
=0D
for you to fetch changes up to 77182df19f874adfc4ac98248606c154764baaa8:=0D
=0D
  target/rx: Fix compiler errors for build with sanitizers (2021-01-29 09:3=
1:=3D=0D
53 +0100)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches 20210129=0D
=0D
----------------------------------------------------------------=0D
=0D
Doug Evans (1):=0D
  net/slirp.c: Fix spelling error in error message=0D
=0D
Greg Kurz (1):=0D
  MAINTAINERS: Update 9pfs tree URL=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (1):=0D
  tcg/tci: Restrict tci_write_reg16() to 64-bit hosts=0D
=0D
Stefan Weil (1):=0D
  target/rx: Fix compiler errors for build with sanitizers=0D
=0D
 MAINTAINERS           |  2 +-=0D
 net/slirp.c           |  2 +-=0D
 target/rx/op_helper.c | 12 ++++++------=0D
 tcg/tci.c             |  2 ++=0D
 4 files changed, 10 insertions(+), 8 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

