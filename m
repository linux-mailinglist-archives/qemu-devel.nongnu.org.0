Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AE483E17
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:27:56 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fAh-00050Q-Mw
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:27:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4eeB-0005Uz-6x; Tue, 04 Jan 2022 02:54:19 -0500
Received: from [2a00:1450:4864:20::42a] (port=46694
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4ee9-0007Ce-G1; Tue, 04 Jan 2022 02:54:18 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i22so74365871wrb.13;
 Mon, 03 Jan 2022 23:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzbsMWai8j8riLLeml+W8h2WbRwev8PVj3x9mLpK8uE=;
 b=NLPrvKtyEiryPML5V88nXN+IUxyi8TqIPyX9+ucpKwhhDp4L0cqjn6uL8aPh34wrcr
 ee5hFxcrwzC6Pox0gIDGnFTjxboc0IiwpoqOsr2f5XPJnQLkfJpp9nDTmIefHV9S5027
 SwCsN8y56UDo3aOng/tak2ZcOmzXuM7XgKUClwxDyVwVGKCNeZTtJ4S1FvTKD1ED93KM
 vfhBa6ikCj3WtMt8gjsAQbrpzNTLkpEHVKqhlwo3VYVMdqfTRj2n/+lxvCsxznGfH8S+
 3H6dTJtVUUY1g4Kjjl6WJqFwfC8Liix36BVhQWMRiKYw4EXnL8FQzGD51k14jf06MBCr
 88Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PzbsMWai8j8riLLeml+W8h2WbRwev8PVj3x9mLpK8uE=;
 b=MXj3u4eE51+YWXTBohmYRa58M4ZoceebNLhUgeJHJmirYlzECY5Hee5vQ8cu40A7Bq
 h08SkcHd7lOx3ytRTlwL8s6QMZfSuMOv/Ikaq6TRHb3hRBmOOjspbtDi6dsMsxDOL/dJ
 kEZmNLLAMcWw4+S6w/kq3DROZRbhKXGxyte3dhF9ITcUdwXAuTGViPGv0d4MQs4w9nGA
 mJnXdfttxqs7mzoWiHTrhiSn/5Rf71Z9iKLpziPPtRbcDMF9KaTuyzWFuhAq3L5GkXmb
 m4Tg44aqMbGPGjPiwVypHd9ofZ2rFuro5tR5D/RY7QM56snaXMwrlUcbNr9JrbHJ51v0
 QhwQ==
X-Gm-Message-State: AOAM531QIjnyentwv2VbeAyOInjJ4HuIFvBXD2ZhQG4x2zPHcGFSLewK
 fvnXQmvHq9KcakCxWULQCFKp8ctmv1HFuw==
X-Google-Smtp-Source: ABdhPJzBzxJsncIioAw6/EdE8vGglFjmGqqqZbq1HMyk6Qt6+Xe2KLwh8zVe7pdApacuP5bjDEsA7Q==
X-Received: by 2002:adf:97c2:: with SMTP id t2mr41861456wrb.577.1641282854581; 
 Mon, 03 Jan 2022 23:54:14 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id d11sm40508329wri.101.2022.01.03.23.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 23:54:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] SD/MMC patches for 2022-01-04
Date: Tue,  4 Jan 2022 08:54:10 +0100
Message-Id: <20220104075412.2088859-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf99737=
:=0D
=0D
  Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into st=
aging (2022-01-03 09:34:41 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/sdmmc-20220104=0D
=0D
for you to fetch changes up to d666c7b529c503381a714b97d2e174848b5aad8d:=0D
=0D
  hw/sd: Add SDHC support for SD card SPI-mode (2022-01-04 08:50:27 +0100)=
=0D
=0D
----------------------------------------------------------------=0D
SD/MMC patches queue=0D
=0D
- Add SDHC support for SD card SPI-mode (Frank Chang)=0D
=0D
----------------------------------------------------------------=0D
=0D
Frank Chang (1):=0D
  hw/sd: Add SDHC support for SD card SPI-mode=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/sd/sdcard: Rename Write Protect Group variables=0D
=0D
 hw/sd/sd.c | 48 +++++++++++++++++++++++++++++-------------------=0D
 1 file changed, 29 insertions(+), 19 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D

