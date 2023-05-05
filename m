Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E106F80F7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:42:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pussN-0001Qk-De; Fri, 05 May 2023 06:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pussK-0001Ob-VA
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:41:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pussJ-0006bp-Cu
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:41:20 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bd87539c2so2527657a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283278; x=1685875278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GGUYB/K0rHbygF7dcBo384KEw+1cPVilG6zEPPYTpr8=;
 b=QpUPdjyaGWJusiYMY0cklVM/t1EabdSRoPAcVGgdV5t9vWqHm0brbvxrxvMXaRuVma
 lvwi3IHbR8hEscm/GX5RqZGSxvl93wbv7lJ9QkaDasbS7vgerBzvULq+B6PX8UYYZW1p
 5eFxpBM4R9YXQrewF56f0Bzuw1NcMdQhDDbIWupt3RvvxdmYMIr9EQOg8FgE71/9sKf9
 T5xUxUSFn8dwY+ryd31rS5zkMllICaEJoBGtJmpdqIDc6NalwGlc9ISL7JC6neR6XkB5
 yWVUK1fXygLYgweM32wQC5sA1tYr+EgVgIrm39LTJiLdmSUVhsDjJkbG2G5e8PYVNi4j
 W11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283278; x=1685875278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGUYB/K0rHbygF7dcBo384KEw+1cPVilG6zEPPYTpr8=;
 b=luj43lvt0VTRcDhTkq3H6ySkjuJuDmykwlgICIVemZDB0M0ly2cEIl1JB0LtF9Hj4J
 YfouDmLfYEfRHLMxRKmjCTIe+UbDr2S4w1y0xakWIzzCjtayDDVOVBHfEc3Ln0VNkkmf
 WPiesBDpz7wYxfQmMnD2wbImav+Zx56+Vd1X8NibKal/eTeyc9aOOk00r6hoeMErWMdB
 h+3//A7rYDJELZWv8BCd45T9DjQDjp9F6SInRqJZCahbXWYh4VIxw9i3hbHRthHIBSky
 ZFm0N3gHA3v1YzCGbTrDOcGymzvGYQQuCw/0Lpo9u3afgl8q/GpiQ1RWq0xp6AP8Hk14
 yPZA==
X-Gm-Message-State: AC+VfDwaGzkcGOQ3sQWyetpJFNGhGSWhCYciP6miRgdc2khLOnq11ufS
 m6jqC/FRnMM2j6fv7i7aT0MrAoNxWCw/uZu3fNPZxA==
X-Google-Smtp-Source: ACHHUZ7+yiWlsG0fP3XBoYR3uhyG2OgdrnprfQvg3fW/tWuIDZ1vQOMC9WmrWfPy9f7KPE31Y14pusFnVtWT/WJFfaQ=
X-Received: by 2002:aa7:c589:0:b0:50b:c9d4:8804 with SMTP id
 g9-20020aa7c589000000b0050bc9d48804mr1018611edq.4.1683283277804; Fri, 05 May
 2023 03:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-18-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:41:06 +0100
Message-ID: <CAFEAcA9MZtk33geq=8-1vwM2W-fDHa8p1gcUf4h2ztPG7HGWfA@mail.gmail.com>
Subject: Re: [PATCH v4 17/57] tcg/aarch64: Detect have_lse, have_lse2 for linux
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Notice when the host has additional atomic instructions.
> The new variables will also be used in generated code.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

