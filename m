Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B07154513B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:50:44 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKQl-000484-Ce
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK98-0007FQ-Eb
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:32:31 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK95-0001zk-U5
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:32:30 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31336535373so94159857b3.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RMDRtXscsbGYkR4Uv79n2h9y++K9vAWqtBZBaIGPY1c=;
 b=D/KxfNfsxkThjHqlaEgOt8KQcyN3yMKeOKiCBHAUirnhqFJCmeCJjf8Rqei+5L+cns
 VtaOzN6fOMSUAWDkfffX7zOcIIFS0Kuhie2ug5q8XAYSDM3kKTfqAhYFwGL4oK6v4C5Q
 rLVNivmRN/7oxmjKopWEgzd3n2pp6uGKN8mAEkShB8JXw8ASH46hH4XbCP9d+DZCn6vy
 1We4Sol8KIM5/qGIy+Yf5H87YxaSUE+cySXQ0wFBlvsvARuIl0cGRjAUudziAqaAfOte
 XvYUd2QDjVJ/b8lFKQxbd2oEXwCC1AbXeURZSH0+ltjjuy9OP23ZZ/HyrLW8tHsYv1wU
 8Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RMDRtXscsbGYkR4Uv79n2h9y++K9vAWqtBZBaIGPY1c=;
 b=eQLseYJLP1dWqedxGlpUOOtxhnKzvGsKBJUP7YbC0gsAPmNMgXxRQTFmU/76N1uQOx
 BmOaaB4UzAt1+oCkMUTCMDKNzbSImQvdASGHT+Uzlg9kCfNT7URNL5GO/9MwV9BX3nXu
 1UHZk+pDwKFv1n5hLlIQMuGHOxc4gf3vlZTrT9j/wEnZlIukCNgxrmVaUXg2oEoz0vuZ
 AlAvlq1T+G8QzJmrzTUwGiRbEjZsCxcyOOcbSG5oT6vnTob/AF7l7+QY6HkVmW/ANs0w
 /cABiiA90u4grP88KjxiszP7wwdSlOaWm7eVs5RRedms/LLswbOBIhhVHvEZ1QmkQg/4
 92GQ==
X-Gm-Message-State: AOAM5333ZVHO+VriKNbIRbi5E+E5AbWBSKP4qRw/q12IngR7U6bCmzDB
 4J4HCe9+0XB1ev3Rw2qOpdraZw3RZ+fS18NW/KVD/A==
X-Google-Smtp-Source: ABdhPJyQGKSaKeyBGZe0+0uKdQLSVRGt/PR8PmvetUjiBktP6vrxWwhc7H4lDuQig7VAg9Bazxgt1+b3aA3EFpHKFH0=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr43786100ywb.257.1654788746496; Thu, 09
 Jun 2022 08:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-37-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:32:16 +0100
Message-ID: <CAFEAcA_zntaK1+Pc1UFxM+Yn7G4tuNwkCvw25chWjbjg1yqQ4g@mail.gmail.com>
Subject: Re: [PATCH v2 36/71] target/arm: Unexport aarch64_add_*_properties
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are not used outside cpu64.c,
> so make them static.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h   | 3 ---
>  target/arm/cpu64.c | 4 ++--
>  2 files changed, 2 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

