Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD36F86D8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:36:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyOb-0000Tg-IW; Fri, 05 May 2023 12:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOZ-0000TQ-MF; Fri, 05 May 2023 12:34:59 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOY-0004sl-5v; Fri, 05 May 2023 12:34:59 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6a5f21a231eso1238577a34.1; 
 Fri, 05 May 2023 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683304493; x=1685896493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCjxT1AnvWCkgvpc+O4OKxD9lGcf/L6QT+VZL3/jXbc=;
 b=DykmxVZbdtHOs4Dzlm/skWg18STcCibki2Pj9HW/GpmrKZTfnDJtO227U++NLkylsr
 nqoU54DcTwERmQXMN/u5I1et27HR5YWLXGVZ76zih6UHLc9oszCBVJ4cp9eB80rUtmz+
 EIU6wRPFuuWVt6a3a4bhKYWrF0EDRIQU9SbgA6PAc5KNLrvHDPENZ9Xqo7Nz8GIxkKww
 9Vv1ZVWSVVtB3crrrP++0pHEO0U1Zmo0fr+NC5X2Wj3KstWdJ1jV/hiyIuhGrFkF9GwS
 giGtL7ziXEAFW6A5itOOG8Gp2gnc/DbPTEnIHmVvWUJr3smVTbbSj7SspGeLkwWIcyv9
 Xx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304493; x=1685896493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCjxT1AnvWCkgvpc+O4OKxD9lGcf/L6QT+VZL3/jXbc=;
 b=WKH/Iem6DKydvgbVpur3jPePzs8STCun5TEoo3VyXVUzUWeVBfvEudnvyhcVS9C5te
 8OJLGwQUsOrSHun5BiQcTMQqVvR+bvWyLd6wSBtGBlVXfSnXqAbITlDWIBj6bhKezvs+
 3BUHvfnTjNLasMq53p/3/CCupQRI7UYBnbpdZhSZ3c4OXmftT8xXKQhPuRB/FZt3DGeu
 uo2JGEFhXWDz9Y+lFyosS5Cc/qd7qYNEhwIIzBrvFcPOGRFXkBoXdIpzazqoiIMBHNmk
 8Pa6zlLL+HQxASeqKobqE2MH2MLv5Wgc3hZpCqFexnBIzxIDy809R80B3/gx+giIqpOD
 dTSg==
X-Gm-Message-State: AC+VfDy539s7hD4GlxZMiSzKVkv/b2B9RF455Sf3nJSoA2K7/Y1CaRSR
 xfzXCtKrypJRjZf0ywyLlb2wOWtq/Tw=
X-Google-Smtp-Source: ACHHUZ4J4Ji2dVXTmswBpoA+Ghn36cDkZpiyVLhxkatBhoLAgNV6N4NDm22WYCHuSE6PzT7AHE4t3w==
X-Received: by 2002:a05:6830:104b:b0:6a6:3a73:95e with SMTP id
 b11-20020a056830104b00b006a63a73095emr999774otp.35.1683304493161; 
 Fri, 05 May 2023 09:34:53 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a9d62c3000000b006a43519523fsm1033475otk.1.2023.05.05.09.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:34:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 1/6] hw/display/sm501: Remove unneeded increment from loop
Date: Fri,  5 May 2023 13:34:39 -0300
Message-Id: <20230505163444.347006-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505163444.347006-1-danielhb413@gmail.com>
References: <20230505163444.347006-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

As Coverity points out (CID 1508621) the calculation to increment i in
the fill fallback loop is ineffective as it is overwritten in next
statement. This was left there by mistake from a previous version but
is not needed in the current approach so remove the superfluous
increment statement.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230405161234.6EF0A74633D@zero.eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/display/sm501.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index dbabbc4339..0eecd00701 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -901,7 +901,7 @@ static void sm501_2d_operation(SM501State *s)
             /* fallback when pixman failed or we don't want to call it */
             uint8_t *d = s->local_mem + dst_base;
             unsigned int x, y, i;
-            for (y = 0; y < height; y++, i += dst_pitch * bypp) {
+            for (y = 0; y < height; y++) {
                 i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
                 for (x = 0; x < width; x++, i += bypp) {
                     stn_he_p(&d[i], bypp, color);
-- 
2.40.1


