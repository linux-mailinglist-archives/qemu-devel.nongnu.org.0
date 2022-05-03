Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5BB5189B9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:23:44 +0200 (CEST)
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvJP-0005yF-10
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvCw-00065q-FE
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:17:02 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvCt-0005is-Sc
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:17:02 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2f863469afbso161201837b3.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57n9bGA/rUiywM8/d7Y1gpObCrKAMHIAmQA5u6lSyyM=;
 b=IjojFcoesvuC5O9fb2UY12kS6+8I5ZH63ff4pyj6I5vO/54JumcW0xpc9BzqUtgSSB
 1Cw3+kZjlN+mfPEns/w/3RLA7DCwsfpHIpQ6/aj7VP1CTSz7Jan7ttBgtzOt2CM35zeH
 3ZS7ZbB1DzM1XqSyEgob5aWLaCFe8sIUp4bl8HdUK5bSfW0bZBjiy1HDHnMPStlrf1e8
 aXJ3zHafjPgI+xyccOjCRdjZHX8DwN88BLswSkpmXUrAB3uqSKLh10bPE0mJds1ylaF5
 rilU4aBPDR216afRhLduESm+e/8y+ixyr+satTbVu6qdQaJzdcYC7U7GqPGGqE83U7aq
 ZZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57n9bGA/rUiywM8/d7Y1gpObCrKAMHIAmQA5u6lSyyM=;
 b=HTJRRhGmPyRSAm7BBiMpC16nNCN10VuZrhS03fj1r43yrlHSom+iSC5bi551fRi3IF
 eWLlmuok09TtGqHFMh5LrjBGBBTsdkwFEGyxQinZ7sLtONA+C6PDg7LvjMwPK4i3Iemu
 kC6Jhm6nCYUi1Otgj+5tFz8qCYi2kBIOLjSuNVPAte7Qx2XDdiyCfBVS2HXJiih6/6Wq
 lG4y+6PWwNMRaI7a16ih+P33YkfhzprPjKs2jn5WaSf/s1ttOpHAElvfJSKQzwKzNyQs
 o2FH1NDWdG/XhROIidg1CcsoD9IGVgA7i8mYlGLHPHXx/VTsDXpTiT9KhLraYVsziLsz
 ACHA==
X-Gm-Message-State: AOAM5307zeJLP40ewVfY/7YCrUgKpmoVR/njSCPVlWviKK942OCJK8Cu
 h4CYS2a5/K2rY5P/wb95kORMtmoxayhZhxwekx1FnQ==
X-Google-Smtp-Source: ABdhPJwSRv47DjKysHgQ/iNhu7Z714o5diVkRwYym+1G0Zp8JkxE4S7JOGMfTIZGUTpGJjSpGfgsPY4gHouIWKSZRic=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr15862459ywj.329.1651594618686; Tue, 03
 May 2022 09:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-17-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:16:47 +0100
Message-ID: <CAFEAcA-xxShWfJkB=wok_EZoi5fFtKDcyxfPF-3XAmjLYk_yeg@mail.gmail.com>
Subject: Re: [PATCH v4 16/45] target/arm: Hoist isbanked computation in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 1 May 2022 at 07:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Computing isbanked only once makes the code
> a bit easier to read.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

