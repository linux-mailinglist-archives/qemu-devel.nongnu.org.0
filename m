Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D94D47C2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:09:42 +0100 (CET)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIY1-0005nx-I1
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHnD-0001gJ-Qa
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:21:19 -0500
Received: from [2607:f8b0:4864:20::1134] (port=34478
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHnC-0000Nb-BV
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:21:19 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2db2add4516so55947187b3.1
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GqdYmQw9z1WxRydVWYrgil53kix75kIz3HfmgUbhcbc=;
 b=HFKCgB+sobpuZgUuVGhchYgeKv2o8AOKxH93p4Q1VAm5IURy23Jm0Y9UGHK+2Gx9nl
 vI3StLLv/g1TU+TJn9FCG1sGwymeGrVCNwXfzVzZ7JKwgcnvdXuqp4nxZJ/GrOZsVnrc
 j+ZMg0u0JrqZutEi1txMjXkJpwWgV0NJpHvuH4qVdowfCmyWS4USoVtsQYunjMtbKVrK
 XDerwXxq/2km16lYJ+omcM9kCiA3OkTSj3IHOqxIH+emtbrYSEjcBFtZCnIKyxtThKYw
 B2wxwRVMmCCJIgPNOW6sxaD7rGlwcpWjh3SZIdmNiN0xj4wKDGGKOIJ0YkFflQD9Hg1m
 BzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GqdYmQw9z1WxRydVWYrgil53kix75kIz3HfmgUbhcbc=;
 b=AZayY2R8eGzVLSyvygUCMANTqFIB7kt8tInN1u30uokE8KfZoNz80YN/dsHkSndFIb
 GW3Ug4lTbaqnmc7D6tNWTBT9JmW08PLyLJLDQ7RY5QSmdGVpRRdfS8LWt6ZqEudUdBK6
 De4cuG86xw+s65nfz+ftf0jWEq2y4JT2CpNDlaOuiKrl5DvO3No1AkBlT/7xU05q/mQO
 UAHsunwe9d2NydtbE0sM3+BInPHrUolHUIYspx8ZBDzZ9jHM5AQO+0+AxsbXLZmVNFgJ
 qa0cpJCAqYZ797gFxxXOF6fkTZkTpVFZ4j8QIb+cWmW5Gv30k+10oR3hBFXidsO9Heqi
 jIuQ==
X-Gm-Message-State: AOAM532z2nMwUMDi8TYOZJpweYki13SO7xShwKT+gCgKWr+blm2dZNEx
 ea0nFFazknVMEXwQnJCC2R6CRQRUMAOynxBQjCKOxg==
X-Google-Smtp-Source: ABdhPJyOuAQpVlgMUfrN9zI3hYdmmDL2XbDBWlUOkoCN14lBkUE/YUT4913lAhqXTlqmUF7LrklZXFMqcwN8FnRfdfc=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr3585437yww.64.1646914877289; Thu, 10 Mar
 2022 04:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-12-richard.henderson@linaro.org>
In-Reply-To: <20220310112725.570053-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 12:21:06 +0000
Message-ID: <CAFEAcA_5THfnvxkBG+7=z0h1qnj9feVJbJWaW5usV+KzoJo3cg@mail.gmail.com>
Subject: Re: [PATCH v5 11/48] target/nios2: Do not zero the general registers
 on reset
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 11:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The bulk of the general register set is undefined on reset.

They might be architecturally undefined, but for QEMU's
purposes we want the state of the CPU on reset to be
identical to the state it is in when QEMU is first started.

thanks
-- PMM

