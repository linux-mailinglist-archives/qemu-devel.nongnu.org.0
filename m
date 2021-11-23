Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A345AE56
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 22:21:57 +0100 (CET)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpdEj-0000om-3e
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 16:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpdCj-0007XL-G0; Tue, 23 Nov 2021 16:19:53 -0500
Received: from [2607:f8b0:4864:20::934] (port=37567
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpdCh-0000s3-MF; Tue, 23 Nov 2021 16:19:53 -0500
Received: by mail-ua1-x934.google.com with SMTP id o1so690304uap.4;
 Tue, 23 Nov 2021 13:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5AKw9ZE3iGCd4PDApMiBgo3y3ut5t3QJu/ZQm40QO3E=;
 b=KZoK7r0oFk4/efx1tnc5+Vcw/5ymJ9LZn3wukGXFnCLojZbZJBRDAR4fLoO192U52g
 1uplJwCWRo/UCCwcHdJryOrN/UyDJaibCDMy0nWNZSIzQeDit8h+3PGGCpDMmObAQd55
 O5hCNPSNAy1pe5nljbfTsd7+ry7Dx3Gpppm1srNLp4gkD8ktn9k3PFwrEJ/IDuNjRLEb
 0RNgr6jqfQ9I92jowXEADl9YSBtFh/NGZcAZFgGCR7s/KNFNlv5wRkXIR9o1V58Re+Dj
 DGQKCsKiC4CfLnBFq/4zq9S23zGzDZTUq+jg46Vow57Zp9gu5mAKM2B+0INQaLLULbhB
 H1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5AKw9ZE3iGCd4PDApMiBgo3y3ut5t3QJu/ZQm40QO3E=;
 b=eqvTirCuS3dSpxyBFrMwtOoktEsfgBLX6dJYfLss5e7aHv37mU7qy1xocor+r4ZYkQ
 u9z/ZyyDiBO+siG/H2pYq91InGTlq3vXwL6xoD/9ZHZ0JivU7qM2TtdHcec/9S+l2PQR
 /41E/f6tIWP7ENrqwCgje3mBgk7F7JstibVLBn+ibLE4vBd/vGIgLxSczX43v9RDvoJV
 xW7Yz9+JG2c4jnuFBUJChwrI3yOII3ufnbaRCyHUZZMRjXcgEr9WIujDHZxnNqmbABrK
 zIsz7vqDbcjN9+LkWEDAifZ29mReotW1iN0YXEvnptFafCsDj9eaIb0rZjvpGhsfI3dp
 YvHw==
X-Gm-Message-State: AOAM532sWAazFgg563lDb/V3h2wVDfPr+SXb7/zHYRAeF6ySpRCWaaY9
 GhH47OI7uziKX8Ud8ouX2uvWplmoZ5c=
X-Google-Smtp-Source: ABdhPJzRgcTsU3abXcdNfFdpg3PdI7MKhjeMd9f1QW8YFh8XLy4A1jJUaYYGePijhWwfTqd23ACMuQ==
X-Received: by 2002:a05:6102:5093:: with SMTP id
 bl19mr13626228vsb.43.1637702389971; 
 Tue, 23 Nov 2021 13:19:49 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id h7sm6807958vkk.2.2021.11.23.13.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 13:19:49 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] change IVSHMEM endianess to LITTLE_ENDIAN
Date: Tue, 23 Nov 2021 18:19:30 -0300
Message-Id: <20211123211932.284043-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This small series fixes an issue reported in Gitlab [1] that
affects PowerPC big-endian and little-endian and probably all
other big-endians in the wild that might use 'ivshmem'.

It's not clear to me who is the maintainer/responsible for this device
(MAINTAINERS doesn't seem to have any 'ivhshmem' entries nor someone
that looks upon all hw/misc/* files) so I didn't add any CC in that
regard. 'qemu-ppc' is being copied for awareness since they are the
folks that are most likely being impacted by the bug.

[1] https://gitlab.com/qemu-project/qemu/-/issues/168

Daniel Henrique Barboza (2):
  ivshmem.c: change endianness to LITTLE_ENDIAN
  ivshmem-test.c: enable test_ivshmem_server for ppc64 arch

 hw/misc/ivshmem.c          | 2 +-
 tests/qtest/ivshmem-test.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.31.1


