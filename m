Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D437F80C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:36:55 +0200 (CEST)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAaE-0006vA-F5
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAWo-0002LK-HT
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:33:22 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAWg-0008K8-FW
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:33:22 -0400
Received: by mail-ej1-x629.google.com with SMTP id m12so39666963eja.2
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CDTIVEvhjG1Vtum1SZsduujZu+aSz7fTPw43mP6cN9s=;
 b=qrh51i0k7n//OWTGzrpvBxGi81JKpM5BcdGgvAZiQmwS/RuuthvXQmvCI0NZbFMp5+
 HI+ih5JQL8xUw00SgDiqidfy+qeqrSvq1rwSt0pSs51x/BjYFk4+2oGZ/VKrMRDfEmnT
 AOsJRjIjtwykEm63FO+8c1BqyiC/yueC087ODO5pmu5WvvpWTmawSlK9+p3ycqInFLnh
 mDeusTVk6koImoet46In0Hgjxhoop0xVH1w/VU2aQrvjrxZMoF6qqfm4kfSs4CWXFihr
 ManXj44voEn0pfQbiFdzrn3tyRqC5iKk2Be5nblLnuuLOdj3NIdZ/O7rPyWGBGi+NrNo
 lFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CDTIVEvhjG1Vtum1SZsduujZu+aSz7fTPw43mP6cN9s=;
 b=fA6eXofwVggcEHBGAvCHXi9DO7Ht5mBojQkFXqtMGmiKzArDMQlHdCQz6wvoJwW6ZQ
 YZDEqOu0JodGDg7cKtIBUAMIoVXpsdLcW3qAbpz5jT4BEq6v4O/B5oByyYWFKdRrcv4z
 dAfkfLCfXrn6w7Fv0xHFXV0IGQ6LPGz3GdhSs0LUKcNndWomDrNGsmGHiZeP/H+GvqCn
 y+THdzvaxDoSOuVEO/Mh7Ph5+cP+VzJC7GMVh8ricogHDIhfp78JP5dMAnpeLXMxXLYl
 +D0Drc+qeYkYJ3QK49i+CMMwDYloeehkkkbVy4U1+IEWaFv8WMzp73So2OSTIojQYROF
 YysQ==
X-Gm-Message-State: AOAM531ImfO8TTrRuz9B0bTCGYhGIaY618fo4vYNCl2wnMw5pBhL//a6
 +u4LqSHjWW/uhZe5pmUjdA7cv3FkWO944jcVRWHmzA==
X-Google-Smtp-Source: ABdhPJyuL788lw83o/u72EvLRxW743ODevebOkSMQLZAR83FtNdYDaJJM+BkHJDPy/67oq3yq+7iQpDRlw5M/usuuDs=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr42953823ejb.382.1620909191521; 
 Thu, 13 May 2021 05:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-54-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:33:00 +0100
Message-ID: <CAFEAcA_C+H=H-OigwdsB-0i_+ORhcCsd8NxRtezeCgPqVQK9TA@mail.gmail.com>
Subject: Re: [PATCH v6 53/82] target/arm: Implement SVE2 integer multiply-add
 (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  8 ++++++++
>  target/arm/translate-sve.c | 23 +++++++++++++++++++++++
>  2 files changed, 31 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

