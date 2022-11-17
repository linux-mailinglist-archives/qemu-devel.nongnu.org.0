Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E462DF72
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 16:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovgda-0000S3-LY; Thu, 17 Nov 2022 10:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovgdX-0000Rh-S5; Thu, 17 Nov 2022 10:17:08 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovgdW-0004qD-7D; Thu, 17 Nov 2022 10:17:07 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-13c2cfd1126so2458943fac.10; 
 Thu, 17 Nov 2022 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SG0/Q1km5GzzRVqTBXEnZEWOhxRP8wcRWWNyqh6Kcb8=;
 b=G7WavMgTv2Lu051OwWuzwcJFaBLQQOe1RbX8oNZgy5vK8/QReDRvnrf9djUmaD2jHY
 22FPhiu6qT5+/wU2AcGfR4nuOmAmxzbvla49hu9L6nab9kTrTO1oKW95wXniVLiv3dNM
 /+nEAXiBTHBpFHqYXOqKECy2l6DG/E0C6QwqfyTL75F2YqX1vOf8ziNIvr7aHeiUQYJV
 QXSZcgGJXZnPZB+WD8e1fiDQrovG7KxFXRZMrfuh6j/aemPAnJX5N600jiMUVZMxw6Kp
 gkaWCYNK0v0oDq9e6R8JWwy9EIlpnG2Lls3eXPuLjIT5LUHk+oG1Yg+ZrzWxhn0rsN+w
 MuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SG0/Q1km5GzzRVqTBXEnZEWOhxRP8wcRWWNyqh6Kcb8=;
 b=g2/bHaw7rw16hk6Aklxpnp7fq6x9f7QCd3ie940RMFz6pFY/gPhASjRptG/HbbDBAx
 EnB3RN8Y+rDM39ekPG3/XR4RuNn3ri8z3fcoj4uJjUi1SatIXzaem5F79l3JUODnRLaT
 1iKi9Wx1mtpiuY0llc+c+ejPdTkMdaN/LrLsXsp9THc/ApFYBjliO4zQe+HLT5KOrrum
 OQwA4PpKtQDOZHLLoS5r5uwsVjG35Usxebt7e2a2wXjGvkXoSFNTqvOW+FKI2h4Og55E
 LWzaNcSS7vzmlcKvCxSvlTk4HyfyE8iTGiBUC6UWHgTs1IOlla9zywKIaHGwCjUU/3tt
 PwYQ==
X-Gm-Message-State: ANoB5pndOyabhKnOklfG4wYuML5Kj5xMacrtDvCVkGcLP6aaFWxTznPq
 CbvhQBlmlg3nRTbAAEOJznVNCA4C1sY=
X-Google-Smtp-Source: AA0mqf7JKdKbkeUC+6pzsPBpAK7+6x9LrJXeyuWy6rvSne/peGfcFhgk4j2bt87x+iRL31z3iK6VoA==
X-Received: by 2002:a05:6870:6c06:b0:13c:c80:fc40 with SMTP id
 na6-20020a0568706c0600b0013c0c80fc40mr1501859oab.231.1668698223616; 
 Thu, 17 Nov 2022 07:17:03 -0800 (PST)
Received: from balboa.ibmuc.com ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a9d630b000000b0066da36d2c45sm430328otk.22.2022.11.17.07.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 07:17:03 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 0/1] ppc queue
Date: Thu, 17 Nov 2022 12:16:56 -0300
Message-Id: <20221117151657.182061-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 2c8311241d1f7377bb4ff76064b1d1fe15166413:

  Update VERSION for v7.2.0-rc1 (2022-11-15 18:56:38 -0500)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221117

for you to fetch changes up to 049b4ad66984aad278b3fc0a75b5a995c9b66a16:

  target/ppc: Fix build warnings when building with 'disable-tcg' (2022-11-17 11:28:04 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-11-17:

Short queue with a build regression fix when using --disable-tcg.

----------------------------------------------------------------
Vaibhav Jain (1):
      target/ppc: Fix build warnings when building with 'disable-tcg'

 target/ppc/cpu_init.c    | 2 ++
 target/ppc/excp_helper.c | 2 ++
 2 files changed, 4 insertions(+)

