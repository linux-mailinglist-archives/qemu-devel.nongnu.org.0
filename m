Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997F574930
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:37:44 +0200 (CEST)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvHx-0001no-2F
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBukD-0005Iv-9J
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBukB-00061p-CX
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPxrUWz/40PCdYS2DePtdFbyH7QmcxCaDkU2H+nwfn0=;
 b=JMmzNJdIhsvRRild0GaIu+ZMnWwwMMmSYSgI7Wu/DjY3iw/31+SGIARDR9HERZIBehLrHa
 YVs6jCI2h7UokXGliLUOOBisd889gWf+xFFbgsNmlvPcDisbhUFEcpbg3j4G2vsMV76yBx
 xcUOLnSGHoftnFeFhCFHNVateAUxSsM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-gaSuume0Mj-VZDoywCCfrg-1; Thu, 14 Jul 2022 05:02:45 -0400
X-MC-Unique: gaSuume0Mj-VZDoywCCfrg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hp13-20020a1709073e0d00b0072b812bc5e9so507389ejc.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yPxrUWz/40PCdYS2DePtdFbyH7QmcxCaDkU2H+nwfn0=;
 b=MXkekyr61/xhrdsFfcBYFqSfl/+R8S5v/B3RjgiXsKyEPdCIqiMhyTFwXooZJ2f2DC
 potDS/md0F0gk3HbqqWdMo6W77qrh0qGvHVfpGJIcN0NN1zcEnZt3lV2k0JG4fq2tHBg
 W6YqWqwikpLMG3cHQBqDHqUbX6UnA9lfjQS6J0V34P6Dg2O9aIcA2biRCM+x32I2Fm/d
 Tia3vVaoqNbqjlMU0SwQzp1yePki4HSi7X2485A0mLFUooDQr3IEF8hAt0xC8t1jCdqj
 Ch+Sf+Y7ZPS3rd6xm8ZmzPY1LfiadEZs4NnZkxlHoTmJ5rgvyOuNdUl0bR0y5NLkbsZx
 voYg==
X-Gm-Message-State: AJIora+5s7HCz84HP+kNCZbEi293dhOykONYyXLhPiy5Mdc5zi3cXYkU
 d0Brk9T8CbK7wk9w0YObuufl0ssilwkUhK7sINgut5xuSde1c2aNZ98O7hpyCeuiHwSFUBgLfvM
 02ag4F7KvkKa/RJ40GegGPQasD36r0gPbSA81icwmYqITHq4By0JeLkoXVEhRzmfQhDA=
X-Received: by 2002:a50:ce1d:0:b0:43a:742f:9db3 with SMTP id
 y29-20020a50ce1d000000b0043a742f9db3mr10963969edi.308.1657789363826; 
 Thu, 14 Jul 2022 02:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttbUOMxjHz8BTr52dk9afhjEOyNH45/eUU5l2UbP26u5r2HwPai1gW2L7km2bknzNwH6GWCg==
X-Received: by 2002:a50:ce1d:0:b0:43a:742f:9db3 with SMTP id
 y29-20020a50ce1d000000b0043a742f9db3mr10963949edi.308.1657789363601; 
 Thu, 14 Jul 2022 02:02:43 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 eq22-20020a056402299600b0043a7134b381sm677928edb.11.2022.07.14.02.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 18/20] q800: add default vendor and product information for
 scsi-hd devices
Date: Thu, 14 Jul 2022 11:02:09 +0200
Message-Id: <20220714090211.304305-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The Apple HD SC Setup program uses a SCSI INQUIRY command to check that any SCSI
hard disks detected match a whitelist of vendors and products before allowing
the "Initialise" button to prepare an empty disk.

Add known-good default vendor and product information using the existing
compat_prop mechanism so the user doesn't have to use long command lines to set
the qdev properties manually.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220622105314.802852-14-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/q800.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 3254ffb5c4..dccf192e55 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -688,6 +688,9 @@ static void q800_init(MachineState *machine)
 
 static GlobalProperty hw_compat_q800[] = {
     { "scsi-hd", "quirk_mode_page_vendor_specific_apple", "on"},
+    { "scsi-hd", "vendor", " SEAGATE" },
+    { "scsi-hd", "product", "          ST225N" },
+    { "scsi-hd", "ver", "1.0 " },
     { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
     { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
     { "scsi-cd", "quirk_mode_page_vendor_specific_apple", "on"},
-- 
2.36.1



