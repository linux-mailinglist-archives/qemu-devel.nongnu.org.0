Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859B530EA3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:16:47 +0200 (CEST)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt6zO-00040d-L6
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt6xc-0001x6-Ep
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:14:56 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:37393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt6xa-00020s-SL
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:14:56 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ff90e0937aso70831017b3.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nhhp8R671t1gHTu79XBmXqyzoApdJ7W1PBn6qQGow3U=;
 b=LED9BmRVS3km947fVK4mRbt3Uov9KKTRkluOEeHAAer7kRaF+oAHfL7rHixSk6tz45
 UmvB9zrQrHtb3AdN+RHfBGYawzORMLgmImt93Fl1Cm05KDhRZ/rlXKsUedPDMPeJQu4D
 zh2jfeYwOaFoGSu5H5t1sVYkwt4xA4QtPxeV7k7NI84dYHQxG4L440SpYouqbczpUYe6
 pLVIg6ieLjOCCNq6daY7YkqoXtdvk+jR1HjgrZr3Jqrm7PPq02FuTKxzepEGJzyWbThl
 s9/q6VkaqFalYVpyZeR8n44sMK+7rnSR4N1UvB2XNb2hhiwTdmEBLMDOeE/ejzTsevSx
 8RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nhhp8R671t1gHTu79XBmXqyzoApdJ7W1PBn6qQGow3U=;
 b=yzUgxvN1P2rTkdjjXbPUeuRZ80lQ1uto4nRMnX3dUkHB2Tjz9AzVwADDR2axBoV5OF
 jOkljTEn+K39q2KOhiZk/NlS/LUZLszv6y08mf5exQbQ3t2fPYs2yG6c0lsMMadn/hZ4
 zrnUgDhVNY+sIjMEhdTD8OMe4rwHvE9nFItjBM6bzuq7FUczZQz5ZP1L9AJgFbR/4fpR
 HQ4+NukoKVEbKQ6787d+vRKVqw6DlMUOLGr72HFi63mRCOlwhudNaIeiba+aManOBvPL
 1I4sICidKaK22mTZd4yw9PROX4GC4PHjC5OIZekXgBdLhoCt9p/ovbBImL5lyeyd2MCW
 2d6g==
X-Gm-Message-State: AOAM532VZGmUCe0c50cEHK+IOfv7rhDaAS6AVJczBugTtdRlCdJmqPB8
 r3dCvNElLzB6s9hhBotEy+zJgHkA0w4G8KpuUNta/KbcuZU=
X-Google-Smtp-Source: ABdhPJwfjGldlhuP2ouOs9GzsCn/oZL13vGM4PJplIs5Ed88MSVi5vonAoI7+bBsoogP00UKyWbodUClGaMOOBF//qE=
X-Received: by 2002:a0d:e903:0:b0:2ff:43a3:90c8 with SMTP id
 s3-20020a0de903000000b002ff43a390c8mr22665722ywe.455.1653308093839; Mon, 23
 May 2022 05:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-14-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:14:42 +0100
Message-ID: <CAFEAcA_n6MJZ-MjVin6wT4eJoeupX7=jtgThbD2=k=WBuaGEJQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/49] semihosting: Move common-semi.h to
 include/semihosting/
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This header is not private to the top-level semihosting directory,
> so place it in the public include directory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  {semihosting => include/semihosting}/common-semi.h | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {semihosting => include/semihosting}/common-semi.h (100%)
>
> diff --git a/semihosting/common-semi.h b/include/semihosting/common-semi.h
> similarity index 100%
> rename from semihosting/common-semi.h
> rename to include/semihosting/common-semi.h
> --


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

