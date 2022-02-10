Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194034B1249
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:03:54 +0100 (CET)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBvE-0007YQ-TB
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nI9V7-0001vE-RB
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:28:46 -0500
Received: from [2607:f8b0:4864:20::102a] (port=42923
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nI9V5-00041g-N6
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:28:45 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso4366730pjj.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fRe7wvaOS3tj5buP5SOWcFUHCR9DPpBo2aZFgzLGlbw=;
 b=0W52cZxFiq9/TaS35h/TdVcKOt2AZz2nJzIai8j8OE/rTohhlY39M8tfWhDxIAdw3M
 lN9JrCnjMJQgg8tYPo2FzfuhoyLwXkiUlI0QqsHuZeg9rX4cTYJnubOI9/+ylBwKs7jq
 iulXsUztPhoB5uu1p/d3A6h620x3vta3yJEV6AUsJKlGktn0WaAu0Dt7eaDcNKkk8XeV
 m6grcwgIYQitg+Ugm9+2VEShFaTrvt8fniveQEucJna5F/Kn1NULHAsd2kxsLzkhDwGL
 yhv8gN48w3A+EakGXl5B6aPW9yAd1CyuxAKDBMRw710aroNeCJ6tBkPK7YJv/WJkVK5p
 p1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fRe7wvaOS3tj5buP5SOWcFUHCR9DPpBo2aZFgzLGlbw=;
 b=V7K0BfFkNd4UZ4dEpoKgQKxBtYX2kvmFYFziJc+MUPABGwN9NwuxWGdGtSZp6RN2xa
 +LIw2Vv2Sar42B2Q56HpGr7+cDkzvEqe/7rsvM+kGgldjwHjpkXAWda/u5IYRcm3MM/y
 M791jhHHxo8iIQ0flmjQgn1RmDHsx1d6exobDFue8q/3VLEh8SsBRRK412hKVnyAaux+
 BEhrOQ0VvKYQ0T/KXGUSaiOn2DSJu1HjRTCB4i8JU1VsCp3aO51Zb2ndaQj0UA1/eMI5
 tys2TLssGGGyrI/YFcy3YuliEie84vGUoTfP5pghLnhaySPKFpu+Az5JLdGgJ+05bfg6
 7+pw==
X-Gm-Message-State: AOAM531EjE/uizKBuyGPOrFhzUWjTFpiCZo9am1O1f+t8BtoLfz7HFFv
 rKZTn3RXHI/NI44w47w6e1mpoX/aI7Wn6F/t4TFteA==
X-Google-Smtp-Source: ABdhPJwGJ61vSIOZ1p4aPtNY4pGcEcyaEJ6rOvwoeq0pm7+6Bx6R5l3rphN095BGOZDjpMmdQVwtrg==
X-Received: by 2002:a17:90b:1b52:: with SMTP id
 nv18mr2828543pjb.136.1644499721997; 
 Thu, 10 Feb 2022 05:28:41 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.148.209])
 by smtp.googlemail.com with ESMTPSA id 16sm2440603pje.34.2022.02.10.05.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:28:41 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] hw/i386/pc: when adding reserved E820 entries do not allocate
 dynamic entries
Date: Thu, 10 Feb 2022 18:58:21 +0530
Message-Id: <20220210132822.2969324-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When adding E820_RESERVED entries we also accidentally allocate dynamic
entries. This is incorrect. We should simply return early with the count of
the number of reserved entries added.

fixes: 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
cc: kraxel@redhat.com
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/e820_memory_layout.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
index bcf9eaf837..afb08253a4 100644
--- a/hw/i386/e820_memory_layout.c
+++ b/hw/i386/e820_memory_layout.c
@@ -31,6 +31,8 @@ int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
         entry->type = cpu_to_le32(type);
 
         e820_reserve.count = cpu_to_le32(index);
+
+        return index;
     }
 
     /* new "etc/e820" file -- include ram too */
-- 
2.25.1


