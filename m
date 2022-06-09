Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE7545305
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:32:57 +0200 (CEST)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzM1e-0008DU-1R
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKb1-0007Z6-D0
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:01:20 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:34894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKaz-0007Mg-Q0
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:01:18 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31336535373so95063017b3.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4rMhemJ7Xu9zi/rPWCwlw2Y4/koUpk3RAejqBOUtu4M=;
 b=hf6MQDJtrV0F1vaU/74Mc/9V333RQZKq+xwzfbOMu137yXeirUIop17fIXoB0ixlwG
 nFh8HgAd7OTltbs6NLgTZXYZzlvc2pxKFre/GZnIHfoOpQHbfxvoN6t0EA68Zynzigrs
 YslUQDuWYGVmNB5BiFAw/buMlBZ0Sm2xa/5ILDukxQopbYqLIYgOn4ZFEaCI6O+u63EE
 mipFJm1b812jDiY1KjVC2TXq+2yVvTpnscnvdUJCB5br7uFqhgUFamIJOg0db87ryJnN
 wVSG298yMguK86LUePEOUu9n/9IsEG7u2p/apIkJ+PMi+2ATWRdtM0glOCART9p/k+Hj
 IklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4rMhemJ7Xu9zi/rPWCwlw2Y4/koUpk3RAejqBOUtu4M=;
 b=w6eLx5sP1qPf8X5W49gGrvkZQPdOToZ16/XBXgo3WnsGfYs/Xfzsl9YiGl/IYS/90d
 PqjGbjKwot1LpDGu5kdgUK4bh9SMN7k9N++0LdvnEFmcgkwEECWqG7gzij6Vyz0qz2+O
 0B/ZuUAA5osS9csd37dqw6MEhTZiInI5H+2t7XCeCIY8GJxNbdhQ2BUQfugutW+vqCUm
 z2MY+iKv5FuKSo86KIvr5em2ds5aHnmHy/Zw+7z5iU/uZOR3HwasyoqGDtpyUdt+Zujc
 i/SQRBcl3XM7+aOmkNZiLMdv6mmKJEuSkGQLvj2flt3de1cbo9yx8aa9ZbngOXxhZfCa
 3/gw==
X-Gm-Message-State: AOAM531WJwC10W2OD48G/8Kn1G6UbHjZEYLdx6KCtgpkCDEnlC7xHJcZ
 x70q/7DLBbwovnHYqvsUgEPvo253u8AhxKLEmc8CJA==
X-Google-Smtp-Source: ABdhPJyRBne8bnmv50xn+Eh8zvJORkp5SUORptmtRanvInrR5qoOg1u6/c9VU7ip48brYTgmvnzoWtPROW59wESOxwk=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr45346598ywd.469.1654790474478; Thu, 09
 Jun 2022 09:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-10-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:01:04 +0100
Message-ID: <CAFEAcA8aNXmBTF0XkFwCdHekB7+gCxh2_2ckXFT5MeqaeMFj+A@mail.gmail.com>
Subject: Re: [PATCH v2 09/25] target/arm: Move arm_debug_exception_fsr to
 debug_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Tue, 7 Jun 2022 at 03:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function now now only used in debug_helper.c, so there is
> no reason to have a declaration in a header.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

