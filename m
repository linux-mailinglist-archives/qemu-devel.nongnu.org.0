Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE16FEE14
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:54:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px23z-0001cl-Ij; Thu, 11 May 2023 04:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1px23w-0001cM-Gv
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:54:13 -0400
Received: from esa5.hc2706-39.iphmx.com ([216.71.137.63])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1px23t-0002r3-6a
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:54:11 -0400
X-IronPort-RemoteIP: 209.85.160.200
X-IronPort-MID: 290480387
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L7W/Oq+LFR92rDFnwW8NDrUDPnyTJUtcMsCJ2f8bNWPcYEJGY0x3z
 TFNCzqEPfuPNDHzfd1xOo+zpEoGuJXXm4c1SQs+rC4xFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jefQHeCU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNFg06/gEk35q+q5WpB5gVWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJEwmIqkWoOctO3AQ6
 ORFMD8BTyuyhdvjldpXSsE07igiBMziPYdao205iD+DVa5gTpfETKHHo9Rf2V/chOgURaeYN
 5dfMGQ3Kk6YO3WjOX9OYH46tO6sln/zaRVStRSYqbdfD237ll0pjOi1a4qKEjCMbfp6nEnFo
 iXPw33WJg8VLMWc7Dav91v504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6LEurQmlFIGlGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYaADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:uH0p9KvHnbgv0Hwrq814ZTaA7skDrNV00zEX/kB9WHVpmwKj5q
 STdZMgpGXJYVMqMk3I9urwXpVoLUmsl6KdgrNhRotKIjOWwVdARbsKheCSoAEIcxefygc379
 YGT0ERMqyUMXFKyezX2k2XKeoB/fWw2JyUpI7lvgpQpMJRB52ILT0VNu9WKCNLrXF9dOIE/V
 Oniat6mwY=
X-Talos-CUID: 9a23:Jh18tmM1udi4B+5DVTl40EBOG5ofYyPA1CrILEOZMldrcejA
X-Talos-MUID: 9a23:fL4DXQiLDJmmpTEcP4PIwcMpC+hq7PmqT0kxiLoipcacLC9VNx2YpWHi
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 04:54:05 -0400
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3f4e2e7c742so9430221cf.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1683795244; x=1686387244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=17WiJmbprSj01CUtV1WWHWzwtN+21oPfApxnBIbGJ88=;
 b=YtWo+0lnwZEN1cnmTeE2SuvM/Q92tu7hyMbvUr7UN9QKPM9JiGWMmmZ8Z9KDkHBqhI
 ksa5/2WGM7HuEyuc3x964u5oG5e5Z5b/MjXQGgp6Qn8Z/L87v+IueKpT5N2yNOW6WW4X
 TWkkzc/R4XaJSKCQoMqvkXCDAbvZbLE/6ah1u0JT4QQvXGS/0aOux7GWQfk4/AUU/MWH
 DwFNE8a0ikr2xDXn6w5HC125Okv7VAsfRO9a9ls2Vioap3V4QnMlCVAUXME1fZFFTFPj
 QIaUlZNNN0nls712nWLY4ymxinldEJXF/IBarL4xK3T0QSud/z6PA4J7EVhXPl61V8zy
 UFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683795244; x=1686387244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=17WiJmbprSj01CUtV1WWHWzwtN+21oPfApxnBIbGJ88=;
 b=XUYJHS+Ts2CK3gn0xsjyHrI8j5hU4Fgbo7ajVFXsfCEee0nNq3uSVcSd2xhh8/7Ojr
 fe2zKIkrpQMYwOq81acnZdjcvpArXrq4+kUevTsdPg6Lb0tBWDKKH14w8Gpr7wSEG7IO
 9L1a2Vz8khp3tEKzXO33rPRMizAiruUwJf603OQ+Hr8q7DeNV5EAtHEEtnNW3gc8pKWH
 apiLx8qDuqQ40T+oX5UaXriTOwuEaQq1S768RoM6ggziUnkgVtqaLqt2uUn9WW15+bcV
 Jz9Zc57yNg8xvfna3g9wImZarICSn7Y3z22z3S+8HGyYAwyLAKzs5VcT+Bat3P+FWwSp
 j+Mw==
X-Gm-Message-State: AC+VfDwmBSmmQU1RnOgbHbOtNyCXeSIvPQt7b7mn9Sd4cDNqEktGBBCC
 QaY1f0S+hK8nG+e9vzXRt2r6Ot53nwPHV/cHnhi2IqeUl0OkMVFVOC5GfqPgiPRfQf3suJlL83O
 Aj0ErAPz1WDuwjsA+mmT31IjVTa5jfK1rkGBALMq8
X-Received: by 2002:a05:622a:15c6:b0:3f4:e4c1:5f65 with SMTP id
 d6-20020a05622a15c600b003f4e4c15f65mr2379260qty.23.1683795244746; 
 Thu, 11 May 2023 01:54:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4E4wnmDmpgm/PPOESGMccJQy1Y+738vgFt2U/DUo1wdjsdQssaUd6q2k4aTLRW2g94zNPpFg==
X-Received: by 2002:a05:622a:15c6:b0:3f4:e4c1:5f65 with SMTP id
 d6-20020a05622a15c600b003f4e4c15f65mr2379247qty.23.1683795244491; 
 Thu, 11 May 2023 01:54:04 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 j8-20020ac85c48000000b003edf043048bsm2085552qtj.9.2023.05.11.01.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:54:04 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-ppc@nongnu.org (open list:PowerNV Non-Virtu...)
Subject: [PATCH] pnv_lpc: disable reentrancy detection for lpc-hc
Date: Thu, 11 May 2023 04:53:37 -0400
Message-Id: <20230511085337.3688527-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.63; envelope-from=alxndr@bu.edu;
 helo=esa5.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As lpc-hc is designed for re-entrant calls from xscom, mark it
re-entrancy safe.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/ppc/pnv_lpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index 01f44c19eb..67fd049a7f 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -738,6 +738,8 @@ static void pnv_lpc_realize(DeviceState *dev, Error **errp)
                                 &lpc->opb_master_regs);
     memory_region_init_io(&lpc->lpc_hc_regs, OBJECT(dev), &lpc_hc_ops, lpc,
                           "lpc-hc", LPC_HC_REGS_OPB_SIZE);
+    /* xscom writes to lpc-hc. As such mark lpc-hc re-entrancy safe */
+    lpc->lpc_hc_regs.disable_reentrancy_guard = true;
     memory_region_add_subregion(&lpc->opb_mr, LPC_HC_REGS_OPB_ADDR,
                                 &lpc->lpc_hc_regs);
 
-- 
2.39.0


