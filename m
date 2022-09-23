Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A115E78E3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 12:57:33 +0200 (CEST)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obgNA-0003aS-8p
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 06:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obgGA-0006WK-Pa
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:50:18 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obgG8-00050h-RU
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:50:18 -0400
Received: by mail-ej1-x629.google.com with SMTP id y3so27113553ejc.1
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HrA/A36uykpV2o1YIBcGz6WK9raOspNo1tFKHfsshuE=;
 b=FgkueYY+5iYygbIkgdcwIbMDW/V5lD/NNMa+UKyac55Msqm/Td2f4kiUIZ0JGIto/P
 ip4mvI6B6+rVXGbG8OYfYDg2qUmbuoY4o3t2QE0tBtVkvCmqQ+PF5F/YO0vmPwwfUhSG
 nKClMhh19fFekDjAYV5bkIHY22oHkh5mhMhlDd6qlzx8c8glx66CmIgZqpzNfmkBVSOI
 cUiKCC5PKDfvlznq/2ROyb/G5YGpXCAK901KN5y4ILnb9ZqeIL/2RvMQTJhqCkTVp5cr
 4wd2we9ZPxFq7gdENwnCPZc8juU00hZMQCnTPB3W2OTeuUuTDBMMhdxQvlRrm7t0o4e5
 DTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HrA/A36uykpV2o1YIBcGz6WK9raOspNo1tFKHfsshuE=;
 b=JsFX0s2XJGuLKM+LG4zxMWSNzjo8M14umMnxI5joT8D8/YE92CCroC+FPAx9Ghtlw8
 vNJBjK3agfamg4WA8rCRZqybvA2hCwDxt8t0mXT9+bil2mjQ4WucE/TDPxKyut9zFkX8
 O4aRxQPtuSkrz7A1NjA6/Fo9yulOLKow85Gqb1cCDRddquVecAUNgiEueV6rlxUdm6IK
 XLGksd1v1uvpq9LhCvgFEBl7gD+fzqjYCCE43L47A04tIChPeNXqqTaaOPtH/ynCtVrW
 6wz5g10opqO+hENrww/MFZAXM5toylML3WhZCYzYa9xNyCwJ1x/tZChpboJkd0ttQO6O
 dz8A==
X-Gm-Message-State: ACrzQf3bToEEC/TRwwFDiVoqqZPr987W3R51CSna42qWopEjzZ9jTltq
 iYfOXgLL08s+KQPzf/k7j+5Sp9tc+A7DGlIvSlblCQ==
X-Google-Smtp-Source: AMsMyM5Fk59zSfFduwnXxvJpK1+0YJV9i4+A6n4uj+qGyDJeFiJnuaM9KSkbPaauvatbh7xO1bfWH+yZ/QgAP1w6FXI=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr6347391ejc.365.1663930213494; Fri, 23
 Sep 2022 03:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220914115217.117532-1-richard.henderson@linaro.org>
 <20220914115217.117532-13-richard.henderson@linaro.org>
 <a1289aed-8d2a-266a-c766-7c698a3aebfe@redhat.com>
In-Reply-To: <a1289aed-8d2a-266a-c766-7c698a3aebfe@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Sep 2022 11:50:02 +0100
Message-ID: <CAFEAcA86kLJXstqA6_KeWmLkTaAcp32iEPTSqfbFkD9C3RAKyQ@mail.gmail.com>
Subject: Re: [PULL 11/20] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 20 Sept 2022 at 17:45, Thomas Huth <thuth@redhat.com> wrote:
> this seems to break some Avocado based test(s) in our CI:
>
>   make check-venv
>   ./tests/venv/bin/avocado run tests/avocado/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
>
> ... fails with commit 01765386a88868ae993bcb but still passes
> with the preceeding commit. Could you please have a look?

Thanks for the report. I can reproduce it, it seems to happen
with all kinds of icount, not specifically with record-replay.
We hit the "Bad icount read" exit in icount_get_raw_locked().
I'll investigate further.

(Rather unhelpfully, the avocado framework has ignored the fact
that the QEMU process exited with an non-zero status, has
failed to log the "Bad icount read" message in the log, and
has only failed the test for hitting the 120s timeout :-( )

thanks
-- PMM

