Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A1B42A9E2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:47:06 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKvh-0004BR-EO
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKfH-00055w-8V
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:30:08 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKfF-00086X-J4
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:30:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so39247pji.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VcDx9mPLBLKzbtBiQddrJF6FQjwU+l4Uk1BlO7a6MwQ=;
 b=RQbeyECZzig4KMgRCZAEgw/brRy67f9iepyN1r1nKB6ypMYhj7cUWd1BAW4E5FqFS2
 AudsnppN3a+k1y71XFrCYR86XxHOD8c+jqePU9cw/e5+nxGIbJtE3QAV9ozEUpkHTr+I
 bIo43pqW/p+W5echNE6AnCSfjY8DbJRaS1YBzfam8A5UbL3sgkKq6dht0gYn1RO4gpnG
 52+RfnEuR1R0Up/oF9D4KzS7+ioAItQkr/B9pvaPFGtrFKNS8TRcDgnZ6uueDAk3lhux
 tRMHN9p5rSaYcHVllpFsZfQmKj76sWxxaaugAZgzkXiL2eLwj7dLxppBzLPjNbtvznVb
 lJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VcDx9mPLBLKzbtBiQddrJF6FQjwU+l4Uk1BlO7a6MwQ=;
 b=T2LY6Vj4MP3btjLNIHfLszr6xwNAng4zTWA9+208NKNYpwU3SFbmTLiAj+wa6A9rPt
 4LAxGf0yhlltD8jCavNP046Rw/BEw3qwPFAACNIU7M9FjhJEbQt1TlVkT57zkIEYKwE8
 Doh4ZxsIJuvsP1FxbmwKPGUQHrYS78tfr7PJL5Bb4N7dlxwmPZ1kn5i1Nn7ePkOYj6dq
 PMGHF8+B0sxENhP0n4Y1BaCq4gAM/5Br37Cehi4DqUfwiY9nVIT36TsDD1metErE6AaW
 3jowOckYObGiP+6XFAVQcngRdTPuR1bnpgfoaDVxvlZWKOzm3OKOAX9ZBM+GdsFh1BbH
 ryLg==
X-Gm-Message-State: AOAM530qRuRf6pYGHy0g6IyG0hdSKWRgtRJ3blXYgl8TH0rj1r5QIK2F
 Uask0CP0nwipTE5Ka0/qyvJbd9mFEj+t2g==
X-Google-Smtp-Source: ABdhPJx+WT9illLvASnZr9EGSyeVPKTxngFWxhf7eL2PtBUnC7sXC6alAoGOfHsM5fK2h39cwwd/Bw==
X-Received: by 2002:a17:902:7243:b0:13f:505b:5710 with SMTP id
 c3-20020a170902724300b0013f505b5710mr5249290pll.36.1634056203157; 
 Tue, 12 Oct 2021 09:30:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s2sm2445555pfw.30.2021.10.12.09.30.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:30:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] target/hppa update
Date: Tue, 12 Oct 2021 09:30:00 -0700
Message-Id: <20211012163001.472654-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c09124dcb8401a0d635b4a52b295e9b3fc12392a:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2021-10-11 08:15:32 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-hppa-20211012

for you to fetch changes up to e770b8cf76083cc51497b854e73f0a9bb92d1bc7:

  pc-bios: Update hppa-firmware.img (2021-10-12 09:27:28 -0700)

----------------------------------------------------------------
seabios-hppa update

----------------------------------------------------------------
Helge Deller (1):
      pc-bios: Update hppa-firmware.img

 pc-bios/hppa-firmware.img | Bin 785696 -> 757144 bytes
 roms/seabios-hppa         |   2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

