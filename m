Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D564530EBC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:55:03 +0200 (CEST)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7aQ-0001Fu-ED
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7QL-0000c4-BJ
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:44:37 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:33239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7Q5-0007cu-1Q
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:44:36 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2fffcc66fe2so20716377b3.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/3Lz48xSS8yQ3h4UUoF3brnpo2eS2xNFQ6IWelL5NnE=;
 b=WLhyByZrVg93QlsHJ0lGb2R0w5zJeYuzT5lfgAr5fV/k+nMkx4vWCSuL1HtfSqhvOs
 adBwFO/eJvEiEPC4AjZvyzRdRUko+Q171/wBaoEe+mMBTRDEFCQTz7IUKErUqXIrgF/K
 jtTvZ6akJNJDkg7vhWSX9WYOkq1SfeVZTWq+QUsrJtVusDSK225gs29oLe2HIJ/+2iNa
 IflJucY68ek91iyLgsN2f9OW+zaYIESKTmO4udNokrYa/F8tdqXQPB+N27YkA6TNeB9N
 7mo0bRVuQTwQMF0iGkbhOkQMmY/nUvW4l3TQM7gIIh/uekG240GWRX8v27zxF1BIkw+i
 pH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/3Lz48xSS8yQ3h4UUoF3brnpo2eS2xNFQ6IWelL5NnE=;
 b=YjmEMUHgMl+t0oAEHz0UYzpDPGtjCw9qr4owZF+rZPqPiBw6N+Ea0fQS+wpQIbCNw6
 lR0zxLOzaIugLmG/Wn3WgHnJL1LZyBztYlc+ArU+mxXtfwSAdK8FEBBTVo39Wb8VokWl
 91T4ZB1ubIPEOMgyH20QwhKgfAn5FxV6293kttzbB4L0JMmix9WcWjwObP8AibcvBusA
 12I9JAu3rcXnHKKOpYwTP241ZxejdU9fO7F3rUsq+PtSmLEMfwuWD1qXiclrIeGVclCT
 fHqA6GM/VU10FZdrRPY7F+Ftp3i14NvLK/ubCO3ZC0dZ2h6WRot4tYyANX6ASHXFzVtj
 hltQ==
X-Gm-Message-State: AOAM533NoB8a6p4GaLfh+bs+oQXcVY3+ayf+/SAAMiQpg6eaFYT8BbbH
 pN5hW6tf+euQvZck59fX9xf7VnG+8Pars+lTOV+C7Q==
X-Google-Smtp-Source: ABdhPJzi2duRCRY9Xr6Ni7mFRIza6VkRmFh+QnesqgAKibByw3cYDe7yBasmqlh5tDeT73YnZZos+XN4spuG7alLpBw=
X-Received: by 2002:a0d:d4d0:0:b0:2fe:b86b:472d with SMTP id
 w199-20020a0dd4d0000000b002feb86b472dmr24246033ywd.469.1653309859843; Mon, 23
 May 2022 05:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-17-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:44:09 +0100
Message-ID: <CAFEAcA_5Me5oJgi0Wa3okwqNtJkQYHuR03LvjuF2r5BPnHJptQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/49] include/exec: Define errno values in gdbstub.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Define constants for the errno values defined by the
> gdb remote fileio protocol.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gdbstub.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 33a262a5a3..0a6e0d6eeb 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -20,6 +20,28 @@
>  #define GDB_O_TRUNC   0x400
>  #define GDB_O_EXCL    0x800
>
> +/* For gdb file i/o remove protocol errno values */

"remote"

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

