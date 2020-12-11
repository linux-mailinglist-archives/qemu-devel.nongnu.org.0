Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F912D6F8A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 06:16:10 +0100 (CET)
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knamn-0006vS-H1
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 00:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1knal1-0005kM-LZ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 00:14:19 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1knakz-0001ND-Tm
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 00:14:19 -0500
Received: by mail-pf1-x442.google.com with SMTP id t7so6270419pfh.7
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 21:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UaxLf7QzKdVC+N1wa9FrLAEQc0bQmmFlHnbZtgEBUlg=;
 b=pNnqh8SD3Ny9u93nANbd2LCrkdlTfEGsMESGe7Ria3iPwgiKurYcd9iF/L9CgjhliI
 igosTW+/+EKkpckoQ09MMsFOo0jSRuSonRvyKL37rECenb0epDecigpgeJLp/zdVwT6m
 iJxcU4pvPkwa+xcPY3MULFR8ezUdnDedsrjrthFXZEldk/dqylpQOIO69ZX69IuJ380D
 myErsj5WIXMBK+R+PgY2gzTKyRQE/3tIXaOUXyDz6sLB0gs3AoLTXjy8OchwR6f6dUoP
 I4WwiK5B0W7Jn/5wwA6PE7/eQFIagz8Il5JOLQ11QwmhvtvJW7Vsxkqdpcb85F/Ymw3o
 8/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UaxLf7QzKdVC+N1wa9FrLAEQc0bQmmFlHnbZtgEBUlg=;
 b=asSudhfifPSm1QpKU9xc4iW09qjpkrnjVLdzyDZ2BFw1DZSnTiyTM2DI4itah5U73O
 5VCaqTur8pLpzclXVrVvh65aRAL/jrlc8i3rW2XHLvl5oRmRSmxitOLhFor4CRrIC0WZ
 WN2LLVNc4vqXGDmbWf7om7fBQffwPjSrUVS0Wgx/MVvWMOSQZ+9ifmRB5DLgh2Sj5yJs
 zbjK54sXFfWQsGyzUw5uqbjWJ34IsHuDcRS6046N56ZW3ZEWV3/To9ScWHAao45/KtL2
 wYaTBptPb1/gry/E2IsJpxXKTySW3hE5pIZ923zTQwMXoLdOR4vpoG98gPE88MtdwhNS
 1ZqA==
X-Gm-Message-State: AOAM5315H/xA8RHX10c8SYQq/H9Mqlw+VP7WO73vZL8zMWf1S3MgZAgq
 NwyeKIbjv1mUfwVylO9bnkH9A7VcxvJCFc/Cu9J7TCr9YEd/P5dNauualZMQlhNS5SN4qQ26Ijy
 snvfKmBb0UwJRZ5ezdOUFmqX+jmzbh0AUUnno5nC3fHkjWzCGFNCzhdEfNFc9pI5p9bJzigvRVg
 ==
X-Google-Smtp-Source: ABdhPJxuN3+9bZhgjcBw8DFBuYObwVtl2tnbKDLJxGQUuF7mKYSQLdDB5ONFbcD+ngD90lX6heRaYA==
X-Received: by 2002:a62:1749:0:b029:19d:960c:1bb8 with SMTP id
 70-20020a6217490000b029019d960c1bb8mr10214251pfx.63.1607663655071; 
 Thu, 10 Dec 2020 21:14:15 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h8sm8293554pfk.71.2020.12.10.21.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 21:14:14 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Add support for DIT (Data Independent Timing)
Date: Thu, 10 Dec 2020 22:13:57 -0700
Message-Id: <20201211051359.3231-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=rebecca@nuviainc.com; helo=mail-pf1-x442.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for DIT (Data Independent Timing), and then
enables it for the "max" aarch64 CPU type.

Rebecca Cran (2):
  target/arm: add support for FEAT_DIT, Data Independent Timing
  target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for "max" AA64
    CPU

 target/arm/cpu.h           | 20 +++++++++++++-
 target/arm/cpu64.c         |  5 ++++
 target/arm/helper.c        | 28 +++++++++++++++++++-
 target/arm/internals.h     |  6 +++++
 target/arm/translate-a64.c | 14 ++++++++++
 5 files changed, 71 insertions(+), 2 deletions(-)

-- 
2.26.2


