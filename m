Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3386C5322
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2hP-00006I-TY; Wed, 22 Mar 2023 13:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3T0EbZAYKCmYXMXYWVKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--titusr.bounces.google.com>)
 id 1pf2hO-000061-9O
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:34 -0400
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3T0EbZAYKCmYXMXYWVKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--titusr.bounces.google.com>)
 id 1pf2hM-0002FN-Rn
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:34 -0400
Received: by mail-vs1-xe49.google.com with SMTP id
 i21-20020a05610221b500b004258d5ee8c4so5260071vsb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507791;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bBc8nJSLiVzdxFPEpKJGMX3a4bJpKjM1r87UkXJvpN4=;
 b=UAoUZFl+wa+3030Wj02P1ENAAPVjfZhajJAtQSqAqTFFXSw598hFJGoF6a1UdgX1Tg
 9j6jmgBvlZzz00r8PAsezf9sENnwZe2qw8mpQWeonBaCcn5ezMocH7U/bvrqKDy6vsk5
 3WRe3olLdllf+l23Ilb9Pr1NXWBcJJNjVqpUWsmdITpJFUb0mvTRbErP8bEUa+aw/76S
 /RhXgZKfXwhNddlT5KLAMDcHN08nnBNE7xUcpMF/ACWvznfseKX37iB7m3N50eNWrFgH
 NnIiATihI1dV1yru2w5ArhiwwZJVsI3ieEDg1TULimPCe+yqBVjLLb6orthfzYlmVwrB
 mutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507791;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bBc8nJSLiVzdxFPEpKJGMX3a4bJpKjM1r87UkXJvpN4=;
 b=shNKCHq/qd+I9rD7eSbVWlReJhQaCRLq0ZX8cLBFKt4xfoAN7BSPZ7ApbpEuf/vu29
 GDOFKaM2nUsIz53C1aqA8iRDYCf/Kux/e2bYYecyq42Cd6g9HP9U8rw/bYN6CfCUKBwc
 mH/+4xgCLbNJexz9Upf6wqtpPluyO1Sn9zLWJ0qTqKf6GzzVtD4Y9KczwSwMA7I0KgRU
 YNe9v+gSKXGDJTP0GYHclgNDaACQz6uzLMRXT/z75Yxp5/FqtWk0QBVapm/eTU2OKmOK
 4CZ61bFBYOUiba9LBMS8zbBvY7PtN5b4s2Y3uq+tuUSFPLAr62BmfdvoMRi8mY141ZKc
 kUrA==
X-Gm-Message-State: AAQBX9eBuBd41XKSpTvML10PLx+vf41w4R3zXwGZNyAd9xRwSrwq14fu
 H2VGb9rtf/pOhmzWFh+XTrHwS9tjVe4=
X-Google-Smtp-Source: AKy350bz0a1Q9yedPzmTe4Oglj7Ang7uq4bZzzcy7xVGJn7rDTy8aLz0ZlfPELEgR8jW1N4pNSjxcin1EvA=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6130:290:b0:688:d612:2024 with SMTP id
 q16-20020a056130029000b00688d6122024mr3685662uac.2.1679507791244; Wed, 22 Mar
 2023 10:56:31 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:08 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-1-titusr@google.com>
Subject: [PATCH 0/5] PMBus fixes and new functions
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e49;
 envelope-from=3T0EbZAYKCmYXMXYWVKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--titusr.bounces.google.com;
 helo=mail-vs1-xe49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This patch series contains fixes and improvements to PMBus support in QEMU.

The following has been added:
   - Support for block receive
   - Support for devices with fans
   - Support for the VCAP register for devices with onboard energy storage
   - A bitfield struct for the vout mode register, whose bits determine the formatting of several read commands in PMBus
Fixes:
   - String read now handles now logs an error when passed an empty string

This series is in preparation for some additional sensors that exercise
this functionality that will be incoming shortly.

Thanks

Titus Rwantare (5):
  hw/i2c: pmbus add support for block receive
  hw/i2c: pmbus: add vout mode bitfields
  hw/i2c: pmbus: add fan support
  hw/i2c: pmbus: block uninitialised string reads
  hw/i2c: pmbus: add VCAP register

 hw/i2c/pmbus_device.c         | 221 +++++++++++++++++++++++++++++++++-
 include/hw/i2c/pmbus_device.h |  17 +++
 2 files changed, 237 insertions(+), 1 deletion(-)

-- 
2.40.0.rc1.284.g88254d51c5-goog


