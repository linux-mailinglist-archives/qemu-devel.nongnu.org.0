Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9A253E4FA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:09:59 +0200 (CEST)
Received: from localhost ([::1]:44732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDQb-0001Zq-S0
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCmK-0004Jn-NM
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:28:20 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCmI-0003M6-2O
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:28:20 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30fdbe7467cso107624487b3.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2v3Xru2fmuRgDrLBzyxs1tMIRmpGWZlqlXKIH4ToY0=;
 b=YFJSXlNseLsrmXnPb2dk686Qorn7np83yfrOs1sQaMfpDuL0i0Se/umq4HOxunKGXi
 95+hcS0PzejaITPrI1F3mK7Hm0QwbrWB7RkYVM0hp3wPERjawTe3yp85rCOdjkOU3Eb7
 R9Ug8YNZcq3mOQOXaFH9QrsXShCYLgCE28LNA8vMxNJ1z5WM5eLFOT9NXcIGk/aKbx7E
 K2AqD9n5c/uGDj7e5YPUjZoiWAx55vsceoLdUtVmlznwAMJnIUVqsSTPa4LQKaOgYJuT
 ehLXBy57rjENdiaQifMfXifQzJQ+bdIV3T77Uq3l4QsczHCq8+GSAYAaXw8if0sRXihQ
 hWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2v3Xru2fmuRgDrLBzyxs1tMIRmpGWZlqlXKIH4ToY0=;
 b=8E8rq/7K000NcPCfT1Ekk48jWMVIaqQA+1wjmPaldkvWcHx5inbHhaT/L0trLi8PpK
 WALLt02BqxuWbydgDk4JstWesrHKeVEVsHLKLkRbkptsJATWKBnf6tbFo+HSEzafwllx
 fkbgCSZdVUONzkF/HhUn6zVjWFe8wix4BGaGyLZnqdQTYOUiWButIx/2VeGCp+G0yWO/
 zg3KFBQONd7WZ8ajzG60ikrV+ruUlhanZKxBBBfgcMZO5UveMGQKy/E35ZdKhEN0HqYq
 qWWyt01yZe6pbAsJmVB967144Z68g0xTDBhTIOuoWjzs7lmBra50syM035YXfBu1c+5c
 3Ong==
X-Gm-Message-State: AOAM5300Z6qtj9aqOKjkpScG9G+30MJ4SVegA8zpLXaaQ8YQdEBXUvQg
 AcRFIB/jihvKirIidjNwbfaXtQTAz4CZO6rMWWqQ9g==
X-Google-Smtp-Source: ABdhPJwiUdk3dOmwYPc4jrsm4HH71XU25x22MzxFk9U50JXYC6C2X6a6AmAwY+r1lwQSzCkPjaKsTtaB10W86j+PhRw=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr26113258ywb.10.1654522097049; Mon, 06
 Jun 2022 06:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-24-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:28:06 +0100
Message-ID: <CAFEAcA_wTr6in4pz=i_hLu89hp+rmo8_iMCaOytGNkZcgH2XDg@mail.gmail.com>
Subject: Re: [PATCH 23/71] target/arm: Add syn_smetrap
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jun 2022 at 23:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will be used for raising various traps for SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/syndrome.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> +static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
> +{
> +    return (EC_SMETRAP << ARM_EL_EC_SHIFT) | (!is_16bit * ARM_EL_IL) | etype;

Every other syn_* function handles the is_16bit argument as
"(is_16bit ? 0 : ARM_EL_IL)" -- can we do that same here, please?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

