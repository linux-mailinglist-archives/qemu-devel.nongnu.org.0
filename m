Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94ED534482
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:48:10 +0200 (CEST)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwzK-0004Fs-0L
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhF-0005VL-Aw
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhC-0003rs-Lp
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwHG27W5JtNl87FocLffTvijVYGVARLLmOjbH0L9euw=;
 b=inKt9Mynp9/RWIsfJL6FESHbWDKoeenyoAOsgdCKCFMrTePfwcnRrYn0qTfqQnz6sA6Jpi
 dj9KK3lsauiPr6TyPohThXM5RTtNlZ5IkjJ6WSyQkKJ2L3G3c9AdzPING1EiL52//ceiUJ
 9isBT3SSvAycZPLz3Gjw3IZBZzhGR28=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-JuFEIZp4NYebkML8oA7PUg-1; Wed, 25 May 2022 15:29:25 -0400
X-MC-Unique: JuFEIZp4NYebkML8oA7PUg-1
Received: by mail-ej1-f70.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so9212716eje.23
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EwHG27W5JtNl87FocLffTvijVYGVARLLmOjbH0L9euw=;
 b=DlbRz3iUwiF/iQ5dBttZuvoTN76hfa7bV5vrfbxywDO+VP6Rd+xza2DeXCPCCQsLyt
 ncF7EW06BhWcPFbPjb0l3aNAY2uwR+zSfItTLe0l0lWRxLBRcmCWyXB9P8VubC9hOeSh
 6AxqMeNsSCfrfPEgCF9vALCuW2GfN/EylQ57yeWO3tDq//cDQkMXynMwdCffZoCVn0HU
 EBkTNMnrKm/Nfhkwg5vhlIRxYzgF2zAHDYJGW0/H04R+Zkrnl4+wVaGCU/EF7DhmOlP0
 DZa6WUzHPfIhaqFf2mCOt6gRX+b1kyvKrhQYEeQS0A2zhSvPznN8H4kOR+lIJijZhFEl
 Nddw==
X-Gm-Message-State: AOAM530ah1D7QaV7XTmv73ZiUG7mqfTIdSvt98zGcN9fa7eCjdGDOhcR
 SB+edUfvdrYRVoMh2LDISBA8MWACM/05u4bAbUBzBxH3w+JBR3P1zUIIV4PIVwv7QxVS8i/vM4y
 qn5yr05Av1ef6sChzceaZVgxoaj+G01GF/aRq+htchCTCkhYKzywHtG7pMW306Lz3OBI=
X-Received: by 2002:aa7:ce81:0:b0:42a:ee56:c948 with SMTP id
 y1-20020aa7ce81000000b0042aee56c948mr36042406edv.388.1653506962999; 
 Wed, 25 May 2022 12:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGAP06Ksg3JAO5gUgAlF+nYGwUVUeE0CeY8+9SQscdMfgn2fSoCIwIEM8ByBMkvwstlIfKOw==
X-Received: by 2002:aa7:ce81:0:b0:42a:ee56:c948 with SMTP id
 y1-20020aa7ce81000000b0042aee56c948mr36042384edv.388.1653506962668; 
 Wed, 25 May 2022 12:29:22 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a1709066d1900b006fec6e1d856sm4221665ejr.82.2022.05.25.12.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PULL 11/17] ide_ioport_read: Return lower octet of data register
 instead of 0xFF
Date: Wed, 25 May 2022 21:28:46 +0200
Message-Id: <20220525192852.301633-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Lev Kujawski <lkujaw@member.fsf.org>

Prior to this patch, the pre-GRUB Solaris x86 bootloader would fail to
load on QEMU with the following screen output:

SunOS Secondary Boot version 3.00

prom_panic: Could not mount filesystem.
Entering boot debugger:
[136419]: _

This occurs because the bootloader issues an ATA IDENTIFY DEVICE
command, and then reads the resulting 256 words of parameter
information using inb rather than the correct inw. As the previous
behavior of QEMU was to return 0xFF and not advance the drive's sector
buffer, DRQ would never be cleared and the bootloader would be blocked
from selecting a secondary ATA device, such as an optical drive.

Resolves:
* [Bug 1639394] Unable to boot Solaris 8/9 x86 under Fedora 24

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
Message-Id: <20220520235200.1138450-1-lkujaw@member.fsf.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ide/core.c  | 6 +++++-
 hw/ide/macio.c | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 3a5afff5d7..c2caa54285 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2166,7 +2166,11 @@ uint32_t ide_ioport_read(void *opaque, uint32_t addr)
     hob = bus->cmd & (IDE_CTRL_HOB);
     switch (reg_num) {
     case ATA_IOPORT_RR_DATA:
-        ret = 0xff;
+        /*
+         * The pre-GRUB Solaris x86 bootloader relies upon inb
+         * consuming a word from the drive's sector buffer.
+         */
+        ret = ide_data_readw(bus, addr) & 0xff;
         break;
     case ATA_IOPORT_RR_ERROR:
         if ((!bus->ifs[0].blk && !bus->ifs[1].blk) ||
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index f08318cf97..1c15c37ec5 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -267,7 +267,9 @@ static uint64_t pmac_ide_read(void *opaque, hwaddr addr, unsigned size)
 
     switch (reg) {
     case 0x0:
-        if (size == 2) {
+        if (size == 1) {
+            retval = ide_data_readw(&d->bus, 0) & 0xFF;
+        } else if (size == 2) {
             retval = ide_data_readw(&d->bus, 0);
         } else if (size == 4) {
             retval = ide_data_readl(&d->bus, 0);
-- 
2.36.1



