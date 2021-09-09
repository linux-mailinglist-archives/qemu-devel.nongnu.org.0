Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128C8405901
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:27:25 +0200 (CEST)
Received: from localhost ([::1]:35150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOL1P-0006PV-MW
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mOL0N-0005Xz-S7; Thu, 09 Sep 2021 10:26:20 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mOL0M-0004iI-80; Thu, 09 Sep 2021 10:26:19 -0400
Received: by mail-ed1-x52b.google.com with SMTP id r7so2921617edd.6;
 Thu, 09 Sep 2021 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LQhHQo7TbvF9Uns6y6CZcNI5Rj8ePDOMGNWM3NJzUpE=;
 b=Zvgr+aXBYfAMGgDRrQDbK2Fu7ml/mLgudEeX6eDRkW2oeE028SP3OtToUWZA2FNm1t
 zYJR8cyQRC/g4Ow5joaqALM/t6Xcb1JpnkjcGD8YN3g7EuR6/F0zoce7QTfO/Qwb53DE
 MoKBRXGJqGIikqN7ZLKfpUuFuKsMpeJu2nvwkdQmu4sBtzoQo+ls/uAzOZnobfc2Y7Di
 Y9k1n0PegGLqA6u7/g3WVBSHmwLNhekf3PxjYd58yARooLxrkJwFKiUjPDOPjTredpls
 nO1pU5WvY5TfKlH2p6c0HOZfNbhMY/8NqhdIIVBdiiDKRg9soXK0x6wX32yb8pUua4xh
 HWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LQhHQo7TbvF9Uns6y6CZcNI5Rj8ePDOMGNWM3NJzUpE=;
 b=fW3oDa2x8zm7pHmAbYqFQHCaqqt8Kl5KEZiqWJyN+gmnTUA2rmdGhZqd/24j4MOjYe
 wTt/cJCrajqeF8P4HCXDjj1+Yd84B0OEkRUDRokouwdaL3sXMNn7bJLXDg1DpPTTigMv
 UcyWb6BsE7P6nciqHVpExdq0NPyCmYTRvt0PU9Az5h5bwh97vqCwsATVikeOIF+5x6YK
 g1FBVi3oPyW7dh5+UfzZT7MZ3tE97mhPEZtcdO7nPjJBPOe+VqFmxLOnshO0qHDGyxWu
 wdMeI2kUzicp2STkQLSu9QyvFODYPhW6BvGk9xLL70cufIimfdfJXBfQHOf3pwrELBdz
 aCYA==
X-Gm-Message-State: AOAM533BgSt5PBw7BXVJNNg0QEsChUgWOiLS80wYDgXO/QISMCRM4A9O
 5LQSHEihRqOHREe/CJVRu+qzeGB2SZY=
X-Google-Smtp-Source: ABdhPJzZ+UcbBz6uk2bmSPHC9b0BJAGdKQdYF+7wlAzhC6kQWrMrB2owt3Arf/dY6uFa9tfNMdINzw==
X-Received: by 2002:a50:954c:: with SMTP id v12mr3465044eda.313.1631197575707; 
 Thu, 09 Sep 2021 07:26:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 v8sm1035857ejy.79.2021.09.09.07.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 07:26:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: link to archived Fedora code of conduct
Date: Thu,  9 Sep 2021 16:26:07 +0200
Message-Id: <20210909142607.388417-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fedora has switched to a different CoC.  QEMU's own code of conduct
is based on the previous version and cites it as a source.  Replace
the link with one to the Wayback Machine.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/code-of-conduct.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
index 277b5250d1..195444d1b4 100644
--- a/docs/devel/code-of-conduct.rst
+++ b/docs/devel/code-of-conduct.rst
@@ -55,6 +55,6 @@ Sources
 -------
 
 This document is based on the `Fedora Code of Conduct
-<https://fedoraproject.org/code-of-conduct>`__ and the
-`Contributor Covenant version 1.3.0
+<http://web.archive.org/web/20210429132536/https://docs.fedoraproject.org/en-US/project/code-of-conduct/>`__
+(as of April 2021) and the `Contributor Covenant version 1.3.0
 <https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/>`__.
-- 
2.31.1


