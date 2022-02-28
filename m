Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EE14C75FA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:58:12 +0100 (CET)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkHj-0008Ap-AJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAN-0002MC-0s; Mon, 28 Feb 2022 12:50:35 -0500
Received: from [2607:f8b0:4864:20::230] (port=43528
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkA8-0007pJ-0d; Mon, 28 Feb 2022 12:50:34 -0500
Received: by mail-oi1-x230.google.com with SMTP id s5so13901685oic.10;
 Mon, 28 Feb 2022 09:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EG5W6v7O8+ytzQCLlXSXY+Hj9MWxDL7HvA2iof/Ges8=;
 b=AkFej0GrNjSSVZZkxGv0Z4rgiRzDW35nl2d/33KGE+2vTFwf6VQfZ4Uje2KgpsewlI
 u4HM1kwZzzUGiZJS4IJYz5rdP3SxHCTCqGS9XS0X5pQSgCNeSV8dcNebnw2Hjd7AjtkW
 lPiI9muMCJ5A37oa+f7CeRSKNLu7U76q0ol6iUs6NSjjMwYApKUMMd+4kcda1EVwb1QE
 sAmXd81hz682tIhadtzh/GcrlkSKSKUZLP1uXuIFqajt2TdWnf1bJhj/jIeihKDf3NKI
 JeqjhAlLnHIPeeV/dOmvJJ4BDVtZPgy0BWTVM69KBGPAVIZZ/Kn6o3fW8k+1DrMuhqDO
 b2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EG5W6v7O8+ytzQCLlXSXY+Hj9MWxDL7HvA2iof/Ges8=;
 b=qrQVXgkD1qbZK0doKqJnJ8fFyquZCIxXfkWsNDTxPv8YQyGbST+RIDxOdIv+wwj8yr
 V7vo0tJ4MhBmemA5P4m1DODsQ0esIzCn+S9zchT5A+LHraKuehJnPTnqwKH6AYa1m74l
 W2Wt89OjP3YbEqDu7cdzkEcXN8vOFnetxpWHAL9lYROhL4crHLvGlwmvUsFi0NnfA+Zv
 B9alQ80cMMN8rso2aYfabL9kk/O2t3etH/b7Btkz9GAbFAwqCEFSntMMqPt/KVaF7iG1
 bWVKiwra5wyGHm3RHfV93CV1x8ZMBeoICqjsiTa7bYa2SH1Ws2fVZtfEildmKKVVP85T
 Mtig==
X-Gm-Message-State: AOAM530C+f8Vw38egVlho/J1+jHTjPNahf7U6kXnUe7O01ZTRXgCjyQU
 3dMBi5iOCgMi/FgvzqCJbRslSXuThfU=
X-Google-Smtp-Source: ABdhPJyUGPQDmt2MCIFLuMG7u6UqVxcGR+9CVIfKOpzAy3OdJwLRKcO+1crL+hcsi+zR2/U5zV/Wlw==
X-Received: by 2002:a05:6808:f8e:b0:2d7:d06:1ba9 with SMTP id
 o14-20020a0568080f8e00b002d70d061ba9mr11944957oiw.64.1646070618177; 
 Mon, 28 Feb 2022 09:50:18 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] simple cleanups in spapr files
Date: Mon, 28 Feb 2022 14:49:50 -0300
Message-Id: <20220228175004.8862-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These are some cleanups in spapr files I decided to make after seeing
Greg adding g_auto* in virtio-9p files.

I also took the opportunity to simplify the logic in some places where I
found it to be more complex than needed.

Aside from patch 02, no functional change was made in this series.

Daniel Henrique Barboza (14):
  hw/ppc/spapr.c: use g_autofree in spapr_dt_chosen()
  hw/ppc/spapr.c: fail early if no firmware found in machine_init()
  hw/ppc/spapr_caps.c: use g_autofree in spapr_cap_set_string()
  hw/ppc/spapr_caps.c: use g_autofree in spapr_cap_get_string()
  hw/ppc/spapr_caps.c: use g_autofree in spapr_caps_add_properties()
  hw/ppc/spapr_drc.c: use g_auto in spapr_dt_drc()
  hw/ppc/spapr_drc.c: use g_autofree in drc_realize()
  hw/ppc/spapr_drc.c: use g_autofree in drc_unrealize()
  hw/ppc/spapr_drc.c: use g_autofree in spapr_dr_connector_new()
  hw/ppc/spapr_drc.c: use g_autofree in spapr_drc_by_index()
  hw/ppc/spapr_numa.c: simplify spapr_numa_write_assoc_lookup_arrays()
  spapr_pci_nvlink2.c: use g_autofree in
    spapr_phb_nvgpu_ram_populate_dt()
  hw/ppc/spapr_rtas.c: use g_autofree in rtas_ibm_get_system_parameter()
  hw/ppc/spapr_vio.c: use g_autofree in spapr_dt_vdevice()

 hw/ppc/spapr.c             | 31 +++++++++++--------------
 hw/ppc/spapr_caps.c        | 22 +++++++-----------
 hw/ppc/spapr_drc.c         | 47 ++++++++++++++------------------------
 hw/ppc/spapr_numa.c        | 16 ++++++-------
 hw/ppc/spapr_pci_nvlink2.c | 10 ++++----
 hw/ppc/spapr_rtas.c        | 25 ++++++++++----------
 hw/ppc/spapr_vio.c         |  6 ++---
 7 files changed, 64 insertions(+), 93 deletions(-)

-- 
2.35.1


