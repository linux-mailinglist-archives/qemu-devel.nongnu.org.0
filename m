Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26823C486A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:29:56 +0200 (CEST)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tCF-000607-SY
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2tBS-0005Je-5V
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:29:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2tBQ-0002WG-PB
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:29:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso14079088wmh.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 03:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCYuM9B5pR6QCr6+0UCIqJfOtvY/76ZbXTNdOkgnra0=;
 b=jn9ohfcVnrpzgr1plEwpcTEpCW8YSMlXYe+J+oMz6lLfZAcSVJlZjLZzWWA/bkLCVV
 fVxi70Foj4NjUTOc3PEbQRzZpRlqCypAzS7B0gWgxAXTyD3wFTfH31xIbCrfikncV0jn
 ovki2hZhEwsuuGrOgFzRyHTKEjIIpqRzsCZFhDFn779DYE4BPBly3Rr1xpHRjBUV8Q/i
 WsyJI/P5twEzjuYOiu7G9yqVgClGOu31v8meZhW8NP/HuorZ+Ow6S9cezhuMKcUe5M+i
 MOavY8GyJZXLGjJlQY6soBQmP3ToAr6ywNyR5/AGPNo1/6TRbxNBl+Tj/T251SvtmL9s
 NB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SCYuM9B5pR6QCr6+0UCIqJfOtvY/76ZbXTNdOkgnra0=;
 b=WtjEYZv53w3/DXDfn6gPR0Br9xzP4kkDVYQcgcIFtg8cCQGHNHvwBDu9jrOfwZyYT9
 zAS6gAzicbnab4AOXyc/vQRIr4YbkgYRDqVoVeAyOXpQlnVOFMYn6M9rnXgScfttauwo
 vBt+nSarp+RaHTKA8WOjajfKCqO3lEm0VMLXtC0UUgOXNsY6Oa5X6OAp9ycdjb9DGUdN
 TsEZpdOaGJImrWM8xvxlizVdcLrsLJXBQ5G3a01b0aL5VR6CvjZsGxR6hGHbOKeE7pZB
 Zw/d1pKae75pjQnWgMsB2VZzwyHTQiZM1waaalLEg2b8MJg7LbTGmLNOMR+oGjQkwzRy
 6CcA==
X-Gm-Message-State: AOAM531jOzmuqB9i0LCjEF+rfmnBCd7g+Z/3UX0VacdjlLEaPDWd1Ou1
 fLhlqD/eNBLd1GH4LNI1CDPHapkBAEOfc5RC
X-Google-Smtp-Source: ABdhPJyHBFD8so+s2bQCtLaE9MhT9j3594d6ojU/RH3Cw8Q1OW1TghZGFz/lnWR0ki50wpToYBq4bQ==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr11310067wmk.146.1626085743145; 
 Mon, 12 Jul 2021 03:29:03 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id o11sm11842146wmq.1.2021.07.12.03.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 03:29:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] SD/MMC patches for 2021-07-12
Date: Mon, 12 Jul 2021 12:28:46 +0200
Message-Id: <20210712102846.2783382-1-f4bug@amsat.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d1987c8114921eb30859854de664f879b5626da7=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-07-11 22:20:51 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/sdmmc-20210712=0D
=0D
for you to fetch changes up to 59b63d78be1f67c87b79331dcc825e485efd3bcf:=0D
=0D
  hw/sd/sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30) (2=
021-07-12 12:27:38 +0200)=0D
=0D
----------------------------------------------------------------=0D
SD/MMC patches queue=0D
=0D
- sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30)=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/sd/sdcard: When card is in wrong state, log which state it is=0D
  hw/sd/sdcard: Extract address_in_range() helper, log invalid accesses=0D
  hw/sd/sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30)=0D
=0D
 hw/sd/sd.c                     | 41 ++++++++++++++-------=0D
 tests/qtest/fuzz-sdcard-test.c | 66 ++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |  3 +-=0D
 tests/qtest/meson.build        |  1 +=0D
 4 files changed, 97 insertions(+), 14 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-sdcard-test.c=0D
=0D
-- =0D
2.31.1=0D
=0D

