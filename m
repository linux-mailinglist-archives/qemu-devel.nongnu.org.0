Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E84BDA82
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:21:33 +0100 (CET)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAVI-0004Dn-1G
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMAQp-0002UC-D7
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:16:56 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=42538
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMAQU-0003Nu-M5
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:16:44 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id e140so34982501ybh.9
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 07:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xh2bh1O8qlMBmDmByquuZgViIg+pCAnyuuAI/5fKZEU=;
 b=roM9Un4haCJ2G5ezm7H9RIARj9zPRoytu09lgRrwpYf0lUltatUkq7BBrr/p81QRGT
 KCv25J2gQG6S0y50EsPCoOGZgizvql82MSQYKwj4Ek9Vy6uxOl4tprDh54xjbevKfu0H
 xkV/cdcVat2trOhvU5ZMj/5/PZR2KQciveKEqCQ5EtLu6jRdXVMBulFp+6PobggffZr9
 Kpf39tQEYOuzBXd7upi5rcBfaGmBllzGIO7HTEzVQSNgGLuB+aOf7E9wldQYNEm2Uv1g
 gqttbRrcjc+brXvoc3RiL+5RDGBKDsA7gyFuJNoxHd/YPZZ6xAKOKqjKi87yoEhjBTQH
 /1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xh2bh1O8qlMBmDmByquuZgViIg+pCAnyuuAI/5fKZEU=;
 b=JgJos7Ck5f8szNM9J10U1RMFBDkBq3usuniSWnmwj3/yPRYK4E3haZWwzwT1ACPWzS
 QBhsCRsTVTmpJXH4pDhEqRqdX0Ui0x+azxtn/inYfp+oAkTNJlagiic3lgmytcX4vOy5
 T8BeHSH+ETPr5itwqmoAXZNfR5TGu6O1j5znM5u0+usAaJ11RaBGzCxxLfbgu0Ccvc4w
 lSJwPzoUV5GjaUGSkLSwCH6+JyyU37JiZM5jHGWOVU9GOM6cCm2pKypCGBTV5kD4NGWJ
 YtdBiaEf0D1Ex7Qk6/M/LBvwXluo9fT5iAxuKbxVa/MdTcn2ftfTtr9DbtogULmfTQao
 pTAQ==
X-Gm-Message-State: AOAM531Nz/9OeuU21wK4ijZTzOUD+U2dJLb7XLpQvLXYRuRxoAhC4whA
 steFAUC8A/udd/so552iD+jKE0foXMae3qldJbhesA==
X-Google-Smtp-Source: ABdhPJwwFP+KeWJnR/1gKWTcJRfN1TrBWHmcxffxRdcPJXYKArnHi2rtpySJVldKYO/qHnT0iZEujQnbx40kRECifVI=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr19309251ybq.479.1645456593177; Mon, 21
 Feb 2022 07:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-2-stefanha@redhat.com>
In-Reply-To: <20220221142907.346035-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 15:16:22 +0000
Message-ID: <CAFEAcA-4p1rrDY3ynmwwYWpkeSqNEv2ak1fM2CYLbTddXOevjA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 14:29, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Compiler optimizations can cache TLS values across coroutine yield
> points, resulting in stale values from the previous thread when a
> coroutine is re-entered by a new thread.
>
> Serge Guelton developed an __attribute__((noinline)) wrapper and tested
> it with clang and gcc. I formatted his idea according to QEMU's coding
> style and wrote documentation.

The commit message says "attribute noinline" but the code
opts for "attribute noinline plus asm-volatile barrier":

> +/*
> + * To stop the compiler from caching TLS values we define accessor functions
> + * with __attribute__((noinline)) plus asm volatile("") to prevent
> + * optimizations that override noinline. This is fragile and ultimately needs
> + * to be solved by a mechanism that is guaranteed to work by the compiler (e.g.
> + * stackless coroutines), but for now we use this approach to prevent issues.
> + */

I thought we'd determined previously that noinline + asm-volatile wasn't
sufficient?

https://lore.kernel.org/qemu-devel/YbdUDkTkt5srNdW+@stefanha-x1.localdomain/

This version of the patchset does seem to include the asm input operand
you describe there (in one of the three wrappers, anyway), but if that's
necessary then we should document it in the comment here.

thanks
-- PMM

