Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B337C3C0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:25:16 +0200 (CEST)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqjb-0002Ug-7G
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgqh5-0007vr-HX
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgqh3-0002vc-O3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620832957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3CqjHDfMrbpPzIIdcxjg06rNpMuzVDondBMT6MtPPN4=;
 b=BB9xUpqTsgolymjL+ZIPN7EZq3bn3NmMGfjySDCNv4cLuBs6cDiABpOrMGfjT+IdWmFY3l
 rWFCqDNJGwDbzbP8XXzV28hdNM6BYNbOygzLBHiKpPJE6YZJ04Xk1guS1j8BpGj1y/sYyM
 HFws8epMI1LkneVWnCRB8ZVY1poqyHQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-NLGbeTTvPC2LyFMqHKyc4w-1; Wed, 12 May 2021 11:22:34 -0400
X-MC-Unique: NLGbeTTvPC2LyFMqHKyc4w-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so10175665wrm.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3CqjHDfMrbpPzIIdcxjg06rNpMuzVDondBMT6MtPPN4=;
 b=uXDBOlYGFogr5IohIaVC7GCPDRE6cC3nabZaTOXNVRnBieS8WzYfUrVXsQSY7a977/
 SiYzwqLrqMY4zE4FyADJpM7lsQ8s1OOqzj9NaWKDwLeePEBp0qnwtpqaB6UwnhELro6u
 6HcEgvmcwGqDHtrb9x8fH3hkBkG7KiWXlIqUKdmbuLLg8qHLRDw6rz+vPIwc0y3OUYMH
 dnJjAGYsVga/NS0BzZndxBlEC026RCOJqmm4+LxuN6FQfdTalJVOyj81qIPIBFU4ZjBe
 iRgyumuvk3uLQhZSqblIhAxx3gXRPseJhLJ6hUpjNEBcghr2+/th5GY0h4XYFHzkG9ol
 AfNQ==
X-Gm-Message-State: AOAM531LgvWzV4kK7RsCkau2DOxtgWn+ZsIMH8dHcJBqW2qDKMLov6jJ
 wy8cRurNYCoGD6cltunvuOEq1kHI6gZJZhojlatTmQcXe0uw06AbSJXDG4xvDpaG3gyqH9vIW1L
 Su7jPK/6WWj3+RkoAofbVxMVj32Yykdsayn0kJGRxDmftR2+0IjZc4Wu7bYaDJiXt
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr45956942wrs.264.1620832953062; 
 Wed, 12 May 2021 08:22:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnVGcQzmX6Q2ewjRXiovxONOaUbJYejEkDgBbr1tlr/+PznpL+hiG4TyU7AZjNA7W69Q/V/w==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr45956908wrs.264.1620832952813; 
 Wed, 12 May 2021 08:22:32 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u5sm30997936wrt.38.2021.05.12.08.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:22:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] travis-ci: Use clang-10 for the [s390x] Clang (disable-tcg)
 job
Date: Wed, 12 May 2021 17:22:31 +0200
Message-Id: <20210512152231.3423265-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Ubuntu Bionic 18.04 LTS clang binary points to the 6.0 version:

  $ clang --version
  clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)

However we can install clang-10 from the bionic-updates stream [*]
and use it, to silent the following warnings:

     CC      pc-bios/s390-ccw/main.o
  clang: warning: optimization flag '-fno-delete-null-pointer-checks' is not supported [-Wignored-optimization-argument]
  clang: warning: argument unused during compilation: '-msoft-float' [-Wunused-command-line-argument]
  /home/travis/build/qemu/qemu/pc-bios/s390-ccw/main.c:284:5: warning: no previous prototype for function 'main' [-Wmissing-prototypes]
  int main(void)
      ^
  1 warning generated.
  clang: warning: optimization flag '-fno-delete-null-pointer-checks' is not supported [-Wignored-optimization-argument]

[*] https://packages.ubuntu.com/bionic-updates/clang-10

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
However this doesn't resolve:

    /home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:18: error: invalid operand for instruction
        asm volatile("lghi 1,1\n\t"
                     ^
    <inline asm>:1:7: note: instantiated into assembly here
            lghi 1,1
                 ^
    /home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:29: error: invalid operand for instruction
        asm volatile("lghi 1,1\n\t"
                                ^
    <inline asm>:2:7: note: instantiated into assembly here
            diag 1,1,0x308
                 ^
    2 errors generated.
    Makefile:20: recipe for target 'jump2ipl.o' failed
    make[1]: *** [jump2ipl.o] Error 1

(see https://travis-ci.org/github/philmd/qemu/jobs/770920106#L1803,
https://travis-ci.org/github/philmd/qemu/jobs/770920522#L1818 for
more errors).
---
 .travis.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 4609240b5aa..9c0deea9a06 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -278,6 +278,7 @@ jobs:
       compiler: clang
       addons:
         apt_packages:
+          - clang-10
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
@@ -303,7 +304,7 @@ jobs:
       env:
         - TEST_CMD="make check-unit"
         - CONFIG="--disable-containers --disable-tcg --enable-kvm
-                  --disable-tools --host-cc=clang --cxx=clang++"
+                  --disable-tools --host-cc=clang-10 --cc=clang-10 --cxx=clang++-10"
         - UNRELIABLE=true
 
     # Release builds
-- 
2.26.3


