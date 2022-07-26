Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48B581054
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:49:55 +0200 (CEST)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGHCM-0001R4-Rm
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oGH7U-0004XP-Cf
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:44:52 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:47459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oGH7Q-0001B8-VX
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:44:52 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MWAjC-1o0Llx2TTG-00XaJp; Tue, 26
 Jul 2022 11:44:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/3] Linux user for 7.1 patches
Date: Tue, 26 Jul 2022 11:44:39 +0200
Message-Id: <20220726094442.4452-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+12x2l5CAh1DNy97zyj/Zr8+YNce1zLqQjfwxOa5gLAaKb0SdrU
 9zNP2oyHxu60EEykA2si/n4l5+IEKE/MaLr90lt6sIPlUK69QELmTZ8FjuVYQzOKk+0Oui6
 6fh63C6EhbipZHZZtlcrpddt/FGecYOij5iUyQ48uJZ6EkzSNg9evpNh86zgIrzTWIUPtDR
 2eGfMVVc+36kqgLx5cAwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ymxi41qgexA=:pbVmMeBiiFq8p130phxO+U
 6vh8CmJ2GhC8z/PkJB+9y84vqG5w6bI2q1uVOeLXrToRlJ+RT3rKAksoz7LsNEqDC2FgLyoUB
 F2olWnfr4wTsmqW4pWD98UxmTHJZdC2HkjAs1LAVKvrr1eW/h/itlePfIeJJMorHupHdI1hrO
 lbKAbxj8NphLk4wwWxztPnQs7pKccLGXAOP9xHru83dAXa6lvkiNBK45TwDYTPJrv9OxKxG6a
 P8Qp04t0zbjW6NHVL1Hl8zKgv6/NbK7/OLtWsjh7TilJRzfNWeJTPpD8zn9kJy5wqxF6xljjQ
 X9VOM9fuIUnQDGvZGkynB/dZ1k9875F8dW6ngtgTRWMKjVrZZVP2S+KBx7W76YI0rL/lCTtvP
 nSkGXcxu8R/14pq8pYGOojrY0a8XAWplRN8z80+BjShBHFrn004H5JkSfOIVTbTFZItUmLFb2
 650k5eDykAgDbExtOVdjyaw7XPFoNEycqU+N1bU4IgWMXZ7URelj6jvS3GR86oosHFUl426Cs
 PznzjdCKLZ6CgGK9b20ZXnFMt13X+0NyZ6W/K8T0gS0OpRL+IHlNs9DjHC/tEvkcwgZdS12ja
 tBZ1uZFGke39uk214oYNozsLJcyuS0hKpkneyS+4JqFtuhvcOe1NSDj2eKr+kSebt3Kt88zm0
 OiGousvQaVEC55sIwj36M8mOkDhi94kioIvfYa22X5z1rgTzRwGrvMgIBBfJFadDwaS0dAqN6
 jfJGFThWzocVWjcDnWbIjbmeKhkfmE/ZiEu2qw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5288bee45fbd33203b61f8c76e41b15bb5913e6e:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-21 11:13:01 +0100)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request

for you to fetch changes up to 6f200f51869ff0de7ea0343dd7104362e994b382:

  linux-user: Use target abi_int type for pipefd[1] in pipe() (2022-07-25 10:42:11 +0200)

----------------------------------------------------------------
linux-user pull request 20220726

----------------------------------------------------------------

Helge Deller (3):
  linux-user/hppa: Fix segfaults on page zero
  linux-user: Unconditionally use pipe2() syscall
  linux-user: Use target abi_int type for pipefd[1] in pipe()

 linux-user/hppa/cpu_loop.c |  3 +++
 linux-user/syscall.c       | 13 ++-----------
 meson.build                |  9 ---------
 3 files changed, 5 insertions(+), 20 deletions(-)

-- 
2.37.1


