Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1A5A29C3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:41:59 +0200 (CEST)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaX0-0004ng-Aj
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4W-0008CL-5E; Fri, 26 Aug 2022 10:12:32 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:38516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4T-0003zR-UR; Fri, 26 Aug 2022 10:12:31 -0400
Received: by mail-oi1-x233.google.com with SMTP id w197so2120262oie.5;
 Fri, 26 Aug 2022 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=g67u4yFDZGr4nwwRQGD4i/TkPZEjAEmcKuspVyC0JdY=;
 b=APVExvu7QiDCY+VgnWtrP7hcp7Xchs3IkhQNVqZIX7GyRAMyY6kBUlnwOaAfjJfwdj
 XYeoJOcFfuRfcmfgSBmRai110ZegGuTqYaDT+ED01sJYF56/VE0Gp8zK9IH1IS6A4ezt
 Fr7NEwATGjl+s19JRCZ/yxSNrd744QEMbyoN8WpIJAau4pp99wroDkGl/T4LdBzg4/F5
 5qTmeBkJWITaJG9qgDwuCQ8ObfLbippf+KlkNuUVgmHO9aoJ+Siiy8jHlinRj8F31L5t
 GTYeFLYhSs/oVirSAO4XP6ziRBFeKTF8DwB+/kMeJAUWv842kROaBk2ltE8jttnXRIYs
 dw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=g67u4yFDZGr4nwwRQGD4i/TkPZEjAEmcKuspVyC0JdY=;
 b=1vATVA2g595tc8qJODLEwfnm1fhlgvIsQU8P9+zSIrOrKeRc2DBCZj089KQqFupw9B
 KbP0OMNtoHB5U+N2IImBnIYlksx131fq18TtE9ZuQbhXaYciN2FXPIaC8GQsjXANkwSE
 bMaRuzsKmxJx0rzXAj7nGFEltnRkFMtNoZ3pOBgUag+r10uK7eZXmWTqASv213DX5qiu
 EOaeuUt6A9vqlF6VazzYfAvev0B8CR6l+kc6suMe9aVPLioNQxlhYNgSZeyo1DTyQKea
 MMqMHSD7eEvG8hCTKppww99r2chCPEQ54DiaQiw0GUjhuRdPqBHWxsH4p9K7y8bvrhPf
 uNNA==
X-Gm-Message-State: ACgBeo2In2sF+0gGpZ92pckRiRe0bLfjLpQycI9xxtwFMpJFlvVI5UEw
 iYd22wGz95T5Mwh9ctMJkD4z0Rhyo8g=
X-Google-Smtp-Source: AA6agR7OEOcRfBYVgM8o3oyVe7wvDmmu+eytnkzMaaiU0bjYCxNnwK4gu0CoUc+KNjau6LUzwo7YQQ==
X-Received: by 2002:a05:6808:20a0:b0:343:2cd0:9707 with SMTP id
 s32-20020a05680820a000b003432cd09707mr1759765oiw.132.1661523144202; 
 Fri, 26 Aug 2022 07:12:24 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 10/21] hw/ppc: set machine->fdt in spapr machine
Date: Fri, 26 Aug 2022 11:11:39 -0300
Message-Id: <20220826141150.7201-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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

The pSeries machine never bothered with the common machine->fdt
attribute. We do all the FDT related work using spapr->fdt_blob.

We're going to introduce HMP commands to read and save the FDT, which
will rely on setting machine->fdt properly to work across all machine
archs/types.

Let's set machine->fdt in two places where we manipulate the FDT:
spapr_machine_reset() and CAS. There are other places where the FDT is
manipulated in the pSeries machines, most notably the hotplug/unplug
path. For now we'll acknowledge that we won't have the most accurate
representation of the FDT, depending on the current machine state, when
using these QMP/HMP fdt commands. Making the internal FDT representation
always match the actual FDT representation that the guest is using is a
problem for another day.

spapr->fdt_blob is left untouched for now. To replace it with
machine->fdt, since we're migrating spapr->fdt_blob, we would need to
migrate machine->fdt as well. This is something that we would like to to
do keep our code simpler but it's also a work we'll leave for later.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c       | 6 ++++++
 hw/ppc/spapr_hcall.c | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bc9ba6e6dc..7031cf964a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *machine)
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the common machine->fdt pointer to enable support
+     * for 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
+
     /* Set up the entry state */
     first_ppc_cpu->env.gpr[5] = 0;
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a8d4a6bcf0..a53bfd76f4 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the machine->fdt pointer again since we just freed
+     * it above (by freeing spapr->fdt_blob). We set this
+     * pointer to enable support for 'dumpdtb' and 'info fdt'
+     * QMP/HMP commands.
+     */
+    MACHINE(spapr)->fdt = fdt;
+
     return H_SUCCESS;
 }
 
-- 
2.37.2


