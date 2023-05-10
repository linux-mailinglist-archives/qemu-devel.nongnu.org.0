Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5761C6FE43D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:54:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwowR-00061E-FB; Wed, 10 May 2023 14:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwowP-00060q-RR
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:53:33 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwowN-0001qq-OD
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:53:33 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so71882803a12.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 11:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683744809; x=1686336809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cIaGVCa4z1B5yNdXLUefPInmKoBbeZzYwSnvQLURcYA=;
 b=EdpmsFIc56dl6bqAr1/8Ik+nG3SkDxR3G+O+MlrzWcYq4IxSP3UdRINyZt41opuHej
 7QKWVKskzf79A8EQUgEq/x3r2WEQoCx0qrKuNu7O+eDgwNnnGaHfahD0Lx2bDKhoHQWK
 U+jeBWWhHZvXYeW3WMijnOnbex6hOsqJ8It1f5e0VFMrZakbZ4WORXPNewayTO7rDnAk
 d2esnUtQnKq1SuXMgl6XPEK4AxQacBp71mBmb85a0XAfTxcFZeoUwetMumGJW2oXpG4J
 9JcnnV/cG4BbqEQVaIOvavT/sEYRFYcX6aVJg2Ens9zKjf0fviBQ93qjOqnQxrzDSaW/
 KOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683744809; x=1686336809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cIaGVCa4z1B5yNdXLUefPInmKoBbeZzYwSnvQLURcYA=;
 b=EqmpBQeiWe7YvOe+7tczUlO550p7WDvsdO75lbKzDNOjSYiv1XyVHmN+CtsqtmHJlw
 Bw3RUjQgGsO869xeY96os9wFz7UhzpjRHGyYDer3sYbMMXZUi001BHQ72FUZ187pROVb
 EJfPHTaRmqfwJZoH1ixm9pRVllzamtK3qVt6GnuOhHCQH29Fuel8W+uUbj29UaLdWgDe
 2b2ZA9ToulzeFdTrYz316E07zuIGLb0PKzigA++AwMYOxY7DDB94zzKRtiNtsiffxIBR
 Q2zB5hygHEoopzaPYqh5pRiWUgpxjg6DvuXtjksuop19PBzamcaXzTQMBDZbnyQsWVP2
 fWLQ==
X-Gm-Message-State: AC+VfDxA2brI0KA9YNQU4DP8NkxZgYIbzaxAcnNcCuKD+di4BZeQHkqf
 65FaZ5pYQFR49WFt1r6vImjPxFHrD70cRfmcYQMBxB1DnTUV/nUJ
X-Google-Smtp-Source: ACHHUZ4Yj9/y7he8bWwReZ/eevLea36RZ+Qw4ZLJYKIG0bJSzuwKmN3/8KIlLLvRHXFGvONQ1/f76Mr+N/3YueP7Nq4=
X-Received: by 2002:aa7:c6c7:0:b0:50b:c4d5:3da1 with SMTP id
 b7-20020aa7c6c7000000b0050bc4d53da1mr16005874eds.8.1683744809717; Wed, 10 May
 2023 11:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230510170812.663149-1-richard.henderson@linaro.org>
In-Reply-To: <20230510170812.663149-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 May 2023 19:53:11 +0100
Message-ID: <CAFEAcA-6EP2ombunHyUHLA4zeTvfVVE5vQ3hO=eV1+Sym63vNA@mail.gmail.com>
Subject: Re: [PATCH] disas: Fix tabs and braces in disas.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 10 May 2023 at 18:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fix these before moving the file, for checkpatch.pl.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  disas.c | 11 ++++++-----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

