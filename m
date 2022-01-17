Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CAD490B34
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:11:53 +0100 (CET)
Received: from localhost ([::1]:60754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tfk-0002EP-ES
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n9TT8-0005Xw-KN; Mon, 17 Jan 2022 09:58:50 -0500
Received: from [2a00:1450:4864:20::32a] (port=39652
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n9TT3-0001lT-R2; Mon, 17 Jan 2022 09:58:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso24989928wma.4; 
 Mon, 17 Jan 2022 06:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7347/TCXKHFTqW4c+ub1isoBgmSJE9thbenFQABOcvM=;
 b=C+VUkLHmTKV9jT06CeSgl+hFZy1y5kKQcN39cT8QJoCc8lxeASuYbUgGEllC3IE5hi
 VExHm7R/3nsfXq9Y8S3E9rI6eQBNijxs3/cb16KyI4I5r35qmtUZxF92jD3258D3nl7c
 m+0Hmir+Fqomp8AoJGzf985Y2zfEt+8fbdmMJWjmrpWG00ICLjQdcqq/5/QT7gy6Dk/V
 iETQqPZFLtGZL/H3n+loeBBn9fNdGYMXIxstQ5jyh2hvV3tHUoCuqra3Fg2cCyQ/4T+n
 qdwCITl8gKBJWP2cdv2sMaTC19ykqJruI0s4xyw4NCd0ybDwh2FnGGZqY8nbr/52N/yD
 H8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7347/TCXKHFTqW4c+ub1isoBgmSJE9thbenFQABOcvM=;
 b=hauq7jaTKfb2OEDoCxPL+axudhe9KdQa7KeiNK8rbs46g4bMGA1j6dwpbfs+VIAfoB
 QeMEDPqsbZ8edhRKPdfS1+qM8192zG309nOSQwpJUVIgACSwN9DNzoasM5MJgFs2uKa7
 gKNc9/cMcq9BkXBWxfbRxf6dOX5zjxHDBl0fSf4sLotUQZvahMl2kgwx6qmd5KBu68Je
 /AJRZBfEVACdUCSYmic2R8c5owuLfYIC7XxJ5Q1pQ4DRVZEb23dGISBtZ3m7ywFygVl/
 u4EzRaJplt+149ixRFh71UoyyqNbl5AM67ymvRmatmSuo4v6Sqx6OMgZB6NctU85FCEb
 T5Cg==
X-Gm-Message-State: AOAM533uAxiAZAO7TNZoUIaSCMm0fi++KPBNDsW/jAIQVjyrvCCVBicq
 Dnx6Q4zwz58BmQZiiWROz10ACom3S5s0lYNuk3EApg==
X-Google-Smtp-Source: ABdhPJx7yGeE2WwP9VaSsXJdtBALuIkJ/TzIUKVRTce0vGe6PRkHqMHk+ELihsrAcgp7WbsojqAIew==
X-Received: by 2002:adf:fdc8:: with SMTP id i8mr19923200wrs.613.1642431524178; 
 Mon, 17 Jan 2022 06:58:44 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-014-042-014.89.14.pool.telefonica.de. [89.14.42.14])
 by smtp.gmail.com with ESMTPSA id m20sm14155593wms.4.2022.01.17.06.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:58:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] checkpatch: Ensure that TypeInfos are const
Date: Mon, 17 Jan 2022 15:58:05 +0100
Message-Id: <20220117145805.173070-3-shentey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117145805.173070-1-shentey@gmail.com>
References: <20220117145805.173070-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all static TypeInfo instances are declared const, prevent that
new non-const instances are created.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5caa739db4..509a290041 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2883,6 +2883,7 @@ sub process {
 				SCSIBusInfo|
 				SCSIReqOps|
 				Spice[A-Z][a-zA-Z0-9]*Interface|
+				TypeInfo|
 				USBDesc[A-Z][a-zA-Z0-9]*|
 				VhostOps|
 				VMStateDescription|
-- 
2.34.1


