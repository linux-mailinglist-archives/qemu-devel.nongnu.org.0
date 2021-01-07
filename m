Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A2A2ECA34
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 06:41:08 +0100 (CET)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxO2k-00063g-Ma
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 00:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0U-0004Vk-Kk
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:46 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0Q-0007wk-TO
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:45 -0500
Received: by mail-pg1-x52c.google.com with SMTP id i7so4082129pgc.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 21:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhQZCZ6csUApkPeGsoLidE8TMWUYv82hNyDvRdEZaas=;
 b=PSqOlIamER0EiPsE7VkKtFInd3AnNG72tSGKCxuNQWCcBCTfBCPqpAzjtUWqfQVqtI
 kwz0qiHx4J9V8OEqDpZl26J7x3HJpFeyV8Zhb0wtWMHqBF5USgZZrIe56IhxLNswrMa2
 hhatQaK70wOeIFzkWgLlylEQM5O/rdqJIql/nHl8wTTMjEooo/sT/Ne/G198DUVc1NPK
 zHr8ZGsF2Eyvx2I+qoVEjcBt2S1BxysyQZcfKDgwqJ6aNaKxJzN++9vhwIDxWJFaXDXD
 p6hpf+87TmAoV83+sEZ4LUQqcX9KLF6ndw9p2AAtHZqrmkKwnBauB7shTM8TQ0P/h19t
 9p2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhQZCZ6csUApkPeGsoLidE8TMWUYv82hNyDvRdEZaas=;
 b=buir5IAm6WzWoJQ9qr8e6mex9mJiBA0WQbFrzS/lguPAkXPOlLRjc44DEk2jnLk6r2
 UWCwAmxLVeOZoSbvxiyF6+Kg7Ud2Y7dNBXeuwLnDzwYEsBLys+OEFMHxtz3BtuFqS+Ta
 JWy9D+1ulaD0vTiFeulCHKktpvpZA5rNLIwAOH4zc909vjm72BIxwarIHiaPd38Vhf5W
 J+eQIfhZc3P3nVKdXjx+eIKtEE3EPDejE4VqVkTM6wNAJDGxWv2f/qkX2hz+XVtPjbIl
 k3FT3vBaepg2LEICsMsHOe9x6BfQ1pxiPvWXC7I0mR1XECs+38Ye/0O24ASw7SoqHPja
 EhfA==
X-Gm-Message-State: AOAM530EdsSqxZ8/bpMezxC0BrHMUB86oYwVc4bHvO4C5demDVDeCx8T
 ukxaHVteaYDrFZUJTCGvSxGv2voaRCh88utS
X-Google-Smtp-Source: ABdhPJxM1dKmO5pgeRjNBBp3f+GK5mpZEfDMflXaNb9m53GjETctSfaveMOEx8dDMeKdMm55DyT7Kw==
X-Received: by 2002:a63:4d1:: with SMTP id 200mr182367pge.362.1609997919545;
 Wed, 06 Jan 2021 21:38:39 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id y6sm7660091pjl.0.2021.01.06.21.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 21:38:38 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Fixes whpx build and improve Windows host CI
Date: Wed,  6 Jan 2021 21:38:21 -0800
Message-Id: <20210107053825.2010-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exit powershell with $LastExitCode so that the CI=0D
would report the build/testing failure=0D
Fixes include of whp-dispatch.h=0D
Cache msys2 mingw with a proper fingerprint so=0D
that only when msys2 packages are changed need=0D
trigger the re-populate the cache=0D
=0D
Yonggang Luo (4):=0D
  cirrus/msys2: Exit powershell with $LastExitCode=0D
  cirrus/msys2: Cache msys2 mingw in a better way.=0D
  whpx: Fixes include of whp-dispatch.h in whpx.h=0D
  maintainers: Add me as Windows Hosted Continuous Integration=0D
    maintainer=0D
=0D
 .cirrus.yml           | 119 +++++++++++++++++++++++++-----------------=0D
 MAINTAINERS           |   6 +++=0D
 include/sysemu/whpx.h |   2 +-=0D
 3 files changed, 77 insertions(+), 50 deletions(-)=0D
=0D
-- =0D
2.29.2.windows.3=0D
=0D

