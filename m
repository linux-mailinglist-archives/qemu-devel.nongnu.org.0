Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20695287F8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:06:31 +0200 (CEST)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcIl-0006et-Pm
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbzJ-0004QN-M5
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:46:25 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbql-00065m-Jf
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:37:58 -0400
Received: by mail-yb1-xb30.google.com with SMTP id r1so27329422ybo.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h8ESteHbO8ad7RNOQfVdNaiM819JhLpkUr1giAPnlcs=;
 b=za0NHY4u+r/jU2mh+FSiQT8uuZwhRd0NSuupZuJJ6SwVQy5suukRdMJKW/J9bQWN8k
 3My8XR9307lNpyyl6+GfsGOI4/eoO2MdWJHFeL17Y1XTjrTBvTB03Hpy1kPwYvbbB9/2
 fcs3ObnoTpyNgsyHccK5XDMAK11HQuKTx/nHoelh95gToVumVAStU1YJfFIL0A3lcPeH
 l4MUWYvX7dcumv0Hwtzxcpo+XXtTuvY8ZiKbne1VDseJT1UDK598abOK7gzMscRdoiAd
 r48kKvFvzbycQOQseWwqEpA/0/3qBh3OugqG38paVoFrKRWxXHfGOHXTMVjLanfoMwNi
 EbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h8ESteHbO8ad7RNOQfVdNaiM819JhLpkUr1giAPnlcs=;
 b=kPih1dHrZkMEANK8ZSPfZU3URqNw7tCOGnionR2PJIP5X2tUPrHZKDCA6wGADUbdHP
 el4+jZUuN6PrBZsyxv4Ge/qJKmSLQVswJk6hc345WEZk5X4u4q+NLI45e2k60TS3T+X4
 huoMEQ1PQ1MNkVm4viZg17o9SSxQ6JzGiQ299zaVBMRY/2ljHMWhZBUmdD0nl5RzdsvO
 vjMzjOjwVNp+LXGNFalJYKWHLxb5mKDofWZjQkuqny4k2iCEuWzy4PhrC0SXTfryxdXb
 s9i2ZuTrr5t3jY+kPFh8XHxu1SuSqKDhfzUA9lgDOXAYnVzRu6AuX1qpl7w2EDXQXCJc
 oXgw==
X-Gm-Message-State: AOAM530vY5VircTtPqbwOtNjHdZcAnW1keHKqoizWgushV06yUPVfMST
 EslE8XFFy7cRs9WJJmRIu9ekxHQugV/rPtC2jyQa9g==
X-Google-Smtp-Source: ABdhPJz/O6KFA+Q9G8IYvb3tnmm9uvzHkMBa6J2lnm0/sZYLEdurj12ni5i9kRI1yWgasSF6ue5sPQFND7TDOTyAdPU=
X-Received: by 2002:a5b:b10:0:b0:64d:ab18:2e41 with SMTP id
 z16-20020a5b0b10000000b0064dab182e41mr5256730ybp.288.1652711822698; Mon, 16
 May 2022 07:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-2-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 15:36:51 +0100
Message-ID: <CAFEAcA-1cTLzvMk21P_p89QHMZDfPqVZYQvUt5UV=t2mYohz9Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/74] semihosting: Move exec/softmmu-semi.h to
 semihosting/softmmu-uaccess.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, 3 May 2022 at 20:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have a subdirectory for semihosting; move this file out of exec.
> Rename to emphasize the contents are a replacement for the functions
> in linux-user/bsd-user uaccess.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

