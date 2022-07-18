Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A337578045
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:54:04 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDOO3-0006ot-7U
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOGp-0005hp-A2
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:46:35 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOGn-0003Yh-QG
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:46:35 -0400
Received: by mail-yb1-xb29.google.com with SMTP id r3so20059020ybr.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QVVKli295o7T13jP/inzdTVJznvyWiLnP8E90M+rGOs=;
 b=KIHR9wtkqolNGylAsj8lMwbpMxIJTkr+ndauSQrDHR5Z6XxLlXSLLY3tRfNmFqbqky
 1CKao32dyBaGVj+Zi6k56g7uOFhS/sGKHGBcmk2TMZVETXm+TzslBGexn/WuqfHF5Zjq
 liOVxCb/EDI8lGFVN5GbYjXccs5lCg9mUQQOEjUrMXZnjnerF9cqsYrlwsJ59VLN26Gr
 87qPwJ0Joyi/qbgK0RIgse1L42mBi1vAkJXnJYjFn5AZ2JTqRU0iR0slDXt1ZwBuNw+a
 JGx5hR4DZQ7vBb6dOZCaGpeNw8R1rcwUAwIpvxs/obOKKA5l6oNdifn7nNhbhrEP6nZ2
 cneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QVVKli295o7T13jP/inzdTVJznvyWiLnP8E90M+rGOs=;
 b=Zb0jTGb6LKAUT4iT43zqxMLWuzNbT0mdZ2fpe6ObaZN03tjjsfj+kYyPCGpsmfX1x6
 nDQnZuWD48UEkrnFIE0DuAD0OlrQOL6AlJko/4IjNl1+RsHoqSaZtYlkwwHBCCMOOnMf
 rxy7/KCzlWfWyRlgAFAC/RXbUMx7bmsMXIDPyIctnRM4dWxH/lMVejdkwRBXG94c9Cuz
 6KOB+CaWBoCkngkHaRwqjRagTT8mbXnuk00chLL9mxEaXVtrCw36PbtTJMG+TYIMMoDN
 HfI4P848T2HHN9KY/cCbJcIDWaYCs5Rs3PLsiVDwWZ/n2FAj6ztjB2YZU+0vYiygM88n
 CD0g==
X-Gm-Message-State: AJIora8yOrqx99MbrTujKtP88dKyNB+2F/lqihyVgrGkeAUSebFLN20u
 oPRaZ9LEpdGpxf2zM2qHcqVP0aaomiQkySZgG/wkWw==
X-Google-Smtp-Source: AGRyM1sIXxzkgu2kGeiRQdw1X85i4n3hitZyxNzovQoO40bYr8nDvBguNSksRLeUZiwybvnj0gvxtQ9ekaNMxWcrrp4=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr27929080ybj.479.1658141191487; Mon, 18
 Jul 2022 03:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-15-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:46:20 +0100
Message-ID: <CAFEAcA-Tm-4KODtD7BuUWGV72zneZW9drnpDW1iubGiSt6Oi9A@mail.gmail.com>
Subject: Re: [RISU PATCH v4 14/29] Merge reginfo.c into risu.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Fri, 8 Jul 2022 at 17:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The distinction between the two is artificial.  Following
> patches will rearrange the functions involved to make it
> easier for dumping of the trace file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

