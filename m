Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBF6DEB6C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 13:54:31 +0200 (CEST)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMWGc-0002LH-3N
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 07:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iMWBW-0005UD-Hs
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iMWBR-00039O-O6
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:49:13 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iMWBN-00037r-IE
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:49:06 -0400
Received: by mail-wr1-x444.google.com with SMTP id p4so13597806wrm.8
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 04:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xHuYdZan++o+YIHWDljoqNMc10hWZoNI8Pj+QAknYjI=;
 b=NkYnASqPGZI2tZF2UdsmWhdxK8E+cAHyTLYcn+3HT+g6Gyr9PfkkVuI9iWAKV05bdI
 oGkZTH4zupWrHy9f0XHhb2RxYDq9bs9IKfkzTpUSLUPIHg2yVeWehSf/gyWgSNCKo4iD
 qEwoUJTfkd18SwUVujORCLMMAG9MBlae37J82LCkVpTTx0LgzP8c7DNl+ip+C0XNB0w5
 FWwEk1EkUR6yZwTaZHiv1d5eG+QmcJxRGxsm4H3dFtlOKLhxOcFiPliFbq1docWt5Pfa
 xE/bg/X/DK5BDCCT4CT4Inv48cJkn7sHoqaQ8wLDK5nlwXoR1SgBaxFQfCJscyBbYgoL
 JMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xHuYdZan++o+YIHWDljoqNMc10hWZoNI8Pj+QAknYjI=;
 b=QTltrs2oxY09ukV3JxtHYbM/g+bIV+5IYnhOySUUkSzy0TSRwffnXdORsXms5EBZkP
 ParkVoqS4OqHbRTSY/Y3354Tct4XjIZUB+4dK2t49S4NJUjExO0cR8Rcvtq6IkQaGN0o
 rmV0qKbC3s4cSK0kzWZuMisvVhxLwtw2IIjJbDrXQyxA/9ro0/NrgKkP4tba3LeDkXfn
 eqMbF5bGsoagSp9jY7zddy6YRbCfDOXreeljSHy4m//YnWj9G/0+WmrWodbiYxYQq8Yl
 Wm9DxY2BUi66lHJ3dBOgER6S4BylPZ1PnoanB8qSJN8cOX1I/rwb9m3JAaHP7jXxKDJx
 8U8w==
X-Gm-Message-State: APjAAAXmZT0W32rr3/NI3EhMgmd9lTBk7dIHZPTaAU7TSVw6t4zfjths
 r4XUxi+GwXVv/suZ0scbh4NReCyc
X-Google-Smtp-Source: APXvYqzGUj8Ew9aj8lc0zPwf/R12bLjWjv0Ab3e25mPBvTYBjwP00wdDCa0k7elSOuwJ1tUoekz3Rw==
X-Received: by 2002:adf:e74c:: with SMTP id c12mr13368927wrn.133.1571658540646; 
 Mon, 21 Oct 2019 04:49:00 -0700 (PDT)
Received: from localhost.localdomain
 (129.red-83-57-174.dynamicip.rima-tde.net. [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id x5sm17156137wrt.75.2019.10.21.04.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 04:48:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/9] linux-user: strace improvements
Date: Mon, 21 Oct 2019 13:48:48 +0200
Message-Id: <20191021114857.20538-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

Few patches I'v been writting while trying to figure out this issue:
http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html

As usual with linux-user files, this series will trigger some checkpatch
benign warnings.

Regards,

Phil.

Since v7:
- use tswap32,
- do not name print_sockaddr prototype arguments
- use abi_int for target_sockaddr_ll.sll_ifindex
- added R-b tags

Since v6:
- Use ABI types in sockaddr

Since v5:
- dropped 'Verify recvfrom(addr)' since failing LTP testsuite (see [1])
- also define print_sockfd() for bind() (patches #6 and #7)

Since v4:
- rebased on master (no change)

Since v3:
- addressed Laurent comments
- added print_sockfd()
- removed the print_sockaddr_ptr() patch, also the two
  getsockname()/recvfrom() patches for after 3.0.

Since v2:
- display invalid pointer in print_timeval() and print_timezone()
- do not display gettimeofday() arguments

Since v1:
- addressed Laurent comments
- added 'last' argument to print_sockaddr()
- reordered series, so patches already correct can get applied directly
- dropped "linux-user/syscall: simplify recvfrom()" for now

v1: http://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg05855.html
v2: http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg08216.html
v3: http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg00411.html
v5: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02067.html
v6: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg01346.html
v7: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03114.html
[1] https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02807.html

Philippe Mathieu-Daudé (9):
  linux-user/strace: Display invalid pointer in print_timeval()
  linux-user/strace: Add print_timezone()
  linux-user/strace: Improve settimeofday()
  linux-user/syscall: Introduce target_sockaddr_nl
  linux-user/strace: Dump AF_NETLINK sockaddr content
  linux-user/strace: Add print_sockfd()
  linux-user/strace: Improve bind() output
  linux-user/strace: Let print_sockaddr() have a 'last' argument
  linux-user/syscall: Align target_sockaddr fields using ABI types

 linux-user/strace.c       | 120 +++++++++++++++++++++++++++++++++-----
 linux-user/strace.list    |   4 +-
 linux-user/syscall.c      |   6 +-
 linux-user/syscall_defs.h |  41 +++++++------
 4 files changed, 137 insertions(+), 34 deletions(-)

-- 
2.21.0


