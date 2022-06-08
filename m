Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A98542137
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:22:58 +0200 (CEST)
Received: from localhost ([::1]:35364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyo9h-0000RS-CN
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6g-0006ps-Fn
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:50 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6e-00021x-JL
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:49 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b135so17369776pfb.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wRO5C6FUpI+VmiZc5y6B6xJJvC1DdXdeKry3Lc4f9U8=;
 b=UWQiWSIp7HZZXxqCW3pAmBUFCxyItPfAzlVa/RBOl7C0g3OWntVXH33cRdpfHwIjEr
 4vJLOUj0dTbFXn4VItK5FkUCgxSX5tJeZd7UZ7eSWm2NocN/Ne5mhxroLWjHbkPlMlCm
 cTOuI7+nPoj2qVOuXG1+X4HZLWbNJA/LH3Uw7EZODEoA8RNGNnwX/qxK8+YT2lqNvSHU
 /smwCgFPrcUmMD+aMWqpANmK7BwjGHoC6ng0nrDiMdlj6WCkss6iydvnktb+xLiAYlEn
 ax9oJDsSid7btHFNzF3cujT89TyebBkJIeowwhufv+2gZiis80QjXxRa95W3AZOvJovg
 uU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wRO5C6FUpI+VmiZc5y6B6xJJvC1DdXdeKry3Lc4f9U8=;
 b=AV5G5+n+26Wr5qVCM4JaBxYPrscPdPDGHcBOo/U9rbXGJq3Nksw+zgQpq38bom8aWk
 UdR0Hjed3oCcoI2aj4sfUmx+r10c5nAUdSfZy5aXNDhXlS3dkaMlvFNN1rNSRp28RUeZ
 wfDTF3M6aQRHYJQviZRMQr5354TFpUHGHGNzxaZ78I1JsNzeRl4htR591YZ0BYU5dUVw
 0oLGxC0JYAVzItp8W7lAoss5LzmtbTpvk/wdOjqwODSy8/lmsd6cf+/4J+Xh3/tBPiGe
 OnA2lLuMVSX3sedfCxrJ5yzfXQ/8IH6LdSFW0qfNVfEf2PxfWR0gOrM/4FNqEq9xG82p
 JD6Q==
X-Gm-Message-State: AOAM53112vcO6f4zNSMek7fE2b5Wt72VFeR8fkmF6lRMJ7JNv84ON+X1
 nXXzjMZ/sqSu+QQD9JEnWDeNrxKGL7BmyQ==
X-Google-Smtp-Source: ABdhPJx2aEr6TxTAunyaMQwDDotZXi+cU1ncx2mbVDDPoq9lFNI5fnI2dmuHbBZ4EXmgLUzwsRLEJA==
X-Received: by 2002:a05:6a00:2291:b0:51b:e4c5:627 with SMTP id
 f17-20020a056a00229100b0051be4c50627mr24804511pfe.20.1654665586893; 
 Tue, 07 Jun 2022 22:19:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 00/11] target/mips: semihosting cleanup
Date: Tue,  7 Jun 2022 22:19:34 -0700
Message-Id: <20220608051945.802339-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
("[PATCH v4 00/53] semihosting cleanup")

Changes for v4:
  * Split out of v2.
  * Undo the gdb errno thing; continue to convert between host and uhi.


r~


Richard Henderson (11):
  target/mips: Use an exception for semihosting
  target/mips: Add UHI errno values
  target/mips: Create report_fault for semihosting
  target/mips: Drop link syscall from semihosting
  target/mips: Drop pread and pwrite syscalls from semihosting
  target/mips: Use semihosting/syscalls.h
  target/mips: Avoid qemu_semihosting_log_out for UHI_plog
  target/mips: Use error_report for UHI_assert
  semihosting: Remove qemu_semihosting_log_out
  target/mips: Simplify UHI_argnlen and UHI_argn
  target/mips: Remove GET_TARGET_STRING and FREE_TARGET_STRING

 include/semihosting/console.h             |  13 -
 target/mips/cpu.h                         |   3 +-
 target/mips/tcg/tcg-internal.h            |   2 +
 target/mips/tcg/sysemu_helper.h.inc       |   2 -
 semihosting/console.c                     |   9 -
 target/mips/tcg/exception.c               |   1 +
 target/mips/tcg/sysemu/mips-semi.c        | 466 +++++++++++-----------
 target/mips/tcg/sysemu/tlb_helper.c       |   4 +
 target/mips/tcg/translate.c               |  12 +-
 target/mips/tcg/micromips_translate.c.inc |   6 +-
 target/mips/tcg/mips16e_translate.c.inc   |   2 +-
 target/mips/tcg/nanomips_translate.c.inc  |   4 +-
 12 files changed, 245 insertions(+), 279 deletions(-)

-- 
2.34.1


