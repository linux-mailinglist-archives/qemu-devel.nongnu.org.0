Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91310CF796
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 12:56:27 +0200 (CEST)
Received: from localhost ([::1]:53619 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHnAH-0003YU-Aw
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 06:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1iHn7T-0001tD-PF
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 06:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1iHn7P-0003nt-J3
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 06:53:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1iHn7P-0003m6-Au
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 06:53:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 90F2D30BEBE6;
 Tue,  8 Oct 2019 10:53:26 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-109.rdu2.redhat.com
 [10.10.120.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC4B5D9C9;
 Tue,  8 Oct 2019 10:53:24 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Subject: [PATCH 2/4] target/i386: remove useless enable_compat_apic_id_mode()
 prototype
Date: Tue,  8 Oct 2019 12:52:57 +0200
Message-Id: <20191008105259.5378-3-lersek@redhat.com>
In-Reply-To: <20191008105259.5378-1-lersek@redhat.com>
References: <20191008105259.5378-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 08 Oct 2019 10:53:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The enable_compat_apic_id_mode() function definition was removed earlier;
there are no callers left. Remove the function declaration too.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3D1515
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 target/i386/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index eaa5395aa539..c9ab1a367939 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2126,8 +2126,6 @@ void x86_cpu_set_default_version(X86CPUVersion vers=
ion);
 /* Return name of 32-bit register, from a R_* constant */
 const char *get_register_name_32(unsigned int reg);
=20
-void enable_compat_apic_id_mode(void);
-
 #define APIC_DEFAULT_ADDRESS 0xfee00000
 #define APIC_SPACE_SIZE      0x100000
=20
--=20
2.19.1.3.g30247aa5d201



