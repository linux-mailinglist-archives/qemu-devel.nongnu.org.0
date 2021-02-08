Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76231447D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:06:34 +0100 (CET)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GY5-0008OH-Jd
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CL0-0006Sv-Gk
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:36:46 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CKv-0002fp-Oh
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:36:46 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s26so14407064edt.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5qiKykYVmIFeMsYmYBKcvsq3q5Um3pdsW0URYra6B3o=;
 b=jafSarHMy7ZNI6w53sDRm0Na/Dr3EzS+j7tfnNlP7XvJy0zqqL4BnMO+0EO8TSwfq3
 t2WROuTBAKm+EjLF31qMFCFMDQZp7bm40bzl7TLbOv5SkWzQA04gkrTAl9m5MOWSu6et
 mxmewRl/4Vjf14ige2qzzVJlOPknLLiSKwYO0EsjwYXo1Sf3GgofMuxuosnjN1qKsMdm
 HMdV0wH/B4l8pKvIUb6M/Ca53o2sG34CfQwiXAAipHPMipLILTkdtJX5xL3wg6BBYbyF
 PDsP5ybl3Sd36NyUPU7EBsqW3RSAONLJExZcsA3jstJP4fpkqrNIKIFwRVOtiQMzCUn2
 KLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5qiKykYVmIFeMsYmYBKcvsq3q5Um3pdsW0URYra6B3o=;
 b=PfdAnZZuIiA9soh8FAyCktavWqsNTQ/BbmQwoJyXro1ddjMCNSQi2GgbRkpJgJqj1P
 o0Zxtjzd6yxwj5+alX7U0oA/OO0hMVJsCNTzy0RuJwo+tEstltiuprWMXw0p/xnokDEn
 d7Q//1U+hZpRllCsYJJKB0Pown8PMVMsAXfAYMxUf2tsV4MTxGRb2ZSMlH7TopObMSYB
 Dps+LtzYS1zuWW4/jWvsA0tHsHa9V3TkoJ7byTwB/vUk/GuPIBMV72kGe5F/F6HLSy0L
 Y/SxYnHowMkoqThWcsyrN9NfpH7JoEU3UzmUe1l0pEYrsqvjVXqJyuU0D7qz+nUYtNh7
 rfDg==
X-Gm-Message-State: AOAM530pkztU5sAH3P6Nba4XCA1KZCYrnmRPZS0EgtZCfAhMkgq1fjYv
 zamTIswueZz59JTkJLJ4VxOHem47GyP6SEPqVIzLXQ==
X-Google-Smtp-Source: ABdhPJxc0xgsPUnnNG41j9/lf+PqmgivZ4jxyG/yepsCuZOdeVrwj2mRgThxV58smDiU/9fqArlFSSRtmKRarvXySJM=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr19279980edc.146.1612813000037; 
 Mon, 08 Feb 2021 11:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-10-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 19:36:29 +0000
Message-ID: <CAFEAcA-4Oa2_v7cdmuBg3MiaiRZpTEZaOEe6cMtoMBVVpazfpw@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] tcg/arm: Implement TCG_TARGET_HAS_mul_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 03:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.h     | 2 +-
>  tcg/arm/tcg-target.c.inc | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

