Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B868A58EA77
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:31:58 +0200 (CEST)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLj0H-0003yy-KA
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibK-0006rK-66; Wed, 10 Aug 2022 06:06:11 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:38662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibF-0000vM-TX; Wed, 10 Aug 2022 06:06:09 -0400
Received: by mail-vs1-xe35.google.com with SMTP id 125so14595625vsd.5;
 Wed, 10 Aug 2022 03:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tl9Z8luQcwSh6QRgPGjf321Es9TY+GefKufsOtFTomE=;
 b=KgvALIwqefdzJWwwLlFQL9HpEIqVEDOunu9FCLCRU57Ro1i7vUXKjIDnxxxURZyCIK
 jEu/Mu9I7ga8cgJkv/H4DWARXSKUxuTOe7VHznlcPAdXtpylUkaA51z5QBs+ErderN3V
 63MNwXzzQuufUJnWIQxRe0g6XoM0u1tJfH/Hqh3K9Adc6r/ImolqHnVmKPbfXLyDunyn
 rmlQ5hpKeAfYjHwDdc355mcRv8uaZgl2feExqfDzJvguWFX6XL0m0KMarp9XUSVMx1Xa
 b/ooazyDNH69E9AN6cBLPgjJqAgQMXxcOcRByJ2iXd+HL1UwfdQ8/p7UsHx6gKbz6Gph
 1HXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tl9Z8luQcwSh6QRgPGjf321Es9TY+GefKufsOtFTomE=;
 b=14u8ADZGbjlHvVJpfx0sDxyVbqmbAbJU/zens8eAuY6HUyTIfN5AuY0Bm/+giR4hXS
 4f7s/qZOfZE2LiR4Vie7JdjawDIUgcBjhZe0NvI4cRtcnvsHr/76QL9VLaBBsg0ncuQ5
 JJSloGlk/p2MlmiNkhFaqEC3G/c/UtAmFp1mmzNWjau1oVapIEMCaIg6qkghKwNV3NaT
 KerJDpn99YJNp5d+Q58G6rMnTPEwSt/bsutpahtV5DEsWUCAVCiIIT6x7vVrWbo9O5LF
 xfjDvi/5KMTDZ8wd7bY+SNtADLfmqOxd5gDN+tzSx7eotzn7i1Qw/kgqh5LCOTgBB4+X
 TUyg==
X-Gm-Message-State: ACgBeo0NK7FMy99FzIaraPkyrLE1nf6WfqxSeVmCjC64LyCseu9yyqNv
 H/9zmNcVvrcE4fjzMUhZUWHmNwqbxcM=
X-Google-Smtp-Source: AA6agR7seHdYUZP1vYPtbXr9Phpis8pJ05k06DIDfDDIzyrS8BJCj3GeFz1U0VgFP2HePFbIJsyLww==
X-Received: by 2002:a05:6102:3d03:b0:388:4e6f:62c6 with SMTP id
 i3-20020a0561023d0300b003884e6f62c6mr11449234vsv.13.1660125964456; 
 Wed, 10 Aug 2022 03:06:04 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:06:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 10/11] ppc/pnv: user creatable pnv-phb for powernv10
Date: Wed, 10 Aug 2022 07:05:35 -0300
Message-Id: <20220810100536.473859-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe35.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given that powernv9 and powernv10 uses the same pnv-phb backend, the
logic to allow user created pnv-phbs for powernv10 is already in place.
Let's flip the switch.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index b6314dc961..02f287feab 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2159,6 +2159,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     pmc->dt_power_mgt = pnv_dt_power_mgt;
 
     xfc->match_nvt = pnv10_xive_match_nvt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
-- 
2.36.1


