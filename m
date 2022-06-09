Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7B544D27
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:09:49 +0200 (CEST)
Received: from localhost ([::1]:38692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHv2-00008w-2g
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFjb-000391-Fb
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:49:52 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:35540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFjZ-0005QV-Vg
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:49:51 -0400
Received: by mail-yb1-xb30.google.com with SMTP id x187so13545221ybe.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r7akZqo8169109bTVmrrRggrtG5hAVSzxwrx3k19zZ4=;
 b=aoV/eCFSEQlCnxrvxVZ6j7B5QYL6tAOEJvyPT4EplNE2Am9+WOx0ucr6Iu1d49PLIf
 7bl9WGhJOQPJ7dlanlcrHddTl+j8rT5e6CBWchqOVOa90/f6x+cmmzAqRd/XscWbdaMu
 C83BW/HRUNOCbOooDebAeeY5h7UYga1/IC1w8i1umqo7YR77vT1Lshy86wf1pE7i/aOV
 aXljkX1L5Q0YCez2QkYRB1mP6lroJw+kol4aDttsoeERf9/tXnWJNuOf3VCoE1SN9MF6
 +iwXDGpT5dPEB/JnKh0/ZJ9TjgxhQ1dcm7Vu4iEj8Qs+IEcXrfwAns4bU91PKLGToVNp
 owdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7akZqo8169109bTVmrrRggrtG5hAVSzxwrx3k19zZ4=;
 b=v1jPgg477MrP1S6nsfN6gGKJTu9//P5ZHXtPNoVfP8WAb6NXyXF3NjMXluv/gwztFm
 hVOLdjLHZCC2eaTVfdgy97zELusZci+CMW564/q6D94bBxqanD72qeGCCA1qCz6yqJpU
 /gAPwNQQJG27XUHiNRg6NTas6Pyh66CoyeC69WQMCvxijshLd1Lw/wS6D9c84NKPD/vj
 ig2//mmy3RXscbUsoETUsH0f64ihcYMghxbbfxOnKIpafF/2xHu9kqbbxrdHz6OKIS4w
 KvDBDPa9xJKhQwIgl4b36qernUl2dLpH/Q5HeXHOUGcEfbv/3jpVxXDmaOAPhZknkXMZ
 29xQ==
X-Gm-Message-State: AOAM531GrAtz/zfTCyuVr4X21i0sMH+40V+tR0SBfCkfMySDJHo0/snU
 r1FKvYCxRApgRd7h1so1eibY9jwJ0JIEQZBQS0VrJw==
X-Google-Smtp-Source: ABdhPJwZyuDo0uF/M1OHAqk5OTKR7ZIYfQNdowl9NchH7bKVoTxXDazOH4IWkfr2ar0gK7OpH7n9p6ln0FEtqXOSePk=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr38888226ybr.193.1654771789056; 
 Thu, 09 Jun 2022 03:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-24-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-24-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:49:38 +0100
Message-ID: <CAFEAcA-bkoZNJMO_PX8Agbp-VJJhuHAk6t5qp8wzjw7Pr6WU0g@mail.gmail.com>
Subject: Re: [PATCH 23/50] pckbd: add mask qdev property to I8042_MMIO device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the KBDState mask value to be set using a qdev property rather
> than directly in i8042_mm_init().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

