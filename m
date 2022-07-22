Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FAD57E50D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:08:04 +0200 (CEST)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEw8A-0007la-Tq
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5H-0002Ip-DW
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5A-0000fH-Fp
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658509495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ke5vqcgkudsqCwZBZaVUTP9XipH1T55BwyTUX5P4f4=;
 b=exwAPwFKalaOn40JjWCam0m8UTRkD+WFBvqNEyWiVpfM8fYY+eTrMOedjgfu3p1mHrU8PQ
 8WuelPA6tWFJOUiVRMH0v8YUKhMxgkJUJrCHSqFqYSoXSa/qlKpzTtqzZUNeVbfTMwEGep
 JAAFwXU3+C/+EfT2xKjbjqUhrT3bK6M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-yTAQHXa-M1iRvinUay5wlA-1; Fri, 22 Jul 2022 13:04:54 -0400
X-MC-Unique: yTAQHXa-M1iRvinUay5wlA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z20-20020a05640240d400b0043a82d9d65fso3200983edb.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ke5vqcgkudsqCwZBZaVUTP9XipH1T55BwyTUX5P4f4=;
 b=hdm/oweSyhxKIQQ0L3sAbwFL5Jse8Zs05J6XSjp1FdcAeZSGDDJHVDuBj9PrNZATYw
 DLjQrWIgt6AAbcRTqMIkdytEILnBfHMlbpLoQkajhm7vC1h6srRT7IoWB36fX75UQtrC
 89P/BZCVUFcCISTNKoeoxg5mlWgsgH0fr9Ye30eT9wtlZrtI8ICyu8EZIBoad4QhPEoo
 AmR9b5SisXMYbPnnlM1q+VaAPr4rp5f4qnPtQ68cxtq8dWalFnCU8hoOFfJrt2952/PK
 8X4b8wINTN1KbBNOlJmZmPJ5/SjGp5S3bV4yr7YJr0P1KsyCJXMKB+qTbHDvrQGUpKKh
 QJcQ==
X-Gm-Message-State: AJIora8JCqdHd4L1w68b613nX5AON58DjQRRlL7cilyXt4aUeSDRh6PQ
 3MaLg0JZLK9dQB4DSHOrjc5W10KYdbRjOu2JK7XyfCgfBQZ5vdtLuMlDfDou3IRQD/9gaJbJYA+
 JbHndLgFC1KZaUkWVOR1AmS0572PTSLGZkCsfcOM/QnMYtKuVe02g8iogR7X/PEz0xoo=
X-Received: by 2002:a05:6402:3553:b0:43a:dba8:9f65 with SMTP id
 f19-20020a056402355300b0043adba89f65mr784873edd.323.1658509493161; 
 Fri, 22 Jul 2022 10:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sGD3lUrF5ST8YAMdio7NvUg5OBdxXxAeZOn7+MYuzvSZRVfTb8DbT4gZ7qLrWoinPoWQYd+g==
X-Received: by 2002:a05:6402:3553:b0:43a:dba8:9f65 with SMTP id
 f19-20020a056402355300b0043adba89f65mr784852edd.323.1658509492926; 
 Fri, 22 Jul 2022 10:04:52 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a1709063e4300b0072b4e4cd346sm2190332eji.188.2022.07.22.10.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 10:04:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PULL 1/8] docs: Add caveats for Windows as the build platform
Date: Fri, 22 Jul 2022 19:04:42 +0200
Message-Id: <20220722170449.853222-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722170449.853222-1-pbonzini@redhat.com>
References: <20220722170449.853222-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Commit cf60ccc3306c ("cutils: Introduce bundle mechanism") introduced
a Python script to populate a bundle directory using os.symlink() to
point to the binaries in the pc-bios directory of the source tree.
Commit 882084a04ae9 ("datadir: Use bundle mechanism") removed previous
logic in pc-bios/meson.build to create a link/copy of pc-bios binaries
in the build tree so os.symlink() is the way to go.

However os.symlink() may fail [1] on Windows if an unprivileged Windows
user started the QEMU build process, which results in QEMU executables
generated in the build tree not able to load the default BIOS/firmware
images due to symbolic links not present in the bundle directory.

This commits updates the documentation by adding such caveats for users
who want to build QEMU on the Windows platform.

[1] https://docs.python.org/3/library/os.html#os.symlink

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220719135014.764981-1-bmeng.cn@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/build-platforms.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index ebde20f981..6b8496c430 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -94,8 +94,16 @@ not tested anymore, so it is recommended to use one of the latest versions of
 Windows instead.
 
 The project supports building QEMU with current versions of the MinGW
-toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
+toolchain, either hosted on Linux (Debian/Fedora) or via `MSYS2`_ on Windows.
+A more recent Windows version is always preferred as it is less likely to have
+problems with building via MSYS2. The building process of QEMU involves some
+Python scripts that call os.symlink() which needs special attention for the
+build process to successfully complete. On newer versions of Windows 10,
+unprivileged accounts can create symlinks if Developer Mode is enabled.
+When Developer Mode is not available/enabled, the SeCreateSymbolicLinkPrivilege
+privilege is required, or the process must be run as an administrator.
 
 .. _Homebrew: https://brew.sh/
 .. _MacPorts: https://www.macports.org/
+.. _MSYS2: https://www.msys2.org/
 .. _Repology: https://repology.org/
-- 
2.36.1



