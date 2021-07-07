Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8173BECC9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:06:00 +0200 (CEST)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Azn-0001il-9d
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1Aut-0006bd-Vl
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:00:56 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:34523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1Aun-00019m-I5
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:00:55 -0400
Received: by mail-qt1-x829.google.com with SMTP id v10so2559303qto.1
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=EIMGxg2wxgW1EoMFOFysPySr21ga+NmDiWpvIO/YeKk=;
 b=ZlV/nZfTg9QO7b1O4GlypERctDHU+AMy82rVVGSnqGlDSPSMcRUiFAmo0UrKxI3FfZ
 E1axdOjEfr6FKRxZpCx6j++FwPcle6x3CCkwrt4WgSmkLJCj9n1ztpBRAXNHkK1A7xrG
 mdbeTpLjysTcAEWjSbMQLRoSEWARyrZKSsDGyJ72cIEO3KEcyDUyt37uEHyXH+GAkddp
 wDH5E1m6WYHeGocxYJwYWjoPZ+JzDQrz4t7RAUvrFKceqoNu2zHm5AgMVl32o/+pvPEu
 /PiAg/Qt0cOg3EBqgijwPNpHl0HdBwWuE2uuF14tnVL6EKCPm4nf1uX96r0pcNWSOf/D
 /d/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=EIMGxg2wxgW1EoMFOFysPySr21ga+NmDiWpvIO/YeKk=;
 b=sljKl2ZzyGLI9S1lBK9tIDYmAuQ9a2H+tuikjWdPF5hGIXWoTLMrlfJrsm71v6lvJX
 bkfW2DQ7rifNTwcRWYYnwvt625kkcIUqrLwgrxFYPvrZsnzxaUiSOCvRoS7YvuMl2Jpm
 E4irx2Mwmsk2IUotMsKlYJXrZLPOnEYq86dkoZONDODPYnvnJyepnuQMwdkNEZ78t6GR
 U8fYBSA9AWQU7nAkb0s3d3x5Nd06xs33lyeo+Z/tZP8cY2o3BQVnqHRksbHzjY3ap+24
 4K5+5zmV3Pp/tP9A3iQI4COXbEAFeK1ZfT8khzPKduLGGG/2USmL/BdfaW/XtGZOxt/S
 w1/A==
X-Gm-Message-State: AOAM532fjufCCYGxZsIpUAaBeF5k8vSnbAxgzVZe1g6twoxmq9timF2o
 sydpcYcfqOoXWo6Nl07H6Fw=
X-Google-Smtp-Source: ABdhPJwbufj8ETxbEXJdadtS0/EF1HzG4fFHESYzEg39svn/UFbX/N9roGOrWQx58JWp7R8xjHEtIw==
X-Received: by 2002:ac8:5794:: with SMTP id v20mr1486675qta.17.1625677239592; 
 Wed, 07 Jul 2021 10:00:39 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id s6sm8714372qkc.125.2021.07.07.10.00.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Jul 2021 10:00:39 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Picture missing in About dialog on cocoa ui
Message-Id: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
Date: Wed, 7 Jul 2021 13:00:38 -0400
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, now that the code to add the icon to QEMU has been restored for =
Mac OS, I think it is time to revert patch =
e31746ecf8dd2f25f687c94ac14016a3ba5debfc. This patch was made to fix the =
missing icon in the About dialog but it doesn't seem to work any more. I =
do not see a picture in the About dialog on Mac OS 11.1. The easiest fix =
for this issue is to revert the mentioned patch. When I ran=20
'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' the picture in the =
About dialog appeared again.=

