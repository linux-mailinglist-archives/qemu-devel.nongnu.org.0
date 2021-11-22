Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457F7459514
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 19:49:57 +0100 (CET)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpEO3-0005pA-SQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 13:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpEIn-0001ht-5h
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:44:30 -0500
Received: from [2a00:1450:4864:20::436] (port=46972
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpEIk-000119-3Y
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:44:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id u1so34445482wru.13
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 10:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4PDKAov0eAJwmhl7SJWIk0PPWDUQdjaifK5Xy6DTrvo=;
 b=ol9Bq41EREqCUadJfLZop723+PChdX28C5Wrs3XRLQLHpT0esHOnIHmrsXOX6YDLx/
 i10ShC5VgnScPrHk03PEFxg58yPehuHJOxxd7t+CT5SFJDkgFYd7/godBI/fLDqU06Tf
 K+KRZi4ILee4Yl1IQvqhEeV/9bmMIGNGaX9cbU+yJ2mM3+V02OiYF81evwnM4Hb0SWEb
 BGTPJt/T/CwUU6KX4HuOmKDy7QJsDTjVjK4VQifqaad8Ydst4Mg+IBd7uP6OOTAAiGuQ
 zSjCZ931jshJLKKGJUaHt4Srtf8pvCMXnYQKH1nY/oYw7Z9ac+K+qiyDHTRaDYR5exy7
 yTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4PDKAov0eAJwmhl7SJWIk0PPWDUQdjaifK5Xy6DTrvo=;
 b=ltPh19i2JQLKhkkFnuyM2nw9VL6R9n2mYOIV6zjBQkKjSl5SQ8d/6Ko+lZjqQGZ4O5
 XRQFBFWWW4MQJzAVWSuQ+MK+0GB2u1l5gslkDyB/BsYMtYTW6fsPlM65Lz4J9y2tH1b5
 ivaQcR4FjvVbciX59+g6D+WrZrd8vJvGs2zd04+tZNQ8iuMw2qxlG96XRUqF9iXCr/8y
 BQ2e60tEN5BIqOsb7T0lgi4YL4hZ7ZoxrPP/mKf0WkJNN+cZsnhYbuhwgSYhkyggqQbr
 2hA9kwH5PSWcJSvfNJxxqIBkbPiXAIYmOojUsmQMvORl32UA5rXH+vFjVqAenrdrH9yW
 ZeHQ==
X-Gm-Message-State: AOAM532ec6P0wfFwuMegEuAIVlUGIPqZXEDYh5IKChln7l6Zup3SMfI7
 d5BIbmAbAmNTNjB8EAmbYhF+4JXCj4xx4A==
X-Google-Smtp-Source: ABdhPJyq14oIJQZUc0yCIw0RpBQKU0OnEx41GuSZ+md4X2+i3SgAdEyCP0JcO0WwXtOzQj3ZRz958w==
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr39972373wrx.298.1637606664461; 
 Mon, 22 Nov 2021 10:44:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i15sm26298163wmq.18.2021.11.22.10.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 10:44:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] target-arm queue
Date: Mon, 22 Nov 2021 18:44:21 +0000
Message-Id: <20211122184422.901437-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apologies for sending two pullreqs today; Eric's patch came in a
few hours after I sent the first one but it's definitely a
release-critical fix.

-- PMM

The following changes since commit 89d2f9e4c63799f7f03e9180c63b7dc45fc2a04a:

  Merge tag 'pull-target-arm-20211122' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2021-11-22 16:35:54 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211122-1

for you to fetch changes up to 33a0c404fb90a3fa8eea6ebf5c535fc7bc0b9912:

  hw/intc/arm_gicv3_its: Revert version increments in vmstate_its (2021-11-22 18:17:19 +0000)

----------------------------------------------------------------
target-arm queue:
 * drop spurious bump of ITS vmstate version fields

----------------------------------------------------------------
Eric Auger (1):
      hw/intc/arm_gicv3_its: Revert version increments in vmstate_its

 hw/intc/arm_gicv3_its_common.c | 2 --
 1 file changed, 2 deletions(-)

