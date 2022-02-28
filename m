Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50104C79E9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 21:20:07 +0100 (CET)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOmV2-0007lQ-If
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 15:20:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOmT8-0005H7-RK
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:18:06 -0500
Received: from [2a00:1450:4864:20::334] (port=44824
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOmT7-0000go-DI
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:18:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so142840wmb.3
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 12:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KnYql3OH7CHGuzhamKtAe9R5fsZj0EkHsVE9D5HsbSY=;
 b=OfA69AiPk7AtRn3oZMc2lISYGZlek+3oHgzJL//zjLR2Jm1CCBrUz+sIAPX3CE09I1
 A7bnOZEsW+jCaH19GYUZNekC/ALNJfg10ldmiy0U3gGuEhlA+v4flJIN6ovGN52MsDFQ
 KST0pLOaUxDHYblp+Mq7ZZwJOf2oONC2F/eQpedfJllF8bxAKxRVE+J1tr7vBM5xEYLs
 UUehRZ5ItQ5CaQnQmk1V3WCyOKzYuaVJIwR2kxNX1fWkigrjOeaMgCgBnibpZyAPB6wI
 f1AjpfDbe/MpaIb7XEonh0bkbav4KMNYN1as4ZSJV/meRJJODkZ+La1znWMIfhUk0gFa
 Y9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KnYql3OH7CHGuzhamKtAe9R5fsZj0EkHsVE9D5HsbSY=;
 b=RrEm3qc2TyBPtYToQEhnD7ZCu1QyZ6YukJ8rW0b2g0MVRj5S+sE65m/rIXxeIarZSz
 QCtvbBAAdGfqvwVaf02EO/00tJgaaSrXZTXCWuoiuIEQ8J7gsykUwsyvhSllDrvqhI+h
 /K57jVVCl96gpmRHfaB0+TvLlNcXgwhxlhRRsGQrKRzwScvXhjjtjTAkc6GdrRTt6B/U
 03ENIJmRmirNihTUf7aQLCgEViJWX4OmR+CBPjrPOBrCbIvrsfh3TkFF/kAEhS0Y5uqo
 ZATSTEscGPiUCe5UCyIDAWkoxS7wRB65wDmpP03H+pnrZD8DolB50OpTEfnmA8ByPn1U
 QJNw==
X-Gm-Message-State: AOAM532rhWTnnCOqAS6y/z/NT/sWt3ip1eJ0rgDVNVqUfBYeEQD3I2DJ
 EEt4Ats9iORH5CRKKK/Ig1b0m4U8sVcVaA==
X-Google-Smtp-Source: ABdhPJw+mxDi2QhrK/dMCVyi/Uy1U0frDayy5gTskOaeQCbAYlfCb5H0L6hfM5O8aZo1s3CKsN1NSA==
X-Received: by 2002:a1c:7311:0:b0:37c:3ceb:71c3 with SMTP id
 d17-20020a1c7311000000b0037c3ceb71c3mr14353024wmb.154.1646079483479; 
 Mon, 28 Feb 2022 12:18:03 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c418200b00380e4fa28b8sm355259wmh.23.2022.02.28.12.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 12:18:03 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] tests/acpi: i386: allow FACP acpi table changes
Date: Mon, 28 Feb 2022 22:17:31 +0200
Message-Id: <20220228201733.714580-2-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228201733.714580-1-liavalb@gmail.com>
References: <20220228201733.714580-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: ani@anisinha.ca, imammedo@redhat.com, shentey@gmail.com,
 Liav Albani <liavalb@gmail.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FACP table is going to be changed for x86/q35 machines. To be sure
the following changes are not breaking any QEMU test this change follows
step 2 from the bios-tables-test.c guide on changes that affect ACPI
tables.

Signed-off-by: Liav Albani <liavalb@gmail.com>
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
2.35.1


