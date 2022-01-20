Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94649440D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 01:16:13 +0100 (CET)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAL7b-0007AT-Td
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 19:16:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAL4K-0005kq-LA
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:12:51 -0500
Received: from [2a00:1450:4864:20::32f] (port=55092
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAL4I-0004dT-LM
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:12:48 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p18so8412217wmg.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 16:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CbyD+c45d/ivXeKj0y9Zf11/liGTcZ9Tcg0XRqyvNfk=;
 b=SFzH9LFMPWJ6y/8ZvJcb2rpeyxJWKHnMUQCVX4eJIs8nH2xZMJVDFPBfxWZpfkoi7u
 0JMtS67p5TIrAMFBTqwf3uNI4pCC/T88h3tsDZymuypTnqZmAtHowbrOqfDbliZPWzhr
 W6SBnbXl1N0uH1uwZ5r4ypxmID3CfuycKhS6JJArDxvNPtBsUEmJDpVUSbeuAiHCgHv7
 YMdTnNTG8z53i9h1SNJroZJ2IW6Sqs+7a+TlDZdNRkkluQYNy3oaYR3haS96eWRvV/jH
 RgvMty4Pc4h7y9VOeay/z928DPB225K3Oyp43NZz0cmnzB1g1deQvs+/rvSHlZujqDPU
 EuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CbyD+c45d/ivXeKj0y9Zf11/liGTcZ9Tcg0XRqyvNfk=;
 b=HDvLGNA/3m2ff6S0hzsOg0R3AjWLkYQUJh9xFUbwGzoq8Qg03/iDSDgJGwggkrAbxJ
 HJ0z4ijEZj6a9aGsm2pMFRd50QVo+sE4kU3+BR6S4B1iI1Y8byfzvApd7wr1gLOZpdt8
 j0/KFytsxUZdPnC2o+3UUUwIQNowZrsmPr1CUi5ez9PYlI8ivhuvhiwBQuLWEME1p4J2
 FxF6VF/k0pQWOtFSPxwSKYRvioS1/jVnVBBHJQcEswkrUcxIOOkiApfNUAW/HRjRCD5H
 R7c33GzDR3nvU6/nWoK5BgjcmqKUshSN9SCPRServw8P91V8sk250r1OThNKLKZ2WnLR
 4I+Q==
X-Gm-Message-State: AOAM531MuwXzBh3Qrx7DeNV63GPd6wtLG9azKX/FhgOahPPDX09m4Oxk
 8SKuSYlucu3BXo1SAUe12OyCgAfVpk8=
X-Google-Smtp-Source: ABdhPJzhYTodaxMVXFKtjNC47NRME2jKxbpAEU9kBQtss5L+coU9+OphrD0EglKvrs0W0pPe/8YWtw==
X-Received: by 2002:a5d:64ad:: with SMTP id m13mr30432394wrp.410.1642637564751; 
 Wed, 19 Jan 2022 16:12:44 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g7sm1013171wmq.28.2022.01.19.16.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 16:12:44 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 0/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Date: Thu, 20 Jan 2022 01:12:40 +0100
Message-Id: <20220120001242.230082-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

This is a respin of Eric's work, but not making tpm_crb.c target=0D
specific.=0D
=0D
Based-on: <20220120000836.229419-1-f4bug@amsat.org>=0D
"exec/cpu: Make host pages variables / macros 'target agnostic'"=0D
https://lore.kernel.org/qemu-devel/20220120000836.229419-1-f4bug@amsat.org/=
=0D
=0D
--=0D
=0D
Eric's v2 cover:=0D
=0D
This series aims at removing a spurious error message we get when=0D
launching a guest with a TPM-CRB device and VFIO-PCI devices.=0D
=0D
The CRB command buffer currently is a RAM MemoryRegion and given=0D
its base address alignment, it causes an error report on=0D
vfio_listener_region_add(). This series proposes to use a ram-device=0D
region instead which helps in better assessing the dma map error=0D
failure on VFIO side.=0D
=0D
Eric Auger (2):=0D
  tpm: CRB: Use ram_device for "tpm-crb-cmd" region=0D
  hw/vfio/common: Silence ram device offset alignment error traces=0D
=0D
 hw/tpm/tpm_crb.c     | 22 ++++++++++++++++++++--=0D
 hw/vfio/common.c     | 15 ++++++++++++++-=0D
 hw/vfio/trace-events |  1 +=0D
 3 files changed, 35 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

