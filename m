Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D294D53443C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:32:50 +0200 (CEST)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwkS-00085U-QS
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwh7-0005Ej-D6
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwh5-0003rG-Q0
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zenkTjX5ljSZMWPTNzlhekDXLg9kHf0n4nzmVZovVqU=;
 b=KkU3eiNUoi9mJ1UR5gx6ZrZcbeZdaVrLrQu0lCDGryePOUplqBG8MH/7UENnL+44WYrB4i
 T0ssnLQL5QQ8/qHMfRXpeJu8HTTrZI4wX6+kyV40tlmf/NbPzptNjcKAcEWFPDqTYmd0Xp
 ASwUz5+/CbYAr8UOjoh5wRlw07Zy1ZE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-WSq7p5SrPLyuaI2IJU-uTw-1; Wed, 25 May 2022 15:29:17 -0400
X-MC-Unique: WSq7p5SrPLyuaI2IJU-uTw-1
Received: by mail-ej1-f69.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso10005207ejc.18
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zenkTjX5ljSZMWPTNzlhekDXLg9kHf0n4nzmVZovVqU=;
 b=q3s6IpijeqiinX0lwxCRKmp7Cb4RoE81k16yiGdvDQ2/2g7oGGyMrcHeaAAmCunxi7
 9QpFnAQoDFisqVXAkba9ZBWN4hQFSEK9xgJLlQA5as0PJb6Hx07J1i/EMCE7Cvy+k8xW
 0XnomjSBa98WYgFlnQTfm4oDpbWO/5UI2TfblGVq/J7WIaEzyl68xisGB+uUfG1yxl/E
 LrE46rPlhZoZhsBwCp/dhiYp5eVycqOPZQ2arG85mzyP4pmPiomWct/MOPksrdbfA/P3
 Ie8hABBaB9/CLBsDmb6FYGUcX/NFQKnEiKKrlU/38O18JvmXdts1VMWFQzwODxivaFL6
 s5jg==
X-Gm-Message-State: AOAM533YxcVZmfnlsnNvCw4/kSL7yEaAJ/eTLUF72V31Q/QpgI3gwv/M
 r0yYxmQZiMix/clh3TFth3GAeWTd0ny5AU0KRcD36eckqUjs9tfMUhlZGEqU06GrlFvgEZA1/U8
 SQQYGDqzwUL7O7s2lU/OneeNyvsaJ8EbmcAdIeMlJG3g5U6i2yyuxVRcXECC3YEeV0Fw=
X-Received: by 2002:a17:906:b7d6:b0:6fe:a34a:a813 with SMTP id
 fy22-20020a170906b7d600b006fea34aa813mr25402924ejb.551.1653506955932; 
 Wed, 25 May 2022 12:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvWK2vIBwMbgNj5gQqZxH8ef+UcpySVmstzRQ4vqz/8ezQE25IVWQniZmwzoDl6n1DB/z2rw==
X-Received: by 2002:a17:906:b7d6:b0:6fe:a34a:a813 with SMTP id
 fy22-20020a170906b7d600b006fea34aa813mr25402906ejb.551.1653506955699; 
 Wed, 25 May 2022 12:29:15 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ck6-20020a170906c44600b006fecd0501b5sm4062125ejb.98.2022.05.25.12.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 08/17] hw/audio/ac97: Remove unimplemented reset functions
Date: Wed, 25 May 2022 21:28:43 +0200
Message-Id: <20220525192852.301633-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

The warm_reset() and cold_reset() functions are not implemented and do
nothing so no point in calling them or keep around as dead code.
Therefore remove them for now.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <cc6e99fd498a9ae358ebce787fc04ab6e8201879.1650706617.git.balaton@eik.bme.hu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/ac97.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 6b1c12bece..6584aa749e 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -222,16 +222,6 @@ static void po_callback(void *opaque, int free);
 static void pi_callback(void *opaque, int avail);
 static void mc_callback(void *opaque, int avail);
 
-static void warm_reset(AC97LinkState *s)
-{
-    (void)s;
-}
-
-static void cold_reset(AC97LinkState *s)
-{
-    (void)s;
-}
-
 static void fetch_bd(AC97LinkState *s, AC97BusMasterRegs *r)
 {
     uint8_t b[8];
@@ -921,12 +911,7 @@ static void nabm_writel(void *opaque, uint32_t addr, uint32_t val)
         dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(index), val, r->bdbar);
         break;
     case GLOB_CNT:
-        if (val & GC_WR) {
-            warm_reset(s);
-        }
-        if (val & GC_CR) {
-            cold_reset(s);
-        }
+        /* TODO: Handle WR or CR being set (warm/cold reset requests) */
         if (!(val & (GC_WR | GC_CR))) {
             s->glob_cnt = val & GC_VALID_MASK;
         }
-- 
2.36.1



