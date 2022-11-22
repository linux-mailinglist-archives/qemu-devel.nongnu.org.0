Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DFA6341AF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWJg-0002Gl-Ih; Tue, 22 Nov 2022 11:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxWJT-0002Fb-NF
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:40:00 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxWJR-0003nK-Sb
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:39:59 -0500
Received: by mail-wr1-x42b.google.com with SMTP id x5so21514988wrt.7
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 08:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=oPTChmxPCRAQqkVSf0xboIxSLVuC6REza6heoRVaNkc=;
 b=cWENea8k8MPpLyh9eK5qIDeBBQeMn9dmyxKCJHBxk4BqRE8KkCYugLjSU6QVCpj9XG
 h8UybbjCJfb6CB9ZVEczvvibBRIHM8Dr2g1wYoWbqG9Uv7H5eQTTtPjKjfrH+XkXn1NY
 Sb/O9U3lglqy39XC6j2XDEZVphcd4kydmV4uvwc0/TndRJl9/KGrzNyt/40r2Su8pTc7
 +n3vybG1NaGPTy7Jo5g1jdEFBdZzdgQ05wxmnPTDpuhjKPNQbkZngdlRyIFQXfcM/+QY
 zBRjHawH6yYUVVRiVo1tRRTzVJLe0Vjbd5OcxHuKm9JnqQm685iq3lWbx0JIsf8zVTby
 tBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oPTChmxPCRAQqkVSf0xboIxSLVuC6REza6heoRVaNkc=;
 b=oEU1BkitUeSi5RNzKxv5aymfsqwPH0iC1omxK0RZiXBHXpteTXzSC/EkeUsfiKwse1
 TPc2YDfaWgm+mAw0IhrGkvo937rYEcxx62gGpN0uJ53Y4J8Y7gbTmv9duiRuFK8xvLT0
 0Sw1LnMM+HN6KtHb8rs5gFN5gQljBCQpCKh3SZfFHuhyHIlel/CFim9RAclmzoUqkH83
 md/LwZXd6GnuN1+doqrxvK5JE6OUE/mdU8VOMAqk9nu3qgGXX6WtNjxJr/B5s38M3geu
 tWaCIsjvNnZmNb6tqypZ8b1eatv+2L+ADEDPpNPgWIIfNm8NuP9z5dt+OTnLB8gZSqnn
 wdLw==
X-Gm-Message-State: ANoB5pmwdyxyx0mJlPXrUBtmlUTwcZ8n+8qP0TDmud37AsLfzSSu0DHC
 Ge92UPbbw+/hOSZasDFbYYsrbOvRvll7ZA==
X-Google-Smtp-Source: AA0mqf6N1HnRgF0qluMlcwFuoLido0GZOzl5wETqH9AAK6Q97BWtD4LYbIkKfLMCdCEUFb8VQARGkQ==
X-Received: by 2002:a05:6000:1cc:b0:241:a59b:ed46 with SMTP id
 t12-20020a05600001cc00b00241a59bed46mr3180976wrx.77.1669135196000; 
 Tue, 22 Nov 2022 08:39:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adff48a000000b002366ded5864sm14353585wro.116.2022.11.22.08.39.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 08:39:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] target-arm queue
Date: Tue, 22 Nov 2022 16:39:52 +0000
Message-Id: <20221122163954.1900093-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi; this pull request has a couple of fixes for bugs in
the Arm page-table-walk code, which arrived in the last
day or so.

I'm sending this out now in the hope it might just sneak
in before rc2 gets tagged, so the fixes can get more
testing time before the 7.2 release; but if they don't
make it then this should go into rc3.

thanks
-- PMM

The following changes since commit 6d71357a3b651ec9db126e4862b77e13165427f5:

  rtl8139: honor large send MSS value (2022-11-21 09:28:43 -0500)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221122

for you to fetch changes up to 15f8f4671afd22491ce99d28a296514717fead4f:

  target/arm: Use signed quantity to represent VMSAv8-64 translation level (2022-11-22 16:10:25 +0000)

----------------------------------------------------------------
target-arm:
 * Fix broken 5-level pagetable handling
 * Fix debug accesses when EL2 is present

----------------------------------------------------------------
Ard Biesheuvel (1):
      target/arm: Use signed quantity to represent VMSAv8-64 translation level

Peter Maydell (1):
      target/arm: Don't do two-stage lookup if stage 2 is disabled

 target/arm/ptw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

