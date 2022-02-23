Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B794C15A1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 15:46:02 +0100 (CET)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMsu1-0005lp-EE
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 09:46:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsie-0001IP-AH
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:16 -0500
Received: from [2607:f8b0:4864:20::1030] (port=53940
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiW-0005bP-Gl
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:10 -0500
Received: by mail-pj1-x1030.google.com with SMTP id qe15so2796670pjb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 06:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QjYn/nDcS9vSkBLMNCNGY4sLg2O1EWN+YW+PnfRwmZE=;
 b=jjykGfkvyv/e/xM+AsSbkB9Xj23mOEHydYLDC7W+URICcK9kOx0mvmu3UJysnPI1XZ
 3wO3kO6EEf9wPdR4IwWBq8TBKRfbZ6pidYww241U0blCa/jmDo7LZGCwknhYMs8aW0Ee
 zLjz6jN4HPP5tN0WEvOH6mSmw3wGX6a/7YLhm0JC2WZPt+mOnU4d34fLJ/R9hYRkLy7C
 Tpv9QHpZ2gBC9SytYaNNagHlhprJhcfERTLvjQrQECahPPgWnpn0VIKBHCnkrpcpAnuE
 a9+ikNHOeqTyUF+uciw7xP+6hs5sycZ7uslabM8rNCr+7xNanrlk52p9JWdsTsmlLbtV
 qphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjYn/nDcS9vSkBLMNCNGY4sLg2O1EWN+YW+PnfRwmZE=;
 b=ZoM5MWrlepd06qbuzs68LsCNg3WOmSDpzOn6q+++YK5lGiaLXH6x5ARA68h6H+3tBS
 5MJYO+EYjsJk3n2RaqeaKx+1rzdNrODMCvKDMfPuprQ4XkwySjSsJnpc9+wJkP3j5qQB
 EfyawV2xPHlZPxgzN6aNettWd+rLbgjWVKBlhz01vIZI+il9S2qdo7FztTrUawk2MCoc
 0ocYEpjnqsJ5cuA/fcGVjJfNFUYeY2KyyjjhkXA2+CuopY3ba0J6QhYJCyb6GRkSAUgc
 l8Er3DV0+TfcccsuqVGiKUJv7aOMgMEzHRkRUXLsHpOnI9lonYj/U9d0+Q0pq661nQ+/
 bbNg==
X-Gm-Message-State: AOAM533hWqlj+8me+v1oNvBeA/oxKzR0J00xqClZT7PpWq/ibWWiMfjU
 yEuZvrd/UP957TIBzZaN1Qmb+249SUHxcA==
X-Google-Smtp-Source: ABdhPJzUiilFL95asm+WnMBgbEoq8MFOCaX8Q8yZ/1YfC9UZqfRawff9NknuZtzn2pRRWY1fE0nJgQ==
X-Received: by 2002:a17:902:c941:b0:14f:3a39:3f77 with SMTP id
 i1-20020a170902c94100b0014f3a393f77mr28680274pla.87.1645626846775; 
 Wed, 23 Feb 2022 06:34:06 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.81])
 by smtp.googlemail.com with ESMTPSA id
 l21sm22929583pfu.120.2022.02.23.06.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:34:06 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, mst@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 7/7] hw/smbios: add assertion to ensure handles of tables 19
 and 32 do not collide
Date: Wed, 23 Feb 2022 20:03:22 +0530
Message-Id: <20220223143322.927136-8-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223143322.927136-1-ani@anisinha.ca>
References: <20220223143322.927136-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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

Since change dcf359832eec02 ("hw/smbios: fix table memory corruption with large memory vms")
we reserve additional space between handle numbers of tables 17 and 19 for
large VMs. This may cause table 19 to collide with table 32 in their handle
numbers for those large VMs. This change adds an assertion to ensure numbers
do not collide. If they do, qemu crashes with useful debug information for
taking additional steps.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/smbios/smbios.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 44c53797a4..1f8d5c252f 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1048,6 +1048,12 @@ void smbios_get_tables(MachineState *ms,
                                        mem_array[i].length);
         }
 
+        /*
+         * make sure 16 bit handle numbers in the headers of tables 19
+         * and 32 do not overlap.
+         */
+        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
+
         smbios_build_type_32_table();
         smbios_build_type_38_table();
         smbios_build_type_41_table(errp);
-- 
2.25.1


