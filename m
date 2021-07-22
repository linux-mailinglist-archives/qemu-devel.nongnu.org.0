Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0B3D1EE8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:24:07 +0200 (CEST)
Received: from localhost ([::1]:47110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6T3u-0003Gb-BA
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6StF-0006ia-NC
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6StE-0005Z4-86
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id k4so4769244wrc.8
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybpq7YGDaKRKyk0i8Mhsn/DdfCsTran5Fk9EVIFVKMg=;
 b=XbdvGfFbfc38mQxAstk0AYUqHK+rrnv2VYsIctH6rogLWV1pMywJWvnF6i43AI3bIo
 VM3KevlSQHp5IQ8U338XyVLZF8FzYViFwk1conqsNZ5b+77J0R0XK65d+kLbAMJ45w2u
 A241p/yJBZn3nTjVa39WgcEjW2F9tdjlE6DkIyFNe/PTDH3DyxbilrtJ+Llmj9kRKtaM
 oCviaqbXNdqpEnBoJ7HQNKIiehOH4wKS5yNArrewZ/WJw4KiXU+FnKNSr+zFWYi8u3ED
 RHHf6rpqiitL4Ui8polHsSCHbI1WJ1z0+rPL6ytbniRHX7PfigSHVhpZ2M0uNZGod741
 0Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ybpq7YGDaKRKyk0i8Mhsn/DdfCsTran5Fk9EVIFVKMg=;
 b=TeTNiVjjRZpZKwo8Y5aDHGyAXZE9ZeA/GsAvxgZygn2fc5BDRNX//ezMZIHqDR7NKw
 skv+VWVNSkvTuIc1T16y6Ekwy+6uL5tCiHs/ixDO13on2fbvSG+VWovTNomsHN8YWVX7
 nUCRZffQC/NasByjlu1bPQKMh+RiKSxdIqKN7iAaqvk8mC2QPW4k6C9yqLvzbcigflwU
 F7EfyhtPBZLZrzB0INn/g7GSY72U2X5eKpBaESOXywZ23iaa9eEbR28NMvE4lpKK1Vz4
 p0VPLWJzOB8S7gTqyiYTGoeGgPdTiTvueGCk1XNTHW+BgiybHEPJ0U5LkoLwx1bfyLh4
 ytSQ==
X-Gm-Message-State: AOAM530K/SEzuxkCq0pugAjaWolBghM24ukiArP2ZkPcLQiSqlt0Hq72
 PBZzSv8/TyqlHaGdXWHdiZBsQ5V1aRE=
X-Google-Smtp-Source: ABdhPJzPxNmCDxw8PQu3SyKCYPwS7fC2hCCd1QVkuIvPvkRHPB4Sdvl1hx9fnyfwr38ERLj2NPDFug==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr48956029wrn.62.1626937982684; 
 Thu, 22 Jul 2021 00:13:02 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:13:02 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/13] docs/deprecated: deprecate passing plugin args
 through `arg=`
Date: Thu, 22 Jul 2021 09:12:36 +0200
Message-Id: <20210722071236.139520-14-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/system/deprecated.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e2e0090878..7ae6f1f727 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -126,6 +126,13 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
+Plugin argument passing through ``arg=<string>`` (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Passing TCG plugins arguments through ``arg=`` is redundant is makes the
+command-line less readable, especially when the argument itself consist of a
+name and a value, e.g. ``-plugin plugin_name,arg="arg_name=arg_value"``.
+Therefore, the usage of ``arg`` is redundant.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.25.1


