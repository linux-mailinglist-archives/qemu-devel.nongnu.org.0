Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B03F9433
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:09:50 +0200 (CEST)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJV3l-0004ku-RY
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJV2M-0002Yy-2s; Fri, 27 Aug 2021 02:08:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJV2K-0004t3-E7; Fri, 27 Aug 2021 02:08:21 -0400
Received: by mail-wr1-x430.google.com with SMTP id n5so8583154wro.12;
 Thu, 26 Aug 2021 23:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n5MWTd/k8xEuf1Dv83EzRuhLKkCGNLEizr7TqZHxSF0=;
 b=AtHd6PHrmxAUo6mzovs1lwyQUZfNPUF86TsyXnCFrS7fx0KFLxGdOJdW10tVJixOdl
 KyrZS5sY3sac0hT7voDTSwOQ1VGF7MENQs4p5AgUP71chKaFKAFyxOu9aSNZsq6mWWLy
 AvtYDuNOqQj8SxKx1cY4julEsv5HifZ9BTFkNazMyMPK8xeiw/3Ri2knk+/Rd4g3q8+G
 FkUcxx2bUP8kjtYq9SjleGTKVriFF1f2RreDkgyISNnXsDac0EjkdrNk1ug1oQ8o2egp
 zGjLsWjF50nmiaEb7sgdtg2CesigtvAmr7SLPTPMN5J4mi7Ia2CZYUEbLyokPtAK8Uxt
 62nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=n5MWTd/k8xEuf1Dv83EzRuhLKkCGNLEizr7TqZHxSF0=;
 b=AhjI7ljPzBSgQbC710L1tY9wc1RIz6DR9Z9kQC9KWZdkRIlsVj/z1PsQ+c9kvE1r/X
 qxH3daxS9CCuHsAQFu+xsj97j6rJWFeBGRQDuVY7FqfmTjrHSfsDimTCZukNTNaas7mX
 b48A4Xi56JpDo3GY2tfVLTMffSgkI+dob5K882y/6ZaHH0FInm9p5/z9IBDmSDKyHsxP
 668tI37Sh3u/wnkj9zFgc+1G3iwWNFJLqyU+uY8BvmGEW/ffO5wfUt+ja4NgGPFEKJ3F
 AldgPPGVK6r4t9w1VsvmAaOHu0Fj/a2i38lxBBfOeTKPDFDpKA1k8pHD0jToI/qi9hjg
 I0NA==
X-Gm-Message-State: AOAM531Vo4D9U2UrgR52P/hP0kdL77M+mUQYN3i8YQJZOi8rTCw7cz8J
 McrWgQrsPlVZm79mm4C2gQpzWJFkAzs=
X-Google-Smtp-Source: ABdhPJwk/PIdOR/wAy7XgDfh4S/H/MVgQ7PKTbmzOQsfxXT4D5MwdxF4aai4VNTGT7iWbDaogiMt5Q==
X-Received: by 2002:adf:8102:: with SMTP id 2mr7900657wrm.89.1630044497698;
 Thu, 26 Aug 2021 23:08:17 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l15sm5338103wrv.84.2021.08.26.23.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 23:08:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
Date: Fri, 27 Aug 2021 08:08:13 +0200
Message-Id: <20210827060815.2384760-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v2:=0D
- updated "Since 6.1" -> "Since 6.2"=0D
=0D
Peter reported CI failure [*] but I can't reproduce:=0D
https://gitlab.com/philmd/qemu/-/pipelines/360227279=0D
=0D
Since v1:=0D
- renamed tests (Peter)=0D
=0D
[*] https://lore.kernel.org/qemu-devel/CAFEAcA8PLvMUEzyu=3DsN4bn4mU30w1aajU=
+T+i__5jnB0QMZnqg@mail.gmail.com/=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests: Remove uses of deprecated raspi2/raspi3 machine names=0D
  hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases=0D
=0D
 docs/about/deprecated.rst               |  7 -----=0D
 docs/about/removed-features.rst         |  7 +++++=0D
 docs/devel/qgraph.rst                   | 38 ++++++++++++-------------=0D
 tests/qtest/libqos/qgraph.h             |  6 ++--=0D
 tests/qtest/libqos/qgraph_internal.h    |  2 +-=0D
 hw/arm/raspi.c                          |  2 --=0D
 tests/qtest/boot-serial-test.c          |  2 +-=0D
 tests/qtest/libqos/arm-raspi2-machine.c |  8 +++---=0D
 tests/unit/test-qgraph.c                |  2 +-=0D
 tests/acceptance/boot_linux_console.py  |  6 ++--=0D
 10 files changed, 39 insertions(+), 41 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

