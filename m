Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494DD574850
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:16:08 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBux5-0001Zl-7y
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk0-00057T-Ju
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujw-0005z9-P5
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USfF9RVAdTE+tkNnR84GQNeWwGHl3N/1116YVhz6nHg=;
 b=H60yFxboq6rRbRBKjw+JS7jjAsBBQScLlG7jKWu9mwNeL0sVeDMjTPn0ObdTJxfSwDeb1v
 JqB/5VZ9wmqisC862L4uj+6b7AkA205pPFBvDnKAXs0cQfdKZHAbk/U57oCbya/EibXYGq
 Avx7UbbwVLLPrBBx5mAEH+hlklxuuaA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-ug5qrno5Nnycuf51REDsDA-1; Thu, 14 Jul 2022 05:02:29 -0400
X-MC-Unique: ug5qrno5Nnycuf51REDsDA-1
Received: by mail-ej1-f69.google.com with SMTP id
 nc23-20020a1709071c1700b0072b94109144so508355ejc.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USfF9RVAdTE+tkNnR84GQNeWwGHl3N/1116YVhz6nHg=;
 b=xtbX8dSlcjx3qs/ufDPOPsi1JQbNKSF+KWIiq2v8Fx2RIFDY3YHZV3fHfqrTxkj0O+
 DNNsssTSBf70AO+nbCRNnyskXVHul814Rh7ZiUqTsmU1Akn+jP388kDCiMcmFXrJstDk
 /5wnnwqNzQevJ+UHVEDWn/DenoKsxfuZJ2xf98i6xy7Gs6k3hhnkwdTr6cvtXD4mE2Dj
 IxvPF/G53T6sVlBBHeRS7BPTxsb3XF/EI6/cQisf7yliStlvXAywsg3QFXAtznHpo5mu
 pNRje07X/AKYVP6E/t7rPjiK+zD3z20PRTB3nZeHV+nTmYPC2e2LFkaAUU5LMFRBE423
 CooQ==
X-Gm-Message-State: AJIora+zMVval6Zs3ryAjvk8gf77Wwv68rm4KMRuNfEvmq/ivDX4Ql8c
 Yc27ug0+O0b7XEr2+SxZIz194V6arGMKBl/AxcD2FYcPHQG3E/oRg18mldtT43S/bF6UH7YmmFV
 cyGdtEOaKTXV+tn7LjpRy7gL7Oo/ifHI0c29JCfZS7TNsM3ZSGNA30ekx+CNkxHgwWO4=
X-Received: by 2002:a05:6402:150d:b0:43a:2cac:ca24 with SMTP id
 f13-20020a056402150d00b0043a2cacca24mr10918791edw.110.1657789347958; 
 Thu, 14 Jul 2022 02:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBLhCN8SoRHQG/0mjZY/MsDnVbORFp6Z/4ysECx1GpzGqsU9viLCjpaJBWU+Wx5645Rk1RmA==
X-Received: by 2002:a05:6402:150d:b0:43a:2cac:ca24 with SMTP id
 f13-20020a056402150d00b0043a2cacca24mr10918760edw.110.1657789347616; 
 Thu, 14 Jul 2022 02:02:27 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 ku5-20020a170907788500b007262a5e2204sm450019ejc.153.2022.07.14.02.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 08/20] q800: implement compat_props to enable
 quirk_mode_page_apple_vendor for scsi-cd devices
Date: Thu, 14 Jul 2022 11:01:59 +0200
Message-Id: <20220714090211.304305-9-pbonzini@redhat.com>
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

By default quirk_mode_page_apple_vendor should be enabled for all scsi-cd devices
connected to the q800 machine to enable MacOS to detect and use them.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220622105314.802852-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/q800.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 099a758c6f..6fabd35529 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -686,6 +686,11 @@ static void q800_init(MachineState *machine)
     }
 }
 
+static GlobalProperty hw_compat_q800[] = {
+    { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
+};
+static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
+
 static void q800_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -695,6 +700,7 @@ static void q800_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 1;
     mc->block_default_type = IF_SCSI;
     mc->default_ram_id = "m68k_mac.ram";
+    compat_props_add(mc->compat_props, hw_compat_q800, hw_compat_q800_len);
 }
 
 static const TypeInfo q800_machine_typeinfo = {
-- 
2.36.1



