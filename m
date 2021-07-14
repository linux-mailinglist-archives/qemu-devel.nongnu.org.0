Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41BB3C89B1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:24:07 +0200 (CEST)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3icA-0007WM-8V
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3iaq-0006pP-DZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:22:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3ian-0003jx-Mi
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:22:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u1so4215675wrs.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0rYHqZJbOr1f1bDr66lCrJu94JynbPXY9c/MqyNnUNE=;
 b=i5+Pre55ULZTKGum8lVm3HU2UmcTU1rAefh7pTHzsqkz0rGIwY7qkrqu8OSLAt1PZj
 HdYHPysuGIL8903UyfOn8QQ5okAeVydscUDAxfUlTjCOejq6mbiQkTf6npejP/Lqy3Dv
 Z55VqBtpnKPR/56uPRnkd8LH1aG2K+zDmlxJ0ST+pO/IFEJoAJ9ST7Bbvf+utLBet5jc
 qK1QnaS4YDliDFAAVz07i/tZO+6E0amSgU6EcIKdL8XC6XC/ty5cXzVo9l3a4iWzC4wf
 wxI5z/VLtI7VH4xKhgDF4YKtDTaDYjrL70/k9C4ZWivbo6Cm3XXkpZH7GNpf/s49vrXQ
 3jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0rYHqZJbOr1f1bDr66lCrJu94JynbPXY9c/MqyNnUNE=;
 b=C/XJqihWZyAbbH70e3YFpoasZdHgBFOeFdll/l/g0N+yr0N5myGPS0wTv48tnDX+we
 PEnxMp479oqOMI74DG140xzS5pjNPMJj1bgv9qyq4LN4N9WCtck7t3ugG/A9mXJgfSwF
 lxo6Za+rLw4MbXhDYUuhy1y62pa1RDEOfMdB/RYuHCnos/TOdapnPAy+Pu3FJAQAfY5Y
 QnfmcFF/kAj8GU6fbY8yjZQDYkMOq7vytjOq2sN/vOAbvGlk8hJAD7zWsRpclj864kAz
 JIQkVaYrYwrUvAUG+UOv6eiwJpMBLkd9arkwfV9PNYU15MrdVkq8QyAa+URPhVQCbGVv
 2OjQ==
X-Gm-Message-State: AOAM533tz3bLTmTkqIEMl/YSHe9Io9O8KtWGF8VTZdYqMkI6PulWhjpM
 EcjrPT8KwqByE2BoxiaguHooJg4Rn+phwA==
X-Google-Smtp-Source: ABdhPJyGJN9WkxB20K7+OvwlMslDKrxJoWghY52ARPyWMlc3oLfVxDwg9djC40dHOyXWBwAvjxwwEg==
X-Received: by 2002:adf:dc85:: with SMTP id r5mr14499818wrj.218.1626283358700; 
 Wed, 14 Jul 2021 10:22:38 -0700 (PDT)
Received: from localhost.localdomain ([102.41.175.227])
 by smtp.gmail.com with ESMTPSA id l18sm6434393wme.29.2021.07.14.10.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:22:38 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] plugins/cache: multicore cache emulation and minor
Date: Wed, 14 Jul 2021 19:21:45 +0200
Message-Id: <20210714172151.8494-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series introduce some minor improvements/bug fixes in the cache
plugins and multicore cache modelling.

One prominent bug is the use-after-free bug induced by linux-user
multithreaded programs. Since plugin_exit is not guaranteed to be called
after all callbacks, it may free data that subsequent callbacks may try
to use.

Trying to uninstall the plugin after exiting does not solve the problem
since it will unregister the callbacks but it won't prevent the
already-fired callback instances from continuing.

To mitigate this issue, the data is NULLified on exitting so that
callbacks can check whether plugin_exit has been called already or not.

Also, raising the levels of warnings (by the time this is sent, it's not
yet upstreamed but it's in the process of getting merged) induced some
warnings, this is fixed in its own patch.

Mahmoud Mandour (6):
  plugins/cache: Fixed a bug with destroying FIFO metadata
  plugins/cache: limited the scope of a mutex lock
  plugins/cache: Fixed a use-after-free bug with multithreaded usermode
  plugins/cache: Supported multicore cache modelling
  docs/devel/tcg-plugins: added cores arg to cache plugin
  plugins/cache: Fixed "function decl. is not a prototype" warnings

 contrib/plugins/cache.c    | 188 +++++++++++++++++++++++++++++--------
 docs/devel/tcg-plugins.rst |  13 ++-
 2 files changed, 155 insertions(+), 46 deletions(-)

-- 
2.25.1


