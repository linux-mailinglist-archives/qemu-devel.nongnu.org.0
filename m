Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D246D11531
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 10:18:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6ve-0004IQ-0d
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 04:18:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6t3-000356-BF
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6sx-00078Z-Oj
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:13 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM6sx-00077I-J0
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f7so2031730wrs.2
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 01:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ssjpbf3lZSyEFjm9LoORSLfJB5PJJDjX374HlcXIslc=;
	b=F2fYBhkJCiKwYXlsKA46LF+FFIlFlftejmpUHmRaQaZc0kXhQzugK9A5T+YKlyJZTj
	7Kb8Q6HsguMVH3UWTRIU5rvvBVyrrfXasp3m14m8Cl42v/5lIzxQr7NTjMOMDChSgtPO
	eFvuUlA7nCZA0KmWh2xiRva2StA5nddPedWhHSMasyPGRvxx41EHiSwWWKI6/CxdMxFG
	Pnd8gnGx1oAOokriDlYLI8Unv9S2aUu/XoGbfI1udjCB+WTRXgb6eKihR74bCDOQnxUZ
	YJwISgvQakdmmwaZ7iN9HoQV/RuGSZl9m4mln/2E9oFi/ObiF+a9MXP0fPb5EOl4HqIS
	Il1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ssjpbf3lZSyEFjm9LoORSLfJB5PJJDjX374HlcXIslc=;
	b=hnWUbbmyao3pkfcN3FZu8mE1LDzmkP9rx8hvz3hlnSbwbQJE27hPqpoDIuGzAgWCtu
	1Aq5OmCBBR6qkjLZt6Tp0xNh5goFQoxnJjBgB2jJK6JC15lxH8UvsatZiMuvm+ZitpgS
	iVM8Tw2Z1lmhwSnC+4NOzpcgM8yXASRb2Vqt9UZ8Au014jleiK3kV1pVzNXejVhD0DCA
	QE9sH6GFffzWZgggf5t9XZN52m8sQDtf10NTaE6ew2t30wV0yJD8wZaRM0W5aVlZ8ski
	Cl91bW3tNe0Js3JY7mtVnCW0jLv3QoFZwWh2WAw1NEhxbMoZ+tQRB7E6TRTfJowPbyeC
	bWGQ==
X-Gm-Message-State: APjAAAVboQduWAA8qzdmjP27wud+OolnnWn1IMkc767U2hMzbrQr/6ox
	uAH2lwi7Fs3NNaV9JmkS6K0QE2OZ
X-Google-Smtp-Source: APXvYqyX49+TXNdFDlgRhaXiS7S7fztKPT9JJ9GTO7e+AIeNKXSbgPtHOJrf2vFERD/JJOFcK8yEgA==
X-Received: by 2002:adf:fc05:: with SMTP id i5mr1801948wrr.190.1556784965674; 
	Thu, 02 May 2019 01:16:05 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id
	d16sm44698367wra.54.2019.05.02.01.16.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 01:16:04 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 11:15:27 +0300
Message-Id: <20190502081554.5521-1-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42a
Subject: [Qemu-devel] [PATCH v9 00/27] gdbstub: Refactor command packets
 handler
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
Cc: alex.bennee@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series refactors the old gdbstub command packets handler
with a new infrastructure which should ease extending and adding new
and missing gdb command packets.

version 9 changes:
- checkpatch fixes

version 8 changes:
- Add new command to display the Supported qemu generic query/sets
- kvm: Add API to read/write a MSR
- Add new commands specific for qemu:
  * Command to swap the memory GDB sees to be the physical memory
  * Commands to read and write a MSR

version 7 changes:
- Fixed few checkpatch complaints
- Feedback from Alex Bennee

version 4-6 changes:
- mostly feedback from Richard Henderson

version 3 changes
- Split the single patch to many individual patches for easier reviewing

version 2 changes
- Code convention fixes

Jon Doron (27):
  gdbstub: Add infrastructure to parse cmd packets
  gdbstub: Implement deatch (D pkt) with new infra
  gdbstub: Implement thread_alive (T pkt) with new infra
  gdbstub: Implement continue (c pkt) with new infra
  gdbstub: Implement continue with signal (C pkt) with new infra
  gdbstub: Implement set_thread (H pkt) with new infra
  gdbstub: Implement insert breakpoint (Z pkt) with new infra
  gdbstub: Implement remove breakpoint (z pkt) with new infra
  gdbstub: Implement set register (P pkt) with new infra
  gdbstub: Implement get register (p pkt) with new infra
  gdbstub: Implement write memory (M pkt) with new infra
  gdbstub: Implement read memory (m pkt) with new infra
  gdbstub: Implement write all registers (G pkt) with new infra
  gdbstub: Implement read all registers (g pkt) with new infra
  gdbstub: Implement file io (F pkt) with new infra
  gdbstub: Implement step (s pkt) with new infra
  gdbstub: Implement v commands with new infra
  gdbstub: Implement generic query (q pkt) with new infra
  gdbstub: Implement generic set (Q pkt) with new infra
  gdbstub: Implement target halted (? pkt) with new infra
  gdbstub: Clear unused variables in gdb_handle_packet
  gdbstub: Implement generic query qemu.Supported
  gdbstub: Implement qemu physical memory mode
  gdbstub: Add another handler for setting qemu.sstep
  kvm: Add API to read/write a CPU MSR value
  gdbstub: Add support to read a MSR for KVM target
  gdbstub: Add support to write a MSR for KVM target

 accel/kvm/kvm-all.c  |   39 +
 gdbstub.c            | 1807 ++++++++++++++++++++++++++++++------------
 include/sysemu/kvm.h |    2 +
 3 files changed, 1359 insertions(+), 489 deletions(-)

-- 
2.20.1


