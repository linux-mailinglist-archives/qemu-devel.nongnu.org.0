Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0862B5D45
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:54:02 +0100 (CET)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keycb-00079B-Rv
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keyb7-0006Ce-JR; Tue, 17 Nov 2020 05:52:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keyb5-0005g7-9G; Tue, 17 Nov 2020 05:52:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id w24so2796475wmi.0;
 Tue, 17 Nov 2020 02:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pEJuCVwmCt2zZ/In8x4VrZhs33JuVzCReO8aBPMo014=;
 b=Kgv7Zyehm9XMk9GXh3yWPLrJCNCTzDA6oRydc3o1J7MkwMdgziOFPoRKEK8xJK49Nh
 zaiEKA4XsW8HCqp0YyZUOSJMOqxIEFnLMvpTbyKCKwAzYCPiGj+DrD36QvMFs5x+5vWp
 z2QMWbtkXIyjeVBZXe0yv0H8lt161C5QKLzSKmbXvohpoQd/RmipyDomxPHOdMyjIEJp
 pL3rCqu4NkkR8J7hDstD37IxskT9WiNTl8x1/hyAhiT7zML95WU1mt2vyiYUdgFf9EwU
 64/hlm0qGjOMrC8Sd9KoNb7WgeaYWe3h4CL+xszwYNdjaFF/3auWyBMo6qhB2MlYLaaW
 VABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pEJuCVwmCt2zZ/In8x4VrZhs33JuVzCReO8aBPMo014=;
 b=ZklcRHjZyJ7qnVpqOKZNVtjG+/JaeSc6fe8gnhu90qMTz0bytcHwNb2K+fxZO3hhOw
 Rom/dN4+PWX+BspsSXN73n6ANzfRBQHocsGtx5CPCfkbOaSBhJD7DihXG6nl51G0As3n
 QOh4tKGevXHG9ABaTfKXeAHplqt9d3+8D7ImYUbw1DGnzdY9elqm4Vk/OCvw92WwUg+0
 qlHACeUCVAUj2OyrPZnBaDRSiAsKy0x2TRHfPL+2F4JgxvTrXDGbrioD0yQlYaYDPKmt
 u0+qWc/dZMOSAX8amNxZCdVV5rIoT1vyAWfrQpCH1s5kPhcxhz78XhLSsSG3ctIKCuHG
 QrOQ==
X-Gm-Message-State: AOAM530PFr4ifYBkNIaqgGvvjZgT2NDa4o7RLkq/+00Uzyu/F/w2jRnQ
 nR30SZOxLSfa5tWkWTNZHiUP/rUN7tY=
X-Google-Smtp-Source: ABdhPJzeUV0cCHwQHiDNTijmQauZsUkqKuUkc+XYme7r0/SrhVvX6RYeIh+tOf7QTZw9qdvlxANFrA==
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr3563502wmf.76.1605610341983; 
 Tue, 17 Nov 2020 02:52:21 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t74sm3085935wmt.8.2020.11.17.02.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 02:52:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] SD/MMC patches for 2020-11-17
Date: Tue, 17 Nov 2020 11:52:18 +0100
Message-Id: <20201117105219.1185736-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cb5ed407a1ddadf788fd373fed41c87c9e81e5b0=
:=0D
=0D
  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-=
11-15' into staging (2020-11-16 17:00:36 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/sdmmc-20201117=0D
=0D
for you to fetch changes up to 575094b786e999e5fbd04c0456f518a5ebefab5b:=0D
=0D
  hw/sd: Fix 2 GiB card CSD register values (2020-11-17 11:45:13 +0100)=0D
=0D
----------------------------------------------------------------=0D
SD/MMC patches=0D
=0D
- Correctly handle 2 GB SCSD Memory Cards (Bin Meng)=0D
=0D
CI jobs result:=0D
. https://cirrus-ci.com/build/4688743904837632=0D
. https://gitlab.com/philmd/qemu/-/pipelines/216829732=0D
. https://travis-ci.org/github/philmd/qemu/builds/744026099=0D
----------------------------------------------------------------=0D
=0D
Bin Meng (1):=0D
  hw/sd: Fix 2 GiB card CSD register values=0D
=0D
 hw/sd/sd.c | 15 +++++++++++----=0D
 1 file changed, 11 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

