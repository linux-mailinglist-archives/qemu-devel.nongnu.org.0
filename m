Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0837337161
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:30:48 +0100 (CET)
Received: from localhost ([::1]:45350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJWh-0006HL-Pa
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lKJVl-0005iy-UK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:29:49 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lKJVk-0007cc-9E
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:29:49 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso8921194pjd.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 03:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A41kWYltpDY6eM576EZ3FC+XpdBKieovcD1kSeZwwdA=;
 b=Mt2azFxtaJQJuiOGDskf93E0g+htPNzTAQQpNkyRqvyQGD89xO4I2RMqZZW0aRKpPM
 YOOnK0yWRZWS0LXk1k9i07lJ5TDxr+OkgiE1r/jxLNdaYgSGOstUrCI4gWPfMUrfeIcm
 coWY6r2ZdWSu8KORXINUtdZ56eR9otuWS/Ycy8qMwgIVIQj2jhQJXFoWYmhP64ltObHD
 B8U9PWO5SKA7zRQ53avBHDJJ7qeddNYsyB1qa0pxnWWN8rKp7B9zcruTyRMyHAxucxYu
 rY82GWp5ukb47MXUmMEsGfnGMqOT/JV4SDfMWzZliQ0mGnglYszQAKnHnzZJYAr6idux
 0SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A41kWYltpDY6eM576EZ3FC+XpdBKieovcD1kSeZwwdA=;
 b=nHniKvHh5lUc3wKYqmPKjGrM2ZakwPOE3HyUlB2p1mk0wRT1/kyVcQE+DRQjRi8KF0
 G1VlhR5ayOwGKJgpdASTZK9lSvOjly4rfl/M3lTlHnK1b8xhGClfR9x/do+T3tQOQhAv
 Q9XEK6eaELRPg8osbXfo3jihVv9xk5R0HXCG8p+OM11vH+U5SmC9UWvvVk24wTiU9im1
 6Iw8RoCQS8l4yMptKqd9X/1djXI4YZi72lg2mpxHLcdbW71DYwqRdj+Tc5ztfJ4384l0
 z6LM1hj2nouXmcKKiThmdhRgVMZhy81xIAWYjdVw8pFtdWecfCRZSgHaos9jSx+l/xTr
 RIWA==
X-Gm-Message-State: AOAM531DjX0NcyOGxafo3Hk7byruBvH1VmVzFMl7PjKWigsYSlWPWLJU
 H22kqsKpqmKFALG2jDMZcmE=
X-Google-Smtp-Source: ABdhPJw1WQAQQaI/i1fd1G3Zt+H9SrPCzr2qGw2TO/8PzUqsyzZZMeNIGaQhEYlDeHH9lPcbjAfoYw==
X-Received: by 2002:a17:90a:778a:: with SMTP id
 v10mr8363357pjk.229.1615462186191; 
 Thu, 11 Mar 2021 03:29:46 -0800 (PST)
Received: from localhost.localdomain ([101.95.133.222])
 by smtp.gmail.com with ESMTPSA id a144sm2292043pfd.200.2021.03.11.03.29.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 03:29:45 -0800 (PST)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: mst@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: replace Huawei's email to personal one
Date: Thu, 11 Mar 2021 19:29:04 +0800
Message-Id: <1615462144-10864-1-git-send-email-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=gengdongjiu1@gmail.com; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gengdongjiu1@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to conveniently receive email, replace the Huawei
email address with my personal one.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e04ae21..823b98b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1711,7 +1711,7 @@ F: tests/qtest/acpi-utils.[hc]
 F: tests/data/acpi/
 
 ACPI/HEST/GHES
-R: Dongjiu Geng <gengdongjiu@huawei.com>
+R: Dongjiu Geng <gengdongjiu1@gmail.com>
 R: Xiang Zheng <zhengxiang9@huawei.com>
 L: qemu-arm@nongnu.org
 S: Maintained
-- 
2.7.4


