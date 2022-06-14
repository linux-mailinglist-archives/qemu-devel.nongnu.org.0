Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F954B5EB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:23:38 +0200 (CEST)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19KD-0006Xj-RH
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o190p-0002VL-98; Tue, 14 Jun 2022 12:03:27 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o190m-00046s-AZ; Tue, 14 Jun 2022 12:03:26 -0400
Received: by mail-pg1-x534.google.com with SMTP id f65so8893580pgc.7;
 Tue, 14 Jun 2022 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7V0Yx83/KzW8Q6mBxG6TRKpr8ulK1VqJTSufD2j2QP4=;
 b=I9uhTVdG1k3nN1gUBe/eCUoPpsFFsL/yBkx24ZnXRNaBMpP3V362oz1N6KcF/wA5yH
 0CZ+Ruf506GSKyHGXRi909yJ4yOVNqJAdD7j61XOKqtERXV0N5wGq/d0CwF/A/rUfPeu
 7WqdVtVOIqSYUlMgK19NWIXuyddVgRcG+zZLJjaTQ2/67E6Ycpfq34ZAAAd6r1j4FJbw
 wmOnil8tLZD7SQdrfMjGHXaKBeVylU3RfTXsCLYpzI1TFVmsgjYglNuRbD900IbjF7iF
 pApKNLlkNK3rr0ZplComQIomGNnvfinCyLlUkqmEfw8aimmKXif2e3tdNrghGoXzEVsX
 uqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7V0Yx83/KzW8Q6mBxG6TRKpr8ulK1VqJTSufD2j2QP4=;
 b=wTCBNmOmA0d/PrSNiXCwikmusxSfSs0L10o4euX0D5eMQRqKiDaPr33CCGN4RZnkGK
 qULqZJTk/5a+3IHoFD4QZiLssr3woTrACDhefUf9zrI96rZgsf7AeA9+kSI9kXGsnc+V
 yxKZ1m6ZIP0Cd2s/Bo/foJUowNEvO3kifx4tp+5t1CgPxts9uT2qTEaiAQmE61UFfwLq
 FsLzk9Aj0TS0FZcSI/XWRRFGEkyUAdHq5HPEty/i9KsRA3KhVmH4YI71tpeMJUOP4oE5
 E17TLZ/KWbF2RMSS4V6grWmplo0vyZosiUWdDdMic/VLTfCjy/wvI6A6B1Zh/N/1Gb0W
 nroA==
X-Gm-Message-State: AOAM532W2PqgZnOar7TTJre0nGja6ScPgSdvDGRVpB9xPH6F+EVWDGnB
 KObTcGi87krPkaZN/s8T3WQ=
X-Google-Smtp-Source: ABdhPJwj5/2mKTvCh8MaSsRYrxJieA0yXSLKGyVkSuR5iStgoi4H3Goo3K54hqJ8CGS6ukmaccMQVg==
X-Received: by 2002:a63:d806:0:b0:408:9e5d:68b9 with SMTP id
 b6-20020a63d806000000b004089e5d68b9mr5051417pgh.22.1655222601393; 
 Tue, 14 Jun 2022 09:03:21 -0700 (PDT)
Received: from zhdaniel-fedora-MJ0FVN0B.corp.tfbnw.net
 ([2620:10d:c090:500::2:9ac3]) by smtp.gmail.com with ESMTPSA id
 b10-20020a170902bd4a00b00168b7d639acsm7422643plx.170.2022.06.14.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 09:03:21 -0700 (PDT)
From: Dan Zhang <dz4list@gmail.com>
To: clg@kaod.org
Cc: alistair@alistair23.me, andrew@aj.id.au, dz4list@gmail.com,
 frasse.iglesias@gmail.com, hreitz@redhat.com, irischenlj@fb.com,
 irischenlj@gmail.com, joel@jms.id.au, kwolf@redhat.com, lvivier@redhat.com,
 patrick@stwcx.xyz, pbonzini@redhat.com, pdel@fb.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: [PATCH] hw:w25p80: Add STATE_STANDBY to handle incorrect command
Date: Tue, 14 Jun 2022 09:02:46 -0700
Message-Id: <20220614160246.2888751-1-dz4list@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <673b4b6c-b107-ab03-fe51-752ec45e6a04@kaod.org>
References: <673b4b6c-b107-ab03-fe51-752ec45e6a04@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=dz4list@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

---
 hw/block/m25p80.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b6bd430a99..3bb0466dca 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -423,6 +423,7 @@ typedef enum {
     STATE_COLLECTING_DATA,
     STATE_COLLECTING_VAR_LEN_DATA,
     STATE_READING_DATA,
+    STATE_STANDBY,
 } CMDState;
 
 typedef enum {
@@ -1218,6 +1219,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             || !s->write_enable) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "M25P80: Status register write is disabled!\n");
+	    qemu_log_mask(LOG_GUEST_ERROR,
+                          "M25P80: switch to standby, re-aseert CS to reactivate \n");
+	    s->state = STATE_STANDBY;
             break;
         }
 
@@ -1472,6 +1476,9 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
                           s->cur_addr, (uint8_t)tx);
 
     switch (s->state) {
+    case STATE_STANDBY:
+	r = 0xFFFFFFFF; /* StandBy state SO shall be HiZ */
+	break;
 
     case STATE_PAGE_PROGRAM:
         trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
-- 
2.34.3


