Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A1574878
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:19:14 +0200 (CEST)
Received: from localhost ([::1]:43670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv04-0005UY-Tg
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk3-0005AD-Aq
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk0-0005zR-Eo
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MoYKiEEJm6JRUCi1cJ1l0HlCPpVMg2FcXoSJlIy3vcc=;
 b=MPHLuEo8Il5gJhsDZ/6fjg6sUHUjiOtKICCa0sLSkBjQ069/oAVhY71/KAxQu8aNzV/3dz
 h5VgyuE3Rbx45e4fcFMqmBjbqU6Jhaa7qxIsC/b+s7QmCVwTwmKQrpb1j9maD0DZ/eZKLV
 /n4Wee1Tj6sHOoh/WODTNKrH9JBTsBU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-9bdow5s3MzyTweaTCZcJoA-1; Thu, 14 Jul 2022 05:02:32 -0400
X-MC-Unique: 9bdow5s3MzyTweaTCZcJoA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s17-20020a056402521100b0043ade613038so1082645edd.17
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MoYKiEEJm6JRUCi1cJ1l0HlCPpVMg2FcXoSJlIy3vcc=;
 b=VRhD/gpcVIfmD5PtIql1VS4/H0vfNgSzCJlaJ9lEglHILMptI1P/TywLuLeszPu+PC
 fCMQ8tVE5eX7PBGbEjkq4FmuxOUaVPXCYga9JYyPHJhXn05xZ5EaVZvKpax57pvkQRTt
 IZW8hkh+ijflVC8Kp8yu5lxLbC9wXgYCcZ2fY9MBx/PhCgpxcsgzmaiIhMq1lvvfA2Qd
 p1LVuE59fRWq0wBs0/9K2rAR6pPbWoTJ1W4e8ePAlHdnxsGgGxphXkzIhAQYWGa+xJJQ
 aKqUp1AE+D/PQlsa2k5DPjgDx4dHuVQOZyZ8nDHNX+oK97UcxNKAC7GPC4BAsJxrxXr2
 Y1gQ==
X-Gm-Message-State: AJIora/ebHdN6Ip3QhxmD/jyreObC44Q9FDbFU9WWqVHS2BXcaKGs909
 jLgARR1pU8mVnhl2k9AiKlza7Wi87zeBhyWp1p1TRa3wV8AGjjePVDibnfOV1Nk0bq4erg31exl
 oL5wyL24NwRD2hMv53HJDzw+dlmekrUh/jx5P92LgoZcU9/ymBjWpiM3QiJlWPuSbzhc=
X-Received: by 2002:a17:907:7292:b0:726:95e4:5a21 with SMTP id
 dt18-20020a170907729200b0072695e45a21mr7734937ejc.266.1657789351105; 
 Thu, 14 Jul 2022 02:02:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vWosh1VSrV2uOGG89cgFw7FhPty7h+kotuez+p7VYVLLFQi8civ4DmY5wT7BnRLiN9k6atUA==
X-Received: by 2002:a17:907:7292:b0:726:95e4:5a21 with SMTP id
 dt18-20020a170907729200b0072695e45a21mr7734922ejc.266.1657789350852; 
 Thu, 14 Jul 2022 02:02:30 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 s26-20020aa7cb1a000000b0043574d27ddasm684888edt.16.2022.07.14.02.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/20] q800: implement compat_props to enable
 quirk_mode_sense_rom_use_dbd for scsi-cd devices
Date: Thu, 14 Jul 2022 11:02:01 +0200
Message-Id: <20220714090211.304305-11-pbonzini@redhat.com>
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

By default quirk_mode_sense_rom_use_dbd should be enabled for all scsi-cd devices
connected to the q800 machine to correctly report the CDROM block descriptor back
to A/UX.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220622105314.802852-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/q800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 6fabd35529..4745f72c92 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -688,6 +688,7 @@ static void q800_init(MachineState *machine)
 
 static GlobalProperty hw_compat_q800[] = {
     { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
+    { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-- 
2.36.1



