Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BFD4D00C1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:09:52 +0100 (CET)
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE3b-0005mT-M2
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRDkL-0003uf-GX
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:49:57 -0500
Received: from [2607:f8b0:4864:20::42e] (port=39775
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRDkK-0007jb-1Y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:49:57 -0500
Received: by mail-pf1-x42e.google.com with SMTP id d17so4991862pfv.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DxXDyM30e+DRLqa3LVgy1MxelVHL/QOEkyDo0vYh3Qw=;
 b=Dth5uhdS4y9SFXVdJx1mncXZcrb3UxU0Pg30+umJl5NzwOTwU8aJfUgkUtRZawoq50
 225wmpH9R4tuOrqYfHxFab5mSNPwm1KAhuYd9DIZ89Mim1VORMooY3qmPRSZgWGVK9bx
 S7X6D4W23hiIWfvDB0Sz612iMkRjM1OjxvkkBC5UqPj8T5KkSjgmJKUWJiTpKP5j2j2t
 YWWkaIyTLsWTYhNW8M43TsHCgJvKSctgwAatCWNafiLHIlxUu+r0wkSAS064HDze1iRa
 QFYIkN2nN+SRwCWBnLfFQaq9Ubcm7rnoeCs0wys9JR1TmkpZOW7UNCkNXeOAqnHH+RcS
 5tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DxXDyM30e+DRLqa3LVgy1MxelVHL/QOEkyDo0vYh3Qw=;
 b=v7c3b1bebzzCBP0dygObWbbyioL6TRNMXKc91IgRiviNd0EADGK17x9teMsICPlp1d
 ALsqIyVQ7j86RmtrnIj8Wm1JjH5ex4hhUPDhxtzDxN1jRPb6JdrKdU6EmFjYsEE/kViY
 95mguUB1+RmklMtReXRgIgXUaEA06vP9PZ5OIiZE02tuxYuZiaf7N4hEDzlSbm9djLKd
 TGEU2d7Col2ReY6r4Iud9saAtdCkBFtQsuWHYaiwPVhaDJudBFMh6uLWF68qRgDAOOnV
 UmLbBFM7qqckWjPVfSb6d7jSKnfQ+3MKdapjj2ZbY+APc2aJbOUzqVCRjrNOkvUYmbva
 jWXw==
X-Gm-Message-State: AOAM533ApzDl/JgD3FjP0DbPv3PmOrrxOIS9ADqrNcPdzvdU2qRwcUzc
 yVWrMilnVaQhsmuWNVudLHtRtN8xPqc=
X-Google-Smtp-Source: ABdhPJxz595wlLaFHJhVeVSI/H0eJuf2lhsT2q6Rj9utnSVEnvYWDsmAQ9rxaalNZesGf+V0FKAhGg==
X-Received: by 2002:a05:6a00:238f:b0:4f6:b09a:4c63 with SMTP id
 f15-20020a056a00238f00b004f6b09a4c63mr12856740pfc.35.1646660994527; 
 Mon, 07 Mar 2022 05:49:54 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9058:25bf:2793:c7c7])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a17090a168f00b001bf66741097sm3622387pja.16.2022.03.07.05.49.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:49:54 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 0/2] Create menus in iothread
Date: Mon,  7 Mar 2022 22:49:44 +0900
Message-Id: <20220307134946.61407-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ui/cocoa: Create menus in iothread

Commit 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 introduced an
assertion that blk_all_next is called in the main thread. The function
is called in the following chain:
- blk_all_next
- qmp_query_block
- addRemovableDevicesMenuItems
- main

This change moves the menu creation to the iothread. This also changes
the menu creation procedure to construct the entire menu tree before
setting to NSApp, which is necessary because a menu set once cannot be
modified if NSApp is already running.

v2: Separate a change moving create_initial_menus (Peter Maydell)

Akihiko Odaki (2):
  ui/cocoa: Move create_initial_menus
  ui/cocoa: Create menus in iothread

 ui/cocoa.m | 209 +++++++++++++++++++++++++----------------------------
 1 file changed, 98 insertions(+), 111 deletions(-)

-- 
2.32.0 (Apple Git-132)


