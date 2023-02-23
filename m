Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2D76A0D4A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDoo-0000QN-Np; Thu, 23 Feb 2023 10:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDom-0000PE-2f
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:47:36 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDok-0001sg-8K
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:47:35 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so5299834pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tIw0+UwQ1Nusj5/1tqd0LaZGFfvkZzNO/I/Y5rAHz1w=;
 b=HLkCBgLTw2149VrVLvgcSiyH7SbYnyja6LtNQ6C+GK/CV1jKg5/jgMP3wPOvwbDgIf
 dQjvsHRqvSJBfA6nAlVHtHgz3YXJP9tAg/DnhDo0zX8qnxNXlQk/7A2dVd3rpw9HYYIb
 O2Si/tzhG0luvv+K5frPgKzlV69LYQQAJWCYNqLnAB0/Lmk2tz4p6pcqhLjzGJzPE2Un
 G2PA/ll0TfdYEo2Cc1DDVXKzLNfl8wIBpNcQUPCFAxOZrYSjWxOPeD3Pv/ATUZkAIJ/u
 YMrxHOgPj8mneH3MY2zEsT5TScJPz2OzBaqca52VnkLLGayW7jpP2sxlvc7wXOFWGi45
 /k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIw0+UwQ1Nusj5/1tqd0LaZGFfvkZzNO/I/Y5rAHz1w=;
 b=PkDIRolNWEPcfsJdzxjXCkkQmJ7YLF+GsVlULjkXkqQLIk5G7Ce/SZ2thX/Z5mspIP
 Rtyjadv4BOaH9Y3NymFVcNlwhqpyz8qEF9Mo91R2K/2VuHAnjaPKe/dNSZyzFq9YtgiB
 e2oqW3xmU7GHqUBnCe3K9J+8exlWZ5eGcSViozVmOQVdd7S1LjlSg1PONKamJkz4QDWC
 h1H7xjtwDB8tmfQFI38FYgDIWDBlWYV3h6FaV4nUUwt+Wxc3uW7/ZPnG0pX/TVvmxZYz
 xtCrMogOxWnXPkerSAZDRLqe252ZysBYJoQ5vlpf+jxqu9Hx07D6OY883AHE/UKdSP2m
 KKiA==
X-Gm-Message-State: AO0yUKWTGVJJr41TFBeQMAc6IHcSiaK1W1gT0yr82fv1rA48EQAp+xUZ
 2/A+/ZtLbhKa26FsFCjMW7OavKPIqHIxgtV4lieN9g==
X-Google-Smtp-Source: AK7set9/Oo0bZCWXarX/cyBkJTV/zCy9CQC8F880U6S6nH8TS7RrT2JlVuwkDCmSzAX22dOeBW/AjcGZ9WBuIoBKuZE=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1226520pjb.137.1677167252783; Thu, 23
 Feb 2023 07:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-9-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:47:21 +0000
Message-ID: <CAFEAcA919w-ApFzPrVkS_RC-x2_ObWQVdmgxLs+KF++WzG_HMg@mail.gmail.com>
Subject: Re: [PATCH v1 08/19] target/arm: Add atom_data to DisasContext
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this to record the default atomicity of memory operations.
> Set it to MO_ATOM_WITHIN16 if FEAT_LSE2 applies.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h     | 14 +++++++++++---
>  target/arm/translate-a64.c |  4 ++++
>  target/arm/translate.c     |  1 +
>  3 files changed, 16 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

