Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A839214E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:14:29 +0200 (CEST)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzvA-0008Hq-67
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf6-0004K3-2d
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:52 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:43511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf2-0006YD-56
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:51 -0400
Received: from quad ([82.142.6.50]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MAfpQ-1lax1t2wHo-00B6bC; Wed, 26
 May 2021 21:57:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] M68k for 6.1 patches
Date: Wed, 26 May 2021 21:57:40 +0200
Message-Id: <20210526195744.227346-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zbxcvl5XHw9kXgoq8PZmeMkYr1X/uHE0SXWPehUF90zq029rrsx
 /3/iVuxGe8wJ13kxiqJ/uwfUOpjyXBDw4qt3mT56TC0P9gqyF+zQpbYzkrhI95cZPjpBuRE
 +AfkRBNRih9TmzsK5azyf/OmmcAAlM0We7zNHBIuE8Dk1gg4LUpibilCgDbSdMg/Qwuv5oM
 geKHtt4V1zjnoY9mUfw9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cSN6mZ3va64=:L5JBFbuQUQFLRiYPJFb9Mw
 6nAuKfWUzLDdE9mcDUK3UQpHDLsqkCta5gX3vHJveNQVoe6DoGu81y5G7HE+QBcUXnKhkXNfW
 96ipAyQnw8pG21KYsNR8nB4HK0LZoVrHQhXf3TAHxNMjKBJyj938/nJ2exfEJGLIZJaeSfX12
 zVCu5S/pfU8V6LfWyLb+HtDZ0rO5O8s0UxiHDinNyYXy7WpADKJpaCguX6ZJd9BIB30y0qTud
 WwnvyYs99UhW5YidZkwrWa4F2se+8IKEjqVAYGMNJRmujKZ4TJ7XjSnS3OrLYuZ/Xg4rcf03b
 bEurEPtQkG5Um2YPy42MpdsC/I89rl53HI7yvipGKAW6aLjgMo+C65juo9N9lCfuDwwLBqm3d
 lcJt06xbrxTPT023jdMOFOcXj9QBabreFYFmEjKzzEqshaLFONrG//ObFuForZcU8SRhYM2qs
 hUWTNGZyqU37Y9G/e2TykZfzdJQLghVtBV2NTrvgsZrVVsAxPnRta2r3Voq03H5vgJDDekJJ5
 ES9O+yQAuc8HeXUynG30vw=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

The following changes since commit 0319ad22bd5789e1eaa8a2dd5773db2d2c372f20=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-misc-=
updates-250521-2' into staging (2021-05-25 17:31:04 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.1-pull-request=0D
=0D
for you to fetch changes up to 5e50c6c72bf8575f124ec9397411f4a2ff0d0206:=0D
=0D
  target/m68k: implement m68k "any instruction" trace mode (2021-05-26 20:4=
5:18 +0200)=0D
=0D
----------------------------------------------------------------=0D
m68k pull request 20210526=0D
=0D
implement m68k "any instruction" trace mode=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Cave-Ayland (4):=0D
  target/m68k: introduce is_singlestepping() function=0D
  target/m68k: call gen_raise_exception() directly if single-stepping in=0D
    gen_jmp_tb()=0D
  target/m68k: introduce gen_singlestep_exception() function=0D
  target/m68k: implement m68k "any instruction" trace mode=0D
=0D
 target/m68k/cpu.h       |  8 +++++++=0D
 target/m68k/translate.c | 51 ++++++++++++++++++++++++++++++++++-------=0D
 2 files changed, 51 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

