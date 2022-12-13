Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAFF64B403
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 12:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p53Hv-0004G8-Tx; Tue, 13 Dec 2022 06:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hf-0004EJ-Uo
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:17 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hc-0002Lr-Bq
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:13 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so7686433wms.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 03:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LRz/PChng4kYvY8iimXYL9efkHh1kt02Yg4D6mTZQ/Y=;
 b=CIE7C5sCmH9BmxyaaMBWWaZurfVXvP1eSrlgJkG9OcDy/1S1bUyksWF569KAwCf4U6
 9FACWkIj9WzfgM5kpVLVrNYwt/aZsBDTInBuonKM91XD8BhoQ8k1aFl5a+Ja9lFo4LFP
 JS+mksY3lS6bKB8VLRpkGPBT0C4H2ooeOA5WiCPU/lgm6KMxiLz+vS1bxCCR2KGxJVMT
 BNwipI2S+lPbFfuNBp9Izb1iNeDlO+Vv/8285bhk8fC+5i6Bdq2F3S9ZQJYOxULGzkFC
 82kI6nsbG55RFYibQHaCFDvjCnnmRWqMYk6ZEDll9gzdJGXUJQBoP3ZiAtyboWLRosMM
 vYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LRz/PChng4kYvY8iimXYL9efkHh1kt02Yg4D6mTZQ/Y=;
 b=UnSumek4TXl2uhbEt9PCEM8bH/Mk0ohOf8FcfyJRnfcBikdatfKbk+I938azBQb/2h
 vaSu06knNsnqsJ1zh0G5+VgC28oAz7fwCNWrCW1BAAIMzWu6pUNWk+s1dA/88wFsiePX
 dGwlgGujTCpvsh7LJ3UlVJy9ol5qHzCViz1sBcLgSk0ZNNzkhuLKTZ2WwxubaMZvlP7z
 /3wLgbZDJw6dfw8ytOqeku30RsJKjZUvuNOqs1Nk7asAegIWscd7UodS2mtYRwvwQxe2
 7JMhhcORjPAx0Fs6JoLEwHl6InIUbXkUoUPDRkbEp56JEDml0++kCIf33crZhkG0czXz
 hQvQ==
X-Gm-Message-State: ANoB5pm3h8rU37JBLH2EH3amHC7GcOFgxTmQd4iNwppJ8B6cm/sOODST
 YEm5rktNOUp7V2hWu80zpir1TaOUJzV2yfFiTXs=
X-Google-Smtp-Source: AA0mqf6TQ2WSlNohnXIh3PTuvvakRq6UWUrBS0EmTWO96xzEiewLQbWYA0nOm45Wsrr/HhfRqf1D0w==
X-Received: by 2002:a05:600c:4e14:b0:3d0:7477:bc89 with SMTP id
 b20-20020a05600c4e1400b003d07477bc89mr15811767wmq.22.1670930229955; 
 Tue, 13 Dec 2022 03:17:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bv28-20020a0560001f1c00b002423620d356sm11319811wrb.35.2022.12.13.03.17.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 03:17:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Jonah Palmer <jonah.palmer@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 0/6] hw/virtio: Split ioconfig / qmp code from
 virtio.c
Date: Tue, 13 Dec 2022 12:17:01 +0100
Message-Id: <20221213111707.34921-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

These are the uncontroversial patches of my previous series
"hw/virtio: Build most objects as target independent units":
https://lore.kernel.org/qemu-devel/20221212230517.28872-1-philmd@linaro.org/

Housekeeping in hw/virtio/virtio.c:

- Make qmp_virtio_feature_map_t[] arrays static/const
- Extract I/O config accessors
- Extract QMP code

Since v1:
- Addressed Richard review comments (restrict scope)

Philippe Mathieu-Daudé (6):
  hw/virtio: Add missing "hw/core/cpu.h" include
  hw/virtio: Rename virtio_ss[] -> specific_virtio_ss[]
  hw/virtio: Guard and restrict scope of qmp_virtio_feature_map_t[]
  hw/virtio: Constify qmp_virtio_feature_map_t[]
  hw/virtio: Extract config read/write accessors to virtio-config-io.c
  hw/virtio: Extract QMP related code virtio-qmp.c

 hw/virtio/meson.build        |  42 +-
 hw/virtio/virtio-config-io.c | 204 +++++++++
 hw/virtio/virtio-qmp.c       | 659 +++++++++++++++++++++++++++++
 hw/virtio/virtio-qmp.h       |  20 +
 hw/virtio/virtio.c           | 798 +----------------------------------
 5 files changed, 908 insertions(+), 815 deletions(-)
 create mode 100644 hw/virtio/virtio-config-io.c
 create mode 100644 hw/virtio/virtio-qmp.c
 create mode 100644 hw/virtio/virtio-qmp.h

-- 
2.38.1


