Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A40650B495
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:01:29 +0200 (CEST)
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhq6S-0008Vw-8z
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpxq-0001o0-V1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:52:34 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:43623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpxp-0000rA-B9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:52:34 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id f17so13508604ybj.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i7yrw++c0JUn6Tq7eJdTKv7p1bKNR2LXL+dQvKR1EuY=;
 b=NDls6/v8hCsM0kbYfNn0nA+Z8RrmGttD7Ip1Aa/hzMwS4NM/oV5mSJjiMZG6TfAvSe
 MMwubXzMtE1wTh61G1tkQ+Rt6OIZQsDHEqch4KoYDyqKmjFfhMRhKBbPrbpftXItSb+j
 VVB9hdrZC5yACBCs65XVgAO2pieVDWoATCS+q9Cbaz/8wxw9ytOnHvtHtkOqZ4FgqPMt
 rm6E42R9DuxXXgwWWb3d9+LQWHsFU2Uym3Om1zlQM4IGYjf9t9S7hZ1Ii7m8VS9+kpnZ
 89ea0w9NtXN5La4t9Xpkl6lr59B7Ukmu/AYSdYpRz3NQg7YQZDUK4DDt2cweK54BBh2+
 NGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7yrw++c0JUn6Tq7eJdTKv7p1bKNR2LXL+dQvKR1EuY=;
 b=BTxHMVX+YoBcRLF4IQCx9XzGcAXXpT2Ssn9zq1fLqqwI8Gomf/kIGIl8o+WvY452z3
 HWMZdPbCtMokFCUdzj7oKJjq2sibcIaEAtJYyMykZWfbg/xawWBOgi4e73TkxjTK9g89
 xRCFhSs9B3adf7a2rp2i3naFSGXxG7QaRjjRZvYNMC55PyVK3IOFRJzPJ8fmM8f2sCyc
 RP1mPiAG0h6IhuqzENMhDo7OoF2C4CNshb2I5ZI3Iu3kGQXK/vBJXEEu9XexbrQ1udJ9
 +eXq9i2FAfgid//07+8BAMoJWWyemFz9JxKMkczxcxwGhFzOYK+/KN69rK4MSkeqroOV
 xb1w==
X-Gm-Message-State: AOAM5335OP3tUqhW92h2zp3OUEd7neLTiCOEjbxGfkniXk+sPh9rV4DQ
 cJmVvggqMZoV6GJSxDUiIGST6V0tDTbZpGm+e113fI/70t8=
X-Google-Smtp-Source: ABdhPJz322Ndys6DYjaJ0lLX4a+jW9V4V7Z917iz0APgQnzoBKDIkf/cfE1O4thw/qsTG/ze37bAWZB3A/I2jpYC/DM=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr3561103ybq.67.1650621152269; Fri, 22 Apr
 2022 02:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-30-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:52:21 +0100
Message-ID: <CAFEAcA9Kh8ws0D-DZdj7V9pm=tpOfwY=MxFzCNK16YWY8uTm=g@mail.gmail.com>
Subject: Re: [PATCH v3 29/60] target/arm: Change cpreg access permissions to
 enum
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a typedef as well, and use it in ARMCPRegInfo.
> This won't be perfect for debugging, but it'll nicely
> display the most common cases.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -8741,8 +8741,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
>              break;
>          default:
>              /* broken reginfo with out-of-range opc1 */
> -            assert(false);
> -            break;
> +            g_assert_not_reached();
>          }
>          /* assert our permissions are not too lax (stricter is fine) */
>          assert((r->access & ~mask) == 0);

This part is an unrelated change and should be a separate patch.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

