Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458A328B523
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 14:55:11 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRxM6-0000G7-9K
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 08:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRxH8-0002BN-Jt; Mon, 12 Oct 2020 08:50:02 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRxH6-0000i5-Jl; Mon, 12 Oct 2020 08:50:02 -0400
Received: by mail-wr1-x441.google.com with SMTP id n15so19063539wrq.2;
 Mon, 12 Oct 2020 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iFs6emz6fGf+xQlicgZNk8cNGLeirUVE2ipQ9bTFfcw=;
 b=UdBxpfLpqcO6gsLuw7AjHeCoUN8MkW98il5/42IOG8OPQpTPw8M4R/zwcv0ZMeIj4e
 UY6UpJj2+3Yaisp18iYaF8gNl15rjMiT4ZRxMP7W5DKJxebai7SMZsoSnGxKXFIWCbwb
 +KlAd73sf3jhMCXSiUnYDHjCJcOGBVvG2jM505n2EpC4UC1PSC7cqTmKFdIPDsjPU9tc
 Hg10BIV0sogdIgHsehM1krukocI28DV/tpUv48aFQfo3DoriMhcMThlebTGuvwYCJH8m
 3TNQU+vjR+1+k2I9eanneHzOj5L67XqAmLq+f39pQkiHU66ttOlEqrwYYFqvXAb/gZOU
 rFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iFs6emz6fGf+xQlicgZNk8cNGLeirUVE2ipQ9bTFfcw=;
 b=HZaz0icJV+eJ8DN54P7eP30amZLruPwdR46o+/YMBROgHH89JcxaQyC8d3TbLMDFLI
 GJNI2wXZsRUum71LltU3IA3NBpC++w2BRs/9dADkczS1PNs6qeRoi8NnFwhAXtMOYjEc
 bOjlqjNeeBSEjm74v3n9LRPL5F7glxxdrjCPgY6lf7rSBwpeLD24jv03330xEEKwVVuc
 7jFY/neMAIgGYn0OfWcBQV7UInmUW5TniKKDsgfdI2OQc5JhEsMA3hSE73e0lArTUjpK
 KJ3v3nG6iFNe6fRMhETAk8v21G2mu+Lv5JiALm2/iHF5ffqBZEVqQ9u1BlxGQyt8Vqfa
 omhA==
X-Gm-Message-State: AOAM530Dz9z0KIff1JFLQgjDyoK9JWZhX6FbqZidSbm+UXx6MVjffY1B
 BTjVp7tD9LrjNle0TQS7Jm3lsV6Qh20=
X-Google-Smtp-Source: ABdhPJzkPqUkQ1uXLcrzZi6wJc+XcPTs1T76h+i/YCMijhTTitA50sxHBC+r+WLOjkynRu1NOTrjUQ==
X-Received: by 2002:adf:a551:: with SMTP id j17mr30236535wrb.217.1602506997537; 
 Mon, 12 Oct 2020 05:49:57 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id p21sm23516472wmc.28.2020.10.12.05.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:49:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/3] hw/ssi: Rename SSI 'slave' as 'peripheral'
Date: Mon, 12 Oct 2020 14:49:52 +0200
Message-Id: <20201012124955.3409127-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- Fixed patch #1 subject (Kevin)=0D
=0D
In order to use inclusive terminology, rename SSI 'slave' as=0D
'peripheral', following the resolution Paolo pointed in [*]:=0D
https://www.oshwa.org/a-resolution-to-redefine-spi-signal-names/=0D
=0D
Candidate to be merged via the ARM or Trivial trees.=0D
=0D
[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg739108.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/ssi/aspeed_smc: Rename 'max_slaves' variable as 'max_peripherals'=0D
  hw/ssi: Update coding style to make checkpatch.pl happy=0D
  hw/ssi: Rename SSI 'slave' as 'peripheral'=0D
=0D
 include/hw/misc/max111x.h   |  2 +-=0D
 include/hw/ssi/aspeed_smc.h |  2 +-=0D
 include/hw/ssi/ssi.h        | 56 +++++++++++++++++++------------------=0D
 hw/arm/spitz.c              | 32 ++++++++++-----------=0D
 hw/arm/stellaris.c          |  4 +--=0D
 hw/arm/tosa.c               | 12 ++++----=0D
 hw/arm/z2.c                 | 14 +++++-----=0D
 hw/block/m25p80.c           | 14 +++++-----=0D
 hw/display/ads7846.c        | 12 ++++----=0D
 hw/display/ssd0323.c        | 12 ++++----=0D
 hw/misc/max111x.c           | 18 ++++++------=0D
 hw/sd/ssi-sd.c              | 12 ++++----=0D
 hw/ssi/aspeed_smc.c         | 53 ++++++++++++++++++-----------------=0D
 hw/ssi/pl022.c              |  2 +-=0D
 hw/ssi/ssi.c                | 48 +++++++++++++++----------------=0D
 hw/ssi/xilinx_spips.c       |  7 +++--=0D
 16 files changed, 152 insertions(+), 148 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

