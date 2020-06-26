Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101DA20B30F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 16:02:28 +0200 (CEST)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joovz-00039T-31
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 10:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jooun-0002Oa-Ee; Fri, 26 Jun 2020 10:01:13 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1joouk-0002jv-Uf; Fri, 26 Jun 2020 10:01:12 -0400
Received: by mail-ed1-x531.google.com with SMTP id g20so6801774edm.4;
 Fri, 26 Jun 2020 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hcSRs+cJNX2519ClSvdXZ2MGkJYwYcBPgPulEMQgfIU=;
 b=PUBlUXKOChYV0OD/cI3fWEdIr5ybWsPUZET1OFPfXzYcu8R6fapEFcor0E36mq1rZn
 HG27EBupFTuq5U7w3+VC0EjDgT+V4lZFh4BIjG9iA7xIJYYXSWhiguvjJwbNV09c74JW
 Pbj3ax/JpBpoZl9nN5hFqvN0tnSaYG9wPaBb3hXCLXqK4M/XV7wRn/MHq1ax6ZDnFzzb
 jzN6x2/0HZgo8B6y/8XgnjuyVSpjafVR7Irt27BaPo7qqICxJ8fS0FbaIWf3aFRM03qe
 6vJ71GAagoIrqBkt9lI5o/sBec83iptc3Eo/0naT9+bMdiTIKgiQqKxTpbMNUb0BmvBj
 2kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hcSRs+cJNX2519ClSvdXZ2MGkJYwYcBPgPulEMQgfIU=;
 b=sbHzWhvYaielSVEmszAralD/60P28sOLVnwoxIeM3OVJL+rwwyP7aKX41eW+Sxeq/6
 N9ziSd8xZRf35absHlL0M0MoftfypACDnhmGcytbHvAAIdbLah+i4YQ9p3SnzF7FELd7
 DZHN/RcQNpMlmeP7ymmQWLjkG4bvIRELgm6qITyFl/TxLieDo4orH1qnMZT4BveKylnf
 rXYTDIR/zIzeBowN7zDs2PKsMG7I995NsSSfL1Y+9JsN+CAT+6tDmNQ6/KG8cXpowvlZ
 QrIW8xAh9nlHV43gW7Ng3cHzTVmBFqeJULnofrKmp8chY76LVILhAn5jhg0KRGG7rVWd
 9vEw==
X-Gm-Message-State: AOAM5330EpjpIwcQYOi+ljMny2zDZa1ahJJKE0fZE199PiRcwkyVBw1G
 cO+8ykTS4CZlr1UCcfGi7QT9JJlchwTUJ3K+f18aJXbaDzm/Hg==
X-Google-Smtp-Source: ABdhPJwy/3Gl+phHRYtjun/pLJ3L2tcxAoJ78cKGtMBSodbUa8WtA4iDDO+wbdpKvMmTnjarL+gzkMwmqau0skoFAwk=
X-Received: by 2002:a05:6402:1597:: with SMTP id
 c23mr3325462edv.243.1593180068693; 
 Fri, 26 Jun 2020 07:01:08 -0700 (PDT)
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 26 Jun 2020 15:00:57 +0100
Message-ID: <CA+XhMqxLQoYmsrocFOM4zwaNX9FhfcAb0EamrvQL6XouB+vDOg@mail.gmail.com>
Subject: [PATCH v2 0/3] following up haiku build fix
To: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=devnexen@gmail.com; helo=mail-ed1-x531.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

From 6fa7a4108236f513201192654e07c7044a3d7e58 Mon Sep 17 00:00:00 2001
From: David Carlier <devnexen@gmail.com>
Date: Fri, 26 Jun 2020 14:48:28 +0000
Subject: [PATCH 0/3] following up haiku build fix

David Carlier (3):
  check sys/signal.h presence
  define SIGIO for haiku
  qemu_init_exec_dir Haiku implementation

 configure                   |  8 ++++++++
 hw/xen/xen-legacy-backend.c |  1 -
 include/qemu/osdep.h        |  6 +++++-
 util/oslib-posix.c          | 20 +++++++++++++++++++-
 4 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.26.0

