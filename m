Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CA4FC2AC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:44:52 +0200 (CEST)
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndx9n-0001jE-Gv
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx7Y-0007gE-Sl
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:42:32 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx7X-0001zL-B1
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:42:32 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id v77so10415208ybi.12
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TG8f7UDChE7ednluA/7rVEB4yBdvDi146OIICyzZZ+Q=;
 b=pApSYyjU80BfREy8/4WK2Kdswauc+W6uwq1s2Uax16TCoQ7oGWZtTiYXI1g7llcnsn
 P+xp2eakqeD5+F1cRyqEe/XPLxzoiib3RiZQCbpoc3BgJHSunmg7tt3sRb7y3dz7TWOs
 bqtqRbh7WcQWac39Ge8G3+daM/l2zh0nO2BHy7n9y57eelrktd3+C8YrYbCDhU3w7QEg
 hbxBLQQh/bAMrEDz4ZtJzuD50ZHWXS5yoCQI+hONmnnJvmlmIsy+Zd+DZN6u6mcsnotF
 Ra6D5DNXX+EQFberf+6hQBHJDACivKQgdXKW0xW/Mnu24SNKOmQgUmqHk/ZfS9LUK3ya
 dJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TG8f7UDChE7ednluA/7rVEB4yBdvDi146OIICyzZZ+Q=;
 b=PBk8gfRAqgQuOL/9VC3EEsb1hKE+BF2o9kbHcTslOPspaxJr1/o4Liouc5uTHRDGgH
 VmH+YnXBbJFG68z8raalCQCkAqlkOX1oblCu0PSlzPK5SjSobrg0YlCQKQMyj7YfzyOU
 hcCe7kD2QQE3ez+WVvMAXCfoM5/gRFGgs52aGLdRJ2Z0RssPBS7XmSvA0ZlQn7xsKt78
 mkoex1LZPejuKdsRola0Fzmq6u/vnm5cwmECyhzpqNXEw3RWxpnJcu6U+3jaX9OKHFKl
 Mpol64wMVLyRq+aqhy6dQTYnQ4xeeaaj+AUMSRSaJnG9011BOcHrXnmaKXSFHgsw0R0S
 ec8A==
X-Gm-Message-State: AOAM533FtCRXDyQt+Nj5RrVGmTkCV2pd30O0GdNizLKjQQgf3ZE2u4wq
 i9ahlK0/9IJyZxDzwVi5zghKZ/zUJxVZKeenrydh4A==
X-Google-Smtp-Source: ABdhPJygg38YDGDuQxOhppmX3MzIGLEpYryK9cASFHzjfZGujR2vhF1A91O2NzfEji8QC7S49WpIj243hd2QPoXFEBk=
X-Received: by 2002:a25:d4c5:0:b0:641:1569:17a8 with SMTP id
 m188-20020a25d4c5000000b00641156917a8mr10099552ybf.85.1649695350280; Mon, 11
 Apr 2022 09:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-3-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:42:19 +0100
Message-ID: <CAFEAcA-5fRQ8868d0AjAx03p_8Em3vCMjYF6ri=XmMiy-a2xLw@mail.gmail.com>
Subject: Re: [PATCH 2/7] target/arm: Update ISAR fields for ARMv8.8
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 10 Apr 2022 at 06:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Update isar fields per ARM DDI0487 H.a.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

> @@ -2067,7 +2087,9 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
>  FIELD(ID_AA64DFR0, PMSVER, 32, 4)
>  FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
>  FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
> +FIELD(ID_AA64DFR0, TRACEBUFFER, 44, 4)
>  FIELD(ID_AA64DFR0, MTPMU, 48, 4)
> +FIELD(ID_AA64DFR0, BRBE, 52, 4)

Also
   FIELD(ID_AA64DFR0, HPMN0, 60, 4)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

