Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDF3E2717
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:18:45 +0200 (CEST)
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBw04-0004Ce-Ec
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBvyf-0002tS-NU
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:17:17 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:55997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBvyd-00055J-TY
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:17:17 -0400
Received: from quad ([82.142.6.46]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MZTVu-1mg3W51eSM-00WVT5; Fri, 06
 Aug 2021 11:17:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Linux user for 6.1 patches
Date: Fri,  6 Aug 2021 11:17:07 +0200
Message-Id: <20210806091709.2465239-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zx0G0k8+owH3I2I8JZW5yKUNfpdS8zvZo7ZoD3VIcjKphQ7RqZ7
 A6cBbg3tk+KdT0xEwcCRuBZlXEp3y5lZN5PmmX/V5/VWCuuNDI1wCq0Wf4gRAUQ099UVgmk
 jP3MMt3yP0ob59Pjcdxv+0xfrYUob6YbowlIeLMA3dec18fn7PDglA4zAUc5+ccom3yyGv4
 vFU43OqvNXgsjVRGKbB7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B1MtjPYJia4=:NTYSX0fZsKFWlRfKUHjhx1
 83CC+Er2pUSCdXRp8fgL9lyRkBkAAMYBjdQAiA2SxA3Nr/8SxlF+TwV1KlmsDZL67I2CWqY5S
 4x8OmDbKdASebIauZBtd614X6uMgIgeTLgCxsY428OO3wM639Gv9lsfUH8dFup4s6QuX6C6Q7
 Qx5BYOVkAYROVqmXCnp/HcUnmhO9WC6NCwgAx0mf9tdfJPejYc/Xm7IHthZdX2lb6q7FlTcrG
 DxtPzofa2P3IfIreXP7Kgj/dygaFwLtb3WJ+7H03AF6yKYWHGbl30fVFX68Q8nK09c33KD0kk
 gp/0Gy9r9AScHeRlSWHnxFFvAFXS4FpXr8TwngzlU00XgEXbVjvU+C92KRAuiqfRUYcuzANOG
 jPY/OqZk8I/R7GqPjTkWkUJVmA9GIzoT4GsSq10B6I/TV3qtHIkxE8UJzVcnBjxQmemqsq6lJ
 ngnM9b9QP1nilbUINR23kNPyJq1F/wR8YqzcSTByWJLmZ7FXzw3ICyGFBWuzqzu6oz9h0s32M
 5r7W2qM5J49HeFwMfxQdM6AcKv+3vVbbul/RcLC39712jQO4zxyRt5jro0LhPcDbFrBY9Ol1X
 G9/0fwLZlBg3xRyhlV/yeG0R8Nhpq0qDbsm45hcErAMa/zsn3x/wkTNsCyS6EyNvHJ6SZPgSP
 2rTLaJiHhB7/vbnUnhmf99Rc6nNu9k1q4zt3JwK6zkSatku7waXYOBozJ/i7x8f+JYlReGC7W
 Ui3HinCHVOJPoUq/se4ltDzVyEj9LYykwNjrgjYs9iB6+1B4mUpwXXYLV/nmRWrst4WLjCwkI
 tJZwh3RXs72gkbibtiBwpL/adK0lQa2l1/4rPB/RGafZ9EeaF29ZVMzJw988Pxj4O22Av+7
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9eb=
:=0D
=0D
  Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request=0D
=0D
for you to fetch changes up to 030912e01c0385b6b09e76549c1a8a04b624f49a:=0D
=0D
  linux-user/elfload: byteswap i386 registers when dumping core (2021-08-05=
 12:17:30 +0200)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210806=0D
=0D
Fix endianness and addresses in i386 linux-user target=0D
=0D
----------------------------------------------------------------=0D
=0D
Ilya Leoshkevich (2):=0D
  linux-user: fix guest/host address mixup in i386 setup_rt_frame()=0D
  linux-user/elfload: byteswap i386 registers when dumping core=0D
=0D
 linux-user/elfload.c     | 88 ++++++++++++++++++++--------------------=0D
 linux-user/i386/signal.c |  8 ++--=0D
 2 files changed, 48 insertions(+), 48 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

