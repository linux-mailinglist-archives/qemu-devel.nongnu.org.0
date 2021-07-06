Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122473BCA7C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:46:15 +0200 (CEST)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iak-0001vu-2m
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu9-0001gf-Rw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:13 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu8-0002XA-2k
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id n33so5670098wms.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2y9vFZOp8T0joOImIgGzNfZmpLp7ynkcqgEs8ar2hNQ=;
 b=TZby2+Dc+/6EClHJWh0R9vb7UsFJccFg6FHk3pByFffrHDgTLAmnsQpvclFXXWhjVS
 sNaPbAbAw+xNlaALx5ll00sytdLnzmauZIrYjZfgqklXUj8Mg/eHVRPIXQNUffcbHQ59
 4oWkvItBtQ+9cg+iO0zpQhiMgykRiw/cmLN3TH1Si8SQYxt5vlbe4bLdtW+emq7zvswL
 QrBnp+fJyCTSuDbmGoTA5Qc9TEH98z26DSGkFnSTCD5kPPplIUc7WfO2iexIJtOr6svI
 G3hD8edSUQ1MzBekzEzDe5Gq1Hafpkjf49HBSqL2iBW3dYDYZ/zlwrvNpj4wwfCISWYa
 8tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2y9vFZOp8T0joOImIgGzNfZmpLp7ynkcqgEs8ar2hNQ=;
 b=d63NyZj52yCfPx9YgKp3rhdweGmJ25OfclHMMaq++Zcuf2jmwq1WKo+4QWJxvtv9+2
 hnzxdt66INWHr9iJCVH4WvzKKSCGWDTdxh/oSl2Zb6sFWKO4YxMgwtZTI3fTbmrA3CIr
 L9l+Kz2byaX6Mf89CQRac2++cPP1ltZJz/xCO8vdB6e+LPl93rg9CuSow5Fynt5KIdli
 a5dN0Sgl6HT07/rheO0Vs0dlMAGyA2jF73sv3z97Q6osJDjhlVa/A/Eg5aWVhYMGyhs7
 IDn3+zTHeH4iICT4V5ZBdvQNLaEssVKcajUWmPpn8ZW0ma+9qa0dbjimNWj6tEGT6BTE
 3bKQ==
X-Gm-Message-State: AOAM532T5ENefNWQJvDyLZsAr99yYuoJd8WWSGjZms9Wp5+dTxtEYLdL
 7QmLW5Exm1rkj2ZAFO/ldm3F5YT0Yaw=
X-Google-Smtp-Source: ABdhPJx/rDJBYZecOtWFd4OTTjjLQIsHX+uP7Jd92UdIWmYbTrqtT0EYVshFU0nUrEZqUpwhrcNlfA==
X-Received: by 2002:a7b:ca4e:: with SMTP id m14mr3814153wml.93.1625565730363; 
 Tue, 06 Jul 2021 03:02:10 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.09 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/40] config-host.mak: remove unused compiler-related lines
Date: Tue,  6 Jul 2021 12:01:41 +0200
Message-Id: <20210706100141.303960-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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
index 8b61fdb4be..7e12de01be 100644
--- a/meson.build
+++ b/meson.build
@@ -2765,7 +2765,6 @@ if targetos == 'windows'
     summary_info += {'Windows SDK':   config_host['WIN_SDK']}
   endif
 endif
-summary_info += {'ARFLAGS':           config_host['ARFLAGS']}
 summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
                                                + ['-O' + get_option('optimization')]
                                                + (get_option('debug') ? ['-g'] : []))}
-- 
2.31.1


