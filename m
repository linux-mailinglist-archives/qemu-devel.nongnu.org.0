Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E94EEEA6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:58:24 +0200 (CEST)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHnD-0006NF-Gr
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:58:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHfK-0005kf-Us
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:50:15 -0400
Received: from [2607:f8b0:4864:20::b30] (port=43718
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHfI-00036e-Sc
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:50:14 -0400
Received: by mail-yb1-xb30.google.com with SMTP id v35so5076363ybi.10
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cWmLecHljmM0e7tYKyTmUILJi8nWEf2HHYTitotFxwU=;
 b=WGQ+KevU7NHTS2um/PU75HNQgU2OEuL7FxDdZltS34JjPz100C8EST7OdFOj02PAp+
 KLEgJBgqXnfwpYT7e0ePd8UeR8Bw38+KzqyC2/RlRRdXNCs+pKXyHBZAYx6H46CwOVWy
 E/nLM3TEvCxp28bpi+HKT2EXoTO00i2WEdCiOmcWZtLuflxSIdnbyLidrupo9RzTB2qA
 rot/3UT9eQG4mfVlQPiEn81aXkx7j7LdiP5UjpSXcdENLNE2IxMe3aY/mNrw53DPxQkI
 Yoke8FhmnxApVcd3QqCmaKNxXzLKnbKSCH5iNNqt4pQumSd7cpheHab8JiuXgq/wYyp1
 W9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cWmLecHljmM0e7tYKyTmUILJi8nWEf2HHYTitotFxwU=;
 b=3VpcBwvOBnDcTAbR8oupuU8iOdr1NG8Yn8X3k7nysuE2ki/Wpj/7lQU746bXVVzai4
 ttFGWGABWAvnOUNHxBmV+4+pb2CKCA8GK2RGjMUoRtxABHBppZbu3cjabyRJxPxAddS3
 0oVmLBTFjVLDniBlutovRF4ienT3b8SAqdG3ZbdzzMCV29uMzdumYMjLOYHPLItQVPCl
 U6eCTXJ+GuQgQ9q+dlOPwXjax6XzVsbwV0m8l7tOUVk0qsFExmU9bJ4S3tn2poh1UYbM
 RTWS+58p6NnaURA/ckp6BUQBgSbki+XbT7QQG5+fbkJKpPK/qOWC6eTKTDkcHEcMJNLq
 8tMA==
X-Gm-Message-State: AOAM533jizM7gz0SnK11YUwKl7ep3AqeXuYOaTkevDyWpUYrUV2awDH3
 r7hS6+hhx3/6YF1lyYUNu2TvzCRkLMEbzCYoa1240A==
X-Google-Smtp-Source: ABdhPJyTuGCGkNsXxkq1uCpbCrzU6V7I9+6IzbkGwlWBDI0n/YpkVcfL4AW97CfCNi0eytlP/shC1cUjC/gzHXre5Nc=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr5269850ybu.140.1648821010518; Fri, 01
 Apr 2022 06:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220401132240.79730-1-richard.henderson@linaro.org>
 <20220401132240.79730-3-richard.henderson@linaro.org>
In-Reply-To: <20220401132240.79730-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 14:49:59 +0100
Message-ID: <CAFEAcA9V+jLU0q27ztHXHgpnv4JXQ8B6n4peXB8u7J=8b0df4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] softfloat: Use FloatRelation within partsN_compare
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 14:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> As the return type is FloatRelation, it's clearer to
> use the type for 'cmp' within the function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat-parts.c.inc | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

