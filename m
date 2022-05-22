Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7165305E9
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 22:46:13 +0200 (CEST)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nssSq-0006th-CX
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 16:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nssQx-0004aO-Tg; Sun, 22 May 2022 16:44:15 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nssQw-0008Pr-DV; Sun, 22 May 2022 16:44:15 -0400
Received: by mail-ed1-x52a.google.com with SMTP id c12so16777347eds.10;
 Sun, 22 May 2022 13:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YcC/TUH7i+LAdz51RJT5WEUI8nBIPKDhEK48jgTbIgM=;
 b=k93+ZnUqoTObNv3ouoh2+YdE1CSIGyV7Z9k7pVShGnyISPtM4k88dRu4UbIhHSw76C
 JA6d3H9fjg/EQ7C/PGfF/HCQpr3ISIyeFd2pXxxFdUfBUdJnNGcd+kbERv/4lCc+5Rgk
 3eLE0wyaVvRFMq5K+K5HIs0m/CR1rtcuvnC5X/Cc9k1WV1gE0vQLOBdH4TfyqkbDqbM2
 Kv4u6hRxcSSnH9pMrMMS0dGziKTgnZuFgqzSCV56p6doamZtnxvhF4aAyh/jrYKFuRQ+
 08XvDZOhiEDbkMfgIYvrc8nN34cZJH2oKzOSRv+CgZwiiVL1+IGOLmMbEW6K5xfWOt8Q
 qcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YcC/TUH7i+LAdz51RJT5WEUI8nBIPKDhEK48jgTbIgM=;
 b=DIaHzOXRzSo7C15F0HL5ZlF8iZayoJFB0gISrnel0WqyCKLhKglCYSiM+lByyTLd4q
 DqgsZMQx3YwOQKZ8xT3+Mh13/2jOm26hn5pCFlr2VcX0HUtEi4cwcFZKaIJeEEt+2mL4
 +0gOcAXwQQ0nHlAOKbNQ7fLJ39q1qizDh2CuGYcrvr+eHhZu1VJT9DJZCLPN3GpjSEJm
 1l96fZKMLm9nwt4J2jD7r5Z1SE9Cu8t6U3aQ+ysRkvJ7M3Y8VKe+b74D5Csq19/Tt7/x
 CoW1URDU39wZ0rPDyNGze/9JbjZcSO5wHN135hgFk2KaOc4+cY1W1mcdHo+FMAgzrpH8
 gs0g==
X-Gm-Message-State: AOAM533YaFxLlDjy9L96LySF7uBpGg7Ihhuxy/3YBWOw6ePEYmj/MpWY
 F5OWlmAHDKojbIKMu47xsfhReSr2VRc=
X-Google-Smtp-Source: ABdhPJwfovmQ3wOz4+4nGzv4JGRIzV0erZvNKYOBhf/NosPXL/BNUMYKxw68TnwglhA2y9DtJJh96g==
X-Received: by 2002:a05:6402:3682:b0:42a:c348:7248 with SMTP id
 ej2-20020a056402368200b0042ac3487248mr21153243edb.197.1653252252276; 
 Sun, 22 May 2022 13:44:12 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1709063f4800b006f4c82c2b12sm5533968ejj.19.2022.05.22.13.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 13:44:11 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/3] QOM improvements for rtc/mc146818rtc
Date: Sun, 22 May 2022 22:43:44 +0200
Message-Id: <20220522204347.10438-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v2:
* Explicitly fail with &error_abort rather than NULL (Mark)
* Explicitly fail with &error_abort rather than NULL in existing code (me)
* Unexport rather than remove RTC_ISA_BASE (Mark)
* Use object_property_get_*u*int() also for "iobase" (me)

v1:
This little series enhances QOM support for mc146818rtc:
* makes microvm-dt respect mc146818rtc's IRQ number set by QOM property and
* adds an io_base QOM property similar to other ISA devices

Bernhard Beschow (3):
  hw/i386/microvm-dt: Force explicit failure if retrieving QOM property
    fails
  hw/i386/microvm-dt: Determine mc146818rtc's IRQ number from QOM
    property
  rtc/mc146818rtc: QOM'ify io_base offset

 hw/i386/microvm-dt.c         | 9 +++++----
 hw/rtc/mc146818rtc.c         | 9 ++++++---
 include/hw/rtc/mc146818rtc.h | 2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.36.1


