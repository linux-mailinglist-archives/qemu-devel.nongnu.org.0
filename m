Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234645F76DF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:32:21 +0200 (CEST)
Received: from localhost ([::1]:37856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogkeR-0004XK-34
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkYf-0000cl-0b
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:26:23 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkYd-0008Qj-HO
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:26:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so6858816pjs.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hy9VANTnzlQtEi2usuKEtShhb7fB7keMadfp3zH8ABE=;
 b=MeU76rRlAtN6I4/JV3NNg74odu9GCVMSfJa/eDxOwdiDD/986eRlBCk1JiE738zSb6
 wUVY7UNycOTva0yBMsAMtD58NMo/SIlCIWbYFusSaDyT0Sx9+hqDGPRZ/8HNk4uyueAW
 MVDdJcAAJ2Qj6tgNyjujCCfxORRw7UNha3o1c5pnknPR/EGYjRkGOz2wCB7kYolLNGfm
 n94ivHqYLs0OjwBGqNkiKhUN2DjOy0apST6ViXVBLsjtZ/D7P/rBDeLfqypUfSYyYRpc
 1IC7Y770FrfXlvedytN1NdIdeF2owbUKnevv9nwFkltps1NpWaLqFEZ6YTE/3qFUji9e
 dIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hy9VANTnzlQtEi2usuKEtShhb7fB7keMadfp3zH8ABE=;
 b=s066lojWeorLbfUzQvU/0EsGPRRkrgdhWx6yFEguqZo43NVsLUrAKcAqs3CWg9RSC1
 JB1ytHepnjD+Q012gjs8eworrrlCivV7Y6ChWqDZw2QWcACNu2uJeMhKfs7AKsajQTpd
 6BNoaM4/3jLcU9INJm3WCxp/LIu4wKliSWyNdNEjHH8ReySf18J5JEzaW+17jQBUw9Wj
 /FRWDbQRlwrOk3Tl9R0kfSTg1AIVtfiTgBhG7cO1SHGisCWRrYPxgeCiWsUmU51e4cfU
 BrgE5NbdhSfnRt14H1PGGty43ov84uacosBAu3rRyuZelyfd5bg/0KtRUB1zHR1tbKhn
 dk4g==
X-Gm-Message-State: ACrzQf2QiEViM3o7ZzieMkOeafD3fxyLyRwICg9W+Jy3wt4J13hIVkwP
 WLq8u/Cr4v36NzeAFgMLTyqi34xyGU9zf73ntdoA8Q==
X-Google-Smtp-Source: AMsMyM4stOcmPLkkVAXJHo91t1fK3zSvp+c7V5VRqKrfxthqKljv0ew4OZCR2rV68jp1EIfigUHFladdaY3A3qjPq4E=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr4407388plr.168.1665138378154; Fri, 07
 Oct 2022 03:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-39-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:26:06 +0100
Message-ID: <CAFEAcA-JmWHYZ_0WQY2xitg0s2uPYN_u+ZTOwvmduC+GkFfq8w@mail.gmail.com>
Subject: Re: [PATCH v3 38/42] target/arm: Fix fault reporting in
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 17:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always overriding fi->type was incorrect, as we would not properly
> propagate the fault type from S1_ptw_translate, or arm_ldq_ptw.
> Simplify things by providing a new label for a translation fault.
> For other faults, store into fi directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

