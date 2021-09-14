Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1186740B768
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:01:43 +0200 (CEST)
Received: from localhost ([::1]:55776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDgX-0002AH-UO
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQDdc-0000UZ-6Z
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:58:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQDda-0003sh-CK
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:58:35 -0400
Received: by mail-pf1-x429.google.com with SMTP id f65so176478pfb.10
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jr8Kfev7ZsFqPN9qvLzsQKk9i4O/NZformmT2zc/uvE=;
 b=VJHNo7TpmoPYImZKu6+WSZ7zj3isYzD4qyvSD1DMxU/GiAoumXFvyRjXrlnnIvdESh
 pC45NQVZfepAijcMUiEDRcBkePu4OsnfcwxAfiIgjQg6xUfv9ClEhaJUCZhoTFh6TECc
 ttWHkUihOkbxG5ExXLgjooC4moIkfV73s18jMOS2IAEakYnB5tx7CVPyhTXQ04tGRokG
 4rJihLVWXqmJo9DIbJp/ExNQzaHrhZ8+odnpW0yW/JT0HeABvrlFONEC+CNHjjpiwo2w
 U195RcAXEZAbcrEXlFcgJg2yHaoMI4F/HLEMMaZYJy9LS6v+IKioWFxUK2Uiutd0RqPi
 TPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jr8Kfev7ZsFqPN9qvLzsQKk9i4O/NZformmT2zc/uvE=;
 b=XTcX3NcbtxzvUf7L0gfUDyVy5NPbmWHn0+uWBeivcfvseSMk4Lbq50VmK0UGrb3HQ7
 gJNV9Ol9mDCd5pAZzYxRicVN5QNbpcAUpudZFgCzaGs/adXYLd2Tf3/8AnyQmPWOtU2j
 UjrdFYpcTvXjspcQY3Zf6S6k1+7zEti5QFOM+ushCaaCsp/MrdrxgCwKjKHQ67Xm8VGY
 Fp+KABq8QJlNUx/SvjX3WFo7dRzDRDcRCVZIsw+H/0C+hZXbXE4QEQ5uxGCn1lWfml3u
 47Ohfod111zWwJA+ZnXIrDnhQK3Lv2k51hoH3kKIIWSi2UzId3a8K6evzTrs+XBTZtbZ
 h7Dw==
X-Gm-Message-State: AOAM531FDWbFlMTxNr1sJzmweGfULToiOEvdMFnfN1Di4mju4RAjn3BU
 BiQ5OJxSv1MhdvzC5ja/cQaGZZ/jpmWyfA==
X-Google-Smtp-Source: ABdhPJzlJo81wrGJcp9jDijvGt3HBeU4S57+pPm72zaBMD0R5Gw44Ow6bYsbxPfiLeklFIz9qusGNg==
X-Received: by 2002:aa7:9149:0:b0:40c:7aa0:5305 with SMTP id
 9-20020aa79149000000b0040c7aa05305mr6309764pfi.46.1631645911725; 
 Tue, 14 Sep 2021 11:58:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id hi12sm2151229pjb.48.2021.09.14.11.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 11:58:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] gitlab-ci: Add riscv64 cross builds
Date: Tue, 14 Sep 2021 11:58:28 -0700
Message-Id: <20210914185830.1378771-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: willianr@redhat.com, thuth@redhat.com, alex.bennee@linaro.org,
 wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only tcg host that does not have build coverage is riscv64.
Filling this hole will help with tcg reorgs I have in the works.

Thanks to Alex for help debugging the docker image creation.


r~


Alex Bennée (1):
  tests/docker: promote debian-riscv64-cross to a full image

Richard Henderson (1):
  gitlab: Add cross-riscv64-system, cross-riscv64-user

 .gitlab-ci.d/container-cross.yml              |  1 -
 .gitlab-ci.d/crossbuilds.yml                  | 14 ++++++
 tests/docker/Makefile.include                 |  2 -
 .../dockerfiles/debian-riscv64-cross.docker   | 46 +++++++++++++++++--
 4 files changed, 55 insertions(+), 8 deletions(-)

-- 
2.25.1


