Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749634A6A8B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:31:33 +0100 (CET)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF6Mm-0007wI-Cp
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:31:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nF1BN-0007CF-Q6
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:59:26 -0500
Received: from [2607:f8b0:4864:20::130] (port=47067
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nF1BI-000800-Qy
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:59:25 -0500
Received: by mail-il1-x130.google.com with SMTP id e8so15431085ilm.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=momofGoAiDMCZqpb5CI96XowGVKHQtzt1h1h2tRhHgc=;
 b=quH8aTeVtOw6hDwlsYq9iywJM0bs9WQDXnLbCYAC7rAMuZ1i7gpFfbbYJFVDCRnlVI
 HBQmnCHfQ2dbEdZgQVjqDBM1d1nTz4BdpTxYTykeFtk+althSBWCjnj+18gxgEoUAzie
 0/a8D+gvLIwJdYMusJvkR5/Or2+E2EZAv34cKqyPskIRCwRnwPshyRf+XXnK8mV5mr2P
 bHqaES7myGw2m3Fv2b+E72JjXjEV/ZIipwn0rgG8ZWoNKCXfHigP20cd0L1LKB+101LX
 VQVfy6eRwlJJuy5mi6/RB0VsqLHzBEx/jDPL7lCaR5fZR3A9Lo0huLnAjiIOY5TIoMCf
 lWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=momofGoAiDMCZqpb5CI96XowGVKHQtzt1h1h2tRhHgc=;
 b=YQVDhQhpNARGxPCQZEgZpFO6zP++rnkaFDDcBWF+hk1rO6wnJeu5ZZ9bSoGrURqtXm
 s7nSrr4AkB5HrtWIjBJV+YlzkVZizeW9e0P6VLipoWN1rfczoBfaYdhgFtJr/A74n2bl
 +ELghgN0EfkDvODY5DjItNTbZkUEr4dWaUuv01ZpFrsBcljptXX3W4LF4d1E4Zl/j3R9
 UrUvkqu3jw17Yhjtj0rA9TxaalKyIbgxJj839HbzNtoDidbniTF9Lc1kPqMLShDIRWlp
 8tW5BCF4YuUA9l+5ZPiax6lSdqr6K+PE5QOx9m9u/Geq3j3IGjngge1RFIm7pmwaJLng
 d+7Q==
X-Gm-Message-State: AOAM532RmFRDYrfLGrXHyb5MPYNQr/cGUHxXokjB6m5SjK6GZKbPM2cR
 qHuS+umpGwcO+FcxT33UzrPakV7AwddKWg==
X-Google-Smtp-Source: ABdhPJxibWxiPta425SCP8Pde5iFNhGdZfE10VX22CiCyownmscG3IBYl4Jn/ggLNP5+azYkfgU/VQ==
X-Received: by 2002:a92:c687:: with SMTP id o7mr15826000ilg.88.1643752756415; 
 Tue, 01 Feb 2022 13:59:16 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id 193sm14960836iob.17.2022.02.01.13.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 13:59:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Bsd user fix patches
Date: Tue,  1 Feb 2022 14:58:56 -0700
Message-Id: <20220201215857.61820-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 alex.bennee@linaro.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3bbe296c1c7a6ddce7a294e006b8c4a53b385292:

  Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-02-01' into staging (2022-02-01 16:32:54 +0000)

are available in the Git repository at:

  git@gitlab.com:bsdimp/qemu.git tags/bsd-user-fix-pull-request

for you to fetch changes up to eb9d35f686ed1279d57463d9e6f289988f594c19:

  bsd-user/signal.c: Only copy the _capsicum for FreeBSD_version > 1400026 (2022-02-01 14:43:20 -0700)

----------------------------------------------------------------
Pull request

Fix FreeBSD 12 and 13 builds.

----------------------------------------------------------------

Warner Losh (1):
  bsd-user/signal.c: Only copy the _capsicum for FreeBSD_version >
    1400026

 bsd-user/signal-common.h | 5 +++++
 bsd-user/signal.c        | 5 +++++
 2 files changed, 10 insertions(+)

-- 
2.33.1


