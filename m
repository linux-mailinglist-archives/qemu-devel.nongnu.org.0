Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491B4B7A89
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:39:22 +0100 (CET)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6Th-000087-NL
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:39:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK62y-0007pr-Ch
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:11:48 -0500
Received: from [2a00:1450:4864:20::430] (port=37425
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK62w-00072X-SZ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:11:43 -0500
Received: by mail-wr1-x430.google.com with SMTP id w11so362445wra.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6l45nITMdKQCVwIvIyWPW5Dh3Kr/iLLnTta+LHGaJus=;
 b=A6fG9N041sS5Be/0wAc6v2GxbD9aNdbSo7MPI4caIMFsQlwGTnddSH/DY7+H5oknAy
 oiSK/G+JfEtIBnNd+gPaJgpLX7/WTc2vDI9XakXyR2u96ytUVGAkfRourV+/Pjb9JXKP
 AlRYfYPQ0/QWOj4eYZdjb5F4yucegN/30mxOA8ElIWVP1OxdVevymSdvKojjY9Nm/958
 EIjHtDqtruvqCzZuBsMmGe1BsUdPNnnIra4gPd2joGM58EgH/P9yHa0FZFnv/Plc+YOI
 HBm+roH2BCMa2iUS8tOoPArdqMzkCm0PHnkkj9yh03VsNQ8Vn456OinmjiLmUziAuS11
 t3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6l45nITMdKQCVwIvIyWPW5Dh3Kr/iLLnTta+LHGaJus=;
 b=J7mXq6N4VRSZtpXyflO8rA8ExwkSYAPaRLTPYw/LOi+9dAj9p5yPhU9pkOBn5XOZyJ
 8dTQwstYtR5PsRO93E2DOIVwnQmnQWQG/QhDyGOGdYA/zCLCOt9lgurw727lXuHiCQn0
 CTB1qqjSW51floWcM3p7Q6YyMQZVZcGURPyKL2pTsUWKvj+pZNHkF4Xj4MdVl5PpL9o/
 us31GZcYPzs8KTHo8UBTZgpC+rXdd0CdVRHjfWRK7SLnc5wWFK5Bp66YATaCZkw1m7bA
 UaC3DLVuGg8GAcqoC+SL6Tx3stUM0FMK3hYNbsQmA+3+qReKJbozlh8zfdJGMUjKVcGF
 siJg==
X-Gm-Message-State: AOAM531/EMxBhzeXCVzROz25NorWcUfjSgP1RXlZzdd0GI/yD1R1WIMD
 yh7IvxMmyk0CcZ96J4n1KQ7Z8/ZrsuG6o5JmbVzfyA==
X-Google-Smtp-Source: ABdhPJzrBoXG4PYgmoTsWvL/EzdkE9C4e/fMXEEFOR1pNYkh6ULjuIKhgiaSvx5LKXBvgBCzQnJt/OFcaNNtv/N4YN8=
X-Received: by 2002:a5d:40c8:0:b0:1e3:e76:129b with SMTP id
 b8-20020a5d40c8000000b001e30e76129bmr19792wrq.295.1644963101035; Tue, 15 Feb
 2022 14:11:41 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-12-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:11:30 +0000
Message-ID: <CAFEAcA-e298ko8fecqzNV+w=xUNu1YRwWi8TfZpcY3-mjPVQUA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] target/arm: Extend arm_fi_to_lfsc to level -1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With FEAT_LPA2, rather than introducing translation level 4,
> we introduce level -1, below the current level 0.  Extend
> arm_fi_to_lfsc to handle these faults.
>
> Assert that this new translation level does not leak into
> faults types for which it is not defined, which allows some
> masking of fi->level to be removed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

