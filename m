Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D44E468A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:17:06 +0100 (CET)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWk09-0000yU-EP
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:17:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWjxs-0007Yh-GS; Tue, 22 Mar 2022 15:14:44 -0400
Received: from [2607:f8b0:4864:20::1033] (port=43780
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWjxq-0005Pn-VQ; Tue, 22 Mar 2022 15:14:44 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so3022506pjq.2; 
 Tue, 22 Mar 2022 12:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QzIyP8Mkvb2J5evFSr9KnKa1FyPsV8VryUkh49s1xvA=;
 b=BRzphTLIzrBvJ7ikBJHA+GPKchDysPdlJC5H7e2gr3nS1zRsgjTQwg1js3XgMk++VW
 ZkIezFEMk91EtfE+FIGlceHI5n7dgKkHl4YTj1YhxY6NOQk9q7BB0U44dcRf+l+ryPOM
 LpKOJLVx9vh11sfER4vdZmuJGzeTdh8JoYROudAdMibXZzmVVJkmxi73Gv0r/3gfFOd2
 1iuwcDyAFVnUYvcz+9HFXy8n1N8aGxzKaivmqnhMDMYuIMZNjk/JI4Mx55g6sBZEjCRV
 YAUUZqbQSDcmX00M+VIFUORsdrZAXzW4pUqhoKWTzL8gLByzLSyIYCaGcM2aUyc60NTU
 yCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QzIyP8Mkvb2J5evFSr9KnKa1FyPsV8VryUkh49s1xvA=;
 b=oM2LOOk2tHcONQ9VzETcEy0f1/qnpE4yNNfiSqTEs0pR59/qF6iEY5j6w/F6JqBfoe
 Vsf0ORqB/u90jIGPUkR1PBgk833yIA3nePlOnrFodVBR8JRxcUknHDt5jeOmdehr0AMe
 Zr4sWdu2v/XNVAtflgmYNqKasdtJ5vxIY4QfAusvFj5ppwbbC+1uHTKyy3UsYlyFkQ+h
 VWR6dpUubUYVp2L4jxtpPIKZfSffDd6wKgUDE0CmdDAS0MfYMi3rtM+8vo1RfHKrJyL+
 JBWlyQCCgu704vB65t7ogJ358CYYx79mT68CCEKOjGPHMWJvEpviVzL8JantLZaXx5z3
 RR7g==
X-Gm-Message-State: AOAM531bDY8B/dFyqJynrD3vYCuOsxFqwPdtzAc8BkhAhp3VY4IoD+8s
 UYhPITHQhduqk7MgpMgoUxQQPXIrqOseOQ==
X-Google-Smtp-Source: ABdhPJyQ5d6lH9YwGRcpFpQTKDOXb9ZOFSM/NWyph5mpuctrxJcyIElt2cIDkxVdxle+yDgphwGUlg==
X-Received: by 2002:a17:90a:7304:b0:1c6:aadc:90e5 with SMTP id
 m4-20020a17090a730400b001c6aadc90e5mr6869831pjk.164.1647976480643; 
 Tue, 22 Mar 2022 12:14:40 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 q20-20020a056a00151400b004fa99ba6654sm10146827pfu.115.2022.03.22.12.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 12:14:40 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: QEMU Devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] CI fixes
Date: Wed, 23 Mar 2022 03:14:07 +0800
Message-Id: <20220322191409.1330-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1033.google.com
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

* Fixes the cirrus CI
* Add an empty github actions to get cirrus CI works properly

Yonggang Luo (2):
  ci: Add github workflow for getting cirrus working properly
  cirrus: upgrade mingw base packages.

 .cirrus.yml                |  2 +-
 .github/workflows/main.yml | 29 +++++++++++++++++++++++++++++
 .gitlab-ci.d/windows.yml   |  2 +-
 MAINTAINERS                |  4 +++-
 4 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 .github/workflows/main.yml

-- 
2.31.1.windows.1


