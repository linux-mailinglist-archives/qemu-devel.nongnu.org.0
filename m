Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF24ABB84
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:38:40 +0100 (CET)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2Lu-0002UE-TU
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:38:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2GW-0008AJ-CO
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:33:04 -0500
Received: from [2607:f8b0:4864:20::429] (port=41936
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2GU-0001jX-8q
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:33:04 -0500
Received: by mail-pf1-x429.google.com with SMTP id i30so12411555pfk.8
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=E5a2PaNgKhv45jsrP8yD2Hyxn0fHtaTtQrLqDp2u41E=;
 b=7w0bCgugVbhgKJ0Lx34MhM13q7pPOqsWmXWZv0Lts0JwUwtbY4gy36ChmkRzK2zkSc
 4/S8cl2Mel5O99tcx7Ag2bF5wu15FbBCxwzsFeUBBybGdW+dVi1WXjjq17ZABw91eS+J
 to+tb15VIrwQUaBxEH401JP/qg66EToEi1trGPE6flLWQJKyviWScNwzDHDRJKMWr8uf
 pdm7ro9GVbKBjDTNlpWXCc64QN8RiMrepUI1BoWJU2d4dbEVUF5NeBzw0YDKWthUDlhF
 w9p3XZv0cGBpbh+beZSPdkkWj8C+FZ+XvWDKGALLPlN6zPo74J+JS48Cn0Kskbdf5jC/
 o0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5a2PaNgKhv45jsrP8yD2Hyxn0fHtaTtQrLqDp2u41E=;
 b=h0w0amEZMX54rXt1/gBnqXELMn8KdQNoNcYhYXF5G4mqf5oxm85kjDfpI89e1XJBBV
 qFBZBK4D32H7FgLTooHeyRXyUXYEfqotUskzjrHtXQlmsWqGkBfH9SGLyIi/j+W+mLu0
 AvKPtpTxgSBSJiYYaGUPVtdAztIj66myylv04ZG2dgNovlsp5++2fcYXp2ZpbgAV6lai
 gYD9zBbfV+0IpUxjI8RQdflTwUBNiWaUKGXZoQAQBNtWH+d0t2VJG5sQC3ZiqiWeVPTa
 VRiKj4bUV0jFoB04Xp54mhaJb9PdFWvOIwD9HIfPG5SiWQCbjRpzaa5M9rTjCbiOzqPD
 Uv1A==
X-Gm-Message-State: AOAM530egsI220lpMkiJ/pZ4y8Qcy115BKYRcp4K6aQtwYocKl5cHVmo
 RTS66enmdIQgTBgU+6kG0ZIMr/b+9r3NuJcn33FEag==
X-Google-Smtp-Source: ABdhPJyFS4/04JfXz+LunNFAdgKLkckcTnQmSwARYq6YGEHAw7O28nIdf3+EJR0EfJrGxaww3lrPhA==
X-Received: by 2002:a63:4182:: with SMTP id o124mr8973343pga.479.1644233577715; 
 Mon, 07 Feb 2022 03:32:57 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.242.56])
 by smtp.googlemail.com with ESMTPSA id h14sm13016345pfh.95.2022.02.07.03.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 03:32:57 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 3/3] hw/smbios: add an assertion to ensure tables 19 and 32
 do not collide
Date: Mon,  7 Feb 2022 17:01:29 +0530
Message-Id: <20220207113129.2701722-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207113129.2701722-1-ani@anisinha.ca>
References: <20220207113129.2701722-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since change b3cddba9c14b034 ("hw/smbios: fix table memory corruption with large memory vms")
we reserve additional memory space between tables 17 and 19 for large VMs.
This may cause table 19 to collide with table 32 for those VMs. This change
adds an assertion to make sure table 19 does not extend into the memory used
by table 32.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/smbios/smbios.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index d7de740363..800a35e9a5 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1048,6 +1048,9 @@ void smbios_get_tables(MachineState *ms,
                                        mem_array[i].length);
         }
 
+        /* we need to make sure table 19 and table 32 do not overlap */
+        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
+
         smbios_build_type_32_table();
         smbios_build_type_38_table();
         smbios_build_type_41_table(errp);
-- 
2.25.1


