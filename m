Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20557D1D3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:44:35 +0200 (CEST)
Received: from localhost ([::1]:46772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZHu-0003SX-S6
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAE-00072r-SQ
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAA-0007g0-Kg
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ke5vqcgkudsqCwZBZaVUTP9XipH1T55BwyTUX5P4f4=;
 b=GnbM2NY7Gc3N/S5sTiaWj9LqwCxdDSMPSr5vp85njUUnuSejGvIXg2Pcy15UV2K7CdnxRn
 l3MxROSsunVvqK0MmqKoxmEZM9DQjCuhFK/DVmOy3j7TuoVXSCBLP0xzSfuA2J9cwY9G7l
 gYMkVdQISjfmRs8Vt1w+ddSMYfbRZp0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-Jk_H96WhPjS-A5GaUGClFw-1; Thu, 21 Jul 2022 12:36:26 -0400
X-MC-Unique: Jk_H96WhPjS-A5GaUGClFw-1
Received: by mail-ed1-f70.google.com with SMTP id
 w13-20020a05640234cd00b0043a991fb3f3so1440533edc.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ke5vqcgkudsqCwZBZaVUTP9XipH1T55BwyTUX5P4f4=;
 b=xSml7wcySEMSMsMfjdAr1YgJW48ec1gQDjZLut5dcHle+g8ENRodqiOtzaR3AJ6G5i
 L+2SJyliBSnb8V9B7GI5NFY+BmmT3cUxrFikB3ctfpwSXiNPUDy3qiX+vhSVhQKTNs+h
 TPusQ3SND/d0RsQEDakkmBYbia3PwKVoJl9nV4thcVfhP3tBicJqGuTEdLObqPP4rhxV
 Y/Ii7+OGjLcC3yLOiJbkmWYWG9i5wGkp3a0xVUpqaCIiaKiLJOvERM97c6rjAxrgfEnw
 hIq211FGwRAE/jIblVpjllEzdtvhluB9SvsU9Ft4ben1U0PYNVGBCMjZUxo/3mF2Bio5
 yHrQ==
X-Gm-Message-State: AJIora/U12pmoVeqo+YpD/BjPDoI1YJ2OPb91n8K4vqMtQOQgitaPWYL
 DW0CjLLr1+0fJFtWDMkuFqxvho6zrs8U/H/KTb6bTIyvUMUtEFaDYocZpblx4pL7ay6i4Z7iJnF
 9TnRT0Bj8L/+IXo7hNChHq8NZxwHILaVb3ev+EUt+FZiwM6EDmHZGIbGqr4rnGSS1Jns=
X-Received: by 2002:a05:6402:3681:b0:43a:7c29:466a with SMTP id
 ej1-20020a056402368100b0043a7c29466amr57623796edb.367.1658421385042; 
 Thu, 21 Jul 2022 09:36:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vrR67aaERgCV8K/IGg/kMVVYfDc281Z+cW6giJ0r3R76zzpBw9oVw4vRKK4CbabOVwm5Li7A==
X-Received: by 2002:a05:6402:3681:b0:43a:7c29:466a with SMTP id
 ej1-20020a056402368100b0043a7c29466amr57623758edb.367.1658421384739; 
 Thu, 21 Jul 2022 09:36:24 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b00722e50dab2csm1017972ejh.109.2022.07.21.09.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PULL 1/9] docs: Add caveats for Windows as the build platform
Date: Thu, 21 Jul 2022 18:36:13 +0200
Message-Id: <20220721163621.761513-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721163621.761513-1-pbonzini@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



