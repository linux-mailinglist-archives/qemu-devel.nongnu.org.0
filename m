Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E09574892
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:22:47 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv3W-00037k-6c
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk9-0005Dj-Mi
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk8-00060y-2L
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wr3W8Qgd538GbFfb3zj67MkTs+oRCp+v1IWEC5iv05o=;
 b=LKKNGtqQpQZaNK7ledD6Mm1ze0Bp0uLvLqD/96q8m9Tl7AnZmwWHGZWPqdVEfS0XmhVAAu
 OjJ/8UR5Rz1pmlMZ1rtuBN7B675P3FcZ5tEtPSZYJEiaeJ/56sqn0XWxxu2lXHi4bNuUOH
 MkGphcT4TGGd8FYuuSa8BQmHxpTUOVU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-KvAYMTCNOTuYEJ-yHMCfgQ-1; Thu, 14 Jul 2022 05:02:41 -0400
X-MC-Unique: KvAYMTCNOTuYEJ-yHMCfgQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq20-20020a1709073f1400b0072b9824f0a2so508436ejc.23
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wr3W8Qgd538GbFfb3zj67MkTs+oRCp+v1IWEC5iv05o=;
 b=SolNF9seY9FrNL99rnnoPN7vILCV2LQX0xn6PaOQpEWMCkayQgyy1Vm4sZ2w58xKgj
 KXgiqI02hCPPc5UPz1MeO1GfbWojaCkjhKR/4eS5aRW5p1zqslScHR+A836i1N3IhHDG
 qhzoWH6nvXkJaIb892zvYOh4hkGgo05Wfr40zvKWHVFOvHC2TimITpGw+QXg7qMBaxiM
 eVbubv+MPetKEHTArjShOkECEsvKBhY0usglUP6xaMr07hIgeDRXmDseaiWBT7Vwad1Q
 JPoh93+2KgKrfhLPZpGMqoMP8DlbxsPVrLtDT45ZwSv5mcLabXgyUO8cejMJojuThApm
 jXag==
X-Gm-Message-State: AJIora9e5HkDqaVv9EUqsgedPlvuB8XSw2y+ctNvcxhy4nEMJEeMvwzt
 RRgYWloOBsq68S+JJCi8CaaWBkVnv+VmMUl4PAnlon9MTkUE5FpfiG5/qw0GkUu9oYBJbOZbdsD
 1plTPfVwp6FvX953+nfU+IKU2AKAt4EekYeufeE4X8QQp0bh7jTO7QYhDqzZpQu2NOGs=
X-Received: by 2002:a05:6402:5408:b0:435:60fa:5017 with SMTP id
 ev8-20020a056402540800b0043560fa5017mr10888826edb.223.1657789360363; 
 Thu, 14 Jul 2022 02:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vCcElLq5RdJlexRC6NqtbBL94Cmq68EThwj0QIeZpxQg/LJmx3/vM9YahpMcHpqhZsBv2riw==
X-Received: by 2002:a05:6402:5408:b0:435:60fa:5017 with SMTP id
 ev8-20020a056402540800b0043560fa5017mr10888798edb.223.1657789360075; 
 Thu, 14 Jul 2022 02:02:40 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 i8-20020a50fd08000000b0043a554818afsm688489eds.42.2022.07.14.02.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 16/20] scsi-disk: allow the MODE_PAGE_R_W_ERROR AWRE bit to be
 changeable for CDROM drives
Date: Thu, 14 Jul 2022 11:02:07 +0200
Message-Id: <20220714090211.304305-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

A/UX sends a MODE_PAGE_R_W_ERROR command with the AWRE bit set to 0 when enumerating
CDROM drives. Since the bit is currently hardcoded to 1 then indicate that the AWRE
bit can be changed (even though we don't care about the value) so that
the MODE_PAGE_R_W_ERROR page can be set successfully.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220622105314.802852-12-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 2b2e496ebd..db27e834da 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1188,6 +1188,10 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
     case MODE_PAGE_R_W_ERROR:
         length = 10;
         if (page_control == 1) { /* Changeable Values */
+            if (s->qdev.type == TYPE_ROM) {
+                /* Automatic Write Reallocation Enabled */
+                p[0] = 0x80;
+            }
             break;
         }
         p[0] = 0x80; /* Automatic Write Reallocation Enabled */
-- 
2.36.1



