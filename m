Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9524E4DD4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 09:11:24 +0100 (CET)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWw5T-0000fu-Ng
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 04:11:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWw2f-0006mE-Do; Wed, 23 Mar 2022 04:08:32 -0400
Received: from [2607:f8b0:4864:20::52a] (port=41869
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWw2d-0004qS-RJ; Wed, 23 Mar 2022 04:08:29 -0400
Received: by mail-pg1-x52a.google.com with SMTP id d76so519301pga.8;
 Wed, 23 Mar 2022 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjfb57HChHr6GOJKnmbRPF+lrIXpcDTyfl9v1Chm8xA=;
 b=fTkJMe1V2hbTK3JWVA1UkvUwoV16byaJXEYA5SDZ61BNl5DGyMV3IMWFk7iPANnvI+
 VfDi3SO7rLaXpwxB1rYr7j6AU4wAWpdPlf3yXBOPFXeqnKgr4ZK0BfwjPQJfzpzt+3S1
 3SLhEgw1jgFY+GkWWvKioFtPLL39LNyqo9D4OwSzC4Jg2I82IKXSczLwmc/Hp79/5P6c
 S9mHwFRcNXEhBpdVhtFE1cWpBWUeK2rIhu2L89TLCA1CaBo9Nj6ngXsa+eWXWQyNMRMC
 C8idYpTNIYbNgs5VHzxHur2WqYVHcKEM40V3ZhX32DTKEj9e8+n7aNKkk1WMXr31ylA3
 KXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjfb57HChHr6GOJKnmbRPF+lrIXpcDTyfl9v1Chm8xA=;
 b=2o4R1KHJceXu8XHoADTkZoTXIDAFhB7U/zW/Y2D/X54o94c7TcSyKM+pDKKb4ZmuF9
 U7XtEhN0HvESv2FZasxuR836EYPZuSQb5nLEYSixrAb4Hh3K+DyGHj/IALno3hOMzAwV
 RKX/OEkf/y3Io94kfI2/E2a/33f0Fo9a2pzysFyafQwje6wEOm+QkxTTiqTVg6cXY9eC
 pJCN48Mhs5QLvw1N1BZ9S1CebxXWmkVOG2HpJ2wPWP0gg0VvLpnkkjyRdbTBAxPEHsvB
 h2V+I409EczM51LVJb+3LqxMrmXm/NYADu44v5AVpE3veumA7zYT65ilBski0Ssl78LZ
 BTCQ==
X-Gm-Message-State: AOAM531b3ScBzUFWB9k7aaPdIiJ4twZ5WZu5PodQ3pKjh6WJ8sPJFYX9
 8LIl40kWNR3cwywHCXgXmmLFBEMC4VPrWg==
X-Google-Smtp-Source: ABdhPJyNRPFOMpnStAaTNu9sE8umYSGBIUWwYi0HGoYSRfCvSRIPz/BCC681EMBKMwZPtXP3pZosTA==
X-Received: by 2002:aa7:8104:0:b0:4fa:2091:d200 with SMTP id
 b4-20020aa78104000000b004fa2091d200mr33256213pfi.17.1648022902044; 
 Wed, 23 Mar 2022 01:08:22 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 v13-20020a17090a088d00b001c64d30fa8bsm4002999pjc.1.2022.03.23.01.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 01:08:21 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: QEMU Devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/3] Windows cirrus ci improvements
Date: Wed, 23 Mar 2022 16:07:52 +0800
Message-Id: <20220323080755.156-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=D0=B8=D0=B6e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2-V3
update the commit log
update MAINTAINERS's properly
fixes old MAINTAINERS's pointed path

V2:
* cirrus/win32: upgrade mingw base packages
* ci: Add empty github workflow for reporting historical cirrus result at github
* misc: Fixes MAINTAINERS's path .github/workflows/lockdown.yml

Yonggang Luo (3):
  cirrus/win32: upgrade mingw base packages
  ci: Add empty github workflow for reporting historical cirrus result
    at github
  misc: Fixes MAINTAINERS's path .github/workflows/lockdown.yml

 .cirrus.yml                |  2 +-
 .github/workflows/main.yml | 24 ++++++++++++++++++++++++
 .gitlab-ci.d/windows.yml   |  2 +-
 MAINTAINERS                |  3 ++-
 4 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 .github/workflows/main.yml

-- 
2.31.1.windows.1


