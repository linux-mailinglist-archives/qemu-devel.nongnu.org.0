Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC464D154F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:59:29 +0100 (CET)
Received: from localhost ([::1]:49260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXYu-0006Ck-6v
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXWo-0003wr-92
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:57:18 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=35384
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXWm-0007qP-SP
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:57:17 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id z30so24111922ybi.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5P3UPfa7g9z/abjdy0EOmxWpTdoQV9t1dzabbQ8XSxI=;
 b=MbF80HCmzfRfGjZCE3YxFea1P4wFWSOQQXpDusyDxKC7RA3gOSJdsoJhGje7KKlqU8
 mfb74TaqQWcew/qOQATxxkeXhzA6x9ysKJYpkpNllzbnha0i6sZvOE+HwsfA5hDvFsqh
 CnUN7sgyTP4i3F20VHsDY8fT9XgR/fw9R5ne9KYNt33VTVG9hxC6+zumSstWxQnwlnPF
 NL//0BPaorwJ6XYhyqINGg8vLg8C5lBAC7BsN5hqMKFq4ao0GY73cDVjsApmCtGcE/dI
 3nH942q+A7K20xYBUZqnlwhodd2u/8KRIONq4Xb6K3/8KQ7G7xZWbN42neL1kt0JT7JF
 HdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5P3UPfa7g9z/abjdy0EOmxWpTdoQV9t1dzabbQ8XSxI=;
 b=hzDfRdjuGF0XXG200JDynhI5S4H7IbSp4Gp842IaTkbf3ZStQNvDIS02PMPS6S3vn1
 28r6kJapmPoDfOUL1aW/X0DacZIAPxdlCzUYFJwYlF2GbS32QlR322blFpVDc874a1VV
 2Qj+ua8w+8nLLRGrzRngqmJqfe4mSFVj57ukHxINjL/JbLXDbLwYjekBHcJoII29P6Wj
 lq/1Ysid/JZXXtn3Tg7Ilbgh1jbPWdqnD/TJmMsWLWi37C8X1Vc8OmCSPg4Kz19TxGMY
 jQ8HZtwM+XyjBEU5ulwDTKsuwjHJn0TipdaWdqyyMLOyiIY579dDtLXslUGHgge/Qf6d
 +usQ==
X-Gm-Message-State: AOAM530EY6HUj9XbYzkf/0sM5b1ONWsY8GypQbbTABf99G26YP5pKtiR
 MqlRZQ5EKItA/WigNDLxXYNojN2Xd9iT+Kw68zChcQ==
X-Google-Smtp-Source: ABdhPJyTnerBOL+57n4cctL7TzszcP/P1ya8WcyzNfyVwgw1PdEidI+/KZWACB/8wu8kHAjrUFwZadphAMiVMn8yHJ4=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr10348398ybg.85.1646737035948; Tue, 08
 Mar 2022 02:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-18-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:57:05 +0000
Message-ID: <CAFEAcA9MOa_GfzYM7PmhspY_4kaZhFpZ--eJdny7jf8b=WpQUA@mail.gmail.com>
Subject: Re: [PATCH v4 17/33] target/nios2: Prevent writes to read-only or
 reserved control fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create an array of masks which detail the writable and readonly
> bits for each control register.  Apply them when writing to
> control registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

What's the justification for this extra machinery? Does
existing guest code rely on writes to r/o bits being ignored ?

-- PMM

