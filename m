Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7722040
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 00:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRlIw-0005ck-FA
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 18:26:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39591)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hRlH8-0004vH-3u
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hRlH7-00059C-6w
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:24:26 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:59402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hRlH7-000583-2m
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:24:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
	s=pic; 
	t=1558131863; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
	Date: Subject: Cc: To: From: Sender;
	bh=KIYDNj+Ax7S4cVsa1BB5pw4uyUUItI3e5+Oj57+pKMU=;
	b=VLJq6PwutBrVHdLcUZh6ww9w73jjNO1T9oqt2Nve9adD4bPyGxCdPvjfG1c9RCD4C4tqEtug
	jHyQudk1Q2bVRYy/ZdQQjBRf6oX4YK3FnrzvRA0BSUgo8vxXSF/YVD21FJj9uA1OHnHSG6a5
	wyL9JjTn4fsZYdYeSRHdYmOhbNQnekb2N3FcWdc7OBPrtg9VPdHMCyVTQTPs3n3f7uAD/QXN
	zWcJ/PLoKxYnw2cwE8uTi2+NV14ZWvcs/PhNpNvK+6HKMEigHnrS01tHUYLJztMwwfN8jGzj
	Hxd2Ub4RU6LSEQNmn4Csj2jTnYdYC9cbaLg2bMnaNoY0RCsks7Ajhw==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
	(30-9-187.wireless.csail.mit.edu [128.30.9.187])
	by mxa.mailgun.org with ESMTP id 5cdf3494.7ff77a124cb0-smtp-out-n01;
	Fri, 17 May 2019 22:24:20 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Date: Fri, 17 May 2019 18:23:40 -0400
Message-Id: <20190517222342.26394-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-devel] [PATCH for-4.1 0/2] target/riscv: Improve virt machine
 kernel handling
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, Jonathan Behrens <fintelia@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Jonathan Behrens <jonathan@fintelia.io>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonathan Behrens (2):
  target/riscv: virt machine shouldn't assume ELF entry is DRAM base
  target/riscv: Add support for -bios "firmware_filename" flag

 hw/riscv/virt.c | 93 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 24 deletions(-)

-- 
2.20.1

