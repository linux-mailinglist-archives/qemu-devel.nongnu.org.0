Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17AB338032
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 23:21:10 +0100 (CET)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKTg4-0005ft-D6
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 17:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTdf-0004Gm-BP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:18:39 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:48279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTdZ-00048w-Jl
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:18:39 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MaHOX-1lHX633Wnl-00WF9w; Thu, 11 Mar 2021 23:18:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] M68k for 6.0 patches
Date: Thu, 11 Mar 2021 23:18:23 +0100
Message-Id: <20210311221827.2595898-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2Y5jFcMx+1N7zRbl5YVOTSArrqnSrJod5kfTyXnWpn+qafnjjHs
 NE8/GaELNPny5KV0mWfF3g12Z2HWGicZSXhIqWmEE23bSLW/qReF0tS5DtJvWq5YDYDM21n
 QEt0s14+LE44kSbo3co2z3qeUgaXsNPmw1IXzYBb5vLKnb8qKqaYGMXRZCUYv5lTniNoknR
 p1N8AsXOj8Q/hp31d0e3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q7e80M6gvpI=:4S4fHxNID/O3DS8uOTuZg2
 vg19RXOQoj2QVih4IrLkuSkg6lnLo9rDeieFhzdQAlxL5SQECupvYH+vgE/Si4ctCPnCgpQmj
 BDqmW/3xhVEWiJ2HMQI197+wo977/rEnzPLEqVmjH5fKkj7r7pNz4mu2YC2zH8nuRP5lttIK4
 Evc7xPBpJNO/CVXHT2PbwkAeSFocTQhSVrLgf4F1UyujL1+kwO3BmVrvSULkooGnCeIWutO74
 TqBmPzS7VKxrGIwNjinuZprAUo6ssKmM7VwAvNm2msjtDe0Jg/t3ck6poeUBz9LKBoe3FbSE9
 h9XzZeidnobu1Y4e5kQSHI1dJdN7akFEqJqWhRkxkYynRGPc3X1ReB78cVGcMAltEzcgehVtp
 P+7tAvswWXhXyL6tEae0hyNdg+vgbXiWa8eYeGkF7q+wdaz8lNbjZyh7YGsSzM72S1YTOs5e4
 T1+0lXZpiA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f4abdf32714d1845b7c01ec136dd2b04c2f7db47=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-docs-xen-=
up=3D=0D
dates-100321-2' into staging (2021-03-11 16:20:58 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request=0D
=0D
for you to fetch changes up to a9431a03f70c8c711a870d4c1a0439bdbb4703cf:=0D
=0D
  target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature (2021-03-11 21:12:32=
 +=3D=0D
0100)=0D
=0D
----------------------------------------------------------------=0D
Prepare MacOS ROM support:=0D
  - add RTR instruction=0D
  - fix unaligned access requirement=0D
  - fix ATC bit (68040 MMU)=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (1):=0D
  target/m68k: implement rtr instruction=0D
=0D
Mark Cave-Ayland (3):=0D
  target/m68k: don't set SSW ATC bit for physical bus errors=0D
  target/m68k: reformat m68k_features enum=0D
  target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature=0D
=0D
 target/m68k/cpu.h       | 68 ++++++++++++++++++++++++++++-------------=0D
 target/m68k/cpu.c       |  1 +=0D
 target/m68k/op_helper.c | 17 +++++++++--=0D
 target/m68k/translate.c | 20 ++++++++++++=0D
 4 files changed, 82 insertions(+), 24 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

