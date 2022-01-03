Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD74830B6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:47:05 +0100 (CET)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Lnr-0007fL-Np
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4LmD-0006eZ-Jj; Mon, 03 Jan 2022 06:45:21 -0500
Received: from [2a00:1450:4864:20::432] (port=34813
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4LmC-0001zG-21; Mon, 03 Jan 2022 06:45:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id s1so69474089wrg.1;
 Mon, 03 Jan 2022 03:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:signed-off-by
 :content-transfer-encoding;
 bh=cNSMbHlmNjeM5+sPA0yyC6MacWj3jxqj27Hk3fj5de4=;
 b=ViknsBAm6UsAGqUYs0pG6KoerFx7OuiwfC+k8ZjeGdgMyOpOnsjovNvVC5JBMIqzp4
 JKqGPatYq3xYkWrtLE2AvxlzrqxZCEcFeZLnIsjkqLNqRMftDO8BW9kPeLHpPNPSM/eu
 gVFSPXq+RXIzie78rf5xNRvbO06NGWbNHuKGtv8xa4g2MdVHjRdKTUUBtphq0SFjcJML
 rXq/GDNwQo9fOM1hcA6UpNjVT+o/G49u8Nj4BQWsOqwrZNU6/+NHU1lhVpLXcFL9v/Hl
 S/xSeDq8CgAndinGG4h3KRk5ppbyOOlEBLGjiQZTYRMY4b+yXbu42A3cpArqY9RS4C5s
 Bokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :signed-off-by:content-transfer-encoding;
 bh=cNSMbHlmNjeM5+sPA0yyC6MacWj3jxqj27Hk3fj5de4=;
 b=8LCAunQIlaCLz0kSWTWWhl7YQNffUAgBPyAR/U8biBQyBHLT5k/Rgx8Na0n+sMNZFM
 4tCk7KDHx763DJY4uAiFenwBpP7H47tbBB1SRDfXtebUq4XdVCiSD6QLHusHv1x4Jiyx
 ZzuxPUnSBGaytxckz4gXV+k8DZeGYK/JG6vh61srgwdsrbNkmn0vawzZhpfT3TZ76n5Z
 fxt6GjF85AQG06dlFqiYxy/u3qLLmdok3TRUfp63Z98O4Q4mwPdvo71jn5QPHQuY3btv
 INrUxJsH0wnxgfJ42bGezTENjQD88mCObDMyedkcJ/ANGYFRZ8Gsf+He/EvOCzvWHhhs
 HBnA==
X-Gm-Message-State: AOAM530vNtn+8dGaUaTILxlk8PxNUtAQUTyFD2U/S3mD4WZX/ge+Jm9X
 9ueDzXtENtssf5cLc3i2lkyXBuPMdVY=
X-Google-Smtp-Source: ABdhPJxLcpy8ROQ3qBfXZGOtiPJY5ZsDSdkwb6iPxuHSvkYSmGBlh2Tg2PWbeVAaRCEyzpWFmy2OCw==
X-Received: by 2002:adf:f252:: with SMTP id b18mr39269447wrp.341.1641210318033; 
 Mon, 03 Jan 2022 03:45:18 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201]) by smtp.googlemail.com with ESMTPSA id
 g198sm38831631wme.23.2022.01.03.03.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:45:17 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Show/hide the menu bar in fullscreen on mouse
Date: Mon,  3 Jan 2022 11:45:14 +0000
Message-Id: <20220103114515.24020-1-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minor change to make fullscreen mode in the Cocoa UI a little more
convenient.

The menu bar is now made visible when the mouse is released (ungrabbed)
making it accessible without having to leave fullscreen mode. Grabbing
the mouse hides the menu.

Carwyn Ellis (1):
  ui/cocoa: show/hide menu in fullscreen on mouse ungrab/grab

 ui/cocoa.m | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.34.1


