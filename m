Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73D576261
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:03:05 +0200 (CEST)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCKyG-000645-8F
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCKuJ-0002qA-Mr
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:58:59 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:44840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCKuH-0006Fa-Ud
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:58:59 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31d7db3e6e5so45832587b3.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2NwipG8RrB5IrkYY6ixB/i17iPj768k9dChiofVSycw=;
 b=syP7M7xSxILLzLVqHECJXMSOzk7c/yrRn3p0nrOhAng3A/5HgEnR8ZE1vn5fuxBHNR
 reAwMvukzdJ14GLcPLAIfp8dEQdUPq/LSGjkgXFqcO3hjj3x9oDyX7H3M5UNFqEeEdkU
 v//cNEtkcrYAnce1FDWbMQK4katSUVrnnmtFGsUjuioYhzxbWqi0CRQPcQMo4s4F5yCc
 xlwkx1ZtucBNF1l2nwAPrDryT3EX8YiNX5HRFh2AtWfGfkb05joKHhvH0uEYTTUSkVnY
 7I4p9wqAW0kPdZRIy81MCQfSK2/5fAv2Ufm2GM1orqsF+UZGV/C55fcwHD4dJnP8tTnu
 +Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NwipG8RrB5IrkYY6ixB/i17iPj768k9dChiofVSycw=;
 b=PDExYqf2KLa27DQe8SUUjQZZ00+gMvOZWPP06gdEKDTaxSxWsVclxlxuVoK9taLdez
 w+GkRZ1V/Xj99034Tbg6fdbmFdQhz7+wvMLuhSyZYYrXAfedZ9gFuQKD1k36v/JmfnMU
 9/pSOx59U3IgPSPupshzixMkUD2ovTnV81MQnNca0ZnvKzjG+5gBl9GuNycMG6R/pO0J
 ZqW834tDCDM0lQ9S5qOkLZVIzr/2w1UHfvRzHw9EtW5Ru1XNMpo6pZL99CNYibHoX2oT
 JOhxwc8ZFgg0XLJGCSRfA1gkaWYKRh/253xYBeG7sgq6HGUyg7v5Fdet/oSX3O0CfhrB
 3ygg==
X-Gm-Message-State: AJIora9ltvjaVLr2Nb2ug97zqwJwQASTEnFGT0OErknb2IJbOeKr5MFm
 NulLoCnnirzh2InVZJDta+cxtXmBuUw8g3lIbf1E4g==
X-Google-Smtp-Source: AGRyM1ugxcuNUG2zSEJrfk/LZycBFdulZrA9iMcyNyYzL4/8/6PPMtB+8Gi22sim0MY0ObpX9b6Tj7Rb2TZDxIpSz/g=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr15776634ywc.64.1657889929049; Fri, 15
 Jul 2022 05:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220715114039.59790-1-akihiko.odaki@gmail.com>
 <20220715114039.59790-3-akihiko.odaki@gmail.com>
In-Reply-To: <20220715114039.59790-3-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 13:58:09 +0100
Message-ID: <CAFEAcA8rJh4Vsv5fVg_2iY6EaCxd3UQLb0cPS70AGJ2SvVCAfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Revert "main-loop: Disable block backend global
 state assertion on Cocoa"
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Fri, 15 Jul 2022 at 12:40, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> This reverts commit 47281859f66bdab1974fb122cab2cbb4a1c9af7f.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  include/qemu/main-loop.h | 13 -------------
>  1 file changed, 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

