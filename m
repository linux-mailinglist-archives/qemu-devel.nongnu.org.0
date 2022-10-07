Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FCC5F7BE3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:59:17 +0200 (CEST)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqgu-0004Pv-5H
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogqYj-00017u-Vg
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:50:53 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogqYi-0003zA-AQ
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:50:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so7730016pjs.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WmZ1iLaRWTR5WM0lMJr57R9TNS1Stv8HvXzJ5i2EblI=;
 b=CICsygMzgub3EGcE7XFdWJ17zRMTZVEX7qVHIIGWYIQNl8K/Xy7++0pIqiF3JFHSWy
 uumfC9A1nFnICXNNrVK4ikmhHNWw4sJRl1+xTrjz4oEAIXJ2evxD3iUYQZ9t0NXjlwSK
 Q4fdKMy5Gj9LEyyCKMYqdOVLOFnrYirLg+/uZuTrUkjT4cOYet1tEoGAb9082QEL6SQ1
 lvcihu5BrXZ6s2+UNZUaUZh2Kd0F+8KGDIyjDoPE3cKBF63AhDNNVRi5K52graxv+Ta2
 Hw0Up+YVUuLMT8UoUK2CNfLUCVmODpKigQAmNvFa+u/+Hj3qBmh0Go+oHRPgPOKHGtqS
 vhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmZ1iLaRWTR5WM0lMJr57R9TNS1Stv8HvXzJ5i2EblI=;
 b=eaf6Vj1jlWhEJH6J6rSP+6+u5o8s9RijXsxzfkThs2I0rN38EGlE1Y8BBWNrjOCQqt
 HC11JJhnkRnEEF2Lwh04PUGasSijAnygWXnfmaryF45HPDiLZWE2pJCgmNsY9f/R7mpX
 uNYyzte/BtR5hDlPVaEQ1HdnItKn1ZwnvpxOV3t5SM+k7TAVFF3jmTeRSmCcomBW4Ttv
 vqvEy8EJ0hLg0y3bBzqwUxhP2UUK1OPd2OQgkZwuw7oZVHb52Ld1XZ3SHAgHT5r96ZcT
 ZvknpFuaGgDgnGrvVT1mt3hflVzmoI2Lfdh3jDQQPexsCcSSVSvXSl9haqO8ZSKGXyDR
 JKmQ==
X-Gm-Message-State: ACrzQf3716bHbOCS/oI/bIdbmfI7tI2dwpV/M/O09BxIDcII6uooUMYF
 jfvmG7tBjvHgPy1gHQ+YWVdaLPzJsxw2x7B1xbMxbQ==
X-Google-Smtp-Source: AMsMyM4g3YOzcdd/wHLWCuvY4Bzvj4IxslPO5qURlPnigHQha6LlYT7rRmO52sM2dTignpiTXwEQ7VdUl/sm7cYO5LU=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr3085341pjb.215.1665161444789; Fri, 07
 Oct 2022 09:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-42-richard.henderson@linaro.org>
 <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
 <52ec3b12-b9bb-b2a9-52c8-54a7016182c6@linaro.org>
In-Reply-To: <52ec3b12-b9bb-b2a9-52c8-54a7016182c6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:50:33 +0100
Message-ID: <CAFEAcA8Qe-Y1HD8ULjDgrcRGbpXruqL=te9NXtTv2OWv2DOBhQ@mail.gmail.com>
Subject: Re: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Oct 2022 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 06:47, Peter Maydell wrote:
> > Are there definitely no code paths where we might try to do
> > a page table walk with the iothread already locked ?
>
> I'll double-check, but another possibility is to simply perform the atomic operation on
> the low 32-bits, where both AF and DB are located.  Another trick I learned from x86...

Doesn't that cause a problem where we don't detect that some other
CPU wrote to the high 32 bits of the descriptor ? We're supposed to
be using those high 32 bits, not the ones we have in hand...

If we do need the iothread lock, we could do it the way that
io_readx() does, I guess, where we track whether we needed to
lock it or not.

thanks
-- PMM

