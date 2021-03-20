Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB386342FCB
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 23:11:55 +0100 (CET)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNjp4-0006x1-8b
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 18:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lNjnA-0005ln-Sr
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:09:56 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lNjn9-0003Sk-AP
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:09:56 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so7087778wmf.5
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J4FGspfjfxg8jJG/MIaqSdj1NPWKNfRqhhBSZ+YRLVE=;
 b=IEO3dFj6R2MJXVDQYoXsWUf2E7B67CJtUItIew/cnpzOL5rw9GdWsrzW0cEBkSHTKi
 4zSua2KVClzQcLz35VGu8PcLT0OdkDVs5fiQBMZRuR9KTgKRYWLOc6QX1uAPCSTTWvzY
 gW9HdMEmr6KNuq8qvv+a4xRTFh5l1N6i+aGskzory4YFIL8rfaCWBEisMuV+B40m0emE
 KchJ79yUX52m/vLn0N0JBu+oGADYd/Ef0qP0L55wvQgiPo2Xpq9dSeyFZgzHOCyIGwA+
 OPwU5FMJsIquhAA9wYVvMiBzUH077auQ623siaZsG5CVVzCZtvnMUQmuSsuRmPg8K63i
 /sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J4FGspfjfxg8jJG/MIaqSdj1NPWKNfRqhhBSZ+YRLVE=;
 b=pL4xXYNxPXNX9TMTwqmz/bPK1HyYlMeCvLw7gxLdJnPSusajqkIiGncrLA0yRouc/a
 iBUuQp+n+HV2Zk/GCUyJKLQiWqOnG1u+itlAbW67fTJjwufWR+Insb6yYcsOAYixQsh3
 TEeMfXo2jArBT+gBQ4tOCXAlEtwE4qMD2y0X/qz/4o4283Cn7Mz1r9LkkXH8IjJPg2wi
 hPvWjyzpl2fckpc+p06Bp0PZ31ZBHCaBxZuUFy1QwLHKT298/0fzFQj5bydCKgahHKDF
 6K6hD3RwWGnrnbWBq/gOlHm44bCQlfqtEIsCC38/w6KSF6UQ2Qso1DtOqQa//HZOittt
 3UIw==
X-Gm-Message-State: AOAM531uzpz5tI11NVUv2XRO7MRbN5vA3oqBneZ0DHdarBosX6kfYMAm
 kXiuTPP+ZiAYbS/5cB9+mznFaePT4gv4kg==
X-Google-Smtp-Source: ABdhPJy9TroiAJ0ux+lww3r77ikKQI2U126wMs++7UKw7Xb8MSTimHu00i+68DgfknbPKiQOQaANrQ==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr7260974wmk.31.1616278193240; 
 Sat, 20 Mar 2021 15:09:53 -0700 (PDT)
Received: from localhost.localdomain (bzq-79-176-28-221.red.bezeqint.net.
 [79.176.28.221])
 by smtp.gmail.com with ESMTPSA id i16sm17175272wmq.3.2021.03.20.15.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 15:09:52 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Set AVR TARGET_PAGE_BITS to be 10 instead of 8
Date: Sun, 21 Mar 2021 00:09:48 +0200
Message-Id: <20210320220949.40965-1-mrolnik@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=mrolnik@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous value of TARGET_PAGE_BITS (8) is a bug. Make it 10
I tested it using the following commands
1. ninja test
2. make check-qtest-avr
3. avocado --show=app run -t arch:avr tests/acceptance/

Michael Rolnik (1):
  Set TARGET_PAGE_BITS to be 10 instead of 8 bits

 target/avr/cpu-param.h | 8 +-------
 target/avr/helper.c    | 2 --
 2 files changed, 1 insertion(+), 9 deletions(-)

-- 
2.25.1


