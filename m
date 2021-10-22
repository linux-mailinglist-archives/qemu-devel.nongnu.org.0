Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B5437AA3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:11:35 +0200 (CEST)
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdx8o-0005nk-Lh
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mdx4X-00030H-3x
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:07:10 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:46838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mdx4R-0004ez-Qf
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:07:07 -0400
Received: by mail-lj1-x22e.google.com with SMTP id l5so208302lja.13
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=XkNMdsHgl2hY/a8nzWlfQL04eLVr3TvlPzta3CNG/Tk=;
 b=cFuqXiKcjlsBj80Oy+v8etvedggAMQ8ZJG5czPhc6Q/uAfnoJ8pTs1Y7vfA3QCTKF4
 2JgEQH+QuSMV97UxvrECd3c96zW5ryTvas7OrtF5qCLQq/SfqjC62rVApEb5H4lJ9FtV
 ipCXsfF03VSLOZ+FdgwmeJ0CsiY4loVwhFtStAjOIrRtvkgSX8Zo076HSjWKzL8p7i+y
 VxvC8rvgbTvf4POcM+0YC8QHF7szEWlu0tXAAl7jg4SdAWveD3o02b3KCuGCOcT1xPkY
 GVpEgiBBI5VzGkfkcdFPKQREujbaxl3NC+Iik4ZgaRdoP6sLLVwjuKBu8LdP87fdSTno
 BB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=XkNMdsHgl2hY/a8nzWlfQL04eLVr3TvlPzta3CNG/Tk=;
 b=YChBQ4TnhZisKyDocaZTZ0BTdL50TU4q8W1CI5nQG2PW8HLCBpNjDujuZzdO5qVN1m
 SS6FYVN4rVd+vSluwfoF/QvAXF/7fxgTw42PJqz8aIf2grqxzbTxuGqQCMH0MOiZPSWr
 s8iLUK+7xid2TXumIyWk4Lecbigg6us1IpfHewxEyvG4YqGn67gU58bd7ITZTLx3duNs
 HlUQYBoje3A4oa1w03DgtezffDTK2LyYHseLRM8NrMIY0opx7BMP0rr05IAczQb8WLdK
 XWqlH2Xyh6MgBoV16bmtr6kAbfOJIpdZIzpVmTs7ADb/ns3dOdV7txqbDyKRpo+R+XE1
 vfoA==
X-Gm-Message-State: AOAM532IMpCnL/YbVnaDvMq7JsXzG6mSqYAY1d1lqMRWBtdE6DcdYyQg
 CjtYYFK3CZf/RiIzJ9pKnBN9ssSzljBqtw==
X-Google-Smtp-Source: ABdhPJwKW69AVNj5SqUQ4c6xQUfgAi7FID+UO0tEPNOI0CHOKpIUauFzkMz9uOgi4zBiXRbsRLF4fA==
X-Received: by 2002:a2e:aa9b:: with SMTP id bj27mr858456ljb.528.1634918818036; 
 Fri, 22 Oct 2021 09:06:58 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id z21sm926503ljg.119.2021.10.22.09.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 09:06:57 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] plugins: add a drcov plugin
Date: Fri, 22 Oct 2021 19:06:52 +0300
Message-Id: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lj1-x22e.google.com
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
Cc: arkadiy.ivanov@ispras.ru, alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches adds the ability to generate files in drcov format.
Primary goal this scripts is to have coverage
logfiles thatwork in Lighthouse.

Changelog:
v3:
  * Increased speed of the plugin.
  * Added documentation to the helper functions.
  * Sorted qemu-plugins.symbols.

v2:
  * Added path to executable binary file.
  * base, end, entry have correct values now.
  * Added option: "filename" for output file.
  * Install an actual tracer when the TB gets executed.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>

---

Ivanov Arkady (3):
      src/plugins: sorted list
      This patch adds helper functions to the drcov plugin.
      contrib/plugins: add a drcov plugin


 contrib/plugins/Makefile     |    1 
 contrib/plugins/drcov.c      |  152 ++++++++++++++++++++++++++++++++++++++++++
 include/qemu/qemu-plugin.h   |   17 +++++
 plugins/api.c                |   44 ++++++++++++
 plugins/qemu-plugins.symbols |   56 ++++++++-------
 5 files changed, 244 insertions(+), 26 deletions(-)
 create mode 100644 contrib/plugins/drcov.c

--
Ivanov Arkady

