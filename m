Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CDB41DB6C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:47:56 +0200 (CEST)
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwPk-0001WA-1R
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBM-00084Y-5c
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:04 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBJ-0005DR-Sr
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id s24so4691648wmh.4
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZldbnCdugQGK5VNaU/g/0ED4l/N93hoQAw50o2LtEUM=;
 b=TcgTnnA4pJecOJ/1BIZ5q4h7ySFF54iIpsvkDpol6iiDJaXFp9Mq4J9F33kaH4EANh
 qzwVWKJU0mGPHaem9N06Xk33VB8gPCiwsAAc62/vVYpm5JOWGifbRdNtsECIl8iIcv+X
 usnnFi6MT8WazKr0PTfAxoEzFx9g/SHcFG/Onb6smOxBHkclf7B/cKi2Tf+NcGLmhclu
 oQAnCihG2bKzZ4zPDlo/PuXcZWFawJQd1IlmoB8sKtUAfqa2ViBbJ+u5KkBUY2ifV25o
 LmTeBXf5ENFTNFHqJ73jJWu+sWfTSYnyAwGqVUqloUYTUdlEFz5ZSl/3FooHyITzPZC6
 Dr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZldbnCdugQGK5VNaU/g/0ED4l/N93hoQAw50o2LtEUM=;
 b=e51WFCZ3h8zjGiDVcKN0rIj/iUDDWj5ix/QBMTlCgSGzHJT8L9TQa9zv6gPh4TpF7v
 HdtOR+dWAlj9FtI/zIKYluzD4ph24/mZFrXOxR3VPd2zFh0fvgEuPxbRQ3pFMghl1W89
 BRFb935Jtiszqv1OitANTvOGE/KlWWmL4q7itfPemrLJbuw+G6zDB0VrHXCCLK3dXbhR
 z2OixBZKFzdsR3a55cQVwuNYKkh5+ROPU2pahT715m+l/sXW3WYNu+DLihS1wwMEF0x8
 vVaqJevvL+XW4b6cUwULLhuLIakPh66i/RhKyN36HahdfWYbo/YIlqyE7vqGy6WRE0tT
 gbAg==
X-Gm-Message-State: AOAM533hJZOQSJKsHxpqG/Kz4nXJkNvhM6SZ7qzUsCL1kBEpvO2OxXqF
 cF6cQmtiqbnym0PkRzZVogm23jkxVoo=
X-Google-Smtp-Source: ABdhPJx39LKVnwzcnFRRJYbGdXfKS58ZyJXKgA5i3L7MF9yPFcCklrxg6ioOVesX3XGF9iqfMu+Pog==
X-Received: by 2002:a7b:c048:: with SMTP id u8mr5289674wmc.113.1633008780458; 
 Thu, 30 Sep 2021 06:33:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c4sm3037168wrt.23.2021.09.30.06.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:33:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] docs: move notes inside the body of the document
Date: Thu, 30 Sep 2021 15:32:45 +0200
Message-Id: <20210930133250.181156-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930133250.181156-1-pbonzini@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make all documents start with a heading.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/multi-process.rst | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/docs/devel/multi-process.rst b/docs/devel/multi-process.rst
index 69699329d6..e5758a79ab 100644
--- a/docs/devel/multi-process.rst
+++ b/docs/devel/multi-process.rst
@@ -1,15 +1,17 @@
-This is the design document for multi-process QEMU. It does not
-necessarily reflect the status of the current implementation, which
-may lack features or be considerably different from what is described
-in this document. This document is still useful as a description of
-the goals and general direction of this feature.
-
-Please refer to the following wiki for latest details:
-https://wiki.qemu.org/Features/MultiProcessQEMU
-
 Multi-process QEMU
 ===================
 
+.. note::
+
+  This is the design document for multi-process QEMU. It does not
+  necessarily reflect the status of the current implementation, which
+  may lack features or be considerably different from what is described
+  in this document. This document is still useful as a description of
+  the goals and general direction of this feature.
+
+  Please refer to the following wiki for latest details:
+  https://wiki.qemu.org/Features/MultiProcessQEMU
+
 QEMU is often used as the hypervisor for virtual machines running in the
 Oracle cloud. Since one of the advantages of cloud computing is the
 ability to run many VMs from different tenants in the same cloud
-- 
2.31.1



