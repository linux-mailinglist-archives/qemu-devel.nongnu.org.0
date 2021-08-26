Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87843F8B50
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:47:40 +0200 (CEST)
Received: from localhost ([::1]:46690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHbP-00019f-Mt
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mJHaW-0000TT-V7
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:46:45 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mJHaU-00067s-Df
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:46:44 -0400
Received: by mail-ua1-x92e.google.com with SMTP id m39so1822120uad.9
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uMYLbHEP2i57sB3CCWiNMT+tsmACLq7A7UayW5ISabQ=;
 b=Jh5wgo08mbi6A91l1QO9MtBNByxKWvgL4S7absGEhZL9dBCJVXJBE/OOBcWm9Y5k79
 OdvbZYfZNqdTB5NvOKO3zh+660hnFXZ9RRSzqJKpd/D8YkhBX/eg4ZRuCODByF3zWx/K
 dJ7D3++Zq/pgg9t95t8i32qQqxfO4OqWWjqaHUSv7ZkjOTfjptVQ0ph3nPfMmuIjtB4F
 lTETeNLf73g7y5azYY9MP5YBKSERX82DKGuhj0TQvWKwdMWmdtsAeLn+0gleVKxUIbmc
 OLkaDo6Kg4HuOZB+WgCdGuQCVS7zn/8YDl546H+dnOx0QFuFp5DcfTfE4zvU7cvq2B3p
 TPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMYLbHEP2i57sB3CCWiNMT+tsmACLq7A7UayW5ISabQ=;
 b=tV1spePeTYSGsS8OwWUlVIwBq1OAEIUcdgXugW2e44jy8arRBqaR84qWgL1YOVBB7h
 azrYtv0/phrYvxuBcm2sfjCsxhV3tVDPoTsrkNlTiSgFxI9Bm6KQX7KQexJ5M2tlIvGV
 Ac8FxtTAaDHORlkER4WqxpL2Baq7dDaisKtX4ueoVnWatnextiI6AGjVqQqal3Cw3H/4
 Qy6Sz34UoMT+IKZft1fKXz3fBjYhimrTnXZETSfeWC1yYr/aLq/05Xgn0skQb0W2JfAR
 greV0lSC2jaScn8qIpp1LLyTkrh4HoFTiNFf8qrKfFcvSQPAXxEZpnd6wB9LHZHrsHmU
 WXzQ==
X-Gm-Message-State: AOAM530UUcerkql6byHaQ6QQQTS1UD+0R1VkSRGAyIgb/6c70x1ODcJ3
 dSUuXn2VGvZrAhORQQXVu+oLcbF+a0Mnc+ZImqs=
X-Google-Smtp-Source: ABdhPJxsNKMssJqz0WAzluO4vRRh3Hf5mSIYa1qTnQy6AH+/9pu8kiVwqmE2v7kRcD8h270+Bk7RsikPUS9zixqQRqQ=
X-Received: by 2002:ab0:5602:: with SMTP id y2mr3114955uaa.120.1629992801573; 
 Thu, 26 Aug 2021 08:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
 <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
 <CAM2a4uxp29QKMaLFOseS5dHRNuooVY6sghzD22NEtGE=3g5wVA@mail.gmail.com>
 <CAFEAcA_eQrd+Hiky+tUZSoNDkcmz5MwpM2=2RQp-gnCDTV4wvw@mail.gmail.com>
In-Reply-To: <CAFEAcA_eQrd+Hiky+tUZSoNDkcmz5MwpM2=2RQp-gnCDTV4wvw@mail.gmail.com>
From: Gautam Bhat <mindentropy@gmail.com>
Date: Thu, 26 Aug 2021 21:16:30 +0530
Message-ID: <CAM2a4uwkY85PaPKBKbA1b_xc6LkeTkR4Me_S9d1HRi2y8TwOiw@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=mindentropy@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 1:24 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 25 Aug 2021 at 20:03, Gautam Bhat <mindentropy@gmail.com> wrote:
>
> If you're
> doing this specifically because you want to look at how a
> target frontend for a new architecture works, have fun, I guess.
>
> thanks
> -- PMM

Exactly what I want to do. Since it has only 27 instructions and I
have a lot of dev boards I felt that it is right microcontroller to
start with.

For this I want to have a proper dev setup where I can load my binary
while I am writing my translate file.

Thanks,
Gautam.

