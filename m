Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F20E4B7A66
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:22:36 +0100 (CET)
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6DT-0000ef-MO
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:22:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5jE-00081R-QC
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:51:23 -0500
Received: from [2a00:1450:4864:20::334] (port=43591
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5jC-000418-Rb
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:51:20 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso290869wmj.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 13:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t36FUEOGpHRINEpA1Sme+7ycuYx9AQNz7yDBT0eXplI=;
 b=CqawAyRZHgHGGBVbj7fj3VY9w7wvfYtoCqXXOqpJ/R+bhIKApoRFjYu3qhqPrm6RzD
 3vIMFhvXNyilH3iowJJNsv8PZd5WC/CmHXHKPDcYicjDh4qDb3s1YlObz7RIcY1M/xYL
 WDLxOZEoCD0syhk1J5VGaS8CgoU13OTyKQOdw6P2iMuXoUBzRBDMe1RzfPYKHYSzkDB9
 GUVTEdlfgIsoQDjv4oAFOqDuW3FBRLm1JQFoG1C/OcziWwdJVjb2R1lQLzCkdQ8N+uvd
 0I4f9yDeQVUk+wpcB+fIhyaJ8EI8uXT0rqLOhkGqvFFqqwovdcW32UMj6kbDWIcqkUS6
 U43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t36FUEOGpHRINEpA1Sme+7ycuYx9AQNz7yDBT0eXplI=;
 b=5yGobtJ5+9yx+XCo1bf5sXQVJb1bBo9XubqwDm4AT68vSGChMM0XOHxKQCzIaxAUeU
 r0KSLm4cIcbvCc6zGN5cPubxxOCzoaB7MfLlAhkbjf/nARcK4+81F2vX56lCR8ZvepgA
 hmuOBDF8EFU8zeg3Zyid4/7eknjsnA+UYVfZ47CLkO7QbamXC0leBOFPV3nSdQcD4sn1
 bjhrX1rVqZfcFlKaVGeRKE7IX38Q3Ht7c4BJWbdI+EX6uC7xVzc5sL/4HwNqdKnfL5k4
 ki3DZCkD1UgrrenINYkQD4Xk5TzadJOE9M9e+3wrijN34xKgnV31pCTtuYa7zRFVBheK
 zW+A==
X-Gm-Message-State: AOAM533WrsTUQU4kSDGR3p/0yPjG4Hab0MoH8Z3XMLDLXoCiFGwoSUWU
 5zdsK6Zl8SH4hsRTzdKOWAYjRgE2CsdZGL3dcFvuAWaNaws=
X-Google-Smtp-Source: ABdhPJxEcFP8I5mD54DGKW4yv/VJl7+tWDl3cLJFiXBblLfnBh5gU6QJ72hTY9ohHeps754qyVXcIEGIEiSFD4ibm+E=
X-Received: by 2002:a05:600c:3d06:b0:37b:a5ea:a61b with SMTP id
 bh6-20020a05600c3d0600b0037ba5eaa61bmr54790wmb.32.1644961877322; Tue, 15 Feb
 2022 13:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-4-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:51:06 +0000
Message-ID: <CAFEAcA-+CTmcqG1F56miTOixvFVAFfFmyUscByhENp7zNMXx3w@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] target/arm: Fault on invalid TCR_ELx.TxSZ
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Without FEAT_LVA, the behaviour of programming an invalid value
> is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
> minimum value requires a Translation fault.
>
> It is most self-consistent to choose to generate the fault always.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Continue to bound in aa64_va_parameters, so that PAuth gets
>     something it can use, but provide a flag for get_phys_addr_lpae
>     to raise a fault.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

