Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB1389FF3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:36:52 +0200 (CEST)
Received: from localhost ([::1]:47178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeAl-0001Gb-DP
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxj-0005RH-8a
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxb-0001ZN-6s
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so4605173wmc.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8IhabcaqhDrc9tLSsH3atAhctazNweFNZbmm5n9WDvA=;
 b=eFZ9hed3TMl3fgoe41lt9QHFooIZ/ovGc/u6D8zKsewJxk4qsWqlsjZFN9UvElZK/t
 lw2YLcmNF0+kEtiSidbzCnBxS3eTnN2UoGnYsuaYDK2CAnuqMpGSSR+QKDkL29amMhJ2
 KML0YbVW4e/hCqq3dWFN94sWzAlyvkTUBnlVGldDBHs7gAPGlFK4th9f5AtbvI/ePHV1
 R2hEgf+MxfomhOBr1AiArsF36WILEu9kNGhDVZ+16IbzFiP2rbDdFr55M2vDLJ5/Yf0s
 c+3melFZO/W8D7Q7wQonyoKzdp+ZbFwljHrGYcSd5uf949fQYGnfdYsmOyz+5gp+KlBI
 m5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8IhabcaqhDrc9tLSsH3atAhctazNweFNZbmm5n9WDvA=;
 b=k3XGxB4yDr91VzQQWd4d28qnrzbnlcSVTaqRUuMBT1u860OxVPZQsywRpNua3YHDL2
 ffxzxBmNScy53cWeM2SiqkhWnMefYduu8Yac0RmLE7ixXsuO6v9AJFFqzX5MJ4OpxXPV
 EEh3BD0BlDomU+3ZkQBewtI01Mx92QnejObZpIpgml8NM8sOZhOG07KTUaImIHxD5j4N
 pouEZ9m8BX/HQuOTBpdpBO3EB0C2bxknj01FGVIebbhi4BwOlNpkONXOeolK6VONlEXB
 fcU6ie3E77Hxp0zQlJKNYkxXSKdyWILxiwtMlXki8/26LbkjZK81mYPDdlWHHIsvhpiT
 Hc5Q==
X-Gm-Message-State: AOAM5301QWdpybJ7EKSwaztq3HqW4U+KFGcs3uYhHrA5rkjZxsaD1fBQ
 6YUs8fjOYRgrpEJVLqtXI4J9HDBchf8gdQ==
X-Google-Smtp-Source: ABdhPJw4uGBo8tq+a0Qmwv313pVKv2zYMnsvRKX5cqrilt5SJlKmjj98T5gTlWogYHCWmW3l0r4Apw==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr2339578wmr.66.1621498992285;
 Thu, 20 May 2021 01:23:12 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/26] meson: Set implicit_include_directories to false
Date: Thu, 20 May 2021 10:22:52 +0200
Message-Id: <20210520082257.187061-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Graf <agraf@csgraf.de>, Katsuhiro Ueno <uenobk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Katsuhiro Ueno <uenobk@gmail.com>

Without this, libvixl cannot be compiled with macOS 11.3 SDK due to
include file name conflict (usr/include/c++/v1/version conflicts with
VERSION).

Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
Message-Id: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
Tested-by: Alexander Graf <agraf@csgraf.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 1559e8d873..82977bf11f 100644
--- a/meson.build
+++ b/meson.build
@@ -2141,6 +2141,7 @@ common_all = common_ss.apply(config_all, strict: false)
 common_all = static_library('common',
                             build_by_default: false,
                             sources: common_all.sources() + genh,
+                            implicit_include_directories: false,
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')
 
-- 
2.31.1



