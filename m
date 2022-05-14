Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA18527217
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 16:38:38 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npsuj-0006u3-Hp
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 10:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1npst9-0006E1-I5
 for qemu-devel@nongnu.org; Sat, 14 May 2022 10:37:01 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1npst7-0001cP-Rh
 for qemu-devel@nongnu.org; Sat, 14 May 2022 10:36:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id bg25so6226548wmb.4
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/FtSYTROOWRpSOsaRTrCuQkEBmKCOcqsEZQHd7jKfwo=;
 b=KfWZpEq1nZhrMdmL9TlKaI3hWzHIiWFs1/NMpQLxoQEpPzzD81pwno/oH/QNN9DupK
 GBJu8uNfkAo/MQftATiM7fAKsYx013SOKjLla2C3PvNeTR2wUACMuKpGbaYAMQ9+vDlR
 MvX08M/4pAhIR6KkRhSWTymt4RnXx+PHbXUeNHG3KVcLYO2odt0RYJ6t6jHSNRVSo7ZO
 TCwQIIONegQIKj//JXGQ5qwhuTFToDTl5UNp6J2SbO3Jx9JnRHQRTgYvbqgJwp34a6uq
 +4H+3Sk3aO6ZIC2/2+lbm80btTQctmCU4IoqVtWaWOrlxsy/otWD2UJ3Gqw4q6mN5WMh
 Zmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/FtSYTROOWRpSOsaRTrCuQkEBmKCOcqsEZQHd7jKfwo=;
 b=ikHBiVyUYi6/6zt3GSQjv2ofF784mQx9UYwWMQfoUkAGJBi+MeTeD+q/giwSJBkEC3
 zUGubXDUQUvFJ0HHunuolXHoN1ZwXSuJ77+qgz7c+IU2D4ForUOgJ21q80ey78pj1phy
 8Ny+b/WYla83zDM6oHx2hTCICMgFFZ8bHd6DaYQNjRoVjpoxzuFvJlts6mJvaj29568y
 4h/7ZYNHq/eo+M2mJpKMaHAWJg1mcjI/t5FM/PrMunNgeHikCUsRKiSxv8wfsHb9JIcP
 kqTcYx1bD7DTHizXaqRtSmjvu1gRr4+hm6IuZiJGCWi+6NKtiPYHLNE4Wrop28g90zr8
 CUzw==
X-Gm-Message-State: AOAM531PJwc/OhZEwlAmRIEGGMLkEtyfriHr6P1Uglj/i3Bl6bf4ranF
 amgXaiotoQ+QFkJJUTdnDyM=
X-Google-Smtp-Source: ABdhPJzjU322cunyFdqMwDpGTTe6CHfSepWmROPtYmkocsE176l+nj6aPxEo0RXP2V42W4nngmXXMQ==
X-Received: by 2002:a05:600c:3b98:b0:394:6a82:8d59 with SMTP id
 n24-20020a05600c3b9800b003946a828d59mr19606484wms.126.1652539015873; 
 Sat, 14 May 2022 07:36:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c12-20020adfa30c000000b0020c5253d8f6sm5081026wrb.66.2022.05.14.07.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 07:36:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
	Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: [PATCH] linux-user/syscall.c: fix build without RLIMIT_RTTIME
Date: Sat, 14 May 2022 16:34:34 +0200
Message-Id: <20220514143434.2093641-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
1.2.0 and
https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
resulting in the following build failure since
https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:

../linux-user/syscall.c: In function 'target_to_host_resource':
../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
 1057 |         return RLIMIT_RTTIME;
      |                ^~~~~~~~~~~~~
      |                RLIMIT_NOFILE

Fixes:
 - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 linux-user/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dd0d92ba4e..6df78bedf5 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1024,6 +1024,10 @@ static inline abi_ulong host_to_target_rlim(rlim_t rlim)
 }
 #endif
 
+#ifndef RLIMIT_RTTIME
+#define RLIMIT_RTTIME 15
+#endif
+
 static inline int target_to_host_resource(int code)
 {
     switch (code) {
-- 
2.35.1


