Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6397608B1B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 11:42:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omAdi-00006w-2Q; Sat, 22 Oct 2022 05:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omAdf-00006o-RL
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:17:55 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omAde-0008Nd-9S
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:17:55 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MkHd3-1pVvde2yNt-00khvJ; Sat, 22
 Oct 2022 11:17:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/2] M68k for 7.2 patches
Date: Sat, 22 Oct 2022 11:17:48 +0200
Message-Id: <20221022091750.2713763-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pmjNEyFx7Fm6gwRv4bPkC+N64wQOhMy+i4pUF097jtfnGTKj/wF
 Qzms1wWendRSjyDPcbGciCkbRa8KfZ2Y2hL2sZIrTRuIhbWkdMDWdYj1NyRAzgHpO3UkSIk
 zgK94AQTB0TAshwGdoyXQwLftGhFQGtGve8Fzt9tj5sjHlLxLKNP73UxaMDhZ0oJCJ1Zar1
 Y1rDVGVyDKs/+S4qFmdIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8YqAE02w/iE=:dY/lekOQAx1OLAHNjTXt7a
 eUgobbfHFGlXVzo+Dow6TmswNKG6N7lBm7VqOTFuBMLuWfC7Sz4e4wB4+XjAvap9fp0RH+3d2
 f4jGKPi45Sgn+QtzMuhLgOvCMQf8OBt5Vx0PF30wDakwqFyDotKy2lZCrB1mJodmLyoPN1vT3
 tf6QiJPU2nYyVQvl9lWk+c2ChwR9d8E2ZrjeY1DXDKx1dH0Q/xjaBpyLeazVUAwRYlNg21G0N
 dQwcFLHmZDIR5fc3Iy9IvkkvMfhwBSoHtRyiMYd8RAzU/w4iNRbcQDb6aCGWy94c7VMlwPlZ3
 f1JNlyX8xn6te+fimxAAKQJt2UMSIXY0iWXKn1GFjs8S8HKmIR1vpk5AFJ6BTKqL/3BLHq15a
 R8FiWVO16e2APl5xworsBIlGNqmoBTfl4UqKYeBRRwW2KKPoZMKlQ/8CsRzGaxPCr2MGj25iK
 VmPh4UPwFaHDzPNs/6JuN66X7diJPeAwoXLGsxsX73TIvFTgB3EgRPBwpGigSXfa+OJ0avvOK
 a2c9DIPku+M8QOcuQTaDqhS4sbFci+CoHK3Hqtu22/aGDYXU557jn7qscIwgswPXQ2C1DoSUK
 O4O30qupe0iQUhswIM53TEAMuFslsBBh5vT8xZdmH6i1v+yfX2ZaO7Pcp0IfvgRWSKzOpDOBm
 kx511AhcAvNmwcOQ8KGWgB/QS2xd9ZSAWQ5vqIZbbAyTcRtYSRN+MSdJJKke3ljjsmLVP1Yvu
 U/tBOrxRyuYtRMkjcE4VhY/VBi18cEmFwVnin6EOmCYFJ/eyDDJRdDRl+oXmx8beUZZfts0LA
 b03o5yP
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:

  Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)

are available in the Git repository at:

  https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request

for you to fetch changes up to d3c7b59be912d257ae7773eb3f1127f81a710a4d:

  m68k: write bootinfo as rom section and re-randomize on reboot (2022-10-22 09:58:24 +0200)

----------------------------------------------------------------
Pull request m68k branch 20221022

Update rng seed boot parameter

----------------------------------------------------------------

Jason A. Donenfeld (2):
  m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
  m68k: write bootinfo as rom section and re-randomize on reboot

 hw/m68k/bootinfo.h                            | 48 ++++++------
 .../standard-headers/asm-m68k/bootinfo-virt.h |  4 +-
 include/standard-headers/asm-m68k/bootinfo.h  |  8 +-
 hw/m68k/q800.c                                | 76 ++++++++++++++-----
 hw/m68k/virt.c                                | 57 +++++++++-----
 5 files changed, 130 insertions(+), 63 deletions(-)

-- 
2.37.3


