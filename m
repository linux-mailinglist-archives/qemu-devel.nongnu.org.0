Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDBF512D32
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:41:33 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njymK-0003Vq-6s
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2F-0000TG-EC
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:55 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2E-00058W-1C
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:55 -0400
Received: by mail-ej1-x632.google.com with SMTP id g6so7639064ejw.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mo6RSwd4X5ZhQJ3X+x+w9UR6IaAzdNZ6WDjy6QIRSLY=;
 b=nsMwcOc2m5KDoomfTk4cozqKY7OY3Q/XPu8bPJDFmafwYk/bV60NCxjHlLM5oV5YhM
 qp8ffpGKNHL5Uq/qrUma9EGoVBytAnkQj9yUQuumVvSd2HARmlx6lQiMcNTwqXP+BrQ+
 x56m+sAXf/w8DInhOj/9ybuAjmzT+X0U6MJmzXw7IWTN2u0EiHEaTx5mXQYjRZu5AVhd
 x8CTL+AogXITD1Z/cznrTlkBnjkBtHjeecilB5ODTYTPPnIY2Xs6TZsud6LM/cTRpfvK
 sYzYIghx1vITwPDcEgdtkAoyUzkIr0NeDbHbXb4wv0+UspyPPi84VmRfoAseFokT3+9B
 vyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mo6RSwd4X5ZhQJ3X+x+w9UR6IaAzdNZ6WDjy6QIRSLY=;
 b=rqRuSE3d20tEzY9PyDXf35sBXP/NTLqw9qC869BxTY2BwQJAJ4tWMskC7CeDuuZCEC
 /EVtfHklmMu+yvN51pWlmMFr/gTEJQwCMwG5nreovYQKFnufDlg/IpYNwITNMiFf3QY+
 ehYem83L2HVxqnArqEWpTtjRz5SzUmF5zKcdOtQgZb67iiDB/hWmlLs2wEvhUepmNFMb
 cXZAzgb/8v+AWWOX66UHcTRdqE7w4c+e/y1Wx9jkonDkPPah6RBEzO1ZWIq8FPTMnuOM
 q8fVoCweUEzuN5SFVxfXSRFMXU0WwoB8qnoYvl90eaoInVCiT6IQK9QQ/O3gTW3jGBta
 VBFQ==
X-Gm-Message-State: AOAM531qIB7nK2fPU/mK1QDeMDiTixehHVE0JmSl4UxXDKnJhqOaKpOL
 hFFY7MdKZyGZoQBVo5F85dLs1tvL/NooEg==
X-Google-Smtp-Source: ABdhPJwpr4qhedCZAof5FbNy79hJrBqAZoAdxgEnGqy1kwzigsho/kbzk060hqEBoh8tl8klaH5BSA==
X-Received: by 2002:a17:906:1e94:b0:6cc:4382:f12e with SMTP id
 e20-20020a1709061e9400b006cc4382f12emr29692520ejj.482.1651128832762; 
 Wed, 27 Apr 2022 23:53:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] qemu-options: Limit the -enable-kvm option to the
 targets that support it
Date: Thu, 28 Apr 2022 08:53:35 +0200
Message-Id: <20220428065335.189795-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

There is no need to present the user with -enable-kvm if there
is no support for KVM on the corresponding target.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220427134906.348118-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index bc196808ae..5f69b94b8e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4176,7 +4176,9 @@ SRST
 ERST
 
 DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
-    "-enable-kvm     enable KVM full virtualization support\n", QEMU_ARCH_ALL)
+    "-enable-kvm     enable KVM full virtualization support\n",
+    QEMU_ARCH_ARM | QEMU_ARCH_I386 | QEMU_ARCH_MIPS | QEMU_ARCH_PPC |
+    QEMU_ARCH_RISCV | QEMU_ARCH_S390X)
 SRST
 ``-enable-kvm``
     Enable KVM full virtualization support. This option is only
-- 
2.35.1


