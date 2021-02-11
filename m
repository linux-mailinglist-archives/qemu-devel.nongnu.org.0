Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B4319594
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:09:53 +0100 (CET)
Received: from localhost ([::1]:59556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAK9o-0006bb-Vm
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lAK2B-0000Ct-9y; Thu, 11 Feb 2021 17:01:59 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lAK29-0005oC-E5; Thu, 11 Feb 2021 17:01:59 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s5so8542625edw.8;
 Thu, 11 Feb 2021 14:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8+iI/+Z9J+ZDOLFxZ6z+8rZu4lnX/3m7j7mn/EsgaLY=;
 b=Y5yOgEWaw15xDvaMStwj1Zp2rn69iHFcyd+XBN80YQ/mhJ3VKQ8H9h1Hw7hUayAcZi
 wKgM8goBNWmzX2hlWdXU55h37YkUMDrBzNqQBPIQ+j0dHf3Bl1HMRp45UvbZPXyyvD+e
 Hn9CeBtZHOLJ0S4G7RNY17ywk/apyHDD0IU3hyuF4iK1Q1XqIKSU7iRbWXxFJmalsRhO
 eQZO6f/fk7sqc+ysfrF0i6wxvogNLqdSa2uk5sYghoqhoSiIMS5dPQaVK3bewngMdmYH
 PmHKbR5yy8Z/j2NFkqzAMPXZG7We7pKXPlHrT1EznRreANJ+dAzDsd5wYo2IfEb+vzOV
 8Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8+iI/+Z9J+ZDOLFxZ6z+8rZu4lnX/3m7j7mn/EsgaLY=;
 b=B4ruqWGYITMtfsYVIHt4hlcxNoCP4PNWW9cMsjCpYRbvb0Qmp37huDSQI6FgV6IQG4
 +tJQFYJzh3PmBpzinrgIHn8GBDnBfxYossxf6XEs6cxQ6aXUnLmCJnyElS89LghhYMqF
 pFjsngHr1n8v7JVONu6LOabr7JhiRpphU1DrBBfEv8yQBfWLP9TPZp0AGKIYeLImOVCP
 ++y+o14ojqDiob+wE5c4Nkwxz48Q1ytL1Cjh52vNGS6oHPoFejaChJxuqu/MUdDmWPhj
 WN6mgNdFbHg0VjSy95/ro1MkOwXD/n3wLvJoMU6ZkzcOYloBAI/3V/IQbScHPno2HBrk
 hPkA==
X-Gm-Message-State: AOAM532n4LfdmRrb9z+yL2qGws1Hv392ogISpd2/sTiJICtIt6rXrUOs
 TegQoPS+zYYIJsq1ln6Sm0A4eGuOY3Y=
X-Google-Smtp-Source: ABdhPJyfC7u7cOXw2jkUSDQaKHsk6hXnhXlkSgz90zCk6W0zxt1Z5nCSOReBT23mbpTQkkm2ryHnsw==
X-Received: by 2002:aa7:c98e:: with SMTP id c14mr195347edt.213.1613080914879; 
 Thu, 11 Feb 2021 14:01:54 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-df14-48c0-797d-7ff1.fixed6.kpn.net.
 [2a02:a456:6be8:1:df14:48c0:797d:7ff1])
 by smtp.gmail.com with ESMTPSA id n16sm5496588ejy.23.2021.02.11.14.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:01:54 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
Date: Thu, 11 Feb 2021 23:00:53 +0100
Message-Id: <20210211220055.19047-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following are maintenance patches for the Allwinner H3. The first patch
is a proposal to relocate the binary artifacts of the acceptance tests away
from the apt.armbian.com domain. In the past we had problems with artifacts being
removed, and now the recently added Armbian 20.08.1 image has been removed as well:

$ wget https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
Connecting to dl.armbian.com (dl.armbian.com)|2605:7900:20::5|:443... connected.
...
HTTP request sent, awaiting response... 404 Not Found
2021-02-11 22:34:45 ERROR 404: Not Found.

I've now added the artifacts to a server maintained by me. The machine has a stable
uptime of several years, ~100Mbit bandwidth and plenty of available storage.
Also for other artifacts if needed. I'm open to discuss if there is a proposal
for a better location for these artifacts or a more generic qemu location.

The second patch is a fix for the EMAC that is used by the Allwinner H3 / Orange Pi PC machine.

Kind regards,

Niek

Niek Linnenbank (2):
  tests/acceptance: replace unstable apt.armbian.com URLs for
    orangepi-pc, cubieboard
  hw/net/allwinner-sun8i-emac: traverse transmit queue using TX_CUR_DESC
    register value

 hw/net/allwinner-sun8i-emac.c          | 58 ++++++++++++++------------
 tests/acceptance/boot_linux_console.py | 46 +++++++-------------
 tests/acceptance/replay_kernel.py      |  6 +--
 3 files changed, 50 insertions(+), 60 deletions(-)

-- 
2.25.1


