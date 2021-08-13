Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DDD3EB620
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:40:31 +0200 (CEST)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEXQE-00066D-3z
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mEXND-0001Uw-Md
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:37:24 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mEXNB-0002di-62
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:37:22 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 203-20020a1c00d40000b02902e6a4e244e4so6938206wma.4
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L6+yrcmctR6p5RhQYBYsVC+QE+I7a8mkrgU7+1bEQAw=;
 b=RVZggyAwtPeR3VR31VuMOqXeZ0QUyNCXUuzNHXC+zo9HKu85T3BB/3MekMjNu3a8mn
 9BydMyz402dB1cubBt2ZJ88Wxh72N2Pvw7WbvWk1rEaykFbKoOcbHAJm53/tav8QYlCD
 7+O6v4vMoJ+hB91JKQ+DHR3+XLO6rUTro+hl/W9kDYQzcfuLNgiI4vAO1jWr4CJlpECf
 g8A0034Bu2N7pLKmwbhaV8x7mpYmGs8+0HnnSAXw/3WQ1hWS40k8EQWMc8ebXEOqghD9
 tAsbs6NbBttW5/QdotpLLiz/hEQmGXbwPnmVy30JMeB4T94eo4lDg2nVvRJ2Mz4rJ96T
 FLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=L6+yrcmctR6p5RhQYBYsVC+QE+I7a8mkrgU7+1bEQAw=;
 b=KPoj8gq9sNffsxWFsejz6cHuKaBg9dO5b2cx2wj6kUDLHxvHJLnrdsXbWUDrxF+T07
 NstURt/LpmYwiStT2/6OGClY6hOCQcMYsz9fvWMZE5qTmgwhJI0MhfcCjKqb4oi4T1Fs
 LMuWgj1lDPY4cjUru8a0IvMjJbYnf4PPbQ0m4RxOkN2lD7stYPDM88xwo/tSI3rkCyrI
 2MCt0KLJbGFf5CilUUCGD0bvayiFW76KsMBiMCakUyuuLDRPahfonQejScjCpwbcLXVU
 NltufkrxnH4PYJg1WqavCRIMK1btkDju6yurA5F4V/QD7bl3+wzCD5CP4XnQ1qKlO/eU
 z4Bg==
X-Gm-Message-State: AOAM531Emc9T3BFjqZyziXGh8tG11LJlGGsc6yKkPC5G1PaYEA5looVn
 ZEa0VPXy7kzjKWdb9P4qj/zhzIfD/I53yw==
X-Google-Smtp-Source: ABdhPJyer0OOMsUaqfHV37kYGMmLW0pa+69mHMvbADAy8HrbOwl9cmOtZG4P/VkYDStBihqFUOEeDQ==
X-Received: by 2002:a05:600c:218b:: with SMTP id
 e11mr2800718wme.185.1628861838502; 
 Fri, 13 Aug 2021 06:37:18 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm1413671wmc.19.2021.08.13.06.37.17 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:37:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] i386, machine patches for QEMU 6.1-rc4
Date: Fri, 13 Aug 2021 15:37:13 +0200
Message-Id: <20210813133716.289058-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:

  Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to ea0aa1752ca88f7856cbf40eef0db62f90f28dcd:

  hw/core: fix error checking in smp_parse (2021-08-13 14:43:42 +0200)

This is what is in my queue.  The first patch is the one that is
most important, though all three are regressions.

----------------------------------------------------------------
Fixes for -smp, and for x86 TCG on Windows.

----------------------------------------------------------------
Daniel P. Berrangé (1):
      hw/core: fix error checking in smp_parse

Lara Lazier (1):
      target/i386: Fixed size of constant for Windows

Philippe Mathieu-Daudé (1):
      hw/core: Add missing return on error

 hw/core/machine.c                    | 3 ++-
 target/i386/tcg/sysemu/misc_helper.c | 2 +-
 target/i386/tcg/sysemu/svm_helper.c  | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)
-- 
2.31.1


