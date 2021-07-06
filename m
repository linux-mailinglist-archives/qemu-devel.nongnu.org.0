Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C08A3BC72A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:31:03 +0200 (CEST)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fXq-00070H-AF
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0fW4-0005cP-Vm
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:29:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0fW3-0001e1-AV
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:29:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id n9so7486956wrs.13
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 00:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fa5m9n/it7FC7n8zwS3va9usjvvjRz5euyw1rHoYrFo=;
 b=VcuoP0w43uFWyEmWEDcPGNp0Nym/SaFEwm/oUD7prUTpwbaFziSahCJhK/kbft83YM
 RbngBKddveuJ4ecrfHcu98OXAJdT/LcwsMVRKerikZ2vwsHjxvlHvqBsey8YW1i/+QfD
 GfwpL5lRiU2hT0wP+QBWSFJhROXs29RaDTKuSk3pyYqVPdeI1vY17/pxx0PrrUGNHSIB
 niKvVcJHPsOeOrk6r6ZxYAT15N7eWLeA4RNdoMGF+qXR4FF5LU6AvuCQyNzsF8Y1e0Md
 Sji5jKKUEVYd+KWZNOIjZn0DxdjhlTDojhZm2c2ajlxZYPDk6jAkw8PbF/maOXvSGihb
 8znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fa5m9n/it7FC7n8zwS3va9usjvvjRz5euyw1rHoYrFo=;
 b=YBGLBTv5dCPci0olergMGLkZhuHhS6HQT4R3FEMbRo+mcAQFVmIFe+oEOBvn+U1pWF
 b/gIu3XsgenlDT3jLeuJaD7253QSicLJ2E0preGVgIqJhAUVD6azTu7RHJEM9EtvGbA8
 ES2iBZZxMRfEAFk1pTfxkr47PFh1tO+cgJ7uUS+0Amkojx8EIt17/o33AWFZhwrqeRvs
 dqeFtd6nDSdv6trJwt9G3qc5Fh9MItuqa8TxJzQfv0RPHxYSw48pPWo+YvBK4DiFxSpz
 8+qj33Yv/T08Rbt/9RYOKDtovOv/oUajr7gwGe9Go02crEk1n6ecErAxV79IBzyOWQ9W
 rWTQ==
X-Gm-Message-State: AOAM532lXXgRIATfDM1kqb9sDbekk9Q0PRPQoQI4D4Q6O5z4k3Kht8Ol
 rummI2jULiDMdXgxxTPoRoAwcQDHRVI=
X-Google-Smtp-Source: ABdhPJy5TaoL1RHNCs52OLGsQtl+lk4hmdtfRT6+NDirUkRJkTRHB1KI26kJakwhteUvia4BowSbnQ==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr13426260wrt.79.1625556549253; 
 Tue, 06 Jul 2021 00:29:09 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 c10sm14290467wmb.40.2021.07.06.00.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 00:29:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] config-host.mak: remove unused compiler-related lines
Date: Tue,  6 Jul 2021 09:29:07 +0200
Message-Id: <20210706072907.296061-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the build is not done via Makefiles, therefore the toolchain
variables are mostly unused.  They are still used by tests/tcg
and pc-bios/roms, but most of them are not needed there.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 10 ----------
 meson.build |  1 -
 2 files changed, 11 deletions(-)

diff --git a/configure b/configure
index 0e487ae091..650d9c0735 100755
--- a/configure
+++ b/configure
@@ -521,9 +521,6 @@ query_pkg_config() {
 pkg_config=query_pkg_config
 sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 
-# If the user hasn't specified ARFLAGS, default to 'rv', just as make does.
-ARFLAGS="${ARFLAGS-rv}"
-
 # default flags for all hosts
 # We use -fwrapv to tell the compiler that we require a C dialect where
 # left shift of signed integers is well defined and has the expected
@@ -4917,19 +4914,12 @@ echo "HOST_CC=$host_cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
   echo "CONFIG_IASL=$iasl" >> $config_host_mak
 fi
-echo "CXX=$cxx" >> $config_host_mak
-echo "OBJCC=$objcc" >> $config_host_mak
 echo "AR=$ar" >> $config_host_mak
-echo "ARFLAGS=$ARFLAGS" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
 echo "CPP=$cpp" >> $config_host_mak
 echo "OBJCOPY=$objcopy" >> $config_host_mak
 echo "LD=$ld" >> $config_host_mak
-echo "RANLIB=$ranlib" >> $config_host_mak
-echo "NM=$nm" >> $config_host_mak
-echo "PKG_CONFIG=$pkg_config_exe" >> $config_host_mak
-echo "WINDRES=$windres" >> $config_host_mak
 echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 1651496800..63411c5402 100644
--- a/meson.build
+++ b/meson.build
@@ -2760,7 +2760,6 @@ if targetos == 'windows'
     summary_info += {'Windows SDK':   config_host['WIN_SDK']}
   endif
 endif
-summary_info += {'ARFLAGS':           config_host['ARFLAGS']}
 summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
                                                + ['-O' + get_option('optimization')]
                                                + (get_option('debug') ? ['-g'] : []))}
-- 
2.31.1


