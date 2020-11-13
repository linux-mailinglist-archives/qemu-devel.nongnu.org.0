Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FF82B1B2D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 13:31:38 +0100 (CET)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYEr-0007Fp-C4
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 07:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kdYDN-0005fK-Ch
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kdYDJ-00029L-KW
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605270599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ams2+a6Fndv8u0hJNqw7ug0CHbJDjF/KmoDcyy+T5qs=;
 b=MGIwavWyhaVQS/D4fQeOJ+c2EH52gzCtsM2Mqi1wg731tKFboZjP3i21QpiazDYQwEYGmP
 U1Cr5n0vv9vhn9HY4NFVuw5N4PG1LNRTXOXBtQyVcB65NCvlNR/soHSJNSBJ4gzccFW+c5
 4ZVuTgETv4JY8iL9ZJiSxchgg8pdsK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-wPLrUU6tNjeqOYN7NiOnlg-1; Fri, 13 Nov 2020 07:29:57 -0500
X-MC-Unique: wPLrUU6tNjeqOYN7NiOnlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98E91801FDE
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 12:29:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1E91002C15;
 Fri, 13 Nov 2020 12:29:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7B76B9D99; Fri, 13 Nov 2020 13:29:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] hw/display/cirrus_vga: Remove debugging code commented out
Date: Fri, 13 Nov 2020 13:29:53 +0100
Message-Id: <20201113122955.759-5-kraxel@redhat.com>
In-Reply-To: <20201113122955.759-1-kraxel@redhat.com>
References: <20201113122955.759-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Commit ec87f206d70 ("cirrus: replace debug printf with trace points")
forgot to remove this code once replaced. Do it now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-id: 20201103112558.2554390-2-philmd@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/cirrus_vga.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 722b9e7004cd..e14096deb46a 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2532,9 +2532,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
 	case 0x3c5:
 	    val = cirrus_vga_read_sr(c);
             break;
-#ifdef DEBUG_VGA_REG
-	    printf("vga: read SR%x = 0x%02x\n", s->sr_index, val);
-#endif
 	    break;
 	case 0x3c6:
 	    val = cirrus_read_hidden_dac(c);
@@ -2560,9 +2557,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
 	    break;
 	case 0x3cf:
 	    val = cirrus_vga_read_gr(c, s->gr_index);
-#ifdef DEBUG_VGA_REG
-	    printf("vga: read GR%x = 0x%02x\n", s->gr_index, val);
-#endif
 	    break;
 	case 0x3b4:
 	case 0x3d4:
@@ -2571,9 +2565,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
 	case 0x3b5:
 	case 0x3d5:
             val = cirrus_vga_read_cr(c, s->cr_index);
-#ifdef DEBUG_VGA_REG
-	    printf("vga: read CR%x = 0x%02x\n", s->cr_index, val);
-#endif
 	    break;
 	case 0x3ba:
 	case 0x3da:
@@ -2645,9 +2636,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 	s->sr_index = val;
 	break;
     case 0x3c5:
-#ifdef DEBUG_VGA_REG
-	printf("vga: write SR%x = 0x%02" PRIu64 "\n", s->sr_index, val);
-#endif
 	cirrus_vga_write_sr(c, val);
         break;
     case 0x3c6:
@@ -2670,9 +2658,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 	s->gr_index = val;
 	break;
     case 0x3cf:
-#ifdef DEBUG_VGA_REG
-	printf("vga: write GR%x = 0x%02" PRIu64 "\n", s->gr_index, val);
-#endif
 	cirrus_vga_write_gr(c, s->gr_index, val);
 	break;
     case 0x3b4:
@@ -2681,9 +2666,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 	break;
     case 0x3b5:
     case 0x3d5:
-#ifdef DEBUG_VGA_REG
-	printf("vga: write CR%x = 0x%02"PRIu64"\n", s->cr_index, val);
-#endif
 	cirrus_vga_write_cr(c, val);
 	break;
     case 0x3ba:
-- 
2.27.0


