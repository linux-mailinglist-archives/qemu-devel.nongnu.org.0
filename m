Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3962D82C1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:33:29 +0100 (CET)
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knruh-0001Qb-Ga
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knrsy-0000yo-BS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 18:31:41 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knrst-0008NF-93
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 18:31:38 -0500
Received: by mail-ed1-x52e.google.com with SMTP id p22so11095323edu.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 15:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HEy9wMH9PzwAixTDEgk7XDxkz6jE9WZCsu8CxWkjz1I=;
 b=KD7G563N9TkCcAAX2V5VbNjjOlYDlsGnfo51mrMRBcSQWB27W4UIU76a5Qsor/Dm2s
 6ERZLfwZr5E7N/kyL9tvNTpLr1Z1mwPuVeO+lzaeGcmRLtA6IYfd1gUF+kkAIPIP2SRm
 gw6HkA1pe3pvF/yI+RtSEEIo6M8OoXMcD7SrVvPG6aRbWAa2+LVwo4GZ0y64bBdvdXiW
 GP4p+G0gloq3mXRdGbiW+uvFkRwaLkiuXveOgAsIR/0qE7QutFyVJ5E2jrRJkKPwuMuT
 Y4fuZa0/YnhqeockbWx5sr0IfxcL0tTsrCLhm0isYci6EQfpbQaXWttebd27fvELZ5Yg
 SPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HEy9wMH9PzwAixTDEgk7XDxkz6jE9WZCsu8CxWkjz1I=;
 b=UKJtaftljYkbDt1Lab+/t5dHleGBUYbWl6KEH+MRhvpBM/poRWbxMQIvv0hNHf2S5u
 v0yKJhbSCDyZ6BCsVxygxPwWtXxziYt3aDuxqfWdDomppGsh1kUdiChFu/02RF3zSphJ
 Xuewnb5jNirdQJQ/w8xHwkI5LGk7aHlLlmHUmiJwTf7U8gqEQZ1kvjNI+lVIi8vLMFq7
 s7CbHU34PKA1EoC9rlvsBQiIdJZKnK4OSUCl5r7zr44AEuvmVwU41a/blbgSLV3MzatN
 +Q9FDDEnU+mdNXQb1Y0Sl+fDepo/Y0p8M7tZSnfzQ0h4iOrWE8kHCH/7AQAayhcNUX32
 SYCA==
X-Gm-Message-State: AOAM531kLlwtt9/4PJfkZ0ZNFuX7ObN4ZtnOTS48FpxfcX3YMd+Q/bTI
 kM5n/jRBBr9qMMB5H4TEOg/Q8JlCkYQMuBm+N49zWQ==
X-Google-Smtp-Source: ABdhPJyRroRbU/Qfd7VMVY99Jt5xQrfaMnhu/a3k14f8Z/aqwEgKmQ+nlBg6cqzO6xjFe+T5Ok+o+eYsO4Y8ylX+NHs=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14136255edw.52.1607729493639; 
 Fri, 11 Dec 2020 15:31:33 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TD93fvQMsSxukRyNgXAoR+Cqh2gW4HZY2okT4tTztXCw@mail.gmail.com>
In-Reply-To: <CADPb22TD93fvQMsSxukRyNgXAoR+Cqh2gW4HZY2okT4tTztXCw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 23:31:22 +0000
Message-ID: <CAFEAcA-DfART76570Q85EiQU5Av6dcE4LQ53_W=BxBYLZaV=Ew@mail.gmail.com>
Subject: Re: checkpatch.pl block comment detection fail
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 22:54, Doug Evans <dje@google.com> wrote:
>
> Hi.
>
> The coding style docs don't specify this as being bad:
>
> foo(/*bar=*/true);
>
> which improves readability at the call site.
> It's not a style to be used liberally, but sometimes it's helpful.
>
> Alas checkpatch.pl claims this is a block comment.
>
> Would it be ok if I try to fix checkpatch.pl to treat this as ok?

Well, whether it's good or bad style it's certainly not a block
comment, so it's a bug for checkpatch to call it one. If you want
to dive into that morass of perl feel free :-)

thanks
-- PMM

