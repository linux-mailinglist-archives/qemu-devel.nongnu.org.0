Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D938E387441
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:45:11 +0200 (CEST)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livLi-0005K9-Iz
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livIO-0007Z4-1q
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:41:44 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livIM-0005Yo-Du
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:41:43 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t15so10081481edr.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCZY1dpAZ31whdx328CGNigrJTCARQ0Y6TQBl3U5rLk=;
 b=aQBojYS5ifRF3T3zRMnRdc4HBOy5kXuQqXItp6QfWY6r7R0JCUryxnw3j2j4T3sxAR
 vOpv/ytLWncAkNZapF4eobFYDHOV5fXP0Mi/sRkPP9HMaWaQQ5Q+SSYMU2/UbzwDHQhl
 NSLNlPiN39GPr5QFyF/sTPI1JUTesFYQNLjfio7eG0T9iy8vqK0zeJOJkhSI3e/bTUfF
 m4IcTp/mwxrq7aaKbVfDTI5q6/TXtXzD01GZ/wRPGj5/nGUSDUXAOnS4YfKlYzso3JFw
 Lo8ReR4Q2NaiTaThoNLCdk+L6If+p3Q+/Ks0Ik9A5xPXh/glDoS/zhDFzv2EcDI2QweK
 fzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DCZY1dpAZ31whdx328CGNigrJTCARQ0Y6TQBl3U5rLk=;
 b=e5Y0tEq2UG8nWF9MJsZA+vDpcV0llC2y8jpAsZT0PKxtE0XF34/g1BhyQCyAa22x7R
 +aIJnYSrx/KtxowdVlgPsiltOy9baqWEcCWLhVdyMlZKAraFFYklOgIckKidsnf+f7gQ
 K78l3gL4DipEST2BYd4zzeRbZ1/Q++ZM0L4mzwWuurtCPRaFs4VJzsup3vARH36cuQlq
 HFvqp9eiUc7r2CCzgQz2k18QpxxRajIA58oeaLjPWGUdxOGL+qKDouK2UH/DIHU/ZJu4
 Wbb6ZRigMAEiPxNYbHr49sNJjt5IgNn29I6iWtXMnPuCEm9fF2imLRglTZrG0BnwnCe2
 VAMQ==
X-Gm-Message-State: AOAM531CUzh00UzrUiF4gJMa3EPHMw2YnKRPwZOD9J5r44KXMbHIo7x+
 ktD9+TrOaS2HSaqDGt8JPsEG8gGfAQDIOA==
X-Google-Smtp-Source: ABdhPJx0sWzxmo1+I2nFPuBJ5iIcGANYu08jmf5DxKF2XTns7F0pMs7me5R7mCD+LGBxR2zbR+58PA==
X-Received: by 2002:aa7:db57:: with SMTP id n23mr5718059edt.229.1621327300903; 
 Tue, 18 May 2021 01:41:40 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d7sm9851917ejk.55.2021.05.18.01.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:41:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Small CI improvements
Date: Tue, 18 May 2021 10:41:36 +0200
Message-Id: <20210518084139.97957-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1 adjusts cirrus-ci to also test installation, and thus
entitlement application on macOS.

Patch 2 and 3 tweak the number of jobs during "make".

Paolo Bonzini (3):
  cirrus-ci: test installation
  ci: do not use #processors+1 jobs, #processors is enough
  ci: add -j to all "make" jobs

 .cirrus.yml    | 22 ++++++++++++----------
 .gitlab-ci.yml | 10 +++++-----
 .travis.yml    | 10 +++++-----
 3 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.31.1


