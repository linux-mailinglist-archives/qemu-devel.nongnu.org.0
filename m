Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95448DEA2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:07:46 +0100 (CET)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86Nt-0003C2-G8
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85un-0007Cw-MJ
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:37:42 -0500
Received: from [2a00:1450:4864:20::432] (port=33406
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85um-0006HA-Ab
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:37:41 -0500
Received: by mail-wr1-x432.google.com with SMTP id d19so12148598wrb.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 11:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s4GbovsPhFMdMUmbwsmy9CvoJOzn2qRDVL1f/Lge/Wc=;
 b=FZDLGVk7LyT1FjFA8YPRBcWP3bLGXWqA+hXqwlNVxwjiP4c7tOb6NueJkZ6Ww2wyfO
 8jF13fLmsfwimpuXKiHn/6jwj+UIrcnSTy2LGvuqq9OMD6WUKJ060PYIezshls8I47n+
 icbuuNxe7DPhkAOnveoq1zft05msP5a1bL0U+TP0xWnxcF3KarSbyDoQqJAvfvw5E3LC
 tyMKs49TCGDvVraIGvR6VzNv4HXH1Iy2n3GAulSAp6vNyXawWTItka0doKIxam80Ih+k
 8LxuFglWg4uHLDko+9X6fv6T36dAHRscv2QnT97ReSPFL7CDadQ6yfoLYQBymJa5NIQX
 An2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s4GbovsPhFMdMUmbwsmy9CvoJOzn2qRDVL1f/Lge/Wc=;
 b=qEHXG9CrBo4gP4wR1tSut6XJ7EAxT2i129dCSEeys1KuPDwfVe/KN3sYyvy1h9hWTE
 U0777khOh3DkPCdNqHQpp9olFe6BzMtItw/TjOLLY5qOiQPJBL45htezUpSwXlHmpT3F
 uqlv9XVOjqxA9H+PraIISr2SYoJ/kKuP117JppOOf+xlim3WJfTFR5v3WcLU8jeexkq0
 r7lDqhEPJu+gC/cDH+yS/QxRoX+SGry3InkI+jvZt6hIaEF9ymrkd5EbdfaC1vyxs9VL
 xAE0wEURoUkJnSs8dCMkZleJCZbMoPjnk1bhzWb19euPHeDRt7qMA/c/371HQAInZu55
 88+Q==
X-Gm-Message-State: AOAM532QF0x0L/raY4tejb1WR0W8qmUnEelFETYttPBvlfCXFlXeavVe
 DYy3SkyiIVLrehqNF2Ug6DBuOoIEMW+eNllJU6XkvQ==
X-Google-Smtp-Source: ABdhPJy4nWmkUNQohyWLg0ZxC/XcKE3it2N4MKQibjNL5wCTGwblgJHdP7iAj0q05eF+dEQgTqUWXMPch+v4pItUNdA=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr5440296wrv.521.1642102659015; 
 Thu, 13 Jan 2022 11:37:39 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-16-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-16-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 19:37:28 +0000
Message-ID: <CAFEAcA_zT2ZBkdf5rL4+TAOOsTyF0NReUpKTvhQUiKXEqNfDwA@mail.gmail.com>
Subject: Re: [PATCH 15/30] bsd-user: Add trace events for bsd-usr
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:36, Warner Losh <imp@bsdimp.com> wrote:
>
> Add the bsd-user specific events and infrastructure. Only include the
> linux-user trace events for linux-user, not bsd-user.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

Typo in subject: should be 'bsd-user', not 'bsd-usr'.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

