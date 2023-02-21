Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E8969E521
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVqe-00053D-MO; Tue, 21 Feb 2023 11:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVqF-0004tT-JB
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:50:11 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVqD-00012h-Tx
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:50:11 -0500
Received: by mail-pf1-x436.google.com with SMTP id g12so2887405pfi.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676998208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRJ1SyElx37SyUjbcQrT9HGWKj1vUf9AxqjqCD4h5N0=;
 b=aVD+1ys4FgmOPukuO/lsq+fCAwGT3munfE3iUmAXGVFBVV6StsFDHl/4cP1VzVHH2M
 9cGu4BIIRkgXVSacyxkPS7b9QNxczMDKNfwj4LwAS2O9ZvioiTJiwKuY+V6+YXa8aYMZ
 manZwqtBUAR/7xaCB5Y1aF/mvlMNu721t43BL9IGivaZKFkm0od/ukXXd3dCAxNY3RJh
 QXqqsesp6kGThgIkOu6fCYirib6KtN82UbkzezbI8BKCFuYO8zSGbvVfIgYS/3qyJlHS
 sLsmQZm6IxTJJrlm8VxdMp9f+k1hZpTTI1Up67D07tQbREPmGew4q0BbBb41Dk1o0XqQ
 GeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676998208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRJ1SyElx37SyUjbcQrT9HGWKj1vUf9AxqjqCD4h5N0=;
 b=ID8Y0ODAhsdpeKckw4nCfP8hSxTZvtZNbkeUZBVzUJBaBu4xDdzphoLSbYrdGJl2JQ
 oCKEjIZuGqgvOoVF60/AlqRblotGkN57nhRUQzjwjHquUIF3O3xikdRB2DygvFEwXIlD
 XFxXhrNF2bspT/c5XUMQo7K7wcWTV8/ez8r2wPDYBU8aumzSu6UqPWmY9xmhnp5f9OXw
 qDOqAQ7/cmfRTgqGntkXfksZXwvrumzXf8mekFrV1l9rdEy72xeq4qeBYqFr+cjWOoIG
 KfjYj8D31VuENwY71o2UmTXyHx5j0pcUYdKP7u1DNUu3zFAghIKG0VtWmVo/7ACLrN6d
 gC5A==
X-Gm-Message-State: AO0yUKUURSRLLUD0tSkl46OdRKL/PRcpw+jl/w93HeTeI7lwCgmHBjoA
 BKi6pnHUxOpFdj0+1Vy4ZIK4j0AK2sXA2+aVHPbomw==
X-Google-Smtp-Source: AK7set/Lb/6k4DDOCJN9UJeXQPCsGunSsaGskxIF49qz7PfgSQNhxNlJCIX5q28s4i1zMOXNuvUVdMBcUFXq+0l6q/A=
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr911153pfw.48.1676998207933; Tue, 21 Feb
 2023 08:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-7-philmd@linaro.org>
 <87cz64s64x.fsf@linaro.org>
In-Reply-To: <87cz64s64x.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:49:56 +0000
Message-ID: <CAFEAcA8nC3R5niQPQ2-AVz94HudMJbt9G+rMQhaynqzmm6cVEQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] hw/char/cmsdk-apb-uart: Open-code
 cmsdk_apb_uart_create()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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

On Mon, 20 Feb 2023 at 15:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
> > cmsdk_apb_uart_create() is only used twice in the same
> > file. Open-code it.
>
> Hmm, you could just as easily make cmsdk_apb_uart_create a private
> static function and avoid any copy paste snafus if something needs
> changing.

I think this is fine, the function isn't really gaining
us much.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

