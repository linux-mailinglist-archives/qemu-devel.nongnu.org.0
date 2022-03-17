Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF54DC9D7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:27:02 +0100 (CET)
Received: from localhost ([::1]:41800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUs1l-00076A-EO
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:27:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUrzS-0005s1-NJ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:24:38 -0400
Received: from [2607:f8b0:4864:20::112b] (port=43552
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUrzR-0002ML-6Z
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:24:38 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e59939b862so61838767b3.10
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyNEgHdqK/aMmTu2SGM0Wua9W1zJVfP++HUJPCgXXFU=;
 b=Ac4DtTywC+4B5KzO24Ygc7dbVQUFgXU3KOKGXolt6eu2Mm1WUy6bDX1AIZrwZ2xW8P
 r3qrS1r3+KDukZPdSFuyAI0Tbj9UVu+ee/iANV4tEUpx3jESvsM6FwY7rHinLLkmR9dD
 3byjSneLCUrtavUZOdIx/QiUnTkUPYWK38FEoSw/NP2ULUZ13OEZpw53AftmF6CuMhCQ
 griJ0CawEzIBEV8YvCouIaW7HNY7t8Sp5es8lacYTCOBxqsJS6/gb32WXr/faMW1bTkZ
 VlpOEnBF29Y/hphNhlFBrctU66njAKAufZSc2q40fCxAB35vyveD8S3D5yX/IP7N99Dp
 zi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyNEgHdqK/aMmTu2SGM0Wua9W1zJVfP++HUJPCgXXFU=;
 b=ovjENMJucZqqBA9slVSt4RYYinAijFVMEkQkubJ03K8VYSaEAJWDFds7huxQio+iLc
 fwRUhDjD8/aJ0uSx8cYW/3VpAXg1sV1BaN/SC/SwVOy9RHW4NnZ+9s5Oq4pMgqbjo5IG
 XfBbGMeefAogcFpZWhLwYtmtevQnK+wCT89NMKb0dqEFq17uRKDT1ZlC4vt2zgPizpsx
 8HGrh0c3elLwkZsptJdNDfoeFwfSQHz595g4lLz5HPnC1LiGId1EnRITr4zO2trW0iDa
 DBWyQ81kRlxM23CSoxeSoA5QGXFvKqcDKdS1RPcpdho41LsqrYDWLhehaUQglcKodlbM
 Rfng==
X-Gm-Message-State: AOAM531YepgM3YqlovI78IsR9bIaNTWmnqoQgiZ6up3IUAEZ0n86iQkT
 kuWUJ4g9bhzhGyiMb24ynq26I0s66nZr7eCkNq5JlQ==
X-Google-Smtp-Source: ABdhPJzy2SQE1EMZjOlsVuJ23tNg0nKIHDwYV/dFY2C+MLuqRtsaRi21bjWOLgzmp0I3yF9WYJPjKJBhNjkbVHpogFM=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr5955001ywh.329.1647530676091; Thu, 17
 Mar 2022 08:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-22-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:24:24 +0000
Message-ID: <CAFEAcA-nn4YC9WO5ajEaZhcqi-9obCZBkOwnmZ35yo7hu6+A3Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 21/51] target/nios2: Clean up
 nios2_cpu_do_interrupt
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 17 Mar 2022 at 05:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out do_exception and do_iic_irq to handle bulk of the interrupt and
> exception processing.  Parameterize the changes required to cpu state.
>
> The status.EH bit, which protects some data against double-faults,
> is only present with the MMU.  Several exception cases did not check
> for status.EH being set, as required.
>
> The status.IH bit, which had been set by EXCP_IRQ, is exclusive to
> the external interrupt controller, which we do not yet implement.
> The internal interrupt controller, when the MMU is also present,
> sets the status.EH bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

