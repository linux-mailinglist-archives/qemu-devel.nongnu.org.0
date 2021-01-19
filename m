Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7FB2FB9BF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:49:31 +0100 (CET)
Received: from localhost ([::1]:35552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sK2-0005rb-O0
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sI4-0004go-Ql
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:47:28 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sI0-0005k9-Q0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:47:28 -0500
Received: by mail-ed1-x52a.google.com with SMTP id b21so12993952edy.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/rLo/Z7Jua44tDgN4jHBQgxvmFybXS5SdAKNpdw+0w=;
 b=sc9lHf0IYPKTPPQcuHUt4b7jaQDJT/5LH6jfHG8PzR0kpOVf3Eyz004c0cpcKvYUXH
 cEgJsCduJyt/ZXGJcBHroBaPHH/39dW4rcsPrK2OpIeRhenb1b6oHDGSmLIUvQkxRSgd
 oBMD+pWRbpoihfdCP/fgj0JLaQYttpg4KV0yli6UvKXipWft33ars5DE8Mdou5gNf1hv
 NVnLDC0LxwKHWbgX2XkRJByG52hP4bKhNWwZ/213pc+hu7OrR04NsLY2NwsPo0lkcYjc
 ne/xzXgzIspbjSyP1jMvkz7WNxuliv2DUdoOTP4kZjVMHNwqEWYW/Id2pANyhpVgDVZi
 SxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/rLo/Z7Jua44tDgN4jHBQgxvmFybXS5SdAKNpdw+0w=;
 b=SbX4OJTHJ0PXXX5mpV9sBsYBQy3AD/HltRDqxeelHci0cKy1bk7OLtC9XdX8o+FHeU
 6NUirVKJ7UZUq9kkvZxYFB1Bk8kaY6gItoO+uoFss2+ZlYQv4XytD6W8NZuN118s0O/k
 QIc18rz4HKJQKGd9im9K260jjgzZz3I9mbj24XDmnOkfKj/KQUM6xurAGWuLoDSw1FHi
 gwYIImgV2p1uCOWbeJ5M76KM5q+4YYgDBGRtvdlc+FAD8LUTQ5QCJbdHEvx+5SAIGIns
 V+QtXB+yFsuQ/9zr7MvhGCj1xIYRGK5eLRVIFQ/5ulVrfJc0dm1ETBoOXz0NNfXriRF4
 Fx0g==
X-Gm-Message-State: AOAM533Hdv6NuPWr+JY5oX4t0Jkrx1uaNwW2qvizTizxTVhZAxO1XxHH
 RDZkucqUVrH8z12UkPp9j6HZnjkqFPkecUBo4c12Sd1Ul2s=
X-Google-Smtp-Source: ABdhPJz31w/pQv5N7K6GVgNOqBU+5CPdW8+QVe4h+CxdYf3YVNZONkaFB/v6Zxf5lhaL67Um/MDPPHn+wK6PpIvKVWk=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr3686185edf.44.1611067642416; 
 Tue, 19 Jan 2021 06:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-7-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:47:11 +0000
Message-ID: <CAFEAcA9=Vf4wEnMT_JKti0f8j=-qUQa4mPQKQ=c165JxQ_xoCw@mail.gmail.com>
Subject: Re: [PATCH v2 06/22] tcg/ppc: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target-con-str.h | 30 +++++++++++++++
>  tcg/ppc/tcg-target.h         |  1 +
>  tcg/ppc/tcg-target.c.inc     | 73 ++++++++----------------------------
>  3 files changed, 46 insertions(+), 58 deletions(-)
>  create mode 100644 tcg/ppc/tcg-target-con-str.h
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

