Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1C4DC9FD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:30:19 +0100 (CET)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUs4w-00031I-MV
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:30:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUs0t-0007Eq-S8
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:26:08 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=35794
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUs0p-0002Wt-CJ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:26:05 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id o5so10896965ybe.2
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xe60UNxMF3kTsGB6cVg5bBcy6tJSZRbAD6tjZBRrAas=;
 b=SzxP9H9sbgwqm9q1rV465M/touUbhKeKwU2K7wLH3u3y+tKraZwls1+605VZMcf3Ap
 Rh1qLUjN+eduFomzdGcfEeEg3BrIR2YopSDyuY6qzEqDXijWYoUwuXaut9ObgXXiKHy3
 lSUww/yQYfn+UeeSpim2LaXbLWMrA8k+1Ueu6LAeewAD2C0MccCT0r//1Rw5GC7PTOTB
 qviWs9abocJOD3YSVbCcOXU1Su7NA8XcEFVuZojT42c+YZNFZ3c7ZjK581ze1LihMP59
 uXGfRrPPj2c7kFE1qVO6VJhqIWWt8lnzhhWkl3hewG1sYaoL9JeH0XgMu7M2zs7RqPkg
 uLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xe60UNxMF3kTsGB6cVg5bBcy6tJSZRbAD6tjZBRrAas=;
 b=byWINVYTj02TVdNKJn2VTxq2LN2Lg7DiUFhvOs75VDqffGz2tfaXsLaDq13OTNigAr
 dgLQdcfhV3Uf7yNKOtRqNPc1BdlwFtIS1T9w/kc+2kYHcJjINYt1inY6DCH0woPP+rh8
 nbpPfPCsrvoD2KDSbldryCcz0iTMHtw5WnRMnGagUwbFW/PRwHOaleiWvCmtrFsWL2qY
 2geW3bHF5iW8LhtgqTkzK514dYl3XSOUjV3VMK89U8BB1D2Ov7MrktvA1wDiGxOy1uUf
 YmV+qT9ZRM7i94Zpndcin5QqIDg9n3Rp0Dz9sU9LWZ+kPt2+V9Lk81m3NqWXvRnxctQ8
 IfUw==
X-Gm-Message-State: AOAM531QgzeDvyr5ehvxKZO+YNquWZHW8mocA08d9XsXJqpjRTkhxr1e
 j2cRWdx3wxbK15AA3gqB8mmV/2arHYbxbHdg5LqSgA==
X-Google-Smtp-Source: ABdhPJzKOgWJ/osDDrATbL5tvDKBk8BG7gbvhGjsdHSKf4GIWTUQFjJCjuy10ZcgverzeRBsYhYz+VorjaGNF9bAPVA=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr5540790ybq.479.1647530759115; Thu, 17
 Mar 2022 08:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-23-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:25:47 +0000
Message-ID: <CAFEAcA8=gvB+O1_Sv+MmXLHFw67axTqqQfD6GzL=ACHxzP_ipw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 22/51] target/nios2: Hoist CPU_LOG_INT logging
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Performing this early means that we can merge more cases
> within the non-logging switch statement.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

