Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B63BA507
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:28:03 +0200 (CEST)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQhe-0004Ik-Hl
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQft-0002JA-RB
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:13 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQfr-0001LB-Uq
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u19so6414729plc.3
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 14:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8y0x5/M20SGHzJpGAGagsYz7FH0EVumgD5axJPpYtFY=;
 b=rgW+IVUJl7pBwUJoZaY/RFjjgTzG5xS3NBR5RpJX0RqCtBY25RsO+gmT1wzIDAg+4b
 WbAA1jApAZWcjfZPYYBoloPUL4PiJRGoGPHtvet/5FyA4RDf1kkD2veA0T++OXS5y0KP
 j5QyZPS2c+YUJXDZPqtTMEn5F8KJXV1RWocZrsMn5zj2McrOCgCPiiNBJAGAfQnmvc/I
 oJnq3xMYjJLAaYuLDDY9u9sct/PRd5RNqNG60vLkrdVhtIkYqm90aDXx009sbUnR2QOA
 q4wBqy6zTMufeYSmAqmiwdW1hb3rHavJgXbeBPewhJIZdTbHDxGNXX+2X+OJCggr3Izb
 ngIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8y0x5/M20SGHzJpGAGagsYz7FH0EVumgD5axJPpYtFY=;
 b=mwhvzbAFkRjqQt38SXZJIdxZqLMHWyQP+l4/aYkqI+aYQvolP0AeQ/dMXdfgQld6Yo
 3pYfqUAp+2d/FSUeFYKdiRBurF5FQWkSWEpguTmnNQ6Ws3hLows7ed9CbKvar4rlYWAN
 hFuXNG0KiFd3BZFTfMr1qg3FlZgahceiuXx3FAF9huPN25XxJrkZVzLJhDoLnbe/SMTp
 HeBW2TLYFaMv+Z7hdh8VuIttoHjqg383B9ywBjNIv493zx9Dau5KR/djvRhe7Tvx8FL1
 lCkBM8yN8VoThiZSkpStda8zSHpLdK+DB47jUAfB3tKWu0EdX1eEFvTAKjnKMRRBxXtg
 3MKQ==
X-Gm-Message-State: AOAM533fvsvmGCM7kb4ybIEhhHTcrde84gKE5ytMsdrpfBNbyHPvPget
 FY8HYKyMbOYdWotw+z3irWY=
X-Google-Smtp-Source: ABdhPJwVkVYCPca1Uv2EIYHDh6pP7THxeH7BZoXHP6s1s8zvoHG/NSF5Nd4lNetSkJfyWd1h2AoKgA==
X-Received: by 2002:a17:902:d4c2:b029:129:4664:f255 with SMTP id
 o2-20020a170902d4c2b02901294664f255mr1472490plg.20.1625261169976; 
 Fri, 02 Jul 2021 14:26:09 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.1])
 by smtp.gmail.com with ESMTPSA id o16sm71563pjw.51.2021.07.02.14.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:26:09 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: jsnow@redhat.com
Subject: [PATCH 0/6] python: AQMP-TUI Prototype
Date: Sat,  3 Jul 2021 02:55:57 +0530
Message-Id: <20210702212603.26465-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/
CI: https://gitlab.com/niteesh.gs/qemu/-/pipelines/330532044
Based-on: <20210701041313.1696009-1-jsnow@redhat.com>
     [PATCH 00/20] python: introduce Asynchronous QMP package

This patch series introduces AQMP-TUI prototype. This prototype has been
helpfull in letting us try out different ideas and giving some insights
into things that we had to take care of in the upcoming TUI. It was also
helpfull in finding out bugs in the AQMP library.

The intent for this patch series is to get comments on the architectural
design of the prototype. These comments will lay down the foundation for
the upcoming TUI.

G S Niteesh Babu (6):
  python: disable pylint errors for aqmp-tui
  python: Add dependencies for AQMP TUI
  python/aqmp-tui: Add AQMP TUI draft
  python: add optional pygments dependency
  python/aqmp-tui: add syntax highlighting
  python: add entry point for aqmp-tui

 python/Pipfile.lock          |  20 +++
 python/qemu/aqmp/aqmp_tui.py | 267 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  31 +++-
 3 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

-- 
2.17.1


