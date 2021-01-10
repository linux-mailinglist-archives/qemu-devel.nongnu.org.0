Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD922F050C
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:13:24 +0100 (CET)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyS6U-0005Zo-Fi
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wataash@wataash.com>)
 id 1kyS4A-00050C-8C
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:10:58 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wataash@wataash.com>)
 id 1kyS46-0002Df-WF
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:10:58 -0500
Received: by mail-pg1-x533.google.com with SMTP id c132so10361307pga.3
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 20:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wataash-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5rIQNK3HO2rD9QhjzaGbn76ifLeP4TgjsM8bsIwurwg=;
 b=GGlu3xjTbFobAhG4GlHEXvVWH/exD9GRA1g2SvdasQVP0j9/J7AY+4X7sH37MeBkAn
 PzDlQnCUuqKatGrQVCpf9ZlT2Si0kn6D527qHGpdpbVTybJjX3lVcXClj+qElLL2+A0n
 TSysykT48FY01syu1iNfghfETY8JueXlVLALKo/e4w+sRT9wvmvtEXZJVRX7iDXHSPQ9
 iDZ8GdEVNicIGNNwao+8oFpxbT4sf77R1jQefNhur1TKIXe1d7UnFXsHM7qenjZQaydR
 FTfcOUgKcv2qDcLWkiShWqHnxfQuWtxrthrbnckJVpuw54AKumA0t4N25NQ65UzwKLXP
 OD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5rIQNK3HO2rD9QhjzaGbn76ifLeP4TgjsM8bsIwurwg=;
 b=nXaSVS8Y3yw9x/KKEMZQBaWQIQqg4ZniYOPQOgIeJc2ve6LhuRwFacePUQ+A1KtA1b
 JjHCiIj6D725xOLTPfPZsfAHLmcDJrU5qn9beTf3E0xuzUdn/bYf5VYBXKqFnm64uSZZ
 omCFd5wvtKnYbBsOZCkfsVn1p6bXHpxfYn8v2D3H1QTV7nnqI48mMygvgNpyMQbBDopf
 fIMLc21WshOlVkP396Pp5XA6gb8kVrMTrz3Dh1+QL4nL5dzdFmC2hNinY/pXcEWR1O0v
 KOyC9FWdrW6Ycq7x9de8iO2HE/2DfbfAtznAa5gK8+yrsWxz8yts2IUZC/6MmAHk/kVv
 mGgA==
X-Gm-Message-State: AOAM532oNmKM4lsOF9Kr2fiPqX2XJ3tB0XE+BWtTvYEEvn6PKA3LkKtv
 jZf9LgsfgKkIJrd0phMqS86pi9y7VBe7hvJK
X-Google-Smtp-Source: ABdhPJzlU58vK9t7iuvSk4xltICMnpYig/RqN4TCnIcSZYWxdJ4kicq/xRiughOUwLlB0zNbdZhM9Q==
X-Received: by 2002:a63:5d10:: with SMTP id r16mr13992386pgb.406.1610251851941; 
 Sat, 09 Jan 2021 20:10:51 -0800 (PST)
Received: from wsh64.wl.iiji.jp ([2001:240:1bc:8005:d702:b3c:6709:2fcc])
 by smtp.gmail.com with ESMTPSA id j3sm12929755pjs.50.2021.01.09.20.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 20:10:51 -0800 (PST)
From: Wataru Ashihara <wataash@wataash.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Remove unused tcg_out_dupi_vec() stub
Date: Sun, 10 Jan 2021 13:10:39 +0900
Message-Id: <20210110041039.512225-1-wataash@wataash.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=wataash@wataash.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Wataru Ashihara <wataash@wataash.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the build with --enable-tcg-interpreter:

  clang -Ilibqemu-arm-softmmu.fa.p -I. -I.. -Itarget/arm -I../target/arm -I=
../dtc/libfdt -I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shade=
r -I/usr/include/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-g=
nu/glib-2.0/include -Xclang -fcolor-diagnostics -pipe -Wall -Winvalid-pch -=
Werror -std=3Dgnu99 -g -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -=
D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-st=
rings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-s=
tyle-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -W=
ignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion=
-to-defined -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift=
-negative-value -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautolo=
gical-type-limit-compare -fstack-protector-strong -isystem /home/wsh/qc/qem=
u/linux-headers -isystem linux-headers -iquote /home/wsh/qc/qemu/tcg/tci -i=
quote . -iquote /home/wsh/qc/qemu -iquote /home/wsh/qc/qemu/accel/tcg -iquo=
te /home/wsh/qc/qemu/include -iquote /home/wsh/qc/qemu/disas/libvixl -pthre=
ad -fPIC -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCON=
FIG_TARGET=3D"arm-softmmu-config-target.h"' '-DCONFIG_DEVICES=3D"arm-softmm=
u-config-devices.h"' -MD -MQ libqemu-arm-softmmu.fa.p/tcg_tcg.c.o -MF libqe=
mu-arm-softmmu.fa.p/tcg_tcg.c.o.d -o libqemu-arm-softmmu.fa.p/tcg_tcg.c.o -=
c ../tcg/tcg.c
  ../tcg/tcg.c:136:20: error: unused function 'tcg_out_dupi_vec' [-Werror,-=
Wunused-function]

Signed-off-by: Wataru Ashihara <wataash@wataash.com>
---
 tcg/tcg.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 472bf1755b..32df149b12 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -117,8 +117,6 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type=
, unsigned vece,
                             TCGReg dst, TCGReg src);
 static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg dst, TCGReg base, intptr_t offset);
-static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                             TCGReg dst, tcg_target_long arg);
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
                            unsigned vece, const TCGArg *args,
                            const int *const_args);
@@ -133,11 +131,6 @@ static inline bool tcg_out_dupm_vec(TCGContext *s, TCG=
Type type, unsigned vece,
 {
     g_assert_not_reached();
 }
-static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                                    TCGReg dst, tcg_target_long arg)
-{
-    g_assert_not_reached();
-}
 static inline void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned v=
ecl,
                                   unsigned vece, const TCGArg *args,
                                   const int *const_args)
--=20
2.25.1


