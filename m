Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F39371E49
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:18:31 +0200 (CEST)
Received: from localhost ([::1]:55426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcDG-0005ty-0u
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc86-0001ho-Ra
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc85-0003te-A2
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so6175223wmy.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vq/Xi8dlTbigKHadG9OmpaHZDNbMK0I5NasTNYcvABQ=;
 b=YNfRrn5NqDT551rIA89vudrAOKoEgdnXOa4oVuMixBE3S6wbsnGgPZQAYvg2Jc7xq8
 gaSXokv8mM4+E9fO81JaYSctLPLZHSjomBzMoGbshShFuIReOhjpbPAgXVXnqRCOGFs8
 fPFGmHbFImFNWXPywQU48WfsBQE8CpAtkAfg248hXV1c9uA67uH7LPn1sOjg6beyDqUs
 gKBPLcIpl26sz4NeBW5mHbMJE5tx4I1G7p4NqhawozuOFK67mMUDwTtTGjI1QCN1IKq1
 m+2mDpeV5EMQEZ43Eo+piT2IbbkZfXVufT2r4K+yJ2bzs/iYxBDtgpfGDoycO7GU3Vyt
 8sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Vq/Xi8dlTbigKHadG9OmpaHZDNbMK0I5NasTNYcvABQ=;
 b=ph6PyZY621tdg34dHEKHclm3NPE0vL8/yn9GGNkmMaBIvpZmqj041426fifBHaSlX+
 0vcyEn5F6aOxiqIGWMzKxhKNTgJAlr2tKt6DeRvvPBLxDWsWtqYASVrfh6zXV4bZZUy8
 uZIeV+tpbUwypFR3LgEGuL4cnY8Pl7cfjlRwmmsEEFgwuDmpBJfX1KW5ybJOA/3fcLb7
 l9OF+Fg3/Tm2Qs4wZTvhI9F6ZI7j+31TmKC8xsJnX8svKDZn+gKhHq+4kiySA6ieucsP
 IbcpdjJTsnVjfuboyC2t+BiXdFO/eclQr+iIBk/iR2HrbZbgEpuqrRSL5TNAyqsKjZ1t
 IJOg==
X-Gm-Message-State: AOAM5339SSo+oNeqo8wcJR3+40Ve54Nj0lnimNNLtomHWgiZJH4WTdgP
 hgSWo1L68anawkKK+knZOLIPxvB0mu7JdA==
X-Google-Smtp-Source: ABdhPJyav7V4EW7InSGKnwl+8jjP8SHeiq+X4AcHiUngjuAWSJFi/C0a0VD4dRlZ2pDUdpVKR5z0kA==
X-Received: by 2002:a1c:3d05:: with SMTP id k5mr22139692wma.182.1620061985251; 
 Mon, 03 May 2021 10:13:05 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id b12sm13174763wro.28.2021.05.03.10.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:13:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] hw/sparc/sun4m: Introduce Sun4mMachineClass to access
 sun4m_hwdefs
Date: Mon,  3 May 2021 19:12:57 +0200
Message-Id: <20210503171303.822501-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: 6=0D
=0D
Hi Mark,=0D
=0D
This series QOM'ify the sun4m machines.=0D
I need it for a further memory maxsize check.=0D
It is mostly code movement (and the diff-stat is good).=0D
=0D
Since v2:=0D
- use static const variable for hwdef (Richard)=0D
- added Richard's R-b tag=0D
=0D
Since v1:=0D
- Full rewrite after Mark review=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/sparc/sun4m: Have sun4m machines inherit new TYPE_SUN4M_MACHINE=0D
  hw/sparc/sun4m: Introduce Sun4mMachineClass=0D
  hw/sparc/sun4m: Factor out sun4m_machine_class_init()=0D
  hw/sparc/sun4m: Register machine types in sun4m_machine_types[]=0D
  hw/sparc/sun4m: Fix code style for checkpatch.pl=0D
  hw/sparc/sun4m: Move each sun4m_hwdef definition in its class_init=0D
=0D
 hw/sparc/sun4m.c | 459 +++++++++++++++++++----------------------------=0D
 1 file changed, 186 insertions(+), 273 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

