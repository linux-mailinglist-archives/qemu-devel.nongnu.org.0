Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AFF33964D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:24:39 +0100 (CET)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmSk-0006C5-NA
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlag-00046i-Eo
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:46 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaL-0002Bm-De
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:46 -0500
Received: by mail-ed1-x52c.google.com with SMTP id w18so9064972edc.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=83FeQyVxN11QJLouXcPIlZEi2ssR8LeMCCehcEY0YWY=;
 b=iPuMCbFl5UIm2Bx3xiC5YOPzDzDro1R204qz3rQVrL5GzMxM7tykwhPAcYOJ77tQW6
 VUkzlIYArMmqiA33TaLKVohJFNpVj4ni2ehsdT+UCk/CC3iqQA7JE5zoOL2uJKZtxna4
 2GZHGReGDlU6spECB7IEzCfpqrnxXkaUdjlY2zZH0nB4w93EUJrfGtT7qQbTrN4OMSgE
 JuWZ/zITuVyd1i4epvKxSHnpB8vvt8vvr5nfBRTh6fvWxFc7COHKgrcOlKqUetzjyvBR
 cyKq1Qu7Z4noG4KnyYliI7sI40BZvF7dtDPaWq+sj6DBfB899L4W3CxBNIMzpe690zR1
 TenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=83FeQyVxN11QJLouXcPIlZEi2ssR8LeMCCehcEY0YWY=;
 b=BCLZU8JXMnJNEPtsls/zki6GW7NXYP39qJq6/J/LxlCvlYsFSwlO0j2QUyhbSKdSTR
 oKgagG8bwl1l3yejkf7YpIxtsv2Rl9oQPXENXTrzpQ7tWSW/KYmU1vzO/iM3IyskagZh
 diwtaA2sygJ29Pg14rHNRMdtjsaEPILqORb0tfqTnqR8htCEeH34rGG6EdpiXR1nc6Fn
 GZ8x6dZ3bW9s1Z4ZA0sh36ylA9/AaCxP7+2gK7V9Wd/uV3p/GWRGh7Q9qwQ5BmuBgmvw
 jvGwyMMpWFGO0f+n2N2UXYFVRFmoEmHqxk2DNKMfvzMeEjogxShJ4PyP2Opgyf3MueJj
 CJcw==
X-Gm-Message-State: AOAM53109gAirbibKegWT8YNOxPbA/aToRKfANOv2rLy1I3t8/Q8vgEh
 g87EMPpn5NkGRGNE87v7OH/6MQ==
X-Google-Smtp-Source: ABdhPJyZtzD+SpFq3FmIfPVWgqtReKXKaf84IkltO30oJfZzh//fuKuu5OBUTxrc91BEuIQfAl2RfQ==
X-Received: by 2002:aa7:db4f:: with SMTP id n15mr15367318edt.12.1615570103883; 
 Fri, 12 Mar 2021 09:28:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b17sm2949274ejj.9.2021.03.12.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8A051FF7E;
 Fri, 12 Mar 2021 17:28:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/14] plugins/next (phys addr, syscalls, lots of docs)
Date: Fri, 12 Mar 2021 17:28:07 +0000
Message-Id: <20210312172821.31647-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is rolling up the plugins changes for 6.0. A couple of fixes and
I've also spent some time cleaning up the kernel-doc comments for the
developer manual.

The following need review:

  - plugins: expand kernel-doc for memory query and instrumentation
  - plugins: expand kernel-doc for instruction query and instrumentation
  - plugins: expand inline exec kernel-doc documentation.
  - plugins: add qemu_plugin_id_t to kernel-doc
  - plugins: add qemu_plugin_cb_flags to kernel-doc
  - plugins: expand the typedef kernel-docs for translation
  - plugins: expand the callback typedef kernel-docs
  - plugins: cleanup kernel-doc for qemu_plugin_install
  - plugins: expand kernel-doc for qemu_info_t
  - docs/devel: include the plugin API information from the headers


Aaron Lindsay (1):
  plugins: Expose physical addresses instead of device offsets

Alex Bennée (10):
  docs/devel: include the plugin API information from the headers
  plugins: expand kernel-doc for qemu_info_t
  plugins: cleanup kernel-doc for qemu_plugin_install
  plugins: expand the callback typedef kernel-docs
  plugins: expand the typedef kernel-docs for translation
  plugins: add qemu_plugin_cb_flags to kernel-doc
  plugins: add qemu_plugin_id_t to kernel-doc
  plugins: expand inline exec kernel-doc documentation.
  plugins: expand kernel-doc for instruction query and instrumentation
  plugins: expand kernel-doc for memory query and instrumentation

Matthias Weckbecker (1):
  plugins: new syscalls plugin

Yonggang Luo (2):
  plugins: getting qemu_plugin_get_hwaddr only expose one function
    prototype
  plugins: Fixes typo in qemu-plugin.h

 docs/devel/tcg-plugins.rst  |   5 +
 include/qemu/qemu-plugin.h  | 230 +++++++++++++++++++++++++++++-------
 contrib/plugins/hotpages.c  |   2 +-
 contrib/plugins/hwprofile.c |   2 +-
 plugins/api.c               |  25 ++--
 tests/plugin/syscall.c      |  49 ++++++++
 tests/plugin/meson.build    |   2 +-
 7 files changed, 257 insertions(+), 58 deletions(-)
 create mode 100644 tests/plugin/syscall.c

-- 
2.20.1


