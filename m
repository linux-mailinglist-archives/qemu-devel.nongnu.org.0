Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD1145418E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:01:47 +0100 (CET)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnEx0-0007Qk-4p
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:01:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtQ-0004o8-Rb; Wed, 17 Nov 2021 01:58:04 -0500
Received: from [2607:f8b0:4864:20::52c] (port=33462
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtN-0005a1-TN; Wed, 17 Nov 2021 01:58:04 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 136so1469598pgc.0;
 Tue, 16 Nov 2021 22:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jj2TxrYIZkkNgjx/8vtmRWzq2ea9PiKONmxpwxgAhDY=;
 b=BnVr06S4ERMIxYe1cRfE3MtTo13gktvHZew95IKpT1/VcYvNZvSMUIr7GUTnXrVEiq
 yE8PYF86ZcRKHQTUjcYYkhhWqn9qfa00JDGvy5SDKQ2qJs+YoAyjuvVvuawvNSNFSsZV
 vsgeQKurZQbWMDN5S1U4WKpyizz34xQPRS38qQNFaVs7t/kzH39rfkE5E/KWJeJkiZ6a
 ErbgeWKmC9zdrzSUYrBHDpY7Cwtu7QGoYBsc8lbDUy/YYv2S092agA2+ydTDLMBLQwes
 XHHMqdO8TjiOy93h1CwNEaD88VPY3wK8mbU+WU+gv7DRk4k4De7vISVNcMvETOic+m6j
 p0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jj2TxrYIZkkNgjx/8vtmRWzq2ea9PiKONmxpwxgAhDY=;
 b=JrVmTNKiTpy6gUEMRNcSMJFSHgsrG3PKEeBN5D8jncU3mQ9VbaQybajpCdAkUyTGl1
 W0yp1/xdm/thmNhRMrt6+9wfkhXFh7g18flkszSoU/o1TzT39QSUW1qdROP1ZOFpAplk
 UYyfTIUD7VJ9zyOVpwS/dFVBNg0hrG14GEUuRnH1U9d1KD/NdGLeMkPJsDeBg5KlMva3
 fweHotbtM7W/urXEPLMy+8u377vgLltSIZjsuQSAYtvYyoQr5OkDERpqn/BCBlTQPy09
 z/3T+1XE5wKxhcAj7VoN5KLOsPfJMvy/szOnDcHAOkIqBgIb9iY1Yq1Y+Cf/6GWiPeZw
 YVPg==
X-Gm-Message-State: AOAM530tSfYeLectUhEZQbdzZU2YvnKC4+vH220jiCWTARqCH1Jy9DKD
 C4CDrLhPrHJrIuJnsgMIZxw=
X-Google-Smtp-Source: ABdhPJw7KvsJIfolSzLWx3JBIgijBi3MvNAOsB353g8C6eIUZ2c3PNJuNJYGNs8yz0YD06lwvQSSdw==
X-Received: by 2002:a05:6a00:99b:b0:49f:eab4:4e7e with SMTP id
 u27-20020a056a00099b00b0049feab44e7emr5031478pfg.63.1637132280099; 
 Tue, 16 Nov 2021 22:58:00 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:57:59 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/4] docs: aspeed: Minor updates
Date: Wed, 17 Nov 2021 14:57:48 +0800
Message-Id: <20211117065752.330632-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here are some small updates to the aspeed docs.

v2: Tweak board changes, add patch to move ADC to the supported list

Joel Stanley (4):
  docs: aspeed: Add new boards
  docs: aspeed: Update OpenBMC image URL
  docs: aspeed: Give an example of booting a kernel
  docs: aspeed: ADC is now modelled

 docs/system/arm/aspeed.rst | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

-- 
2.33.0


