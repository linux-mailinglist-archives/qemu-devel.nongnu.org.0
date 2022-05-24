Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5107E532DD5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:49:32 +0200 (CEST)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWmp-0005RA-EI
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWei-000403-A3
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWea-0005Ll-CE
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id p10so7649078wrg.12
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5EpRm/9HHK85fo5gZK8auBcL4vBK6z84dOJ/Zm0/w68=;
 b=H3B6QgaIWPXzjDwGh7xqUtBVD6vxaaLK46FQHGxyes1+ACsXyM8RHc17XPKSgU4/Tf
 +Z6k6d+ohqxiBq4q/PkodHO+SsQUa+eAiNZPwCwtfeVxFnVFn42gdMLiA8jEpMfzoKWk
 jhTx34as0hmYqQJ1tuZm0Qt57udqXEQk7SJd5esszWYVcdB68jP13S3W9icf/A45yuQZ
 oZ2Oz4syPUE/KgLirD4SRvucJrsxikONRaPV3vsxYPPyqfVfWeIghkomiSTNo3gdr9ZA
 Sc1ZRUbpKaaN46WCW1xFayodx6qhiyiroANeX5zJbOUAtXPGntZ/RpWOR/evIO9CKGK9
 wSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5EpRm/9HHK85fo5gZK8auBcL4vBK6z84dOJ/Zm0/w68=;
 b=LcaYCfREZNPKi8TzXpVNaw2r4Xk5oyQKh567NpEsQy5tztBDnfuenAH5QAYbN2KVTv
 fRXlsNX+fnNMBMQ+KAuoc573Pr+9gq4btDblmdxWvEH74WYXBEXdoct6NnayTbxFk8Eb
 ogXaPziFzJz1H/a6x2FTduzMpOFqDlTF472g6XF5oqhGX7mUwq9oqV4k1jXuI3b5WCEf
 IXPjsiJATuUjnI1cHEW4grrRLeDKRNTBHwsNm4FB5khFdpE4DBZguw7CwVpga4xuQnrv
 tSNQGszcWvvehC75DJpalVJ+HKTgQC8ajzJMId3mcdV6ZYEZFesFqu3jBnm+MmqfFkw7
 7e2g==
X-Gm-Message-State: AOAM533Ht/rSY4D/fEai/jHxMydpu5ekGSuulqZSrGIGlJFSlrFJc8ap
 L8BBI3uDCGTyg45W0WKs+ZJWKw==
X-Google-Smtp-Source: ABdhPJxUXaOagc7FveAmVp8BFerCV0KvgdixFxC9Rcgx7e8JVf7Hmb2MKoqj6dfS9ags/LFJGcsL0g==
X-Received: by 2002:a5d:6984:0:b0:20f:fadf:8849 with SMTP id
 g4-20020a5d6984000000b0020ffadf8849mr1086144wru.143.1653406858077; 
 Tue, 24 May 2022 08:40:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adf8901000000b0020c547f75easm12886935wrs.101.2022.05.24.08.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:40:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 624CF1FFB7;
 Tue, 24 May 2022 16:40:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 00/15] virtio-gpio and various virtio cleanups
Date: Tue, 24 May 2022 16:40:41 +0100
Message-Id: <20220524154056.2896913-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

This series ostensibly adds virtio-user-gpio stubs to the build for
use with an external vhost-user daemon. We've been testing it with our
rust daemons from:

  https://github.com/rust-vmm/vhost-device

Getting the test enabled took some doing most likely because the need
for CONFIG support exercised additional paths in the code that were
not used for the simpler virtio-net tests. As a result the series has
a number of cleanup and documentation patches.

The final thing that needed fixing was the ensuring that
VHOST_USER_F_PROTOCOL_FEATURES didn't get squashed in the negotiation
process. This was the hardest thing to track down as we store the
feature bits in several places variously as:

  in VirtIODevice as:
    uint64_t guest_features;
    uint64_t host_features;
    uint64_t backend_features;

 in vhost_dev as:
    uint64_t features;
    uint64_t acked_features;
    uint64_t backend_features;

and a number of the other device structures also have various features
fields along with get/set function handlers. It wasn't super clear
what the flow through this structures was meant to be but I'm fairly
sure there is unnecessary duplication in there somewhere. We could
certainly do with some docstrings to make the point of each field
clear.

Going forward I wonder if having a fake vhost-user daemon is
sustainable in the long term. Maybe it would be better to spawn real
vhost-user daemons in a test mode so we don't end up duplicating the
whole protocol?

Anyway please review.

Alex Bennée (13):
  contrib/vhost-user-blk: fix 32 bit build and enable
  include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
  include/hw/virtio: document vhost_get_features
  include/hw/virtio: document vhost_ack_features
  tests/qtest: pass stdout/stderr down to subtests
  tests/qtest: add a timeout for subprocess_run_one_test
  tests/qtest: use qos_printf instead of g_test_message
  tests/qtest: catch unhandled vhost-user messages
  tests/qtest: use g_autofree for test_server_create_chr
  tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
  tests/qtest: implement stub for VHOST_USER_GET_CONFIG
  tests/qtest: add a get_features op to vhost-user-test
  tests/qtest: enable tests for virtio-gpio

Viresh Kumar (2):
  hw/virtio: add boilerplate for vhost-user-gpio device
  hw/virtio: add vhost-user-gpio-pci boilerplate

 meson.build                             |   2 +-
 include/hw/virtio/vhost-user-gpio.h     |  35 +++
 include/hw/virtio/vhost.h               |  21 ++
 include/hw/virtio/virtio.h              |   7 +-
 tests/qtest/libqos/virtio-gpio.h        |  35 +++
 contrib/vhost-user-blk/vhost-user-blk.c |   6 +-
 hw/virtio/vhost-user-gpio-pci.c         |  69 +++++
 hw/virtio/vhost-user-gpio.c             | 357 ++++++++++++++++++++++++
 tests/qtest/libqos/virtio-gpio.c        | 171 ++++++++++++
 tests/qtest/libqos/virtio.c             |   2 +-
 tests/qtest/qos-test.c                  |   8 +-
 tests/qtest/vhost-user-test.c           | 179 ++++++++++--
 contrib/vhost-user-blk/meson.build      |   3 +-
 hw/virtio/Kconfig                       |   5 +
 hw/virtio/meson.build                   |   2 +
 tests/qtest/libqos/meson.build          |   1 +
 16 files changed, 872 insertions(+), 31 deletions(-)
 create mode 100644 include/hw/virtio/vhost-user-gpio.h
 create mode 100644 tests/qtest/libqos/virtio-gpio.h
 create mode 100644 hw/virtio/vhost-user-gpio-pci.c
 create mode 100644 hw/virtio/vhost-user-gpio.c
 create mode 100644 tests/qtest/libqos/virtio-gpio.c

-- 
2.30.2


