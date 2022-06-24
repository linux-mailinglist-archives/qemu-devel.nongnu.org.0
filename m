Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598F3559D24
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:19:54 +0200 (CEST)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4l69-0002Ma-FR
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kyW-00085r-1W
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:12:00 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:43968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kyU-0003ri-In
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:11:59 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3137316bb69so27517457b3.10
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMUVfEdmj1R1Fl3ruViv9Azz9yo2bP4QqUaYYPj7nCI=;
 b=U+WOGkfk6yMFVcyaqguu+E75RMLRn5ncnIVcVpgGs8UeH4Bs/xgdRI6wbrTSzFbPx7
 ODuY2viHOgggP6l68WpsxGd1R1Jd6E359yxmEj+T9L4PFzYwcClX52AGaUmMPOHF+pAk
 6v6nC2kNzp88lD4YXMvniEEhbsw4HiD6qvUHKRJuH5BNRyOxRJdnLxMUYhTOA0j6fBtN
 Sa4t7gmQsWR6EjbUzIrh1G2M7nrLqbJCGfEsuQde1Af6bTfFuY0w2NOk0O7lcaaDy4FU
 o+Pq6rcOyMGa8Er7kgRZpJXmnOiz6sPiCrNytvItN4vKNY/LggTbwy5elg5Q6Pm9bkLH
 ijbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMUVfEdmj1R1Fl3ruViv9Azz9yo2bP4QqUaYYPj7nCI=;
 b=MbvGzBnOKlux8rPO6dzYLwcz/VtBvAvLzlM2OmFNFsDISeHT2LouhIeBQf8nz2sU8Z
 XubLZOE2/9SY0oGWDhHeI1afaXeKfxPnh1fSbunvjSEYBgpkBtzv6Hf1JV08LqgApaVn
 D46FrVsgXagepF3Bg3JUjqWHXjhpaMHPzAxSmv4wEU0cOhqS6aHzJBMoxUR0mdXOveju
 XQSgz5GplQBVpAw5vlW8iV2E8zn7JLZCK5WBARsCH9CU8XzXPrHgmNnMjY5qFToxya8H
 F7pvhC7MaIDk+ReNwOtOJFuSAapAGNqyp/28PlFvTiQT5X6dPVyVhn6c59e+PjlIXueX
 3mFw==
X-Gm-Message-State: AJIora/Vqd88zO7iWCm0fIW2i/b96f5hZRCoxhkWOvWwPHX38lNYUEgj
 yX8CgxgOznmMwotb2pY7QKjmT1KRD9pjo1pchLizfzqYSyY=
X-Google-Smtp-Source: AGRyM1u4HDanforKXNAT6A7Xz4zbrhE2m+/fR/b8bvkNg1mpIhY8o+R51Ny5aCb+l9ZxxBgQwk9+LT30NyuqHrVASaE=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr17396384ywb.257.1656083517330; Fri, 24
 Jun 2022 08:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-49-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-49-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:11:20 +0100
Message-ID: <CAFEAcA8CVD1ep23f_Cfnb=FvHER8B6mPH9dRYu339Q9e=GC_4g@mail.gmail.com>
Subject: Re: [PATCH v2 48/54] lasips2: add QEMU interface comment
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Fri, 24 Jun 2022 at 14:44, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This describes the LASI PS2 device interface implemented within QEMU.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

