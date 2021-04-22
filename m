Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85613682E3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:02:46 +0200 (CEST)
Received: from localhost ([::1]:37434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZaqr-0004Vn-FM
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZana-00031y-0D
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZanX-0002rP-9w
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619103558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KyU49pUarJyylQp+gLXcuupEdSTxKWJDdKxo6CuEd2k=;
 b=IdOVI27XNzdrcd675+3HwhBQMzHHpMag9b/PxFFpXaorD+lZwuHb+vlFRRj1kIyraDgzSw
 +5Itl7F3nuwLbf/moPmnWSe92Z2+Q9qru76ppSrYEnkqz8d0TkM+0jz3hxizGakL1apW8K
 5sK4DP3Fj9AoFWiEv8G6Axll3+w+8Ws=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-Fi8VWcpwO-ajf6pHRyt8QA-1; Thu, 22 Apr 2021 10:59:15 -0400
X-MC-Unique: Fi8VWcpwO-ajf6pHRyt8QA-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so9413560wrl.20
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KyU49pUarJyylQp+gLXcuupEdSTxKWJDdKxo6CuEd2k=;
 b=EVUzqnbqfXdxA38gLIJAG79+PO+AKNQfaZXDHhilSqCLN/UPNW16yn1V4SSdFAzwAG
 aOZTBs6tMXY3sQrTq+Q+D57JUPI+3+np91y2rbUyy7eYRfbdwZKPHKUwW6eLhzD3nnoo
 CAAI4ck8KY+KeH4e9h3db1E71J6+ll6O4mJsdZP45SRIPimm5Vyi9qfVejC65ecVmTDm
 Hy9u670JzGgjyEtA2yYtYQKodA2nf3W+xq9hnkVcHcBIcwh7RWOvddIw4vUkdf7gur9J
 Fz51M7K5VldOQOFEKY9+gwvTw3LQo4J9S1kxAo1xxfB8739Fq3WSb9hI7THCmG9ONFia
 N41w==
X-Gm-Message-State: AOAM530G+zHC1q1Vd06O1XYm4yTmMo2jZwvonTLREwsFDjIDiuUZVeoQ
 WybSuwzfllTZhJtLVjXI/TzuiDYjGVzPOcoW2fkilnRAJ956huEI5EZCAlPzDzhMJUH+fIgf3tZ
 CpUetT16ML2OuWE9W5koXe+Ab1zzQttFd3YjLD6IG+sFVxqePbZMx4ZARQTRV5zr/
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr4643246wrd.367.1619103553824; 
 Thu, 22 Apr 2021 07:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3yej6n7aUc3ixdpKXj5rml98CRYad4AOWud2e0P4rvR8YpNySf1SluDDQ4ZKrnXJ1eSiFpA==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr4643211wrd.367.1619103553474; 
 Thu, 22 Apr 2021 07:59:13 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g3sm4079976wrp.46.2021.04.22.07.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 07:59:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pc-bios/s390-ccw: Silence GCC 11 stringop-overflow warning
Date: Thu, 22 Apr 2021 16:59:11 +0200
Message-Id: <20210422145911.2513980-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building on Fedora 34 (gcc version 11.0.0 20210210) we get:

  In file included from pc-bios/s390-ccw/main.c:11:
  In function ‘memset’,
      inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
      inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
  pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     28 |         p[i] = c;
        |         ~~~~~^~~

The offending code is:

  memset((char *)S390EP, 0, 6);

where S390EP is a const address:

  #define S390EP 0x10008

The compiler doesn't now how big that pointed area is, so assume its
length is zero. This has been reported as BZ#99578 to GCC:
"gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
pointer from integer literal"
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578

As this warning does us more harm than good in the BIOS code (where
lot of direct accesses to low memory are done), silence this warning
for all BIOS objects.

Re-introduce the cc-c-option macro (see commit 036999e93e4) to check
whether the compiler supports this warning or not.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 pc-bios/s390-ccw/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 29fd9019b83..21581d1258d 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -8,6 +8,8 @@ CFLAGS = -O2 -g
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null > /dev/null \
 	      2>&1 && echo OK), $1, $2)
+cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
+	      >/dev/null 2>&1 && echo OK), $2, $3)
 
 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
@@ -30,6 +32,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
 	  virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
 
 QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
+QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), -Wno-stringop-overflow)
 QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
 QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
 QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
-- 
2.26.3


