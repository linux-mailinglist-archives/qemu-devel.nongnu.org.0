Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6864D1B6F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:14:22 +0100 (CET)
Received: from localhost ([::1]:56640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbXZ-0007v1-4m
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRbMB-0006aT-PM
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:35 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRbM9-0001Oj-TV
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:35 -0500
Received: from quad ([82.142.8.122]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MwxNF-1oOEl30TxT-00yUN3; Tue, 08
 Mar 2022 16:02:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Linux user for 7.0 patches
Date: Tue,  8 Mar 2022 16:02:25 +0100
Message-Id: <20220308150228.1616561-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aOV3+eVL6CPI5Lmz0PSfz/wnV+i5G88PDwy+4l9oSUj9TijMktZ
 cZPG34V9SwvekMWtf1luksdYwW7SpnfQkAwKA+L5MvNP1jbwU8cGNnDmsmllo4gZOEqOANj
 syzlxyawBjQB/aH2L/0ElR2KWaCuNk2m1F30S6kqo1uWqLG5xGrYRUAS77W2CXs0W2OqT1J
 GDQd38QU29/Z653wbv7tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aHXDqwiFx+A=:BY3SxxUM6chA2eLP+E+igr
 0CpLWKBqqeGDapFx71D6wwDANsOoWeVdSM2t39Dy8a+j5clsfJBfOj7WI0d60boJoZdoV/Q4v
 /CoDLvDfoI2/5l0oa7p79b5jMgd14Rr4aOrBRYTpvBJ9PRYcSeXIDQO97F7PO4OrRAApV790w
 SEECt8eBaMhDada8P28v/FEgXaSlEUzAufX/Jx5xJgLqdowBborroNQgsgZR39IB3DEAXm/eV
 bm+q3eDwmlQaOVRlmOb7TCyXwNyrmOBqMGXcKAaqj0p79h1dZV2spqk6kO2sl7bw9/ZroQkNS
 QR5gcM+2mfms50F2bxkWS6hH/haJ8omXn2lx4eNmgju/De49FB27DFDFv6P5o6IZxfHqvz4++
 fdW0vN+05A+QBYwiwmTmczPPXB/0egFdppzzcU3HDJik0xIosOKEB17Q4mFvMDCIO4j+jlqXg
 VbCVvErJCptZ/YCLJWVDZ36kQN/tHMJUf9WsMdlbphEauS03OOFzSTnZzFXq5kJOe8zzTD/2m
 P40ZPkJSh+Oej6D3akdA69o4GCUe2umLg9gfCIG2x4DiPrQIIqf2GYolbqnf9Tv3SyW6LY35F
 FXKMr7V+Sgt8cCG3cuSlXWCKld+UrNHxkPnLC7h0elTItCDSCeFMTo25LA6b6P0DGM+wOXyV0
 KtdLjYbTv3j60Jr8r0JFxz8nUSZIYPWHPHpU7xPNjlL04G/2joi9H5HsYSBNoKybD5S0=
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f45cc81911adc7726e8a2801986b6998b91b816e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20220307'=
 into staging (2022-03-08 09:06:57 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-r=
equest=0D
=0D
for you to fetch changes up to 62089c849d49f92823c68624720cdac8fa4b43e0:=0D
=0D
  tests/tcg/ppc64le: change signal_save_restore_xer to use SIGTRAP (2022-03=
-08 16:01:08 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20220308=0D
=0D
deliver SIGTRAP on POWERPC_EXCP_TRAP=0D
remove stale "not threadsafe" comments=0D
=0D
----------------------------------------------------------------=0D
=0D
Matheus Ferst (2):=0D
  linux-user/ppc: deliver SIGTRAP on POWERPC_EXCP_TRAP=0D
  tests/tcg/ppc64le: change signal_save_restore_xer to use SIGTRAP=0D
=0D
Peter Maydell (1):=0D
  linux-user: Remove stale "not threadsafe" comments=0D
=0D
 linux-user/ppc/cpu_loop.c                   | 3 ++-=0D
 linux-user/signal.c                         | 2 --=0D
 tests/tcg/ppc64le/signal_save_restore_xer.c | 8 ++++----=0D
 3 files changed, 6 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

