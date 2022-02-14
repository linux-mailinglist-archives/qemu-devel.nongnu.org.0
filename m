Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E54B4FAA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:09:45 +0100 (CET)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaAq-0004jF-3d
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJa3K-0006eB-G3
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:01:58 -0500
Received: from [2607:f8b0:4864:20::42a] (port=45781
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJa3H-000614-7J
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:01:57 -0500
Received: by mail-pf1-x42a.google.com with SMTP id p10so8179895pfo.12
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H7MLGrMBvBmrRp+FoyoBkI45SAgDCZl8y9ZhwbvUM0Q=;
 b=p8iEF0nC9H3T761PPTPGHILvcP2JcfKicPSLRiaCDHFE9evP9A5WmJq+9dBCoSjqKQ
 G+z3ylnb+CBU/EWktofpOPHV/uGa2Av5T/xCcUe2rKNz2jfdiNbAm7a7vw34f2rCmTl7
 pFBD7Sknjt9s1asAlGnrxOj6pEaxNSzuteAMSNGvbOBhnyddk73CuiUtdNdIHgCqxBdl
 OQ+Vn7oNEuWEoe3KBMYCL2sfC7JNwK45MPsmPYOPp3pctuDkOzGHMjKn4myKgJ/1iapb
 GJACzNkZ4FWKgMhQtLsleJyOkejqkcoC7Ddhl6d8JQnKnSIusZBL92X3IBz0ZYeyAYze
 UwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H7MLGrMBvBmrRp+FoyoBkI45SAgDCZl8y9ZhwbvUM0Q=;
 b=Z1u9SwNdnW00+S3stMp5fH0VjqPLH4hyYKK2vvFeIdpMBCKSpDGnomsTqiUPIHTGkK
 gN9ADs9aoAmHpwmRVBYOmBcb2JA4p4uZv7TA5C+FFbe9yqAtYATRdbZD8w4DGty+w/nt
 zicMq0YIbGcXa/SZggxtAT6Nw+nCSaiC9X3AqGQh9MSqnCcACUZxS0ynUVfrwFomIq0m
 4Gz7x5F1ZmDwZ4ql+T0rzwvOpY0y//iz68QiN+aILSBeJZsg/E3yBFbmdWVBwdshJJLv
 C2JYiM5eZuttArQqYlhaeEjii2nYkEJb4MvnFyUGPpXaPdksR1gQJoqx2L9byVzwqMPp
 PM2Q==
X-Gm-Message-State: AOAM530Fnze3yWAIqxH/Ckbb5qg5ZuWjTxnSyfGDM+4O59e0PvprPubF
 GbKQ8DUIYJ4hwipEnUGgKZCN6w==
X-Google-Smtp-Source: ABdhPJyWuaklEsgRxqResxgEvxt+KaeQG393NDw/oUsN+SVED5HzQS4FHkMwiOC+jN16x4ToQ9Y2Ew==
X-Received: by 2002:a65:4d0f:: with SMTP id i15mr11705607pgt.464.1644840112141; 
 Mon, 14 Feb 2022 04:01:52 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.127.101])
 by smtp.googlemail.com with ESMTPSA id pg1sm11614380pjb.31.2022.02.14.04.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:01:51 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: no need to add my name explicitly as a reviewer
 for VIOT tables
Date: Mon, 14 Feb 2022 17:31:45 +0530
Message-Id: <20220214120145.39359-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am already listed as a reviewer for ACPI/SMBIOS subsystem. There is no need to
again add me as a reviewer for ACPI/VIOT.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0b845f445..d92a262947 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1812,7 +1812,6 @@ F: docs/specs/acpi_hw_reduced_hotplug.rst
 
 ACPI/VIOT
 M: Jean-Philippe Brucker <jean-philippe@linaro.org>
-R: Ani Sinha <ani@anisinha.ca>
 S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
-- 
2.25.1


