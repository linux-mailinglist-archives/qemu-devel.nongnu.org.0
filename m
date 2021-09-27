Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C074198F2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:35:06 +0200 (CEST)
Received: from localhost ([::1]:49110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtar-00050j-13
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXJ-0002Dg-Ta; Mon, 27 Sep 2021 12:31:25 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXG-0002MJ-31; Mon, 27 Sep 2021 12:31:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d21so52865596wra.12;
 Mon, 27 Sep 2021 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kZ3NPq8xSonogV+AXQCkWFGHjkGa33MIFajlqwGAQQA=;
 b=lKaM+KUBVh0vOEoo40ZKt2TRZojBQXgCD2ZbdaLBqZpNqKY2wa6EiliZ71AjSCnbQ5
 rBbG0pzmrvM3R0kEiOPPCQOQBQ2FdwpXyR/y2wd06s3TzKQaMYu9n+KBwlrY8+mMJYku
 uLADpbtkYOFdlgot0XYvH3e1xXt40rnkxKb1ITZNX8G19fnVJE7jVy0t04IMdXn+nOR+
 QV1MRwb0XiteqHE/SSiN+k9P2ktAoXbD/GgkKF6/dswSHQYL2S9BCifzWHrYvXhry+u9
 7x8Q8L0rYmQPiZgPJUm17VcDWnIpwGjqt+h90B19QujUuyLZk5sVGSaie9aHB8zd2TOC
 OLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kZ3NPq8xSonogV+AXQCkWFGHjkGa33MIFajlqwGAQQA=;
 b=OMTcmRUWx0+DZceZMugB54/fZcWO1lPdOuWoFtlEva4jlal0uUxV/ZXcEcXhiea+JZ
 BBanFS/11XM6nWHp7zTZ/VOoV6nrGb3zXT6vlDXHh+y1QXULVkpqfUiyY0IHmFs64Lv7
 2xmNDZbNjfbRJHhFyxOtdfGZoIDk2xt/7C+kGS0K5UXwmddEITSDaUMAih5tRpikFmHj
 mv4pv4VVjOhW3+LDjkP6oWNVj7DCZ/xOAkLN0EjWRZ8KuQfMBBoEXE4dn1n6i6WLyMaA
 tDF3qKiJ8WFtaY02xV7ibUuUCbv3r5NbnhSBK9vkFXbZzlTAwizfJGXMzPC6dhugnG1B
 buJQ==
X-Gm-Message-State: AOAM531rD+QKo7Prq9ot5/zGLOxqDIq6SMyCzZW69cqAONogSwNajq4i
 oPPLrXH59zHO7MpiMSGce6Oda57Ox3Y=
X-Google-Smtp-Source: ABdhPJywN/nhBJCF1yeUZaUCjwkhN3av7QC1HrQ6VQBKPz2Q4hwipqUDjFRYApsDrt1E0eaMZ+YLxA==
X-Received: by 2002:adf:d4cb:: with SMTP id w11mr885288wrk.125.1632760278730; 
 Mon, 27 Sep 2021 09:31:18 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w5sm9484696wrq.86.2021.09.27.09.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:31:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] tests/acceptance: Add bFLT loader linux-user test
Date: Mon, 27 Sep 2021 18:31:10 +0200
Message-Id: <20210927163116.1998349-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v3:=0D
- rebased=0D
- addressed Wainer review comments from v2=0D
- rename avocado_qemu.Test -> QemuSystemTest=0D
=0D
Since v2:=0D
- rebased tests/acceptance/avocado_qemu/__init__.py patches=0D
- extract has_cmd() from virtiofs_submounts.py=0D
- check cpio availability with has_cmd()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  tests/acceptance: Extract QemuBaseTest from Test=0D
  tests/acceptance: Make pick_default_qemu_bin() more generic=0D
  tests/acceptance: Introduce QemuUserTest base class=0D
  tests/acceptance: Share useful helpers from virtiofs_submounts test=0D
  tests/acceptance: Add bFLT loader linux-user test=0D
  tests/acceptance: Rename avocado_qemu.Test -> QemuSystemTest=0D
=0D
 tests/acceptance/avocado_qemu/__init__.py    | 158 ++++++++++++++-----=0D
 tests/acceptance/boot_linux_console.py       |   4 +-=0D
 tests/acceptance/cpu_queries.py              |   4 +-=0D
 tests/acceptance/empty_cpu_model.py          |   4 +-=0D
 tests/acceptance/info_usernet.py             |   4 +-=0D
 tests/acceptance/linux_initrd.py             |   4 +-=0D
 tests/acceptance/linux_ssh_mips_malta.py     |   5 +-=0D
 tests/acceptance/load_bflt.py                |  54 +++++++=0D
 tests/acceptance/machine_arm_canona1100.py   |   4 +-=0D
 tests/acceptance/machine_arm_integratorcp.py |   4 +-=0D
 tests/acceptance/machine_arm_n8x0.py         |   4 +-=0D
 tests/acceptance/machine_avr6.py             |   4 +-=0D
 tests/acceptance/machine_m68k_nextcube.py    |   4 +-=0D
 tests/acceptance/machine_microblaze.py       |   4 +-=0D
 tests/acceptance/machine_mips_fuloong2e.py   |   4 +-=0D
 tests/acceptance/machine_mips_loongson3v.py  |   4 +-=0D
 tests/acceptance/machine_mips_malta.py       |   4 +-=0D
 tests/acceptance/machine_ppc.py              |   4 +-=0D
 tests/acceptance/machine_rx_gdbsim.py        |   4 +-=0D
 tests/acceptance/machine_s390_ccw_virtio.py  |   4 +-=0D
 tests/acceptance/machine_sparc_leon3.py      |   4 +-=0D
 tests/acceptance/migration.py                |   4 +-=0D
 tests/acceptance/multiprocess.py             |   4 +-=0D
 tests/acceptance/pc_cpu_hotplug_props.py     |   4 +-=0D
 tests/acceptance/ppc_prep_40p.py             |   4 +-=0D
 tests/acceptance/version.py                  |   4 +-=0D
 tests/acceptance/virtio-gpu.py               |   4 +-=0D
 tests/acceptance/virtio_check_params.py      |   4 +-=0D
 tests/acceptance/virtio_version.py           |   4 +-=0D
 tests/acceptance/virtiofs_submounts.py       |  59 +------=0D
 tests/acceptance/vnc.py                      |   4 +-=0D
 tests/acceptance/x86_cpu_model_versions.py   |   4 +-=0D
 32 files changed, 235 insertions(+), 153 deletions(-)=0D
 create mode 100644 tests/acceptance/load_bflt.py=0D
=0D
-- =0D
2.31.1=0D
=0D

