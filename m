Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B037379C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:34:44 +0200 (CEST)
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDvX-0002hH-7j
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDka-0000wN-Hw
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkQ-0005C0-TA
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id t18so1038793wry.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Rw6OGQrVJGw3XC/foHAisgB3VI31AwIvMNzYonwovA=;
 b=qeP7/ybCYH1wzVDrDLRBnkTBwAV04Hs70pHEaHj7uqrFgdmecAOZZgFtVowmwGqM9P
 UlvWuwqkBshA89X+17IsKvfQiPJjXI4KZUl++XtkewE9VkKTe8ocmz4hRHP0mRbK7rbD
 Y69i+VX0scN5CUHPCa0mbRZLbv0ArjwKwu99QL9qij1fstlVr10CaUO5G68fwpAXcIsy
 PPwCq0JxQfshDEytFtygdMl/2pm/yrdeIaOOEX3lcq40grZWQsdnDHdtImJpafDsp3Bs
 T9IX02L6ZL6qcaHmqcVmF0KIPMV84RF5d61qlWWFiZ6v3/qcCaP9YDuT9rU6vuMKctoP
 o2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Rw6OGQrVJGw3XC/foHAisgB3VI31AwIvMNzYonwovA=;
 b=OH60UETXE8Md1/r2KWfbBP4hRzieJVDyROIt6oThejKsjpwiXWIw+Rd3Yqcv4amdUS
 iEfaEOFw5rdbUUqbHeLrVGYiU/nk6cFaE7h/io9Z9Cu/1wPanYm4FSvjhhGzLb2l8Zu6
 Hgu/c2P6sq/+HNQQPD5v6pafOmYyLSLhFnlE4HYp6slYPVqvVI05pJRnEEhZ6VxZ+AM9
 t8O+v5CvIIKfa5j54KAaQTXwQH5jXVMcX7wUOtWILb7wiF1CIQCgKmWyH84sHAi+y8G6
 e4X6O021TRg7GvX8REzyYtWWLCJ7FxXVHlk/1RPpiXDCoe/XzvJFMOSX/pShs5xTAoiF
 bo0g==
X-Gm-Message-State: AOAM531c4Uzygn6YRklwZHzL0eW/vkJsc2eqhZqaecLMc2IRFgNCowAi
 Cbqfoj4IPQoF/GPLQ9EIzZ5Ziw==
X-Google-Smtp-Source: ABdhPJxKBjIKFIRVICTt+T5dRPcjvNMkbMnutk59LWL9zch9eKlQOiQh/+VJ+6xRqpY4GxtgjijDgg==
X-Received: by 2002:adf:8046:: with SMTP id 64mr36246315wrk.176.1620206593179; 
 Wed, 05 May 2021 02:23:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm5999462wrr.27.2021.05.05.02.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:23:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5BC2A1FF92;
 Wed,  5 May 2021 10:23:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/7] scripts/tracetool: don't barf validating TCG types
Date: Wed,  5 May 2021 10:22:58 +0100
Message-Id: <20210505092259.8202-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505092259.8202-1-alex.bennee@linaro.org>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG types will be transformed into the appropriate host types later on
in the tool. For example adding the following trace point:

  tcg goto_ptr(TCGv_ptr ptr) "", "ptr=%p"

would trigger:

  ValueError: Error at /home/alex/lsrc/qemu.git/./trace-events:149: Argument type 'TCGv_ptr' is not allowed. Only standard C types and fixed size integer types should be used. struct, union, and other complex pointer types should be declared as 'void *'

Rather than expand ALLOWED_TYPES just directly handle TCGv types in validate_type.

Fixes: 73ff061032 ("trace: only permit standard C types and fixed size integer types")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210406165307.5993-1-alex.bennee@linaro.org>

---
v2
  - do workaround directly in validate_type
---
 scripts/tracetool/__init__.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 5bc94d95cf..ce5fd23191 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -87,10 +87,9 @@ def out(*lines, **kwargs):
     "ssize_t",
     "uintptr_t",
     "ptrdiff_t",
-    # Magic substitution is done by tracetool
-    "TCGv",
 ]
 
+
 def validate_type(name):
     bits = name.split(" ")
     for bit in bits:
@@ -99,6 +98,10 @@ def validate_type(name):
             continue
         if bit == "const":
             continue
+        # Magic substitution of TCGv types will be done later
+        # using tracetool.transform.TCG_2_HOST
+        if bit.startswith("TCGv") and bit != "TCGv_vec":
+            continue
         if bit not in ALLOWED_TYPES:
             raise ValueError("Argument type '%s' is not allowed. "
                              "Only standard C types and fixed size integer "
-- 
2.20.1


