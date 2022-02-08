Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FB4AD7D1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:50:25 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHP0q-0007v4-FO
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:50:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHO5t-00048x-Q4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:51:34 -0500
Received: from [2a00:1450:4864:20::334] (port=44841
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHO5s-0002FD-Db
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:51:33 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so1304059wms.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/cp0Eavh3V8E0LPz1o2+PAYITsGwCDODjGDBiSDjLFY=;
 b=uybl98UnriNUVqXizEUHEP2IL7vQ3WnL/W/Cumq7Tfo8qoRHTh/faNF6wmRAIH+3FY
 oZ9vuJQKqowAAe65pRKy3gL5jyFtamThER2MbRpfyGBfYbJTDTBfcl6xkFHDze/zdeUq
 hUuC58JKviWXqRCF8RxLVFV7LzYPNa1+NHqgIPGXDIqnixMNfYvgB1EhuokwTI9vbn7M
 b+n2S5si8DwHm7HYWY7fGEf0rgNiSaT+VswFww+9zyfYgXj6NvNtOwL+TeLMyEoxaDoL
 dasm9aQ/NkTsRrqG0lb+L/S6NARY0h08vGAeevyfXHtU0k9Ud/akbTqre+7Cl3Xodrml
 TUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/cp0Eavh3V8E0LPz1o2+PAYITsGwCDODjGDBiSDjLFY=;
 b=Gq0iBnCRgvERT57YKL2zUjFprL8/oYubL5Ms8miiSC1XeXhLQ3An+aGsf28ygiZvZL
 yxyjHvalwaFQMUq7qEol4zcqlRbCRm4vxHWiZZldxOXqGSXt+P7Q9vrT8KFqoaYycuNw
 EHt3wWX6ui61T8G33uedvYYOy7SxhWj9L8KJk+aMSLpxjf+96vfSbcEQ/S8xuhlJrOZA
 nxhEqdQKgDEtBO6a5UuZMF8ftbfjhNw1t19Oof1cRdzuQ/Ux4SMrdMQHGol3ly35H4cR
 5hEyHYyaD7iuPKdNfqcPvw1ux3kS5ONoOHnJj/nOBJ3Tr/Ubw4q2EOuCgE/Z2xLcdsF6
 LpUA==
X-Gm-Message-State: AOAM530n7YWSQmiqZty30lPtALCMA7Tgu65I/Iz+Imk6OJbRtsUK+ezZ
 BuBPVZHrjbDnXYk6Q8geQheA1ktToB8fm23RXFbc5A==
X-Google-Smtp-Source: ABdhPJxY/8g83pHfDPnetF9EYHz7sSLBBllsb/5GGrm97izYdmf5PHo8gmFHCaHxLDGasHFWw3bnxS3BU3E+JUn0ZyI=
X-Received: by 2002:a05:600c:3552:: with SMTP id
 i18mr606767wmq.21.1644317490659; 
 Tue, 08 Feb 2022 02:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20220208071710.320122-1-richard.henderson@linaro.org>
 <20220208071710.320122-4-richard.henderson@linaro.org>
In-Reply-To: <20220208071710.320122-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 10:51:19 +0000
Message-ID: <CAFEAcA_p=a_sbs=OwN8BrXJNxdhPB+31Fz=Q+sUEiSvUYJkJfQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] tcg/sparc: Add scratch argument to tcg_out_movi_int
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 07:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will allow us to control exactly what scratch register is
> used for loading the constant.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target.c.inc | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

