Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6300C6BAEFA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:14:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcP4G-0006tY-Ur; Wed, 15 Mar 2023 07:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcP4E-0006tO-H5
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:13:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcP4C-0005q6-P1
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:13:14 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso854202wmb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678878787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5+Ha7AWPe0Ij4Dk9r69c9tNMAy68evnLdoHdgGkeNdc=;
 b=BP1eYUe0krBRyshBxQLFqBdIonOpz0xqfNgKSpCVg2zLQ4O1L5D0WdkfGPB1c8tzsh
 gg0LbZmE27qnAQd1r4qEsBN/ncqBFCFaqe0pRcUZimY6QTxbrnFDfnwN1qbXDRWZgS3j
 aaAB6NdO4wxPBEkhMuT90MxAJuHYPdbpaOU8+6ciW38rZc/w1+AexCIaIsyHQT5w23lK
 N/GwQf/45S1E7kEZ182riF4U3yfjBcoWSSKe9Jix56mSgUC6grnCjlNLuJ4lH6zWJnEf
 d8M1xjFopVT3RO8lBYCEonRTLb8hj4kmOWH1TdkLgHom+GGAc5i6S9l9Eh3rZYjgVCg9
 7u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678878787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5+Ha7AWPe0Ij4Dk9r69c9tNMAy68evnLdoHdgGkeNdc=;
 b=E48Ql0Ugn5Fr/DLQ6mn40P+5KpHR7WDZixu7A0aDKgRC6GNErDH9HtQVIKEMq9XIbG
 iiQU+K9Srp0WOm1Bx408sg50DgpMFn1o5BFb4pBx63BAAT+dO5ykW9EdsI6vpYH5r7Pt
 Av+rtdqliVDCt87DnF3ybVzJIySrcwKWuBmyHmLLsYnoPImthp86CSqhGhzZEGGhvSLn
 BYv4dMQdYVnaCdss9rMuAu6vhfAtmtKKN/Aqs0LcfhhmHiLcYT/htiH/oFx2pRz6XwlN
 X+diS/aXl8bu5jCjBYKjRph8p9t+1U//c3npS369q0BsOwWdqB4tC9uMhmfGgmkxYbi3
 QUrg==
X-Gm-Message-State: AO0yUKW1kg+F09hFZ8Pycpe8Fcakyr8YdsrxmB1XE12EcHPqNQygw97l
 Y1Yn52VNDFJJOISWmJo9KvXKfco+l7SEZPN2Wfgfmg==
X-Google-Smtp-Source: AK7set/gmHAZyEXQx/Pc+imuta8RYRHpDemnHAftWZroJPPSFUKyQzGoSLgXBEva7likZViuh60HBg==
X-Received: by 2002:a05:600c:1552:b0:3ed:1449:cdca with SMTP id
 f18-20020a05600c155200b003ed1449cdcamr13546296wmg.2.1678878786724; 
 Wed, 15 Mar 2023 04:13:06 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c378400b003ed24653333sm1432912wmr.33.2023.03.15.04.13.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Mar 2023 04:13:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/3] qapi: Simplify enum generation
Date: Wed, 15 Mar 2023 12:13:01 +0100
Message-Id: <20230315111304.21692-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

QAPI generating enum count as part of the enum forces handling
impossible switch cases. Modify qapi/types.py to generate the
enum count as a definition.
Do not try to cover the unreachable 'default' case.
Clean files covering unreachable foo__MAX case.

Since v1:
- Update documentation (Markus)
- Do not generate empty enums (Markus)
- Collect R-b tags

Philippe Mathieu-Daudé (3):
  scripts/git.orderfile: Display QAPI script changes before schema ones
  qapi: Do not generate empty enum
  qapi: Generate enum count as definition

 docs/devel/qapi-code-gen.rst | 10 +++++-----
 scripts/qapi/schema.py       |  5 ++++-
 scripts/qapi/types.py        | 11 +++++++----
 scripts/qapi/visit.py        |  2 --
 audio/audio_template.h       |  3 ---
 audio/audio.c                |  6 ------
 migration/migration.c        |  2 --
 replay/replay-input.c        | 12 ------------
 softmmu/tpm-hmp-cmds.c       |  2 --
 ui/input-linux.c             |  4 ----
 ui/input.c                   |  6 ------
 scripts/git.orderfile        |  2 ++
 12 files changed, 18 insertions(+), 47 deletions(-)

-- 
2.38.1


