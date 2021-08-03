Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451F93DF408
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:41:59 +0200 (CEST)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAyQP-0001X5-R5
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAyO1-00085D-VG; Tue, 03 Aug 2021 13:39:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAyNy-00034P-MU; Tue, 03 Aug 2021 13:39:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so2605558wmq.2; 
 Tue, 03 Aug 2021 10:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4EJBAQi6xuy2tNu/TnKauJ4xukFwIpXJcAxBbGWhyo=;
 b=bNWyg0F8DJS/Ed4iKjy9jeaWEpaBPt0ueC7Y0wMvpLEQig9MuXk5LNeaVyvRba27kX
 VfIU9Gw8ogwgIo53QFlvBCOHfcEajw/2orNV+Ve88iZxu9ScI9ybVqv4DzoNdMunq0zM
 MBtsG/TylouU41yBdIt/ZfKZSibx+yRBHWz8zJeNiZobeQguhLiQxdYYcFgjO3guo4qS
 PWznWv2BuHEbyWmjDaEJtp+209vI8JXnu1mRcZs11t+4oq+08mjGJ+YDabnxSUQXxsrG
 AzDZhPJM/irXPwG3SrGIzYwd8nHS00PktCQGb+kVswSIj4vWE7i9UsVVvXAwWOAoS05a
 N8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=C4EJBAQi6xuy2tNu/TnKauJ4xukFwIpXJcAxBbGWhyo=;
 b=EHFWJVjfty+VTMHoE/w0+Unv8cv4P+hMfEbHDxGnczLoOdZpgBic6IfCz3KsSAFOOx
 S4wdhhg+OvHfSplRE1UKGZDM2rBwz801nqMW0fPZkJGUUsGSV8tqpjb9P5betJ/aXAKE
 g/abzeJg5MW39EDk6+eMPlYEXlQlmq1OZZXC8bjLym4Uwyy1qgJLqBon5HATy386HFar
 fUB/kINYf0Mi/xjbs8Kv7WQe2O/WZL5W37ZIlPxCBUgqpjyTCWR9ef7RRIoBsVRQ2qTD
 sNR1n/TyVDwY8oqs5F0DFNOoM/XtGeHShRMAiIv9no7uOoA7ib2oz94uO9Oo2C/penci
 2UrQ==
X-Gm-Message-State: AOAM531mZBLqXWctkM7vRhmxEcg/9tdHYrKGHbIiNcAPFFn6IHubyAeG
 112dBZZt7qK4yLLDpuOMrsZkODXsBmKxfA==
X-Google-Smtp-Source: ABdhPJyohufdi7KCajprcWVi424JdiiGm9Zx776d7NWe1FjjyQ3noTG4ocE4sVWOrzsebdIG4w6+rw==
X-Received: by 2002:a05:600c:3648:: with SMTP id
 y8mr5459830wmq.144.1628012364709; 
 Tue, 03 Aug 2021 10:39:24 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 e6sm11377337wme.6.2021.08.03.10.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 10:39:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] SD/MMC patches for 2021-08-03
Date: Tue,  3 Aug 2021 19:39:20 +0200
Message-Id: <20210803173922.3599280-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit acf8200722251a0a995cfa75fe5c15aea0886418=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2021-08-03-pul=
l-tag' into staging (2021-08-03 14:48:57 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/sdmmc-20210803=0D
=0D
for you to fetch changes up to 4ac0b72bae85cf94ae0e5153b9c2c288c71667d4:=0D
=0D
  hw/sd/sdcard: Fix assertion accessing out-of-range addresses with CMD30 (=
2021-08-03 19:34:51 +0200)=0D
=0D
----------------------------------------------------------------=0D
SD/MMC patches queue=0D
=0D
- sdcard: Fix assertion accessing out-of-range addresses=0D
  with SEND_WRITE_PROT (CMD30)=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT=0D
  hw/sd/sdcard: Fix assertion accessing out-of-range addresses with=0D
    CMD30=0D
=0D
 hw/sd/sd.c                     |  9 ++++++++-=0D
 tests/qtest/fuzz-sdcard-test.c | 36 ++++++++++++++++++++++++++++++++++=0D
 2 files changed, 44 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

