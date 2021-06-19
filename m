Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D880C3AD8D8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:16:07 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luX5C-0001N5-Ck
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luX2y-0007zT-I3
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:13:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luX2w-0002wU-Qz
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:13:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so7184141wma.0
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NhEmstI7voCbXCpgEx1K3WliyZy05W2Ya2u4C8S1nOw=;
 b=RZ1mHylWSzhRWt/BFjAqsE4BPosPYhXG/OGvairEjPsrmDToCsXO9LQjzisEskDIfH
 777mcBwTIZVq5PvD9juAAFmt3DiMuAiK1fhks9zmkCNZ+u93vMoQkB7/oJRe1/fbuHi3
 Cx9tzhRs5us7B5Ka9QxSGL0PssjFpvB8hu4068kPrBfg7WvCQWOoTC101fvoR/fn5gYc
 GHo2eMxh8qobw3rCtniJw8VuW29Acmn/Cw2A5S/mMAA2LrNVQu3VAFi2/oacPRvpFr3O
 /AMhokdL/V5/oO9HWbpGa3rAKaQ/igiVV620nCvf0juJmDCvG21faya5ZXWwJtbeSdUH
 1zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NhEmstI7voCbXCpgEx1K3WliyZy05W2Ya2u4C8S1nOw=;
 b=eDSQvSJDWY5rV/nb4hm+cqiVzjVp3H8YsIjApUFEE4R12mXM+BsKD4Lguog6VlH5pz
 u7mWYGPQUYG7o2uGZUtl2kdqzRO5sh3OBI99M8qnuxQ6vVdhxlpD5DeKoZ4fHchNKvWv
 AKF7VPRHV9uTaFtYhuNcrrkam6tZnWxPcp6YV2/nVsXJ4kvLlungMh9nstWpa3JyHWwG
 gAyQ2XeUxLrAWU3o3LdYyM6cmhH3d8jIxcTamt5/soE7+Yx7BU/465HUnGISElCob7Hf
 T8/RiPUJLreT9Bq6raa64gzt5WrL6O4fkWm6XcfAwvCdu5cIh9XhfUluDSj/27XsD3Pv
 9H+A==
X-Gm-Message-State: AOAM530UflPaj7bS1eqkWqsgiTMQhZIDhJOQwznTCTpC9diSF1Erp7Qq
 8nhIUMY/wTju4R4QYsVPvSJ0E/2opxVkBQ==
X-Google-Smtp-Source: ABdhPJy+XPMq3gBTD+ihJSK3WYererbPEKWsw4tT07SL6yI2yHnr0bvGFMvwH90wKGuII4MJOHtL7w==
X-Received: by 2002:a05:600c:358b:: with SMTP id
 p11mr15267504wmq.112.1624094024451; 
 Sat, 19 Jun 2021 02:13:44 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w8sm11799192wre.70.2021.06.19.02.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 02:13:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] coverity-scan: Remove lm32/unicore32 and add sysemu
 component
Date: Sat, 19 Jun 2021 11:13:40 +0200
Message-Id: <20210619091342.3660495-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 'sysemu' component for issues not related to TCG.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  coverity-scan: Remove lm32 / unicore32 targets=0D
  coverity-scan: Add 'sysemu' component=0D
=0D
 scripts/coverity-scan/COMPONENTS.md | 11 ++++-------=0D
 1 file changed, 4 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

