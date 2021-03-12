Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ACE3392B0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:07:34 +0100 (CET)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkK5-0005Je-UK
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKk8I-0007vZ-Dg
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:55:22 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKk8F-000774-VF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:55:22 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z2so2052030wrl.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2E59w2rPYa9Wi4/3MeopBpeqlsRLPnmVSy6mfQnrimE=;
 b=dw/mGZ8o3+Fg3AkCfoEa62oPh8GT0Ju5eSd0x+VLCBu1Z7yUguYqa5z3H+eMfGiM/M
 rHoVLjIaaSGpaWeoieAW+N7tB/rpMo/0xLBvtK+Bsh9O9hRVUHeXptMQNVoBKOyN+FRy
 qdfHFirFkeCq39/dOW7gi2xlGEb63TffKxr+BPW2J/RFPnySYWHS43n1i2IAMJeVXD1L
 QmYqw0/jh0C+dLyTU1TaHevtXL2s2iNH5Wq8e3zPfLXfzcTmvRKLEvHTSj8rHIwD8R67
 Z7rzz1a6sr+26vHp+T6Fd9+wNRklrakTXH+2mA7rGrKiCFcAv3PtwqwKVM2bas9uawxS
 Fj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2E59w2rPYa9Wi4/3MeopBpeqlsRLPnmVSy6mfQnrimE=;
 b=V53UWaEQBg7UOZ7duoNjRDV2LRhhlkJPIAmOWmdl6Ma9DALTnuQ5tB3/TGorNUV+08
 N8TOzjqOtbXR4Uu+pefEyuKDInQ/915p5mXlYwdcnGn1afahX1XPBV0B2y+rYy03erds
 EMc744dqNU8TzNmGzY/RoJWXO2r/AjwdaxO/TNtgzOl+21dcO11oAexRhWoVvXY4NqBE
 obiLFev42ocOKuW5EOq4FNfYb9WJfGkX61zFpPQ2qSTVMeUctYXqv0Y8Kar+OwFMgEV9
 nK0M+xXcaRzmdb9+LGR4ffcFvw1FQVzg5XC+13OHvl7SJyh7DaMSx4cShYmtiNCZTgO2
 1DEg==
X-Gm-Message-State: AOAM533S0j2Sl3MCQwYYZgh0slzqj9Rfb7GnEdEY8kovlTj4h+9GuRbp
 N7jJd/P43okMdD9OZAkb3Mn1TzvuytM=
X-Google-Smtp-Source: ABdhPJw1xlKPvLv6cui2V8BVQzuMRUlFXLTo+z1eJR4EYOtjkdgGbpRI6gxQ4/ZSnA2TvN1sKYZ1BQ==
X-Received: by 2002:adf:e809:: with SMTP id o9mr15018770wrm.110.1615564516040; 
 Fri, 12 Mar 2021 07:55:16 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s83sm2565435wmf.26.2021.03.12.07.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 07:55:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] MAINTAINERS: Mark Renesas hardware emulation orphan
Date: Fri, 12 Mar 2021 16:55:11 +0100
Message-Id: <20210312155513.1849109-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Magnus Damm <magnus.damm@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yoshinori Sato doesn't have time to manage QEMU reviews.=0D
=0D
The code is in good shape and hasn't started to bitrot,=0D
so mark the corresponding sections as orphan to give the=0D
possibility to any contributor to step in and fill the gap.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  MAINTAINERS: Mark RX hardware emulation orphan=0D
  MAINTAINERS: Mark SH-4 hardware emulation orphan=0D
=0D
 MAINTAINERS | 22 +++++++++++-----------=0D
 1 file changed, 11 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

