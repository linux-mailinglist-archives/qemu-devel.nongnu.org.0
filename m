Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C98554BCE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 15:52:37 +0200 (CEST)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o40mZ-0006qY-DR
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 09:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o40i1-0004Ju-MA
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 09:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o40hy-0007UV-EY
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 09:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655905667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ky2M8q8JE1zNFbxjM0CoYfHSXzOhhM92RkJcPP6d2SU=;
 b=jS3K3ANhN8QP9jSkQ5SCrTrgzBWFsyqzRL4payBR/PvmW2XIX+kpMPhkJMYSmmXGjV0mQp
 V0Pdbfa6r/KlzAImz2aRV6QZfoPKxYBf4BuokB7CFBSq9Gjs3Y7pFvB/vXawcm7kbQDouS
 ZMOLznDwAFVHVb3pBSeg2kb7yHn2FLA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-iqZMznJRPuqnxC_hopNOQg-1; Wed, 22 Jun 2022 09:47:46 -0400
X-MC-Unique: iqZMznJRPuqnxC_hopNOQg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640235d400b0042dfc1c0e80so13343849edc.21
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 06:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ky2M8q8JE1zNFbxjM0CoYfHSXzOhhM92RkJcPP6d2SU=;
 b=Ftf3Er/3GSaBL1O4ppOBG2LbkVsmlLsXo9/GMJIabZwGyOfvXne5UH1P/7sEItE6BM
 hM2kbgk8DjUM1SpGVkbMIsdpkzmP2tokBNn0tEZp8aSD3Pn/v+zRORxFW2alJ71yGvz8
 51DBHUdC9/ZuFp7wrvtxdzE3chsN7oInzwnKd5vZoomR2wcoSCTc9ARQjFuRHKlCoT9Z
 k7taT9inZI5+d+vZdhcKglSk/5sXNywTuPYXsxdM/v9qk41FwsnelgBCO6MF0p4UiDIR
 JneIF+vJPkKRf19a0cXUUw+1f3+35/R9hQ6Nyv5VWaeQpw70ku+tsEJTb2aHCgjhFo9Y
 I5Dw==
X-Gm-Message-State: AJIora9R3kbQpEIY7Hg6EfaOqjollqDdN2/ag1jCvGO+OeB+Uk7scRwL
 UwYWerdLY/BIlHJOq/0Q5ZgzOlsDM3Hd8OpOhWOqtl5BIGU8gSfReDp3g2hdWVxlwEBpJiyx+fl
 L1egUci0UqOnlIyPBnpm3WbSp3WNr9C5zSN7zAbPIeE9M/Zhogki95FbhWzAybTdTXaQ=
X-Received: by 2002:a05:6402:1f0a:b0:435:6e0a:7aba with SMTP id
 b10-20020a0564021f0a00b004356e0a7abamr4352904edb.318.1655905664961; 
 Wed, 22 Jun 2022 06:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vluvnlQQraYGjChnQ/+WjujXEmEwalD6mBa9Gaql2SbnpjJHIAAPjG589YDiB3PN3GTKgwvA==
X-Received: by 2002:a05:6402:1f0a:b0:435:6e0a:7aba with SMTP id
 b10-20020a0564021f0a00b004356e0a7abamr4352878edb.318.1655905664625; 
 Wed, 22 Jun 2022 06:47:44 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 d5-20020a170906304500b0070f7d1c5a18sm9364104ejd.55.2022.06.22.06.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 06:47:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 alex.bennee@linaro.org
Subject: [PATCH 0/2] build: make tests/tcg compiler detection code more generic
Date: Wed, 22 Jun 2022 15:47:40 +0200
Message-Id: <20220622134742.139306-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Configure is trying to fall back on cross compilers for targets that
can have bi-arch or bi-endian toolchains, but there are many corner
cases where just checking the name can go wrong.  For example, the RHEL
ppc64le compiler is bi-arch and bi-endian, but multilibs are disabled.
Therefore it cannot be used to build 32-bit hosted binaries like the
linux-user TCG tests.

Trying the cross compiler first also does not work, and an example for
this is also ppc64le.  The powerpc64-linux-gnu-gcc binary from the
cross-gcc package is theoretically multilib-friendly, but it cannot
find the CRT files on a ppc64le host, because they are not in the .../le
multilib subdirectory.

This can be fixed by testing both the native compiler and the cross
compiler, and proceeding with the first one that works.  To do this,
move the compiler usability check from the tests/tcg snippet to inside
probe_target_compiler.

While at it, restrict it to just the user-mode emulation tests; if
a compiler is not able to build nostdlib freestanding binaries the
installation is broken.  This however detects a problem with some
system emulation tests that are using inttypes.h instead of stdint.h,
and not passing -ffreestanding to the compiler.  The first patch
fixes that.

Paolo

Based-on: <20220621075147.36297-1-pbonzini@redhat.com>


 configure                              | 166 +++++++++++++++----------
 tests/tcg/Makefile.target              |   1 +
 tests/tcg/aarch64/system/pauth-3.c     |   2 +-
 tests/tcg/aarch64/system/semiconsole.c |   2 +-
 tests/tcg/aarch64/system/semiheap.c    |   2 +-
 tests/tcg/multiarch/system/memory.c    |   2 +-
 6 files changed, 105 insertions(+), 70 deletions(-)

-- 
2.36.1


