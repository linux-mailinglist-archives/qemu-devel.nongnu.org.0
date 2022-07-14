Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D165748A6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:23:45 +0200 (CEST)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv4S-0004id-Gk
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk8-0005DG-Cb
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk1-0005zp-Sg
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4H00/Y902lyrfox7E+/FrDYoSe9D5v5iihKAKWBtn8=;
 b=FLLlSu9hJLFEYGNgU9dFoze8CGBjzqA/LxcUhu8iVoF+Xl9xDtdG1HM65vBuSyaLioxFuL
 C0kqEscURRm89YqWVZCENl368097yi8D2q4VdVtFfWE+MyB4pcPac32xDOZWXee0AU5PYe
 WtUOPtSsygGoDjty6wvjgO2BlFV7fVA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-pbER3D87OI-5ISv6j3ajaA-1; Thu, 14 Jul 2022 05:02:35 -0400
X-MC-Unique: pbER3D87OI-5ISv6j3ajaA-1
Received: by mail-ej1-f72.google.com with SMTP id
 sg42-20020a170907a42a00b0072e3fc6cdd1so503067ejc.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V4H00/Y902lyrfox7E+/FrDYoSe9D5v5iihKAKWBtn8=;
 b=h629oBBup4Ha4HsMT3aqnnE0JfXX4SiMJT5OQcaWQjJNX1aBdOOGeydFtVbmbI7JBB
 riomJSP8qEc6Z1gouEbyO9VoesH1XEmEpyjPDSskExt0CHaLwClNLSFw4dIf8/N2dwLf
 u7AN04GEu8n/7LO+BtNiL/b5aSDBrb/6HmuwSfHVXRwZ6kjG3Om3QN4VaHP5E+dUPfqu
 rJ/nRsAsWM7B816va+Azl0rnj37ZGAEdrO38tb9rcEnNGne1ZIMKswlJU+ok1jvRYa2d
 ll3X0KTykdw2dl5zlCPlwt1JoAve9sqGJn7/1+adxZbKUD/x5TnrID1vP+Twcsb7aitd
 LvxQ==
X-Gm-Message-State: AJIora9Ww1gcqt89ADm0W0J5j6Vh5usVxbE0iZ8xX9yc2hmAYaAZezvo
 iSgmqIHuyxyZkrfewF+uPJpSwlb0UkZbtAQVNxNsEQf9Dxo8OEifrhAwXFtLKcxzmgwPIzj7Pfj
 wIZGCDEenuWtXRuk8BxyUrSoiPSegnrjdzGR5zmaf93Ad4vWi+lJh1B/C+miBOiUELQ0=
X-Received: by 2002:a17:907:2705:b0:72b:4ef4:2d91 with SMTP id
 w5-20020a170907270500b0072b4ef42d91mr7602385ejk.95.1657789354330; 
 Thu, 14 Jul 2022 02:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vRYbc4rbrJN1eMcjtynPMVxTF8BKSBb1I879Hc2PwfIEm6AA1cWTR+AaPd58WKuzxdvyrNlg==
X-Received: by 2002:a17:907:2705:b0:72b:4ef4:2d91 with SMTP id
 w5-20020a170907270500b0072b4ef42d91mr7602355ejk.95.1657789353989; 
 Thu, 14 Jul 2022 02:02:33 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 o7-20020aa7c507000000b0043ab81e4230sm690304edq.50.2022.07.14.02.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 12/20] q800: implement compat_props to enable
 quirk_mode_page_vendor_specific_apple for scsi devices
Date: Thu, 14 Jul 2022 11:02:03 +0200
Message-Id: <20220714090211.304305-13-pbonzini@redhat.com>
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

By default quirk_mode_page_vendor_specific_apple should be enabled for both scsi-hd
and scsi-cd devices to allow MacOS to format SCSI disk devices, and A/UX to
enumerate SCSI CDROM devices succesfully without getting stuck in a loop.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220622105314.802852-8-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/q800.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 4745f72c92..b774a5b20a 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -687,8 +687,10 @@ static void q800_init(MachineState *machine)
 }
 
 static GlobalProperty hw_compat_q800[] = {
+    { "scsi-hd", "quirk_mode_page_vendor_specific_apple", "on"},
     { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
     { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
+    { "scsi-cd", "quirk_mode_page_vendor_specific_apple", "on"},
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-- 
2.36.1



