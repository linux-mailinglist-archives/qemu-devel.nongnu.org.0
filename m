Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3475D35DC44
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:13:14 +0200 (CEST)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWG2i-0007IC-Rg
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWG1F-00063i-SS
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:11:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWG1E-0004hT-7N
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:11:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e7so6876986wrs.11
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v2ZW8nmI+4ZxdZ8EyG2Dj+43IFxvxj9PfBOQppJZkfo=;
 b=IoaEWEWv4BEamDm58aL9KvOLx2e5N1Rg1GOlETzGIy2gtckn2S74q6q/aNora67aRx
 K6IAdBKWV9Vz4czwnW9+YSuQuaXJ0wx+SlmUNMhmawuQBRrqaXpWf3budbtfIhEztCQ4
 MUqr6m+RW5mDRFU2ttErw8zkepYCTh//5UPK3spU/4tTqvIL1ZpSdRbMMIbcpNdgl7Bn
 HYgvVP3UaGPf8lKUlpu9ArGjdxucnZ7J1uFnprBn3AWKpf/CgUuyC3Hmk1BKAi4Y9/9C
 a/QE/tPIuGc6sATHP95M2vYl79+juzLtJwDTb5Iqt0cfwexDSld7WZDzaR3IEQ9fvAKJ
 qLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=v2ZW8nmI+4ZxdZ8EyG2Dj+43IFxvxj9PfBOQppJZkfo=;
 b=Xrf7JZxx6E83P8oEgnGQr57mumy0Yocr4fvt/nHOm4hlS48PbLQrFFb+71H6u3Gi6I
 oR19KV2GAXWfMPizqn6TmsrqnuMB4w3xahn4trXec4FiGelrSUmIe+UyaIC1M56RbjrK
 fJ84CUg6PpNIaQA4/CG+erNS9U2Sh6AtDqg/SCCVG/W6eQYc92eOCL7u0kVRyTl8w8EZ
 K1iHGlpDlAcn75G11jhfgLA50CvOxxCgIg9fjRnCItWdKjwiKFrYWQj9iH+GJIFmHnFf
 W05dMEbNWUwj1mNSqXVMwaQwImf6hsLOOW1tWLEcHvZkY2UZmW3x1GRszBbdsLsCV1ta
 4gWQ==
X-Gm-Message-State: AOAM533XzcNbVLKhP8yhyJxUvejIc8mbDVmTa11lgNe8rXwVKFBQ1AGC
 LCuhPEfTNvRDuhkEQqGD2M31U3LOEc8=
X-Google-Smtp-Source: ABdhPJzOIZpXd+TRF1leU19moGTrKEuR4zNoU7BO4+rxuIYgtNPM4mOJDlmoWH0ufY52kvHnNgRrSA==
X-Received: by 2002:a5d:444d:: with SMTP id x13mr11490025wrr.406.1618308698580; 
 Tue, 13 Apr 2021 03:11:38 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u9sm1858165wmq.30.2021.04.13.03.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 03:11:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] MIPS patches for 2021-04-13
Date: Tue, 13 Apr 2021 12:11:28 +0200
Message-Id: <20210413101131.3480173-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620=
:=0D
=0D
  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210=
412' into staging (2021-04-12 12:12:09 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20210413=0D
=0D
for you to fetch changes up to f4349ba966abfe39f5d98694abd7c7551d5c8c02:=0D
=0D
  target/mips: Fix TCG temporary leak in gen_cache_operation() (2021-04-13 =
12:07:00 +0200)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Fix invalid Kconfig dependency=0D
- Fix missing migrated value=0D
- Fix TCG temporary leak=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM=0D
  hw/isa/piix4: Migrate Reset Control Register=0D
  target/mips: Fix TCG temporary leak in gen_cache_operation()=0D
=0D
 hw/isa/piix4.c          | 15 ++++++++++++++-=0D
 target/mips/translate.c |  2 ++=0D
 hw/isa/Kconfig          |  1 +=0D
 3 files changed, 17 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

