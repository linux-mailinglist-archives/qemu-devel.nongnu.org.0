Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B765C2AD159
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 09:33:28 +0100 (CET)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcP5j-0002fF-QU
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 03:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcP37-0000kj-Bd
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:30:45 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:47863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcP33-00072F-6Q
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:30:44 -0500
Received: from localhost.localdomain ([82.252.154.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M6lxY-1kf9ff2TNe-008IX6; Tue, 10 Nov 2020 09:30:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Linux user for 5.2 patches
Date: Tue, 10 Nov 2020 09:30:31 +0100
Message-Id: <20201110083034.224832-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mWnjO8nUnapN6D+SMO81VANrZfmog4/bltPio3hAxRpdnKx7ViL
 T9YzWCxmRYCGpmHQ2Ukbe8D5RIvDm+L4bpNCh3SocPOlLLic+sxgvsCW2CwObMPj+JeNpHg
 jx9Bwxr2o2MIS048bvklPb5wyIl/7SMLzxN88OMzqyToNITwzpcgwAAqeuxVl96pP4ng2z6
 1SKMkYZ0FBXlp3ECUV+2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sk73feTq904=:aEDQiUjWC0lEEMF2PxWzLL
 xcc5E9tEUbnKC9DBaoqj7kz2EmcqDdPyE3M7xWTkIVi0bU9g9T4YT4OK75v+Lg1vI+e4Ojegu
 UO9k0XhAkSGN3R4kGHK6hKX8bl4sDw6DzKVt4DXW4WU2hMvTL10XVBlVlC0zEl8L+K1rRgNBr
 yye5nOfygGunWQTD4XWs+BDIoccrRDQpYKyGL34AnwldUbf2dFr7e4d7fI4lNauARx3TNV9E+
 yRFNjIvCy2buABT/oBa6MsQWQwcFpN9ljGSPwfI/V38k+jVRhUA2OHVuAfhQK2WDPxSJ7LBEY
 gsH9CczUCY2iRbBnnXKFqt4UhONd+Ew7fVT2SM7NW5ykVZX8M1Yu7Epu4sr+7U3roKmKqBMM6
 FYgp7H53CMOPT3LGJm3o1+87ovLXuo0Mnf/zxpXi8m55rtV2FCsLkeVCz1kr9
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 03:30:38
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

The following changes since commit 43afbbd9fea1b255cc81f5f4bfd0b6a88826c735=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2020-11-09-tag=
' =3D=0D
into staging (2020-11-09 20:29:04 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-5.2-pull-request=0D
=0D
for you to fetch changes up to c3ab5df2f5c466d998917f2c707e206322063dcd:=0D
=0D
  linux-user/sparc: Don't zero high half of PC, NPC, PSR in sigreturn (2020=
-1=3D=0D
1-10 07:54:22 +0100)=0D
=0D
----------------------------------------------------------------=0D
Some linux-user/sparc fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Peter Maydell (3):=0D
  linux-user/sparc: Fix errors in target_ucontext structures=0D
  linux-user/sparc: Correct set/get_context handling of fp and i7=0D
  linux-user/sparc: Don't zero high half of PC, NPC, PSR in sigreturn=0D
=0D
 linux-user/sparc/signal.c | 62 ++++++++++++++++++++-------------------=0D
 1 file changed, 32 insertions(+), 30 deletions(-)=0D
=0D
--=3D20=0D
2.28.0=0D
=0D

