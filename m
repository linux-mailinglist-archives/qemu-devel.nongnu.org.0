Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CB3706A6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:35:40 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcm2F-0005Nd-II
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxQ-0000Wu-LC
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxK-0005Vi-KX
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id i3so842679edt.1
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KgkCXkAddqdW7Wh/XOFFWw0iz7BQQdaoOkycqSMin3o=;
 b=iz5WRMqHR/1wD3+GmOJCUX81CwwEkLYGnr2qbwphW8oxEm0a/ATlIYQUPoAzELC2Hn
 dr+0CLPS98VARPrZoOp9xDQpCfKDYyxF0h+sIlZm9jT1iTf3KfNCYgjWQAawS3rj1cQZ
 AQ38HLgxhG9zj74ZgZk20+2cCKJkuPyzihyXiTghKFKzQONhkTOPV3dZ9rdU670U/7fw
 Fk++uTl0EJ/Md02rpbdGacvRPP3ZuDAPfChev6R7HU1Iv1a7Qz3TIxDImwAywUhZO6v6
 rnqxtel9G+x0cF/sDSQAFGy3YDUGYynqmR9+O11LKN5K6alBf1zIGZblhe/hrXp5wFkV
 R4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KgkCXkAddqdW7Wh/XOFFWw0iz7BQQdaoOkycqSMin3o=;
 b=r+QwPtaDHj5SSeUxBcPxf9GVFHR82Gffur7ppAIRRCqh28Pxzw1ZlYytoR4NPlRhxF
 Nk/zZFl637BOlkY/afvSg95RKopcnWhjqNrOeF9Z6liuMGzV/WebUrawTGxQjwASY4cv
 GajBg2hWEIqRCD+O0NL3HgoTZ4Ovr7Jp9hchaKt61ywg5DZRxLPIa48KGWolPPN3lJQU
 BTDFgdPAmpVnO6ZCWRl3cNTGm0FIKa721IBhlyUbKBq8aJFE9ATygJ3RB8CAfy/cf7n3
 5uc+wbQCXf2yAuqUChPjMZiBke2eJkDz3zpDp8TrZpf+hGqTxYeWaJ9DqxhDjSr++9PK
 PwdA==
X-Gm-Message-State: AOAM532RMWnqFYAOmctvvYBPb4gBa0+GpZNp0UPzZahOe0BsCRx8nL4n
 i+5s7ReMy9Be0DdbLnRGi6Ej8f1B2G8=
X-Google-Smtp-Source: ABdhPJw2YlzIR/TxF7JBB8Udr5S7Zcdb8cpJVgjsd+rnCBMqxJEk9bcRDVBYe/fQ6mbedO2Phr27mA==
X-Received: by 2002:a05:6402:17ef:: with SMTP id
 t15mr7747953edy.385.1619861433046; 
 Sat, 01 May 2021 02:30:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] Add NVMM Accelerator: add maintainers for NetBSD/NVMM
Date: Sat,  1 May 2021 11:30:21 +0200
Message-Id: <20210501093026.189429-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Reinoud Zandijk <reinoud@NetBSD.org>

Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>
Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>

Message-Id: <20210402202535.11550-5-reinoud@NetBSD.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c5..4341184fa3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -509,6 +509,15 @@ F: accel/stubs/hax-stub.c
 F: include/sysemu/hax.h
 F: target/i386/hax/
 
+Guest CPU Cores (NVMM)
+----------------------
+NetBSD Virtual Machine Monitor (NVMM) CPU support
+M: Kamil Rytarowski <kamil@netbsd.org>
+M: Reinoud Zandijk <reinoud@netbsd.org>
+S: Maintained
+F: include/sysemu/nvmm.h
+F: target/i386/nvmm/
+
 Hosts
 -----
 LINUX
@@ -529,6 +538,8 @@ F: include/qemu/*posix*.h
 
 NETBSD
 M: Kamil Rytarowski <kamil@netbsd.org>
+M: Reinoud Zandijk <reinoud@netbsd.org>
+M: Ryo ONODERA <ryoon@netbsd.org>
 S: Maintained
 K: ^Subject:.*(?i)NetBSD
 
-- 
2.31.1



