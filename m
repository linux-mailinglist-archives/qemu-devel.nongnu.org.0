Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1E367A14
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:44:31 +0200 (CEST)
Received: from localhost ([::1]:37980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZT4g-0007y7-6D
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZT1s-0005o7-2A
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:41:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZT1p-0008K7-9K
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:41:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w4so39865084wrt.5
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 23:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SA5RtUdOJy294jMBy+JrBBDERfAlU2HDu39lV/3lafM=;
 b=FocBdhQAdaWxsSyFv2fBNq6RYCgOxdWdvA4KqpWO4L5E/R17wD/aRli6mR9bO1KYlw
 hpJPQXi334hnm7r9ghVNRN2TGUMR2UT/RqoGNb4aOl4xNhPO4y4zu3lMXoy9ZMZv8Z20
 WPuZZD8wDi5cyLbul3CEibQ21NPY2SkDTwlrSDChEbPZe4ogtJxhJlwYnJ+njBmWyNs3
 c1yBUAP8LseSVTlT0Yg+bbbCUGT3lk3U4wkaW/POHQ4tb+5faDr2QqWe6FHduBrDM1SW
 NDWkQ+fsZRD4coLOV/76TJ+VRVuL+K5543FW5WCMXfC7uOnTUObhVDdaW+BTv0YY1pRo
 oxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SA5RtUdOJy294jMBy+JrBBDERfAlU2HDu39lV/3lafM=;
 b=I17uMtG0iQrBh8GjxINRKvhszr3+cDWmp+00r1iF4SRRmdP6QrdZB0OGKZI61CUF8W
 O60VrWxDQvocZWNCg0rhA0e5JoXwI71VS4+N/iBSS1wiqWWI04hRSYRUYIHVKJBgqOWZ
 m6KrRkKQ5kPNPl6fUM1t91ii6SqGBpdgbzM809dXlcTo4hDywFLaWlHgh90XCLaynTYG
 lNqxVhF2K6OOeoHTZcReRHecpTYKBDDP8G9jky42kKtTy35wavMX9OZ3ZkCXAj2TSQbc
 d6R1E3Zcf+MnSFP1ADMs7Kms5zP2uJgho5/+/cNivffVbvWUcCZ5pD5NSDjMP3IcJ3lA
 9Rgw==
X-Gm-Message-State: AOAM533QfYVpvI1Q0ksZWapmoQu7iKjJXN7N+/Pla3xeCXYWDm7SSuoC
 Sxn+MXEUXWIrfQQwSrOFmLGkWZ8jjsPN4A==
X-Google-Smtp-Source: ABdhPJy+HxMtRs6nJ/ZRiiaPQY3Fqn9kl58OSPh8OkMuezllp+jncyJkljSNH5kc7za+z43fRcx2HA==
X-Received: by 2002:a5d:62cd:: with SMTP id o13mr2075785wrv.77.1619073690861; 
 Wed, 21 Apr 2021 23:41:30 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t6sm1959422wrx.38.2021.04.21.23.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 23:41:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] exec: Cover gen-icount.h in MAINTAINERS, add missing
 exec-all.h header
Date: Thu, 22 Apr 2021 08:41:26 +0200
Message-Id: <20210422064128.2318616-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

include/exec/gen-icount.h is listed as unmaintained.=0D
Add it to Main Loop (or should it be TCG? softmmu/icount.c=0D
is already there).=0D
=0D
Add the missing "exec/exec-all.h" header.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  MAINTAINERS: Add include/exec/gen-icount.h to 'Main Loop' section=0D
  exec/gen-icount.h: Add missing "exec/exec-all.h" include=0D
=0D
 include/exec/gen-icount.h | 1 +=0D
 MAINTAINERS               | 1 +=0D
 2 files changed, 2 insertions(+)=0D
=0D
-- =0D
2.26.3=0D
=0D

