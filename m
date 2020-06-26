Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151D20B1C5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 14:55:31 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jontC-0008Dt-9J
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 08:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jons3-00076F-Tn; Fri, 26 Jun 2020 08:54:20 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jons2-0000KQ-Dc; Fri, 26 Jun 2020 08:54:19 -0400
Received: by mail-ej1-x62f.google.com with SMTP id mb16so9266576ejb.4;
 Fri, 26 Jun 2020 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gkoQ7wKEqYIgyzpfrFvA5qo0YC+QngQ6l2mRgEwy8/M=;
 b=ZYNLbpj6m3OGREiI93R4gTLD8sDA0q5/+8Uc5eG6gH8x+d27g6j0IvKbuZo8HpcAh3
 nqY3MPHwCZD7Vw/Te06wWJOskkRI5pLJcx3T6dwxKJTNs7FytZ+7Tu3H1LcPjGMikepN
 XGVbGohumRrhsAPIw9k1mdxc8v8ucQFD9pPO7xodUJUfHzio7iVkpYsTSaSoj4AsD2RO
 AR6nQ3daUT+uSzxXxa+XT9RguDRsW34KixoEKw4KMwNQm5N7Hi06XqgRKh9NJbOdDxS+
 XYaI0S3SsXEv9/6GTj5AhRRhnIaiyVmzB+vrDVnHh2DVdMZPKAHs/7DAOW5QnQpsQhCm
 X0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gkoQ7wKEqYIgyzpfrFvA5qo0YC+QngQ6l2mRgEwy8/M=;
 b=qwGJdWq3PXU2on4z1DpmSR5Dx6VsFAjk5r4Fo/0qDTiu1XT7qYb514BLgbh9xdwtRm
 kDANI37FSf/lFSsY6Q8YTO9VNrRk1Vg6dGhBE9JAO5octY2KvWQA0L4hQyaznkWabOMt
 9wfWDJN8HUS/zlHSWRBsDcOpkfxEZj4PTylNLvcEXvhiA49xgc0YbQ/Ng429J/dpElIK
 uYCHC5LvNQIwP9aJ+RAA9f4PJzfbwbyl3MbtVHkSw3pSzRlS9ThIApiH9Wg7wviVbl1/
 ONIIi8eXrUkuAh1+GFADoJ7UlzB7FGxkxbhibtBF1WMAhH9VhCPEtMuIBBFIn1xyC7KW
 Ngrw==
X-Gm-Message-State: AOAM530G/zsZri7E1Zms+xljQX1m7Q2pbYDB3/fW5qIhmmsxv0+DNoDi
 64nu2QOupokyZVDpGWIxyC2uBIDLm0sDgvwWBZVnWtyugJs=
X-Google-Smtp-Source: ABdhPJxvWsH0Qmmy+7MwHcom0a3MU7xLwfcgLlXd1b6ICYrWoz/LG3ln1HpqTDuurjheK1vXFEVD+UAVS2Ni0qWTOnE=
X-Received: by 2002:a17:906:58c:: with SMTP id
 12mr2303803ejn.311.1593176055335; 
 Fri, 26 Jun 2020 05:54:15 -0700 (PDT)
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 26 Jun 2020 13:54:04 +0100
Message-ID: <CA+XhMqzMf4YLEhbnnq2zSPxFiAHEGaNXgkQUoxouE3A_U9wa6w@mail.gmail.com>
Subject: [PATCH 5/5] Haiku build fix
To: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=devnexen@gmail.com; helo=mail-ej1-x62f.google.com
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

From d36aba6190152c626f668fef3704ee6b61bfc323 Mon Sep 17 00:00:00 2001
From: David Carlier <devnexen@gmail.com>
Date: Fri, 26 Jun 2020 13:45:04 +0000
Subject: [PATCH 2/3] define SIGIO for haiku

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 include/qemu/osdep.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f88fe23936..860bb3c16c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -388,6 +388,10 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #define HAVE_CHARDEV_PARPORT 1
 #endif

+#if defined(__HAIKU__)
+#define SIGIO SIGPOLL
+#endif
+
 #if defined(CONFIG_LINUX)
 #ifndef BUS_MCEERR_AR
 #define BUS_MCEERR_AR 4
-- 
2.26.0

