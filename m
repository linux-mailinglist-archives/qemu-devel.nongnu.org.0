Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F724CAD8D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:29:08 +0100 (CET)
Received: from localhost ([::1]:33006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTim-0006Xq-2C
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS2-0006q6-5A
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:51 -0500
Received: from [2a00:1450:4864:20::42e] (port=39876
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS0-0008QG-Hn
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id ay10so4082019wrb.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5jubMeLfMS6DO/0PCPGI57Go6LtnBr0CArY5PUrgsRY=;
 b=DYxmc7F66McsdB3bU+RofhAlr0VVUoCVX4n4J63bnZ0Myhcy42Htfh/E4C2BsIoxNl
 Rt0WXEv4RyiRuycom735zdsmOPy2uD1M2EXJeJZfBUI2S5hXYIWceBEYRbqhB4rwUOmE
 xqSSaECE2QSLDLLu3RVFPow+DgBtsMictRT8l8OLD1Y9WQkiYfuCQ+SYAoNbQpkONWQH
 rnCyJVFEJ9a2yc/rrO/uozuMwDduK6s3XNFTs7kHXC8zUrG6VtYCf90BY9HrhBGDkGzc
 wfbnIv616hb1caURGM+nT2v6U+FLaeUOJaZKgzeACdJBV4MAdhIH3nuD1KwqhlZsbKwy
 moXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5jubMeLfMS6DO/0PCPGI57Go6LtnBr0CArY5PUrgsRY=;
 b=4xtERiWapQ/exJvteOxP/5vmfrvUTdwqTIRUwYScsEv3L+uHL1C03QQAQcvmPzJgVL
 Pxm8Ua0Wkh3Xu85MTsC0SDMcQv7hjiiiJ2uqA4hc4lFeLOpQ5M9Iv610Pc4w0GkQE/KF
 pHb1gvk42liuZtyx0Fyo+YhMnL4pSUJi9CfWZFSu+JWEddNErg6tHEAyZECC5wyqpAmY
 U+NsFMYCZG18o8tZoQp14ZsYa/oEdJ62IpNAYEI+uLOrYl+PyZJcAXfGHGoy6MGWBUsl
 afD1dhul/4ag/c58BCctId9nOdfawsxoifga2x4kX3KUVwppqJhSN/a1qvxL9CiI+89k
 UMrA==
X-Gm-Message-State: AOAM53061L4/306l1SB3/j2abbCFlXTS9Ita6a2ir/6lhhiKlwJWKrVX
 nv7IfygpzmMmuJf0zY+OxB1MpUnFyg4=
X-Google-Smtp-Source: ABdhPJyBVxbT0Z1VbkhkPp9ggOx9ge/DTe6BhImoSXfTsJquTPQqdctWEaiX7TFOZmzGenN8ztVDmA==
X-Received: by 2002:a5d:69d0:0:b0:1ef:747c:c1da with SMTP id
 s16-20020a5d69d0000000b001ef747cc1damr19203140wrw.713.1646244707274; 
 Wed, 02 Mar 2022 10:11:47 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] qga/vss: update informative message about MinGW
Date: Wed,  2 Mar 2022 19:11:29 +0100
Message-Id: <20220302181134.285107-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The headers are now all available in MinGW master branch.
(commit 13390dbbf885f and earlier) aiming for 10.0.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220222194008.610377-4-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/meson.build b/qga/meson.build
index 54f2da5b07..62472747f1 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -15,7 +15,7 @@ have_qga_vss = get_option('qga_vss') \
     If your Visual Studio installation doesn't have the VSS headers,
     Please download and install Microsoft VSS SDK:
     http://www.microsoft.com/en-us/download/details.aspx?id=23490
-    On POSIX-systems, MinGW doesn't yet provide working headers.
+    On POSIX-systems, MinGW should provide headers in >=10.0 releases.
     you can extract the SDK headers by:
     $ scripts/extract-vsssdk-headers setup.exe
     The headers are extracted in the directory 'inc/win2003'.
-- 
2.34.1



