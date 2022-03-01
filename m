Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453B4C987A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:45:31 +0100 (CET)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPBFJ-0003Yw-BC
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:45:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPAre-0001Bx-RP
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:21:03 -0500
Received: from [2607:f8b0:4864:20::1135] (port=38810
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPArd-0002TD-BE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:21:02 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2dbc48104beso58542387b3.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dhAeB3XS+OL/ga59IIf1XT2CF6fYk7bEx44MdL8Yl+c=;
 b=rh6Ks4gdfOc3rgVWdiSXU3uDOFBlTD1wOoZG5A9Jb/OTgbPMLJBz3Nuob5tCg8vkKn
 zE2T3sKcasmzpmHdCA0irCFOK1eFEOrFk4e/ZTYi4Id0utNAO1n8bBqCfF35QoVDOk08
 jXk3A6JiGoDC0GQhnLeEhXoar/jjwbVWE2PKds2D69rhix/wUQAzgwa10KKlGZXp0/50
 PoZyOQ6OAnfcETbsGnSmYNV9ofEbxH9DOXeNYds2M9Qm8iKfRRJZEaOQfIcHUpuvlOOY
 8TpjmANjxNPsXml9JXGg0UHA1YGKwldbvBus4NrIVPlvJW65IzknNKeLXMIbMsAluv1s
 KN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhAeB3XS+OL/ga59IIf1XT2CF6fYk7bEx44MdL8Yl+c=;
 b=luYc3UyxQAE2fjt7H5twtJkWS4ukqQlqkRAoWeENtajy7j8ueoMJe7b02gQJHlm0y5
 7ZjSa8EEm2DwG9yjnDuM2OfPw2UjGwp+9yRK/lgA9gfcybxVSkqPIW/3AkFFIB5QiSQV
 gw8z69vLlJ7saIPeXKbqWrkC9Tt2cB4/O3dytwRSmysx/eZQMbHq3yWgLb9tIvipW6Br
 HxD9fJjPUTGqNnDaaz+fhGqPQlpdECz4t5y7/c6yZ+3M1fiP4ogoMy55cUMA2no9HHgp
 dey7J69lu6433jRNeVyIOplV1F1X4oiynTv74uySQ+367cwhtCI3rEolNyMkf0agD7vX
 Owuw==
X-Gm-Message-State: AOAM531l0wp2gfaX7t9SvWETQcN6M4E3m5XCfErysyEjYaorp7FLWuma
 U8sI4NR0ik+8dpfUcC13DJlXGwTdQSrzVhcZVYm/tw==
X-Google-Smtp-Source: ABdhPJw61hcDv0GMmlt0ZB3J0pnozlAupxUqiz6/CHM1cJ3/oxr3L4f+/QeLZClp3upxXvOwvj4GYPsIIyF4wJJm0dE=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr28413307ywf.469.1646173259749; Tue, 01
 Mar 2022 14:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-16-richard.henderson@linaro.org>
In-Reply-To: <20220301215958.157011-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 22:20:48 +0000
Message-ID: <CAFEAcA_wybTgyAW6wrqeNhG7wOZp3Hxr0qN-V+yEovJmJhcXtQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] target/arm: Advertise all page sizes for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We support 16k pages, but do not advertize that in ID_AA64MMFR0.
>
> The value 0 in the TGRAN*_2 fields indicates that stage2 lookups defer
> to the same support as stage1 lookups.  This setting is deprecated, so
> indicate support for all stage2 page sizes directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index d88662cef6..2fdc16bf18 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -796,6 +796,10 @@ static void aarch64_max_initfn(Object *obj)
>
>      t = cpu->isar.id_aa64mmfr0;
>      t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
> +    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
> +    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
> +    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
> +    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
>      cpu->isar.id_aa64mmfr0 = t;
>
>      t = cpu->isar.id_aa64mmfr1;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

