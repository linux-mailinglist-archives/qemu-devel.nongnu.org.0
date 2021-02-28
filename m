Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415433274C9
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:26:13 +0100 (CET)
Received: from localhost ([::1]:35214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUVw-0007vR-7g
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTA-0006gI-R7
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:21 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUT9-0005US-6G
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:20 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a18so5912380wrc.13
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 14:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SUtqrAZKnuy98eV2gBiLf2qJEsW3ou+ojqWe83oSNuM=;
 b=If+bS6AX7gu9nMjGsEBCakIM53PObndTz8BObUjVEdJhPjgebrfsFANppZf28UpH/T
 Vc912gfaL4c0f7V6QWU9mGl786HdQOWSzPF7tDAkO/LKrBuZkWO8A4BSxJ9VTLpNis9L
 xE30mVggMcaXBhT4GJkyLHkrLxEKlPUFd8YJfIzKudMugas/XHjn+MifoeMWIAriNbnI
 j85Hbd2MMXdL849OTGgctPOGO4hFIcn5aZp99tXwsp7uXetu+suvCiXOsmRFlHr6Avxk
 vpRyVWRglEL8gPpkpviT31a1v16V5iRJmkcXDzfVcg+EcpGTxmTbBoO6QA2HZkNp5t9B
 iasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SUtqrAZKnuy98eV2gBiLf2qJEsW3ou+ojqWe83oSNuM=;
 b=gR1HehO4sB5uPXTaTsGnO/sUNWG8Ww8bfrsQTJ8jSztGQA13lsJ6IGFbzsotialVll
 2lDXTSpsWCTfO1ZKLOov+kGyLKUMpg+GGEJ3sVN/OM/j1h9A5hn2cdxBSnpKXO02i6tc
 yshZoDdDp6ZamE2ojstRZeYJPZyyGy4REldkxNiK1SzQX4AkuCbkJ2aPVvW1D3MhQMtN
 7zTHfdJdms1cKMH5lJlfKpncF6CHHEYTk3vC61o5sDVo1sJR53eDb5Q+v1EtY4tDEX57
 Yf/FFxbN0uyzo2W9r9LSgRnj69luY64vcS8cPTasZeIW3UUt+a50kRpCjMWMkCGIeian
 niFA==
X-Gm-Message-State: AOAM531/qvM11pDnVFoehODTaLiGY1cDjnEPGrFD0x+fkg7p/SoFeS/8
 sXZgukQUP+E7asEfICcr7ewSMpM7qLk=
X-Google-Smtp-Source: ABdhPJzT78g22IIhaxEPpd60ic7VfYhM2AwF98YeSH+7Cc41fCg5KblQiV1I/4n6qR2JRPw0lScf0A==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr13506024wrq.201.1614550996851; 
 Sun, 28 Feb 2021 14:23:16 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u4sm14953663wrm.24.2021.02.28.14.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 14:23:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hexagon: Add Docker image & testing to gitlab-ci
Date: Sun, 28 Feb 2021 23:23:10 +0100
Message-Id: <20210228222314.304787-1-f4bug@amsat.org>
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is a rework of the 'Add Dockerfile for hexagon' patch=0D
from Alessandro/Brian that Taylor sent in v8:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg780330.html=0D
but adapted to mainstream.=0D
=0D
Gitlab shared runner are usually capped to 2/4 cores and timeout=0D
after 2h30 to 3h. We need a beefy custom runner to get the image=0D
built and stored in the registry. For now the image is added in=0D
manual mode, hopping we'll have magic runners added some day to=0D
build the image, then developers can directly pull it from the=0D
registry.=0D
=0D
Alessandro Di Federico (2):=0D
  docker: Add Hexagon image=0D
  tests/tcg: Use Hexagon Docker image=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  gitlab-ci: Pass optional EXTRA_FILES when building docker images=0D
  gitlab-ci: Build Hexagon cross-toolchain=0D
=0D
 .gitlab-ci.d/containers.yml                   |  11 ++=0D
 tests/docker/Makefile.include                 |   2 +=0D
 .../dockerfiles/debian-hexagon-cross.docker   |  23 +++=0D
 .../build-toolchain.sh                        | 141 ++++++++++++++++++=0D
 tests/tcg/configure.sh                        |   4 +=0D
 5 files changed, 181 insertions(+)=0D
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker=0D
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/=
bu=3D=0D
ild-toolchain.sh=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

