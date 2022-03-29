Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384044EAEFB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:02:59 +0200 (CEST)
Received: from localhost ([::1]:58182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCQz-000691-Qm
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:02:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZCOg-0004GY-PH
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:00:34 -0400
Received: from [2a00:1450:4864:20::52a] (port=35738
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZCOe-0001bT-6X
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:00:33 -0400
Received: by mail-ed1-x52a.google.com with SMTP id g22so9729670edz.2
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IiY0bcbgRf5PWc/j9msKHP6ovlumpPa5rJr6jYzkEa0=;
 b=aH5epNbQd1JxRmXVLtR8+yKAI2Bb0MqIFZhkOspc6jXtUBhF3oNUNHrb2qRb2p2VCt
 4cSOK8JGfv3eeldGFF5Ekc69D9O4KRSgAjrCrZehSROaJGEWfKLzh1HvseX0SQ7UPtu7
 /Dp4mWybM2owS2som74SCPLKqj1WyZZShifHSNWfSTETn5R/toXrMTBKzLlWb04EKl7K
 67+3nMxULJeK09vpyC00ksl8oqSQVvvmkmP2vZZKw3cp/G7u7hrGBBXRTjUG8eS6urgp
 x+/KplQfv99OROVM5kjkkK/LLbDdUuUZfvaPHu9B5jZWYoOROi+9oNPPY2bLIyM1bFOf
 E6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=IiY0bcbgRf5PWc/j9msKHP6ovlumpPa5rJr6jYzkEa0=;
 b=13mZOEfHzw/mN40R3xY4b5iERF5+rbHl6XkVboDe0r/j+F+bJ+ZrTCXDsLap5pi6Nj
 1FIQ07tRTUPB9Enk9EiZSf8FG6Zr8Sud7hp7TKGcePwkpEfv4/V1j8Bw7TYeuQ1WCCjS
 Wg1nUzGq+LO56wT+ZHg3xM8lypLTommrASTOkvb+De6t9xlvH/83YoG4LIqppu8hWnz4
 TMInup/d05Fr4/ZpnpAREKrkOnmENve1r0bgPjYHOLKm5SR3c8ACWAJQvxJ+ccASIHEp
 5gSIGZgnRyJy2TVUvSqA7WvlpzgMlZeJOmvOIpOXwyc4K+5rvN3XlBlYDw2RBuvJzBEj
 h28g==
X-Gm-Message-State: AOAM532guB5bdZJj9wAvjI+U0THky/ppYGV5OSqWt0Gjcpk1WeFW21ao
 s8jutN1aCNYB9Piv0fZ10aRFqLT23Mc=
X-Google-Smtp-Source: ABdhPJy5iKVGlapw4WK065qplKhHVf7+UJo5kcCWCLm5kpSZfTGT11VlaHgbec+mc/GPnV2CJXKlsw==
X-Received: by 2002:a50:fd94:0:b0:419:9ed:e870 with SMTP id
 o20-20020a50fd94000000b0041909ede870mr4778633edt.207.1648562430653; 
 Tue, 29 Mar 2022 07:00:30 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b006a625c583b9sm7117506ejd.155.2022.03.29.07.00.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 07:00:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Build bugfixes for QEMU 7.0, 2022-03-29
Date: Tue, 29 Mar 2022 16:00:25 +0200
Message-Id: <20220329140027.869953-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f345abe36527a8b575482bb5a0616f43952bf1f4:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-03-25 10:14:47 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 36e38426ff40c9ba86d4e66027f3a98747890623:

  tests/tcg: really fix path to target configuration (2022-03-29 15:58:39 +0200)

----------------------------------------------------------------
Build bugfixes.

----------------------------------------------------------------
Paolo Bonzini (2):
      virtio: fix --enable-vhost-user build on non-Linux
      tests/tcg: really fix path to target configuration

 hw/virtio/meson.build     | 4 ++--
 tests/tcg/Makefile.target | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)
-- 
2.35.1


