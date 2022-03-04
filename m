Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05F94CD7C6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:29:28 +0100 (CET)
Received: from localhost ([::1]:54416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9rz-0003wz-Fq
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9Wx-0004mj-VS
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:45 -0500
Received: from [2607:f8b0:4864:20::62c] (port=38459
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9Ww-0003kf-Je
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:43 -0500
Received: by mail-pl1-x62c.google.com with SMTP id t19so4414500plr.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=untwttg2h9MUzs6wtedAKndtsuh/tYZaw3CDKZL3ZkM=;
 b=dN0bjUbHMaxc0knlgM/3Sq7j3gEDRSWUe0Ohwy7PKM3k92GICreyZKk7rZ1lAaQ2Q4
 qvxqKUN6i6l1QPY+LqgmaOv4QM8w/6uRDYttGiEVJEuTpSr9b4MaglU/OiIEPazngLdW
 f/rLZdurLx0UEmrlUojGy7BX05KgTbzGZ+Y6FyGgQJtLvjuK5kZv9ubvEzj98+GrI2cT
 um6XnRKf5QY0j/ZUx6KjfEA+jWdmHmCkAd5H+HeT9yUigf0vY8SfOm3zOgGzUIBJVUQd
 22Yj4LS01VqU8Jm08Em9TtP+wKkZwuDM278DwwgDvs3jWvsBaonjMSqNwxoCDqPZheiY
 iOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=untwttg2h9MUzs6wtedAKndtsuh/tYZaw3CDKZL3ZkM=;
 b=EXs3B8OLSF8gN+Vrwn5h75tgK7vnuGW62Hgc0qpk48TkXdb9hZ25ETWaidAcTS1Ta+
 B2Wf8kLpt5TmGmOe5MDYPLPvHJbnnX7qjcFaSV1bnAoDe09wiRFmaHY+hFDsOGQC3M3m
 ll1Y/jdUonxnaC7fCMosYkVJpOKmr5L5XBVj7d6/FQ7CsokpV4CPFyjlTpyi0zv+Pg2C
 G57TWWNKXfM9SqvxxpAL7G/ci7kqJkt0A95Fm1k7k9s+lUecJTcDW/XHPGvuh2mG9C5M
 2gWC5GISqhKGJQyCUXLiDVUGgyIuh1vpL2c9ecqTeVQ+h8zYFcBZe4o9YF4Tpvv8hxSC
 nj1w==
X-Gm-Message-State: AOAM531L5B28NPyDv1NXQgFP+/zcuVhJi1yKEVJbscxMlvInuU7/O3Q0
 H5rm9l5MnsHItiitRWSi51Bc4ZJbGDYNEw==
X-Google-Smtp-Source: ABdhPJx4eWULUkU5zHmpW5IPDkRE5FVCK2Mz/jlJcOd4Q1IR6Ljr89UjYCyHwTbBMKXK5gWRW5H8eQ==
X-Received: by 2002:a17:903:11c6:b0:151:a247:31eb with SMTP id
 q6-20020a17090311c600b00151a24731ebmr11737290plh.91.1646406461098; 
 Fri, 04 Mar 2022 07:07:41 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 nr22-20020a17090b241600b001bef1964ec7sm8278861pjb.21.2022.03.04.07.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:07:40 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v6 1/4] tests/acpi: i386: allow FACP acpi table changes
Date: Fri,  4 Mar 2022 20:37:19 +0530
Message-Id: <20220304150722.2069132-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304150722.2069132-1-ani@anisinha.ca>
References: <20220304150722.2069132-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62c.google.com
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
Cc: liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liav Albani <liavalb@gmail.com>

The FACP table is going to be changed for x86/q35 machines. To be sure
the following changes are not breaking any QEMU test this change follows
step 2 from the bios-tables-test.c guide on changes that affect ACPI
tables.

Signed-off-by: Liav Albani <liavalb@gmail.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7570e39369 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/FACP",
+"tests/data/acpi/q35/FACP.nosmm",
+"tests/data/acpi/q35/FACP.slic",
+"tests/data/acpi/q35/FACP.xapic",
-- 
2.25.1


