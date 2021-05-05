Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8CF37378D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:30:07 +0200 (CEST)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDqz-0005ci-09
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkT-0000tF-0d
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkJ-00057p-Ll
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z6so1029694wrm.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjMgeed3Eg2L1hYeBcLF4NjYwepJBsR/ly1lGVEUMu0=;
 b=ixmaL4rKcE+HYPu/LGHYTYNrXtg14GwMqc2eOXh5Zr7AcT1Iyg0tmoQ/oSPcLMlAHu
 2+5uKmC743YHFbMMZ4WsCM4ZQjx2uY+mhPJ8YAbm3dDdgN2Jzry4XFX61qzKKn8NJuRV
 msB7/99cJg5qYl8v/aq3l6okcHVf3On/b/pMsCFm/ihUFXEDpGh3O684p4vH3z1K1Vvy
 LrxhBzS/KSqj+GLkaG1/px0HR972fZ974xpgZlTn4e1KulBsEPPhp2JU4YyWw1FbqsBM
 EtY/oq2C7BAJKxPLwmWE60onEY5KKHoSbrmA20NiNA8S28c4LcfTmBq3lv/pSRxSCzRZ
 S9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjMgeed3Eg2L1hYeBcLF4NjYwepJBsR/ly1lGVEUMu0=;
 b=L4Bv3dL831UBdJ9gVbb978YbSkpQAyWVNIzggQz780tXX4NFZwmiyIcjEkfnt3d3Hg
 KgxTK30lyCgWeLjRMiKu46zLcypKj+wIrrbHCq/7LR8rBV+4fLpy3QYN8dU2mbw1ooRq
 i4Fx2nFjTBk4zPYJGgGO9nNgVYoZtyXGYmdXtTTSqftGBR25MjCSGag1PHtSsZVIM3ZA
 k+kp28D4FCtLUFNr80izA+OSwpMLyOL2AdW9zwd+koXXarVmFbySUv2KXUESsFmV8rLg
 IVPDNsgBEnk/u0jsyGx3iaOPrQgXAbIXZeEG8FEuPB62DiNzcEoAwphZ6LlqXk4WZP+8
 8Xiw==
X-Gm-Message-State: AOAM533/Uf1bP/0oLEY0L3gdpENq3Pa5oJ1qx10WnticYXR0mMBdqT2z
 uydp+gds552MRnGcocqT0kNEnQ==
X-Google-Smtp-Source: ABdhPJzPxLGaqDrBVi1qIM3zlej/zQPuEjYD46CuXPnIXyoZYNBSqjofyZV7UJNdPolorcQ4lbi3uA==
X-Received: by 2002:adf:e845:: with SMTP id d5mr36211901wrn.96.1620206584696; 
 Wed, 05 May 2021 02:23:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y21sm5088878wmi.15.2021.05.05.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:23:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5B8B1FF7E;
 Wed,  5 May 2021 10:22:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/7] plugins/next (windows, leaks, tcg tracing)
Date: Wed,  5 May 2021 10:22:52 +0100
Message-Id: <20210505092259.8202-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is my current plugins queue. It has a few fixes from Yonggang and
Mahmoud as well as some minor tweaks to the TCG tracing. I've also
marked an intention to deprecate following the discussion we had in:

  Subject: trace_FOO_tcg bit-rotted?
  Date: Tue, 06 Apr 2021 17:00:20 +0100
  Message-ID: <87eefnwd0l.fsf@linaro.org>

After the fixes to the tool I've actually managed to implement some
trace points in the generic code but I was still running into issues
in translator specific code. For the time being the tracing
documentation just references TCG plugins as another approach to
solving these sort of instrumentation problems.

The following still need review:

 - tcg: add trace events for [exit|goto]_tb and goto_ptr
 - scripts/tracetool: don't barf validating TCG types
 - docs: mark intention to deprecate TCG tracing functionality

Alex Bennée (3):
  docs: mark intention to deprecate TCG tracing functionality
  scripts/tracetool: don't barf validating TCG types
  tcg: add trace events for [exit|goto]_tb and goto_ptr

Mahmoud Mandour (2):
  plugins/hotblocks: Properly freed the hash table values
  plugins/hotpages: Properly freed the hash table values

Yonggang Luo (2):
  plugins: Update qemu-plugins.symbols to match qemu-plugins.h
  plugins: Move all typedef and type declaration to the front of the
    qemu-plugin.h

 docs/devel/tcg-plugins.rst    |   2 +
 docs/devel/tracing.rst        |   7 ++
 docs/system/deprecated.rst    |  13 +++
 include/qemu/qemu-plugin.h    | 187 +++++++++++++++++-----------------
 contrib/plugins/hotblocks.c   |   3 +-
 contrib/plugins/hotpages.c    |   3 +-
 tcg/tcg-op.c                  |   8 ++
 plugins/qemu-plugins.symbols  |  25 +++--
 scripts/tracetool/__init__.py |   7 +-
 trace-events                  |  12 +++
 10 files changed, 155 insertions(+), 112 deletions(-)

-- 
2.20.1


