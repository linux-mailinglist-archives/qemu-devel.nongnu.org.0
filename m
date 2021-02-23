Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7AD3233FD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 23:59:08 +0100 (CET)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEge3-0006fx-PG
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 17:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lEgZ5-000284-Sq; Tue, 23 Feb 2021 17:53:59 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lEgZ3-00021V-Ka; Tue, 23 Feb 2021 17:53:59 -0500
Received: by mail-ej1-x636.google.com with SMTP id lr13so49196ejb.8;
 Tue, 23 Feb 2021 14:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hwxfonhHlGFVx69kT9RP5//Gc3YVzhRRMlYFkTlWsyY=;
 b=RMIoNMAj5pvhLus3GS4TMqkh9kjPlMPYPoFXuexUpEli92lmC3s4P3DELoV4F/YYAO
 7FA7Dr7ECmWQGcBxDklgkGp7ZH1sNPsd+VYJVmJtwC+vESFLzcWp+017DUGgrvSjU7lb
 vtzAuBVtgQZKaWZ9rA/D17tHyjXT2kuc3xTOWBE2BrvM6RbarWrmAgzOWkONwJZ3XSCa
 +luKXilpCtfO69kiR4oA6uxdUstKFRWF32p/YoQP9+4yofDy5GqP+E71SUUmE9zKnm0M
 O8MyhuaNCEH/rQi9E6Yb2AqWxjj1yH2HlSMq3rrVnmw2Ql5dml5NOjoCV0dAZF/G3896
 HNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hwxfonhHlGFVx69kT9RP5//Gc3YVzhRRMlYFkTlWsyY=;
 b=QXw0mD3uQ8ucgezDX3DOVvtzlltnr5G7di3p1TTdi1Uj6Y4QGuegigEfxnEembr7Ly
 WEpy6r69dy8y9Jm4Dh0AEm1cN8JW5a9K1Z3bOVmt5hb5wiqrFd4ZLhtZQWmAEHPC5PBa
 RDwAgP01YgzhFPqiU5Bn8IKcJnMn/EXmzTcIaLyA0+6Crvkkcg4HIv/cPiM4qrbXlXtW
 y0HAOVowmOJ99Q+w22UGyVNnthUY+kg/csTW0k4gCgaMDUdV6n9UNz7cN+eXjIaev2Ec
 GjugoYUvBcNQUzmvj05nuswLXjMdNMoc7nt4iUGZX4NbUHV7g/iO1ki6cTV+m53OzkxI
 UBPg==
X-Gm-Message-State: AOAM530yBDIRizkXtxoXVkaTzXc4I1Sy0vVVSvlyjRY0mSxVHcDKUiOO
 JkrWfEbnWXlVdTrDQ6zT/yVSyN+IYl8=
X-Google-Smtp-Source: ABdhPJzcXKaMdl9K+Yix1t1MIn7CNJ9NSJrunoe3c0MHm2szaJPc4Drf6ScbdFQu0uluPDOQ7x43hQ==
X-Received: by 2002:a17:906:774d:: with SMTP id
 o13mr26426072ejn.70.1614120835104; 
 Tue, 23 Feb 2021 14:53:55 -0800 (PST)
Received: from localhost.localdomain
 (2a02-a456-6be8-1-9f7b-4035-6320-cb66.fixed6.kpn.net.
 [2a02:a456:6be8:1:9f7b:4035:6320:cb66])
 by smtp.gmail.com with ESMTPSA id u15sm55752ejy.48.2021.02.23.14.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 14:53:54 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Allwinner H3 fixes for EMAC and acceptance tests
Date: Tue, 23 Feb 2021 23:53:25 +0100
Message-Id: <20210223225327.26700-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x636.google.com
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

I've now added the artifacts to github as a short term solution:
  https://github.com/nieklinnenbank/QemuArtifacts

The second patch is a fix for the EMAC that is used by the Allwinner H3 / Orange Pi PC machine.

ChangeLog:

v2:
 - added Reviewed-By tags
 - changed URL for artifacts to github.com/nieklinnenbank/QemuArtifacts

Kind regards,

Niek

Niek Linnenbank (2):
  tests/acceptance: replace unstable apt.armbian.com URLs for
    orangepi-pc, cubieboard
  hw/net/allwinner-sun8i-emac: traverse transmit queue using TX_CUR_DESC
    register value

 hw/net/allwinner-sun8i-emac.c          | 58 ++++++++++++++------------
 tests/acceptance/boot_linux_console.py | 49 +++++++++-------------
 tests/acceptance/replay_kernel.py      |  6 +--
 3 files changed, 53 insertions(+), 60 deletions(-)

-- 
2.25.1


