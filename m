Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B451327D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:31:40 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2N1-00010S-OW
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1id-0007GR-K9
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:50:07 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1ic-000296-5c
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:49:55 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id s30so8275481ybi.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/DebtAAlHccggWlW6eZc/NMwLWhH6u0F6zybn2RJLI=;
 b=E46z0e9nB///kB6jqQbdzyeFdaCoEu2LUmWTMrBfZi2DcAzkhphJS+l1OGrjR0CJSA
 hMe2KhZdNHVfLsrVWizZ1QY7ju87h09D6q3vWFw/rFbbOR0jtRjI2PJuwL8NuzCgdVvb
 +sZNKFxF6dsfkTIWp5etwJTudP3en7JClXlbW+um9MMXsPGBM6TTo2ieVOrSLGxLlZtB
 GMMaLO6EB1SK7tDEiVagDNyY4rkd/6S1YMGAiU5NOAD8BND9bnR8rCynAinF2wN8TBPp
 LQhoPWGJsUXOZEZFlRAFweTkxJN0eCTFATxq9Zn7HGoV2b+vsUYlS8Ju6thhKm/mVNW5
 QtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/DebtAAlHccggWlW6eZc/NMwLWhH6u0F6zybn2RJLI=;
 b=2iVPBqGY7VEia4bhh5v8at2MVaQOeifm495Er/KWGYJp+Cqd4EFqv0cJdawXBVx5iQ
 7ReKbTLgSb3RzIONprDpJ9XPqjjCLdQ1qKP7QVl6qmk6hSWdobi+tZRdWj6qI4UOu/26
 MwdoJyxHTWjO8lvgE/I5zFu0DyuS/6wGI9bpfjwaPnz3Tb6KpB8pKBejVX2FwrIrUQ14
 NMtheeBTNfP59VCzT4SiGa6ET3ZLezkzyiek+hWuqzNp+10eE2mxLnJdlOLsEcqRFRi1
 3QGpeXbOnCiuH/juinwjtHqUjUsr7qGdMDXRaAcl67H8E3saey0fnNtuvQ1W2sYeHux1
 GuFw==
X-Gm-Message-State: AOAM5339VezBioOjg0kNTZuydLtB0bNn3ilwjCBNI2HVO/xUnoBk2Lmq
 f8yS8iCHzq+WYjRWM2aYYC0KlqxKKXfTbvHSXJPwRLz/edA=
X-Google-Smtp-Source: ABdhPJxkimgl+mmybGh1C5sb9UkCFhhkIvNcHQfTFXGopJ841wAtUf2+wRf9ZLXYTh63RPg3tqNZwSK9o3pomcnJ4S4=
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr20086381ybk.479.1651142993208; Thu, 28
 Apr 2022 03:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-46-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:49:41 +0100
Message-ID: <CAFEAcA8zjYQyi6cNzeGEy3OqJZVJeBpOb3ZXOPgv+2zOQdXxrg@mail.gmail.com>
Subject: Re: [PATCH 45/47] target/arm: Use tcg_constant for predicate
 descriptors
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Tue, 26 Apr 2022 at 18:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In these cases, 't' did double-duty as zero source and
> temporary destination.  Split the two uses.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

