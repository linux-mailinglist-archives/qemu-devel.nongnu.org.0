Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8C35D16E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 21:48:34 +0200 (CEST)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW2Xw-0000Yn-PO
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 15:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XKN0YAcKCn8yhqwxuhjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--venture.bounces.google.com>)
 id 1lW2VA-0007Lb-FY
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:45:40 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:52228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XKN0YAcKCn8yhqwxuhjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--venture.bounces.google.com>)
 id 1lW2V7-0006TZ-2D
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:45:40 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id m189so12231558ybc.19
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 12:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Wdpm+J2ptFjnLpc4pKG/VlefI/v5cVrerIv9rQO16Ng=;
 b=dXzqakmRH4nvngQ/1LjDMtDSTUrmw73L71WbCb+Hu8ZgI507k1qrsJWW6P3PaGtMWN
 FBOoJ1feu7eunmMxSq8yOAKRjuvFqUfTGTJa+Qkk+Uo3GvSbKoV359DkgyIfquBKb2Ue
 rK/liKUvtJsgpayUVRYnNGWfhxM9VxYgpsLGL50wLitje8ySqy5MoCO419O36q+MbqLL
 aUJK5avXJ9DKWqt7FbyivKKgU1WoX3pFZwoQ+5kK0lis3excbJM2OJeU3/V8al/IVyQ2
 TDd08UkGINHs843eOkmnti9wmczos7QnEYyekZipCuee0Hs1l7QPmLbhn+ALzSSfPryG
 CyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Wdpm+J2ptFjnLpc4pKG/VlefI/v5cVrerIv9rQO16Ng=;
 b=gtX7SIwkI7RUPX46mEU9moWAJSM5HkjTUv+jVGrsMrUYhRKOGLsqp5JXXS42JMFNy8
 FBNuQrbNkVmo06yJUFGr0C6rUI/XfDUbz+SHyP4G9OTXuzLoDpJb0EoMOvD8xe5gLaN9
 L9LBUpGEpVnw6AvfrKqYwuTkvXwSM0yjCNZ6k4KC/bV6xWnLRqit0AUsD3inlm3nhqlw
 5nPWevMV6tX2kXKij2u3tIHJkE0MXWopO7yHq5a16nBXQeWAc1Y/UwCTZ5+NWZbOKJ8c
 UFTU/L12KemSWeQ9MVKc5SkcEuynC9wYxChSJCXwmrpVFNDL4C0L6HdhJb7KVOXFurJf
 jWdA==
X-Gm-Message-State: AOAM531gAQpxLGozA4c/tYdxP/W0xBSZyFwLGqQIIWfxKtywsMu4ae1N
 ocHxeJC0JyPyZe7BqfXSke7Uzszem4QV
X-Google-Smtp-Source: ABdhPJzi/XoO78WfAZugVE07gGLJVpRHygteFz96g6gQw+HDhV1SBVOpoxE8mDK1k38Nh3NnRWstJqtsNDPh
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7285:fb47:eb76:b9a4])
 (user=venture job=sendgmr) by 2002:a5b:446:: with SMTP id
 s6mr40590358ybp.317.1618256732318; 
 Mon, 12 Apr 2021 12:45:32 -0700 (PDT)
Date: Mon, 12 Apr 2021 12:45:18 -0700
Message-Id: <20210412194522.664594-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v4 0/4] hw/i2c: Adds pca954x i2c mux switch device
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3XKN0YAcKCn8yhqwxuhjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The i2c mux device pca954x implements two devices:
 - the pca9546 and pca9548.

v4:
 - Fixed up bug where the i2c_scan_bus wasn't parameterizing the
 current_devs list.
 - Minor consistency changes in the i2c mux pca954x.

v3:
 - fixup comment with missing end parenthesis.
 - removed superfluous object cast.

v2:
 - the core i2c bus now calls a match method on each i2c child, which
 by default will only check for a match against itself.
 - the pca954x device overrides the i2c device match method to search
 the children for each of its buses that are active.
 - the pca954x device now owns an i2c bus for each channel, allowing
 the normal device model to attach devices to the channels.

Patrick Venture (4):
  hw/i2c: name I2CNode list in I2CBus
  hw/i2c: add match method for device search
  hw/i2c: move search to i2c_scan_bus method
  hw/i2c: add pca954x i2c-mux switch

 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/core.c                    |  55 ++++--
 hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c.h             |  17 +-
 include/hw/i2c/i2c_mux_pca954x.h |  19 ++
 8 files changed, 383 insertions(+), 14 deletions(-)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

-- 
2.31.1.295.g9ea45b61b8-goog


