Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC1559A1E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:08:50 +0200 (CEST)
Received: from localhost ([::1]:36402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4j3J-0006vg-JO
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iz8-00034n-Ty
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:04:42 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:40464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iz2-0006wM-IX
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:04:30 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-317a66d62dfso24068327b3.7
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfDjcMR9+awmZGnO0ppivvxD0ZdOE/LSdtfasxFk6tU=;
 b=cIY8VrSoU1fzTTzha7tyc48sw1yCsAgOZJs18AIN4b9q56rP4CWXMNOYD9DCRjx9L3
 jRhLlOjO2c/Jc5P2VETkPstxY5B8UDFfY/qu4nnMNTQfcpv+YhFIMedjEJauQPUnYcK/
 CcFuvE/Sxw5qVrBwBmL3ML2NIV4QlJswzIHGChsU69cY3Y3Upw2ySRO9xZrGk/VLrE1c
 srP70a3zv58cdOcLRPMzkJ4HtTnDyiZZQuW1BW72dAgBAsKeUB/d0ImRmVd4B/+TBrMr
 OXb53XZZnPHOGhy8Ll94QVd9OGgauKC5dxtqmDsDM4mM1jLVPDTbh9uAUzAeymSZKxRI
 SQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfDjcMR9+awmZGnO0ppivvxD0ZdOE/LSdtfasxFk6tU=;
 b=sj1DyQi+KrdTtAnLSziupFjkeEhuDcMJPGpnysKcgoTd48TTHCmqtPJLcRp+Rj7EcZ
 aTU4Lsqywlgc4hpnJCmx6D9flzZpLs7zc0fR7xIJxOpNYUWGRkNp+fvhVsPWh57db1+f
 IO1hBLXds8IEE7nut6z2WNYOk1i/UjKEwbZ2SMjenzV1ARUM1iorYa94eAKVVadhLZy6
 I0ScwmoJ8bYL+1RelW+2qf4ihv8B14c+XTp63Tf4Zk6LzH9VWegfI8n8wZhtvQcPBVTN
 1W8l4E1x+pppP41Hqc3GQe2fR3nMkC7UYOlC72jSozec+dTYgcesNl8FAtnbalAzV0qH
 ugCQ==
X-Gm-Message-State: AJIora/CSutF6IcRhWBnfBu7oR6EPf3hCcDwc0upghTYaSL6hdLLDl+9
 lAFOlYdUD4O0fjNdbsNKk7G0nMM2KiqNUvp1Yb1BQw==
X-Google-Smtp-Source: AGRyM1vX68MJ/BDxqFf4boNCpuTGB7/+XmVJzMzBmkkZcT/wWMXo/V1eQefsZrbdKBM1CbTzejlX4qevqvg+2NUDqcg=
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr17424705ywg.469.1656075861322; Fri, 24
 Jun 2022 06:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-39-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 14:03:43 +0100
Message-ID: <CAFEAcA-LSjXc6zk1FOn+6YmX2ZLLwg5bUGDX5MCR1S7ZvUtQ4w@mail.gmail.com>
Subject: Re: [PATCH v3 38/51] target/arm: Enable SME for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 20 Jun 2022 at 19:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that SME remains effectively disabled for user-only,
> because we do not yet set CPACR_EL1.SMEN.  This needs to
> wait until the kernel ABI is implemented.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/emulation.rst |  4 ++++
>  target/arm/cpu64.c            | 11 +++++++++++
>  2 files changed, 15 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

