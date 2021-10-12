Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2042ACFC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 21:07:52 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maN7t-0001dS-BM
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 15:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maN4E-0007x9-Kr
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 15:04:02 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maN4C-0008K7-TT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 15:04:02 -0400
Received: by mail-pf1-x434.google.com with SMTP id y7so353055pfg.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 12:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VcDx9mPLBLKzbtBiQddrJF6FQjwU+l4Uk1BlO7a6MwQ=;
 b=j7ZMyx6k2+5Rhr8aZUaQW13hLmMVZHyP/9o5wQN26YZymYE7WixhO9Db1e5VuCFupP
 0ydYoStnN8R/BsL76o+UknSCKNn+NAR7cJfCYjHG6kwsOv0XuZpjVe8T0tNc5I841eyp
 0QKVcMm1Le3cmqsvRGcYbWmOJB+734rng/bi0LVqE6BjqE1BZ59bChaNs0rUujVDmyES
 eRswIkzfgyfTJZWhEYxjAXI3SivWoXhXPJZGhpSZ1+ijuzQurwQOJI/O9dyHc4iQ6nSx
 ZmFI/bs2KqAXlItYLakXItIakU7nct/SAJZXQuIVdRIiMSTGOjzPtaw30vR14EmAWHZO
 JxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VcDx9mPLBLKzbtBiQddrJF6FQjwU+l4Uk1BlO7a6MwQ=;
 b=Vkk7X7f6pmOt6PsVWLG/gmkXpsiWpRcRrv3EpOpg476w8PukiEA+hn0BtPkib7bJCD
 b/KPpEmsHCImaEGjgmGSIDB/umMiu0VJNtlxoL9TAutdwUTDvV1ei6WnAJt5zXa76Uds
 YB1Jp7c85PG27RxRQ5kwr9TJ/l4Pa36tppzwRkIkDwTm6pck+gsZdZvOvZABX4f+As86
 AfpEQr3qPOFTyrhLekRWnC8+Muwsb0GkmizrcKY5BWGof8CSGS89YnrMNxmIdICSLbYb
 yF987PVIj0smx0dvT8dj425iofTxHs/nRpl8rexoOp78oTNhWk7yrm+cCVqnaaAE1dSz
 Skuw==
X-Gm-Message-State: AOAM5325qOHUvmLOdhyQougRYUGE7Llwg3AlSBpeOaRXQYVdqPIV9kWp
 czY2TnXEwZZX2N4fwSwNu9rZWGkkPf7iGg==
X-Google-Smtp-Source: ABdhPJyjYwuJgbjqowJyzx+w83HM2vk9sC11mv1tlMGlexwV/csOjH1bZ1EhbGdjt1B99HiU1/4R/Q==
X-Received: by 2002:a62:7688:0:b0:44d:186d:c4bd with SMTP id
 r130-20020a627688000000b0044d186dc4bdmr14538630pfc.71.1634065439268; 
 Tue, 12 Oct 2021 12:03:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o12sm11899783pgn.33.2021.10.12.12.03.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 12:03:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] target/hppa update
Date: Tue, 12 Oct 2021 12:03:56 -0700
Message-Id: <20211012190357.528140-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

