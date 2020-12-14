Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D92DA168
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:24:43 +0100 (CET)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouOg-0001IC-80
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kouNk-0000Tv-M5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:23:44 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kouNi-0006dZ-3n
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:23:44 -0500
Received: by mail-pj1-x102b.google.com with SMTP id z12so7002759pjn.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0WuH8TqiJA40G8DCzmQLw+nViHVVO8sxjmSX+Vtmrc=;
 b=N2yxVIdkuEAZcJCtd7c3I1Rhux/UjFq0foQrVsp8NLD4jacmFZpqwMfhTWvQtIX5uP
 jcUoQQRuFciU3+gWF2sle66M3EX6SkpTGcBPV7+EawVfGmWurAIP246qOgXlFiiiBQpD
 aYc9C9Wqt5JEgo8a7vomGn26cjZYLcBe16V/xeOuL+z+A/+YLS5wLfxtyiLHk10j6gbt
 l7niGScr3D+Mp9quLMgY4pBGtsFZhI6mXqY8WYSpRHMQGrdnowehBqPqHv6oSJ8r9np7
 26XAKU6QZOmxGqQXjzB7vU6bLhB+/VBCOCsOLWNJKtu5EoBkibuECXJQ30tjd0jfPc/j
 N7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0WuH8TqiJA40G8DCzmQLw+nViHVVO8sxjmSX+Vtmrc=;
 b=tHhBrgBOC1v+52mMr+9Agp79f9JuCG2FQJVizxyYF9rR/sfXUAz08jeYHdZg4iTf0g
 jWNd5OunYxPrBLXtdwbixH3IhmpoKqjmb+8dKTGqFdnOy32sDsEmR4KdJZlH5D3YQj8o
 g0o9c96a5P6mh3ngm32EV3mEivGXfE21JXzp0JFFv6hM807D39QMKGYHfiKrrlM4JUaO
 ZYhpWhJWJcU63pAqooyaaROhfvL3EsM43KxkytjEPgLf35Y85BXKEa+jUQdtg/GDNneO
 jydXlOuwOYwvT+cwKEz2eMi+KgNVqDj1mEkuqEINoZRpBNo5yf15h3aTLcpdqIcDLnGr
 LRcA==
X-Gm-Message-State: AOAM530aNwBKA7vF7LzLClq/1dVTKwVu1xVQyitQM0RaNAq5fSZAJePm
 WN2x+P9WqWIYLe41O12rFoS/S9V/h9NLwBZWjQKnXpVXu5gJlF+SN9u3aIz3FSpdhU8mW3mbTe3
 /kEzhbcP5IUrM+ekThfp+aHuFZDp/KbtAi4UumoMg4+nYmzX3jhXTt2dpv+k5V5bNKh6h3EjsQw
 ==
X-Google-Smtp-Source: ABdhPJyz1aZhPRwzvcrYh84euEN+K2t1JQ2xkiQmKRL8qIIJnSSZG41d1qAJ1T/xij1KwCCgYkIB2Q==
X-Received: by 2002:a17:90a:4892:: with SMTP id
 b18mr16265104pjh.64.1607977420445; 
 Mon, 14 Dec 2020 12:23:40 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a141sm20927524pfa.189.2020.12.14.12.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 12:23:39 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: add FEAT_TLBIOS and FEAT_TLBIRANGE support
Date: Mon, 14 Dec 2020 13:23:26 -0700
Message-Id: <20201214202329.26765-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=rebecca@nuviainc.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for FEAT_TLBIOS and FEAT_TLBIRANGE, both of
which are mandatory in ARMv8.4.

Rebecca Cran (3):
  target/arm: add FEAT_TLBIOS support
  target/arm: add FEAT_TLBIRANGE support
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      |  24 ++
 include/exec/exec-all.h |  39 +++
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 303 ++++++++++++++++++++
 4 files changed, 367 insertions(+)

-- 
2.26.2


