Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B720601800
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:48:11 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW5q-00046d-EJ
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVff-0002Ts-Gg; Mon, 17 Oct 2022 15:21:09 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:35661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfd-0002wd-DC; Mon, 17 Oct 2022 15:21:06 -0400
Received: by mail-oi1-x234.google.com with SMTP id u15so13240781oie.2;
 Mon, 17 Oct 2022 12:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdwF3Drv7lJ5ZhIvA04ip74IIHwhrVpQPOB7Yjm4bKk=;
 b=dxci8Oaf8twU1JSdTQNlHAaOd7F8xHWR4COhdnODnSSqgLpzJUS/7QWaLEwcUiL6FI
 TYvoM7TroCW46fBxJdpRuhyZwKm4zxXkm8YeoN1UfvYtj5vWh9pi8xaM+b9uS2QFHaoD
 USbHBxeiRWpcix9DTXUi/Wk/p2ETJ64ZqR3PkGfHYO2GcIJKB/WZkOwVn66GDPkoNxtu
 6AsQAwJUtRG0JYLWE3VGNhhMUsw5GJSDUbzrQW+NEz4dluDl6Ky6jNybCoSld+NJBMFv
 iBJf5LZwF3VY9/KLoAlKdGgs01NMGZicAFTPRNI9JdmeXxyVh2vCIwAG/cG5FaIB/egX
 jp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdwF3Drv7lJ5ZhIvA04ip74IIHwhrVpQPOB7Yjm4bKk=;
 b=VBlQejMFQctiNukihfAnQh2rLQFW6KJCAra/TC6xrf1LGtCZotbFP8jUlr44HcAY+G
 8kAVaognfmlvNXy0UmpH32YiXH/Q1Zo8lk3x3EtE9Cq/ik3ZBuXGN/7UY593POFcswer
 xcnKNDMsuVxRS+e2S5vC/MlK151e2XFCMUFQfy3hvq0asI0gQOvLMVtGkTsyO7Ad0qLu
 TX7EZj3qC01eV/mTvZ+c0OdZl/ibNVpZCK7CL0HYYAywY6ktrzTn4ZFnVuBbYPzno4vj
 okhN/07ytrybEKXKeFAG4MEIFyt9Y+0fameFx8DnhXcamXub1qaOQ0oLKYNYhWaQq0+O
 Mg5g==
X-Gm-Message-State: ACrzQf1jPbYvyRVZZATWcMD5d5PPlQ0KYROG0z1kYs/lmlkuB02bDczO
 uJ98DA3iLnqPUTznukeKqQy7/nxGCBU=
X-Google-Smtp-Source: AMsMyM6unnmWOKFmbkhWEEhoivKb36v7PpTAXDPISg172y9iKwuOlmesHeUJ/ieNy2v5zbbwU6KU7A==
X-Received: by 2002:a05:6808:2123:b0:355:15ed:480a with SMTP id
 r35-20020a056808212300b0035515ed480amr9171902oiw.38.1666034463766; 
 Mon, 17 Oct 2022 12:21:03 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 18/38] ppc440_uc.c: Move some macros to ppc4xx.h
Date: Mon, 17 Oct 2022 16:19:49 -0300
Message-Id: <20221017192009.92404-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These are used by both the SDRAM controller model and system DCRs. In
preparation to move SDRAM controller in its own file move these macros
to the ppc4xx.h header.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <74d9bf4891e2ccceb52bb6ca6b54fd3f37a9fb04.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c      | 4 ----
 include/hw/ppc/ppc4xx.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 55082f2b88..57274b56dd 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -380,10 +380,6 @@ enum {
     PESDR1_RSTSTA = 0x365,
 };
 
-#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
-#define SDR0_DDR0_DDRM_DDR1       0x20000000
-#define SDR0_DDR0_DDRM_DDR2       0x40000000
-
 static uint32_t dcr_read_sdr(void *opaque, int dcrn)
 {
     ppc4xx_sdr_t *sdr = opaque;
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index ff88385ac0..10c6dd535f 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -111,6 +111,10 @@ struct Ppc4xxEbcState {
 };
 
 /* SDRAM DDR controller */
+#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
+#define SDR0_DDR0_DDRM_DDR1       0x20000000
+#define SDR0_DDR0_DDRM_DDR2       0x40000000
+
 #define TYPE_PPC4xx_SDRAM_DDR "ppc4xx-sdram-ddr"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramDdrState, PPC4xx_SDRAM_DDR);
 struct Ppc4xxSdramDdrState {
-- 
2.37.3


