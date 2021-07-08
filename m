Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902133C1B50
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 00:02:02 +0200 (CEST)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1c5p-0002ox-2K
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 18:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1c2L-0008Ve-Kt
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:58:25 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1c2J-00065U-PH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:58:25 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MHmuE-1lvVcO0GWs-00EwJt; Thu, 08
 Jul 2021 23:57:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] linux-user: update headers to linux v5.13
Date: Thu,  8 Jul 2021 23:57:53 +0200
Message-Id: <20210708215756.268805-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FQKFJlmimOuGGEGr5uDlRVcdSIhWGp9YeMsyx8VtF2AwWq1L6+i
 oBN4pbvAxTuzUKys/Nlvfukf5SBCXP/pOwKFlzfFLtrIC4S5VNEHFC5WpEnQXgoH6AuN/1G
 L69lgBOir/UNd+DtLUMZMJOTsjOrsy7DPNuiB6DhUfYNdS6g6TZXAR1L3T4rN1dBgLoII/0
 NTOk6F6bD+y1nVmt0vxEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A4ToSEom6Wk=:fhEQzecWSfZtr5F6I7crIi
 Y+dU8C+ERUtI38r6VkZbHiKbyxBI0dVlQxWCNGk74p5JHCiW5g+isNut1cyTppWjNGk189q5r
 mQRLI9gLhf0vhw6TkuyBSRwhfaImdFk2eM7Qwpp6BDFFo2T6/4EgXnfTz490xYyMChBuBbNXb
 4RA8nMKNVZE+3HqQPhkb3z4HiNjHH56jdhj1EjF1dBbJ+cEF1ZaMHauAlEUySPr1Bc1Ble46B
 93NyWMXp2nrdPbiYFgE4tLHbwF2yFY0m49ZGHGUPzOI8gMIoYpQmeET0iQUJnP+NZD4l7H7VO
 IXOHb73JXLRCsxrFYuYZueC3LPGN8FtBCRtBxeK29HcR6WmqVj62+zFrxvkJj4HJkciHlbCib
 Fx/huc1fmM5+AOFHUaQW+mbS3U2CvumDBJ1t0yaVd/LSjFdHXXVgMiLJ0PTXOemVMrOqbcaHk
 9o4EhaMSwfhuoM0ewENFFMXENWcvlKXbVltQOVuWq0HVlxZimyCA2QYBhscb5AILH8g/yiIv6
 3bjUP4fEVF3FzSijaXp3oDF/6bbEoVWADZLuLp9YXcr2UigPZAVQ9v2KFbRMKBwVW5YXumR6H
 1clI21fijKvm2K9sRX4/6bJliU/zXb/PgMqrsruUL6e02fnTeTnHnShC65/8ZqzrwRjD1wgYm
 zpSomNE0Ar0zA62Auh/Vzym0PDr1Y3SFt/aoEJiilpZv8eBQZvPqWPpOfPIJLGIBywIKVZMer
 iuTw8SvGDlOB/l9kdTFIcMRmrynncVEHmFR/co+P+puzxlOZXk10W9Fqs1rgMgCj1YprcARHH
 2JGoicQXbw4pZaOo58YZ3+52ThLGzza0bL9hsF9kBT59f6+QEfmFBr4VwGsFX1oJtHwLGJ6
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Taylor Simpson <tsimpson@quicinc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All headers are updated using tools from scripts/=0D
=0D
gensyscalls.sh, update-mips-syscall-args.sh, update-syscalltbl.sh=0D
=0D
update-mips-syscall-args.sh has been updated to work with the=0D
file directory changes of strace.=0D
=0D
Laurent Vivier (3):=0D
  linux-user: update syscall_nr.h to Linux v5.13=0D
  linux-user,mips: update syscall-args-o32.c.inc to Linux v5.13=0D
  linux-user: update syscall.tbl to Linux v5.13=0D
=0D
 linux-user/aarch64/syscall_nr.h        |  8 +++++-=0D
 linux-user/alpha/syscall.tbl           |  7 +++++=0D
 linux-user/arm/syscall.tbl             |  7 +++++=0D
 linux-user/hexagon/syscall_nr.h        | 12 +++++++-=0D
 linux-user/hppa/syscall.tbl            | 31 ++++++++++++--------=0D
 linux-user/i386/syscall_32.tbl         | 21 +++++++++-----=0D
 linux-user/m68k/syscall.tbl            |  7 +++++=0D
 linux-user/microblaze/syscall.tbl      |  7 +++++=0D
 linux-user/mips/syscall-args-o32.c.inc |  5 +++-=0D
 linux-user/mips/syscall_o32.tbl        | 19 +++++++++----=0D
 linux-user/mips64/syscall_n32.tbl      | 19 +++++++++----=0D
 linux-user/mips64/syscall_n64.tbl      |  7 +++++=0D
 linux-user/nios2/syscall_nr.h          |  8 +++++-=0D
 linux-user/openrisc/syscall_nr.h       |  8 +++++-=0D
 linux-user/ppc/syscall.tbl             | 39 ++++++++++++--------------=0D
 linux-user/riscv/syscall32_nr.h        |  8 +++++-=0D
 linux-user/riscv/syscall64_nr.h        |  8 +++++-=0D
 linux-user/s390x/syscall.tbl           | 19 +++++++++----=0D
 linux-user/sh4/syscall.tbl             |  7 +++++=0D
 linux-user/sparc/syscall.tbl           | 19 +++++++++----=0D
 linux-user/x86_64/syscall_64.tbl       | 27 ++++++++++++------=0D
 linux-user/xtensa/syscall.tbl          |  7 +++++=0D
 scripts/update-mips-syscall-args.sh    | 13 +++++----=0D
 23 files changed, 227 insertions(+), 86 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

