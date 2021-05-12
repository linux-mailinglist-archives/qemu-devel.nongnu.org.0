Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14CB37D397
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:37:37 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtjl-0005BE-1V
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWQ-0005zb-RP
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:23:50 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:39873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWO-0005nw-6q
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:23:50 -0400
Received: by mail-il1-x136.google.com with SMTP id o9so15821926ilh.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ChjRyYgxYB/o6Ut2yXtF+G8QdpZUARwNHpLx2DM8b0s=;
 b=w9kOJFH+sLQ9Fz0gUYLM6tZlFHx5jZNtYVqiQlOjysTOInC8zHbrfJI4w+Z2Nr9A+q
 4HWXNGTH6zD9qNtVNBUI1b14wN5z0HSOiDEnNz841EIHUexUcCJ3J9DkKqAg0SaoUC3I
 8vToIZt8h5pIQU5rQ6mippwsaAmbiu4+I4WNCKf4/wfthDlrTOpOSbY4d4av/Ur5U6eE
 vpvEfQI1tHRZ38J/Doi3bCYY9hypq/eOQhWaOoLAH1CIsTzYtDC/xyHFkogS9hfhffNo
 cFh4bAncMudcSt/fz6df6uymqxVTrbycmGFOos5prR+8UjDbZdnKi5n+UvUMTq9389vG
 nbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ChjRyYgxYB/o6Ut2yXtF+G8QdpZUARwNHpLx2DM8b0s=;
 b=r24fKIHecmo8F6Y/pj1Dmsh4UoNtRnkiIsd5EIUC14UrmgIJKfvt1raq0cxrSAsiNP
 MkUb6H1hxhNmdPwK8OXNlZoNcKUlniMVvFegsDkR6ymyaixVRRgml39xejvcPxAfZXHb
 3AOC0BfBsGVK6pObMUoJLVKdHKu7S6HgrUTpToQhGBndx+Z2BDZ4+Lduogi2B0jjkVnw
 6zWJBMKK7NOfw/PoIFr22FL1BPtCQrQNZ2mPqbOL5YCHRdGzBbSEbFgtGqt2f7dkrn35
 zpCdymD+0PleQIJGcgZr41oIaLsvQX1m5BMTQ0nps2aPKPlTujojn2ix0AhbxiO/bw9K
 smTQ==
X-Gm-Message-State: AOAM532a/y8URiFhyVBc6agvca/BpAPixRW8sxQbJaHrEXtVdBtaqstx
 RAS0Exq85oWhnF1CCefs6MJs4ZUP/GTcJIKFxx3g1Z3YNs3o/y9JaN17vpsxk4S/aJJaZ0SsqB+
 HAV7B/bgohEaIERvuZWOeyxikuNW6/X3n04SZfqHUiAVSv5hZD9Jnb9pbRz53ZSkh56S+pKCLAQ
 ==
X-Google-Smtp-Source: ABdhPJw72r1BYYgG97q28mWhxo6XzIXcfSKGk+zgJweM0n1oHX2xTibtvg/IHJ9nQTpv5qOsZxVx5g==
X-Received: by 2002:a05:6e02:1a86:: with SMTP id
 k6mr778263ilv.253.1620843826043; 
 Wed, 12 May 2021 11:23:46 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d16sm247484ilo.12.2021.05.12.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 11:23:45 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 0/3] target/arm: add support for FEAT_TLBIRANGE and
 FEAT_TLBIOS
Date: Wed, 12 May 2021 12:23:34 -0600
Message-Id: <20210512182337.18563-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x136.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Testing: booted Linux 5.12. Ran "make test" and checkpatch.pl.

Changes from v8 to v9:

Dropped patch 1/4, because Richard's 
'accel/tcg: Add tlb_flush interface for a range of pages'
patch replaces it.

Fixed page_shift calculation.

Added do_rvae_write and vae2_tlbmask functions.

Moved RVAE*OS entries from the tlbios to tlbirange table.

Rebecca Cran (3):
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 target/arm/cpu.h    |  10 +
 target/arm/cpu64.c  |   1 +
 target/arm/helper.c | 324 ++++++++++++++++++++
 3 files changed, 335 insertions(+)

-- 
2.26.2


