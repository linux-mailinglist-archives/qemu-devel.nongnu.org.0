Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4AA46C1CB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 18:31:05 +0100 (CET)
Received: from localhost ([::1]:39226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mueIz-0008Hl-2N
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 12:31:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mueDl-0001AD-Kz
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:25:41 -0500
Received: from [2a00:1450:4864:20::32a] (port=42691
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mueDg-0002sj-GL
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:25:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so30wmd.1
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 09:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MgyV4+NE4pw1IcspuQrj96xhlPFIsIyEDh71hiELwBc=;
 b=PRHhPm6m/oWvi2HCNFNcW8jP52dyV9yq/Iuyp7OJ3B7zsiQEO3sdCsq5LAjJI+WToK
 YigFf7BSOd7PHMLYs9lLvyBKJmTLUJYNKOcCkPgkMJVM67bqBjigTtwOtmkfdS5wO4M9
 SQRpA4TBNtCc1/aLU9nd5MmYC3PKf4re5bYTBU0I9tJ5AwYxi7PVMAi+z20PG8ZyEt/e
 IdQI9jS9NX3RNVXJdxFKFipytmTldhNNv3x69uWFpY9fR4vMsfRCq/+NDh0BFLEq8Vv1
 a8aypdbkyVznPqBmXcliU2Z8Vr1Y4HvWuMCYd8+ae4C/1K37251BgITUarEitU9734dp
 F04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MgyV4+NE4pw1IcspuQrj96xhlPFIsIyEDh71hiELwBc=;
 b=lcjA2UK3dTt7aiIYW9crVT5JhqRM8BYYFatV2rt6jGwMwiiGwDPRH6K/6AkrDsqYUI
 0vNs4cnWtFhyqBLQJFSUcCJNYjoKFS+UzkKqmw6pktLVbH2464E+WzmNnbarlx7OKTi6
 ZhfQPQjk536CO7s/9wC5dAw2WX7nrN1rHF7ucOw4R+bft28OwTqijE8l+Lh0UwVmwL/N
 R4O/f69hPcXM84W/YJeYQ0GzRgv4HUMlCfK2ULCZ8nc1tgkEmasxT17jt09PzzFFB2f7
 xJv4gb4eT88n+gKKJCVDKCO2etmQ4sMymiGiMEUFtFEvs4yFLNk+J7M/VvxmdMSxLegY
 pAkA==
X-Gm-Message-State: AOAM533H8GdZqd5l55k80w9zpOv+xddRxVQzJOM4/y3LvoVOHy81D84L
 zdFOX6W2Qk9cH8AhrWAhf+TQXeDYjrtU6w==
X-Google-Smtp-Source: ABdhPJzinzJazjgOn6SuCBWfwTHaNdd3ny34TWlLdTjFkVP+NSr1Wp/r/7155vOCkpENwkf52cQoCQ==
X-Received: by 2002:a05:600c:3b1b:: with SMTP id
 m27mr8802959wms.125.1638897935279; 
 Tue, 07 Dec 2021 09:25:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id bg34sm3556060wmb.47.2021.12.07.09.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 09:25:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.2 0/1] target-arm queue
Date: Tue,  7 Dec 2021 17:25:32 +0000
Message-Id: <20211207172533.1410205-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Last minute pullreq with one patch, fixing the GICv3 ICH_MISR_EL2.LRENP
calculation. I went back-and-forth on whether to put this in, but:
 * it's an effective regression from 6.1 (the bug itself has been
   present since before then, but it was previously masked by the
   other bug which we fixed in 9cee1efe92)
 * I just realized it could cause a screaming maintenance interrupt
   even for hypervisors like KVM that don't set LRENPIE

On the other hand this is very late and we haven't seen it be a
problem with any guest except Qualcomm's hypervisor. So if you want
to decide it's better not going in that's OK too.

Tested on the gitlab CI and with a local test of nested KVM.

-- PMM

The following changes since commit 7635eff97104242d618400e4b6746d0a5c97af82:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-06 11:18:06 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211207

for you to fetch changes up to 2958e5150dfa297dd5a51fe57a29156b8744f07f:

  gicv3: fix ICH_MISR's LRENP computation (2021-12-07 15:30:08 +0000)

----------------------------------------------------------------
target-arm queue:
 * Fix calculation of ICH_MISR_EL2.LRENP to avoid incorrect generation
   of maintenance interrupts

----------------------------------------------------------------
Damien Hedde (1):
      gicv3: fix ICH_MISR's LRENP computation

 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

