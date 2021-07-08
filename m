Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F5E3BF813
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:09:52 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Qyd-0006hK-3j
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qwt-0004oF-SN
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:03 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qwq-0001Er-VC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:03 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mvs2R-1l93Cz1CJ5-00srd6; Thu, 08
 Jul 2021 12:07:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Linux user for 6.1 patches
Date: Thu,  8 Jul 2021 12:07:48 +0200
Message-Id: <20210708100756.212085-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Uyl+4/Htp6a2w/GJf0BAqh7VqX5VkG1NO6i8lNbxQdGaEUFVolK
 ecY5vTNKKGmYcVKM4P6R9FCsvNw0Vql8lhEreOI5jfhS4NliZEZSnV44pbhF1fQiInKRWBe
 MWVZC46USVVKAleMphRpH87RbqEuOsEwz/rQtVSEy6DsyUDX0O96+B8G4pADx4Z+adKzeDw
 WqfbRMTep+7bKCQ3WtxXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YLHV5byLsH4=:JltjW5vpbtDoR6dQanu7W/
 30TqXbmQSwONinDjoXxm2/lvkZkmIn6ta6HLO/1XdsNBjyhjUM+SiCe/O+4XQcyY5j4tdWp2o
 Qb14JR2TGYYAg5pT/lxgYxLT7rmbCeiB/HAoZO+HeTrSkSQ7KLPLm+oRPRG3W3Gqi3RelQIRa
 CbGGQFJ3xfjhWSmQkjEznYc3DvR/pJwHSfidyCSnWhP7lKlQKD/FHgrw7D4DsJIIePWggU+jl
 LZQvnQE1ekXLQihv1jwE0IILI/BJR5lcsIW+Ia2rexnEuiy4YlALQ84fV+P0HUXLOSP08ZiPw
 BS5w51RDxSXL9+NYZvwRyk1KyIXB3i4N1CaPoDJRaG4Medm46olbUduml0pvsgkgRvOUHU9Ga
 VMfu+0CdP/dtwKZ8drnHAagWUsf+kf8u5g1nvyDtXsOqv+gprxs2EXvojnjk0bp9rq6r7bdJK
 M2Bqld7T6T2jYDUOMvcr4UsJsTIsusDrSESvu6u4vPSn3Xzw6rIIHzSPSli4sP0oCWpgwRCfG
 6LUPzLPVJgFZAggPIndrpEFJDcKP9XFoaRd79bd+RGkYgI7ZoGRGHHHE3A12qbf6iJ0RS/smM
 mh0TGQ7N54GR3pA0IeUEiIJQwK2VSS1qqE6+rr00Jwbqi74aPbUuRn+Rt7m5V5Ct32PXtmLUc
 6oiNRJKizd3DpfGzxvwQMO+CNok9AXW9vklar6f6/ElpCO2aU2XK3HuSBRckcxVSDdD5Myv4d
 9IlOsruyWwfF4CCKTSu1cDJO8RYbjM11CTyxtdQfEU6oQQnU7dZVagF/VyitXpTyyBJHgzzPC
 qO23JHNVIoS+RI9yW3Cohv+JjKBKgGNhTwbLhWax3GpM5VBKMun5Ou0yMKjz/TdF343mxyk
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-07-06 11:24:58 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request=0D
=0D
for you to fetch changes up to c632ea1dd90313bc360b9de9d5014c2167f4d038:=0D
=0D
  linux-user/syscall: Remove hardcoded tabs (code style) (2021-07-07 21:34:=
21 +0200)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210708=0D
=0D
Code and style cleanup=0D
Add ppid in self/stat=0D
ELF_HWCAP for RISC-V=0D
=0D
----------------------------------------------------------------=0D
=0D
Andreas Schwab (1):=0D
  linux-user: fill ppid field in /proc/self/stat=0D
=0D
Kito Cheng (1):=0D
  linux-user/elfload: Implement ELF_HWCAP for RISC-V=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  linux-user/alpha: Handle TARGET_EWOULDBLOCK as TARGET_EAGAIN=0D
  linux-user/hppa: Handle TARGET_EWOULDBLOCK as TARGET_EAGAIN=0D
  linux-user/mips: Handle TARGET_EWOULDBLOCK as TARGET_EAGAIN=0D
  linux-user/alpha: Remove hardcoded tabs (code style)=0D
  linux-user/syscall: Remove hardcoded tabs (code style)=0D
=0D
Richard Henderson (1):=0D
  linux-user: Fix style problems in linuxload.c=0D
=0D
 linux-user/alpha/target_syscall.h  | 198 ++++++++++++++---------------=0D
 linux-user/elfload.c               |  13 ++=0D
 linux-user/hppa/target_syscall.h   |   2 +=0D
 linux-user/linuxload.c             |  42 +++---=0D
 linux-user/mips/target_syscall.h   |   2 +=0D
 linux-user/mips64/target_syscall.h |   2 +=0D
 linux-user/syscall.c               | 191 ++++++++++++++--------------=0D
 7 files changed, 235 insertions(+), 215 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

