Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25137FC6D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:23:12 +0200 (CEST)
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF3H-0003Zo-MP
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEed-0005c5-7V
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:57:43 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEeb-0002qc-KE
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:57:42 -0400
Received: by mail-ed1-x532.google.com with SMTP id s6so31688963edu.10
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cByo+HAv+WnrF+1RuvCCRT4GjZe5G2crOGDi1tsqJ34=;
 b=EKZEavwvLkHLzh0Byv26Q4Q43c82PJfLGBvot6WVfPn6qDc4LnUPQxf3T6GtNgXb0L
 HbzAsOQuE0wqFu5zujPE37OhcPGECmk6flTwwCpgM5ftlGqUEYykFhuFDee2nGi5Ll09
 AMKZ8poJ1aHCmMYjDXlgOFErSnUZ5sba2s9vbUexfO/kkMYsutY2CN9IkGIbVc5H1qv/
 hoEWctKI8/rpwWrAbQUcFGdC2T/ADi55yg63Oz+Dfah5M5DKgaQiZjmfi3Q/JmsAN7yz
 O2eUj1oyrvekT+O+vDuVUa0VNK1IkwJA3s7+ek1Fol3LVSO3Fu3Q6oi/I462Z6fxy83d
 ASwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cByo+HAv+WnrF+1RuvCCRT4GjZe5G2crOGDi1tsqJ34=;
 b=B7HvqBxmGHxc+9T++S3KAsd0kDmpic74DXZcSpOjqxmOgtM+DNiggH0dTbHRVDEaI4
 FWC/OgujYYn6xiRuJYqZKo8i5S7Fwh4vXBpfbucqSOYzterkzUkRVdLoLwv5upikKsGf
 srt2lMcYp1HX3JhTuLXHHNOPJVZhJp8+/+EjpQlNIfYLyrKOOE0CFZ32NpmptjkFel6y
 87O1lmpLHP1fa6SZ/AjzUgkFasEL5jhE/HQ0a/oy+EcuPXYI7WTOeEIRdewvDiOwybaL
 d3wry+kkVj7T4HdpB6tUdTxxB9TRpp05SV01g6oZ1VFl8eqmqpR00ftmOMN2QztfItC7
 pcuQ==
X-Gm-Message-State: AOAM533ZjTwBTTeHgtypI7eYLj/9wO98wpsXUVL+2+AOrYb2jtj/TfvY
 9/z2U+URS//i8Z5ytG1/RGzEkfk3HYomEL6PhLaPdw==
X-Google-Smtp-Source: ABdhPJw+uRJrPY06dbw7XGQ9xEU7J5LaRJPfjcWgq6zOUAfso4sC28uipM2CV9GYEIyrAT2n+yqqHWMbW9BoXvAAPxM=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr50935956edt.36.1620925059853; 
 Thu, 13 May 2021 09:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-73-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-73-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 17:57:28 +0100
Message-ID: <CAFEAcA8FVHHYsH+nEVmJLYYvOGk-dsStvPKD0Yu_Qp-eDJQVRw@mail.gmail.com>
Subject: Re: [PATCH v6 72/82] target/arm: Implement SVE2 bitwise shift
 immediate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200430194159.24064-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 33 +++++++++++++++++++++
>  target/arm/sve.decode      |  5 ++++
>  target/arm/sve_helper.c    | 35 ++++++++++++++++++++++
>  target/arm/translate-sve.c | 60 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 133 insertions(+)
>


> +/* SVE2 bitwise shift by immediate */
> +DO_ZPZI(sve2_sqshl_zpzi_b, int8_t, H1, do_sqshl_b)
> +DO_ZPZI(sve2_sqshl_zpzi_h, int16_t, H1_2, do_sqshl_h)
> +DO_ZPZI(sve2_sqshl_zpzi_s, int32_t, H1_4, do_sqshl_s)
> +DO_ZPZI_D(sve2_sqshl_zpzi_d, int64_t, do_sqshl_d)

What is the rule for when a set of operations on (8, 16, 32, 64) bit
values should use (H1, H2, H4, ""), and when it should
use (H1, H1_2, H1_4, "") ?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

