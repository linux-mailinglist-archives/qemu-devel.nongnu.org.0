Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F47557C53
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:58:12 +0200 (CEST)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4MPS-0001L6-6y
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o4MMk-0000Ap-2d
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:55:22 -0400
Received: from esa14.hc2706-39.iphmx.com ([216.71.140.199]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o4MMh-0007hs-KL
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:55:21 -0400
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 225061284
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kPNS8qxzCDVcQhsWe+B6t+e8xCrEfRIJ4+MujC+fZmUNrF6WrkVUy
 DAeXjiEbKqLZTbxeNkjOo62oE9TsZ6EztJiHAdr+S00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LiW1rlV
 e7a+KUzBnf0g1aYDUpJs8pvmDs31BglkGpF1rCWTakjUG72zhH5PrpGTU2CByKQrr1vIwKPb
 72rIIdVX4/u10xF5tuNyt4Xe6CRK1LYFVHmZnF+AsBOjvXez8CbP2lS2Pc0MC9qZzu1c99Zi
 8xwn6fpaD8QGILDoOkFbkABLj8lIvgTkFPHCSDXXc27ykTHdz713awrAh9ne4If/elzDCdF8
 vlwxDIlNEjSwbLrhujiG68y16zPL+GyVG8bknhk3TfVF94sXNbOT7iiCdpwhm1t3p4XR6aCD
 yYfQSZPMEv9QUYRAVtNUMk9sfnri2XzaQQN/Tp5ooJyuQA/1jdZybXoLZ/Zd8KHQe1TmUCXo
 H+A+H72aiz2L/SawDuBt2uy36rBw3K9V4UVG7m1sPVthTV/21AuNfHfbnPjydHRt6J0c483x
 5A8ksb2kZUPyQ==
IronPort-HdrOrdr: A9a23:eYFXfq9Ze6B6+YScKORuk+ACI+orL9Y04lQ7vn2ZhyYlFvBw8P
 re5sjzsCWftN9/YgBHpTntAtjjfZq+z+8P3WBuB8baYOCOggLBR/AA0WKL+V3d8kbFh4lgPM
 lbAs1DIey1J3RByejB3CmEP+AJ/OSnmZrY+Ns2DE0AceipUcxdBstCZDpzancGPDWuzKBXda
 ah2g==
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 08:55:12 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 b2-20020a0cb3c2000000b004703a79581dso13502147qvf.1
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6g+CHctbKDq0rrReMS5PtJdAKseL7Gn/6RVysn7YOQ=;
 b=E/Xyd4jJuYCjXgE7dQEyfJXGiDImkf1etn2aTBoj0EgTSSq7ZgSUaG6OIr5KTKEdVa
 dkXNizIkr1033Qrk5iWdy+nwf87ya6XS61FMXHQ75CVdYexSD0modcJivvUWeWXf/PEX
 Hbz0C+sC+gKxmp0RqzUDER1aYjod5cNBTITIAbdFoTKT4DZG5/kqAYPd/3dQVW4JcYER
 thal6xYkJSyfJUArMJPs9hYe5/ctRm9tr1OJygRnzhvL59Hy1VYRkvZqgab8kCu08gXp
 OlKiq0acer0H2Gcp902cmsS4NyM69phY3/mY3kNkxteJQLpIYsJYGcLroL6DIom/Y/hd
 zkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6g+CHctbKDq0rrReMS5PtJdAKseL7Gn/6RVysn7YOQ=;
 b=wtA+2vte5AwNyxJ/wKxYgozr0mq6+ZGrlmgo/A5QJb6ZuRtoshtHc928OSAt67Ws1Q
 M1pvS0SMWQgMnvyEKCF7bNfNYzcCJw+JmqPcUjzEoXUHLY/IS4w+PEUkaTZ+pgZnGjpk
 Aik/gOa7GMB7/vdnucdo5YLpQRx9fwMBrjSbmrah8dVGvy4Uy1aFOmEkcJNHuYhPCcU+
 7s/hCoCeoVhj0AVeBo0phkOWF7OhxvQAqoSg4DHMxgse7YLkCFzxpyEDaf0dQZLWFZXw
 4etPkzOUdkvkxWbdiAVfRv3i+kdxZHVVt5WhR8sbLuk0tLLpykcwiMW140xpXYoWjQyK
 vnjQ==
X-Gm-Message-State: AJIora+dhRwG5ztddNnW65i03x0XhlamXk51hgWavTRPVNREQVcq5TUb
 Es3ZDm0bfvh9c/SEtCavg582FWGmuF1kaqmzqJN/gw7fRvU6J0wtMqJQkWB+u1p0U/WvsCz0SG5
 248pu4D5vmWHHBN20X1rVCFsYu/5YNg==
X-Received: by 2002:a05:620a:2546:b0:6a7:a299:15cf with SMTP id
 s6-20020a05620a254600b006a7a29915cfmr6098634qko.28.1655988911410; 
 Thu, 23 Jun 2022 05:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOickmNp+wycna5fJ02/TYqqKDurPAk0/wc/+8hylJh/+h5KdwwDDX3deAojKfaJUy6D375Q==
X-Received: by 2002:a05:620a:2546:b0:6a7:a299:15cf with SMTP id
 s6-20020a05620a254600b006a7a29915cfmr6098608qko.28.1655988911117; 
 Thu, 23 Jun 2022 05:55:11 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 p12-20020ac8740c000000b003162a22f8f4sm2740138qtq.49.2022.06.23.05.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 05:55:10 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: [PATCH v2] fuzz: only use generic-fuzz targets on oss-fuzz
Date: Thu, 23 Jun 2022 08:55:05 -0400
Message-Id: <20220623125505.2137534-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.199; envelope-from=alxndr@bu.edu;
 helo=esa14.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The non-generic-fuzz targets often time-out, or run out of memory.
Additionally, they create unreproducible bug-reports. It is possible
that this is resulting in failing coverage-reports on OSS-Fuzz. In the
future, these test-cases should be fixed, or removed.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/build.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 98b56e0521..aaf485cb55 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/bash -e
 #
 # OSS-Fuzz build script. See:
 # https://google.github.io/oss-fuzz/getting-started/new-project-guide/#buildsh
@@ -105,7 +105,7 @@ do
     # to be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets
     # that are thin wrappers around this target that set the required
     # environment variables according to predefined configs.
-    if [ "$target" != "generic-fuzz" ]; then
+    if [[ $target == "generic-fuzz-"* ]]; then
         ln  $base_copy \
             "$DEST_DIR/qemu-fuzz-i386-target-$target"
     fi
-- 
2.27.0


