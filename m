Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786F569D2C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:23:33 +0200 (CEST)
Received: from localhost ([::1]:34414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MnL-0000TI-Vl
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLh-0002tC-Oa
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLg-0007XV-7M
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGY+3nxfxPiKGQg+Ba35A6nRHh5PqIaDn669AYeZsq4=;
 b=aRVAZfPhKhPSRrVRCMOz6OhyYXPHgxIIWqT5o8oCVhgTv9sVDYXSj0cIq1vOW9PYLfjTVG
 wJ5Mff1PVnonbMuht4Rj9vd1yVbPqcmRrlpcj1B5w6a8VsYYtCB1BkMDMSxrw1nYPeT8yx
 QrfShBX8O9vakyhZMEbcPJNu/s/9kKo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-FdiGI9L4P3SlQpskLPmDHw-1; Thu, 07 Jul 2022 03:54:50 -0400
X-MC-Unique: FdiGI9L4P3SlQpskLPmDHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1A90185A7BA;
 Thu,  7 Jul 2022 07:54:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE3A040CFD0A;
 Thu,  7 Jul 2022 07:54:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 13/18] pc-bios/s390-ccw/netboot.mak: Ignore Clang's warnings
 about GNU extensions
Date: Thu,  7 Jul 2022 09:54:21 +0200
Message-Id: <20220707075426.1163210-14-thuth@redhat.com>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
References: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

When compiling the s390-ccw bios with Clang (v14.0), there is currently
an unuseful warning like this:

  CC      pc-bios/s390-ccw/ipv6.o
 ../../roms/SLOF/lib/libnet/ipv6.c:447:18: warning: variable length array
  folded to constant array as an extension [-Wgnu-folding-constant]
                unsigned short raw[ip6size];
                               ^

SLOF is currently GCC-only and cannot be compiled with Clang yet, so
it is expected that such extensions sneak in there - and as long as
we don't want to compile the code with a compiler that is neither GCC
or Clang, it is also not necessary to avoid such extensions.

Thus these GNU-extension related warnings are completely useless in
the s390-ccw bios, especially in the code that is coming from SLOF,
so we should simply disable the related warnings here now.

Message-Id: <20220704111903.62400-13-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/netboot.mak | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index 1a06befa4b..057f13bdb4 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -16,9 +16,12 @@ s390-netboot.elf: $(NETOBJS) libnet.a libc.a
 s390-netboot.img: s390-netboot.elf
 	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
 
+# SLOF is GCC-only, so ignore warnings about GNU extensions with Clang here
+NO_GNU_WARN := $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-gnu)
+
 # libc files:
 
-LIBC_CFLAGS = $(QEMU_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
+LIBC_CFLAGS = $(QEMU_CFLAGS) $(CFLAGS) $(NO_GNU_WARN) $(LIBC_INC) $(LIBNET_INC) \
 	      -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 CTYPE_OBJS = isdigit.o isxdigit.o toupper.o
@@ -52,7 +55,7 @@ libc.a: $(LIBCOBJS)
 
 LIBNETOBJS := args.o dhcp.o dns.o icmpv6.o ipv6.o tcp.o udp.o bootp.o \
 	      dhcpv6.o ethernet.o ipv4.o ndp.o tftp.o pxelinux.o
-LIBNETCFLAGS = $(QEMU_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
+LIBNETCFLAGS = $(QEMU_CFLAGS) $(CFLAGS) $(NO_GNU_WARN) $(LIBC_INC) $(LIBNET_INC) \
 	       -DDHCPARCH=0x1F -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 %.o : $(SLOF_DIR)/lib/libnet/%.c
-- 
2.31.1


