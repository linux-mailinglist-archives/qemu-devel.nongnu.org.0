Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07426492745
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:31:45 +0100 (CET)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oaN-0007n8-Ts
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:31:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nba-0004YD-NW; Tue, 18 Jan 2022 07:28:54 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:40809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbY-0001uH-LJ; Tue, 18 Jan 2022 07:28:54 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MqINP-1mVjhi0svD-00nR86; Tue, 18
 Jan 2022 13:28:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Trivial branch for 7.0 patches
Date: Tue, 18 Jan 2022 13:28:38 +0100
Message-Id: <20220118122847.636461-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rpTQguqhbEm/oITqwFdw9trpaoT7dE4gaMTPWWC9ICC027Y+y6N
 XZTC+2TXoPNIIqKgmp854GEObWwulZq33WnjgZzXDLRzFo4oahA6Spc9Braic0c8VA599l4
 Jz3HIXwXfzMHN9wGWj0kY544XPrJBjzdNkuPkdgOtwWbhD2rNwkc6r4539pEh8aqAndII52
 vDgqgCZH6Sd+JbIxF9RJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ZNoj97stAo=:G2umrKFlhCWBy6F4HSacSM
 IdiYwzJLqguTShSQGKCXm2lGe9qgK7dNkKjgzBaTvx21R2kEwYEoaWBijZdPZt4C0N6b6P+PB
 DCE8RMUXIKEDRx7Ac9ljIPJjTrCYrMu6v9mYSbyUYlKH6Nr3RoR3Dw9jJvBlaC/IQbxlvinje
 xuCbypX2AqVQt4IX0VpFgNa1WQgWuxALZ7ewM5C0aE0V7uhQkxO2xTviBZQwrFXbe4R1fNvmp
 VYN0ReJF04IK1hKqaIjOJ7LMJ/SziTxY2ZNy2MwqwkoJ94qqTIyEf1MrLYl+6yTh7EClKP1OY
 k8Z37PwmY48nXBV0z+BwYtiRUhhVjwrzXRNwSFTjAKrUg6qRM0OzBVv7BrnGwZv0998YPfQD8
 M/Y/EUZeZVWs8snHIaxXx5hIY+RyOfYNVusM2hWMQ76ubH6zY+SJs67KycMHa6IXY1BZ6lyGz
 5KjRvzWwnIEB/jRXJrAu+0/CimTCiVmDGRfMcVXsDgEE8KkZS5JVlOuGXoleOy6AHvnAAiIQN
 g21WWwPwu8Lyt+9nrbQd4r7Y4oVo1Nc56L9goyTjXtKXzezA17HmnoGa9SGhuQkDxhXXiBB8z
 CAlNa8hpp3x7jq3/PI9ojEv94koo3lWZM4IPa9CCzClk4EWx1JXCLYEXkx0f7yuvGx+z0AxrY
 GQCadq8A+zjfZmfJZ83+PwqJN10Ap3iLXEBdM5eLo2yPVlNyb5t6XxqsFwyP6RnATEyY=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b32=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-2022011=
5' into staging (2022-01-16 20:12:23 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pu=
ll-request=0D
=0D
for you to fetch changes up to bfadf13f63d63d099bf2be14c9b1863f25a091a2:=0D
=0D
  linux-user: Remove MAX_SIGQUEUE_SIZE (2022-01-18 12:44:44 +0100)=0D
=0D
----------------------------------------------------------------=0D
trivial patches pull request 20220118=0D
=0D
Fix comments and typos=0D
Add vmstate for ETRAX timers=0D
Use ldst in megasas=0D
=0D
----------------------------------------------------------------=0D
=0D
Bernhard Beschow (1):=0D
  softmmu: Provide a clue as to why device tree loading failed=0D
=0D
Peter Maydell (4):=0D
  qdev-core.h: Fix wrongly named reference to TYPE_SPLIT_IRQ=0D
  linux-user: Fix comment typo in arm cpu_loop code=0D
  linux-user: Rename user_force_sig tracepoint to match function name=0D
  linux-user: Return void from queue_signal()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/timer/etraxfs_timer: Add vmstate for ETRAX timers=0D
  hw/scsi/megasas: Simplify using the ldst API=0D
  tests: Fix typo in check-help output=0D
=0D
Warner Losh (1):=0D
  linux-user: Remove MAX_SIGQUEUE_SIZE=0D
=0D
 hw/scsi/megasas.c          | 17 +++--------------=0D
 hw/timer/etraxfs_timer.c   | 34 +++++++++++++++++++++++++++++++++-=0D
 include/hw/qdev-core.h     |  2 +-=0D
 linux-user/arm/cpu_loop.c  |  4 ++--=0D
 linux-user/qemu.h          |  2 --=0D
 linux-user/signal-common.h |  4 ++--=0D
 linux-user/signal.c        |  7 +++----=0D
 linux-user/trace-events    |  2 +-=0D
 softmmu/device_tree.c      |  6 ++++--=0D
 tests/Makefile.include     |  2 +-=0D
 10 files changed, 50 insertions(+), 30 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

