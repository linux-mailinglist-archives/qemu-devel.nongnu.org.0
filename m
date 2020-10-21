Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C14294B7D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 12:52:19 +0200 (CEST)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVBj8-00066N-EN
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 06:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kVBha-0004sz-7M
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 06:50:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kVBhY-0000bh-4j
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 06:50:41 -0400
Received: by mail-wr1-x444.google.com with SMTP id n18so2530492wrs.5
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 03:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aRi4yxGHxJMjWj+a3RYEFO3OTElqHl7OZ1xj3cdSFVI=;
 b=GjvgNUaX99trRaNwXa5YF5zSnMGTYy6yR9xZiSz293oRw8n1I1d3IFZLQwACrj34at
 lyKcE7iKDdtU0OmprjDz9rwvYKr1BHUVJD+8kxsuzt/DLGafEgQ12yan2kbi1h5aFl7U
 6zOaV1TcU17OKj71It5yDRFPcHWkhHqeBd5DrjcabmQWZ7KvewaiP6qDYn9k2w47glgu
 sE3eSULC2jo3GCeYaF9BTcfG55CeucSU3KDH73vylvRs1VMw2IQJWiIwe/VZ2J6lctky
 nVuK/eQzgClPFr/SIo30atgUD6hrwN6uu72BuISQlgmUwJFB/O2HCNYjg7aazdDAij0G
 x16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=aRi4yxGHxJMjWj+a3RYEFO3OTElqHl7OZ1xj3cdSFVI=;
 b=B1oss5+sXIh0WFET3c+nl3P6xxDSTA++AMVombQCi1RRwxKzzatucPRNhpJpKD/fXR
 k8qtBhuWuS17U/T1+Wi6Paw38pIRZNufRxFrLRQJ+U2XqE9VyTvtzU1GWh5QdEKx8peY
 PPA/hMaQSYq28cgPjTH3o+PeNJSBlViiL0Pv1UQJcALqcRgMQ3F5REV+xx2SwOzyPkG5
 N8NcAUkTA2iZFs78Zkze5xbtfAMD8rOWrtfX4dRdgsl6phcSfaTMqLVPTfazZeCUMeWb
 pQoFwphJcyFAtDQ5UTJWmvHHC6IxBwv8NaoZ2miGlIUqpR5uRAA58Ua665ru7BL0OcJH
 meNA==
X-Gm-Message-State: AOAM533XkJzbIKxWouimfgSdREem9jNKi+KaARRQ8YQvOV8Gy3m23I+b
 ApO7QMHzEDvBDH/TIRa3Pe8PgPosISo=
X-Google-Smtp-Source: ABdhPJzD/Ty0bOHlpyCDIMHKKl+uDfRAMxXfQVEI81K/B4hnF3c8TnOYKfDcZMjBSxpzhlTfB3lqWg==
X-Received: by 2002:adf:b19c:: with SMTP id q28mr3887890wra.119.1603277438245; 
 Wed, 21 Oct 2020 03:50:38 -0700 (PDT)
Received: from localhost.localdomain (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id m12sm2989889wrs.92.2020.10.21.03.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 03:50:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] tests/acceptance: Test the Fuloong 2E machine
Date: Wed, 21 Oct 2020 12:50:29 +0200
Message-Id: <20201021105035.2477784-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Huacai Chen <zltjiangshi@gmail.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Cleber Rosa <crosa@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series add tests for the MIPS Fuloong 2E machine.=0D
=0D
I have been using these tests for over 1 year now.=0D
After recent discussions with Huacai and Mark regarding=0D
how to contribute tests for machines using private blob,=0D
I think it is time to publish this series, to see how=0D
the final part will be discussed, as it tests a blob=0D
which Lemote company doesn't publish the sources. The=0D
binary is know to work and has been used for various=0D
years on real hardware. Its MD5 is also know (I am not=0D
using SHA-1 because it has been published with MD5).=0D
=0D
The idea is to be able to share tests without infringing=0D
licenses issues.=0D
=0D
Please comment :)=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  tests/acceptance: Remove unused import=0D
  tests/acceptance: Use .ppm extention for Portable PixMap files=0D
  tests/acceptance: Extract tesseract_available() helper in new=0D
    namespace=0D
  tests/acceptance: Introduce tesseract_ocr() helper=0D
  tests/acceptance: Test Linux on the Fuloong 2E machine=0D
  tests/acceptance: Test PMON on the Fuloong 2E machine=0D
=0D
 MAINTAINERS                                |   1 +=0D
 tests/acceptance/machine_m68k_nextcube.py  |  51 ++---------=0D
 tests/acceptance/machine_mips_fuloong2e.py | 101 +++++++++++++++++++++=0D
 tests/acceptance/tesseract_utils.py        |  46 ++++++++++=0D
 4 files changed, 158 insertions(+), 41 deletions(-)=0D
 create mode 100644 tests/acceptance/machine_mips_fuloong2e.py=0D
 create mode 100644 tests/acceptance/tesseract_utils.py=0D
=0D
-- =0D
2.26.2=0D
=0D

