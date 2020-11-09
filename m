Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FAC2AB624
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 12:09:35 +0100 (CET)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc53G-0002kw-HP
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 06:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc51D-0001eU-QN
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:07:32 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc51B-0006Pn-4g
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:07:27 -0500
Received: by mail-ej1-x642.google.com with SMTP id me8so2192037ejb.10
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 03:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Bz9D3QcrFR97yRVevYA+dbsOZ+Ocysw/k/oP578BaE=;
 b=OIq0EYdoAiBvVNE6N5+IDFisG+pA5ZNaFmP/VaRA1FcZhJ5fovlSEMeeG/mso4U+Oz
 3ZhEdoLgLbR2n8lrdVk5k8hE6z1gz+zgdygL0DZL4/Kj7tq9h8rblV37sWQKMXy37Ctj
 gSH9nJebkTsDJOVD0wK3+1kO9JStnhe2J59prF9Nt/0Z1KY6zIb6jLw8rWwYyR/5Q4Dc
 9ByES8yVELFnQ2FuoOIyw+LtWtJJdyCNMrd5cJiUnI3LjeiomUbIFikctWMv0nm3VZUy
 VlndZgIVzOPsWbPSFrkFsBuTaeQlls0jSb3QVIlogX8HH3Xj+vI0IatcmwBRvsNa7Fcs
 uOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Bz9D3QcrFR97yRVevYA+dbsOZ+Ocysw/k/oP578BaE=;
 b=Adn1KyFtJJt0NlW0nfpiOkFF2t9wAIfx+d1WJM9EievT9Rj5m/gmpEv4Si6IM+wK32
 JOFYOtSlJ4hmRo7lqFDgNYmfz2UXebMFjaTqAB4Y43KN/J0tvTRGSusaduZguqxqL7eB
 C2ztIL5TZ2aW0pYBV4fAbiDEbBSToA2Kyv4jEiFpFOFS+GqbAz9NhYl6rGDh2YBqX95r
 n/HLF5AHMDXdVbs1xzFbbYU8BvpnmWGOX55K+iWqy+wVujcr4i7OTgCdF9ymqaoSq0so
 /SxN+YrX87RH9c+VX+U0CRcN2GTmJFkxWxEKwtXgHiXKnVFJ4srdCYZ5pI1SdT+eES9T
 QFYQ==
X-Gm-Message-State: AOAM530zinr/AukY04XjbgIcF6j4mklPWUDwqvqRdDBYaiSpikcPbQyV
 VfGX6C6pQarJtn5Or08kfOMms9K3AYOu8KwgQzEPng==
X-Google-Smtp-Source: ABdhPJyrZe7PHqgftecTrssPthmxb1TWJRNua5IHr/vW8AhjxgZq/mttF8z3VA7eFk+tSUcnz1ABh5P7A23KKMKaVuI=
X-Received: by 2002:a17:907:9e3:: with SMTP id
 ce3mr14613788ejc.4.1604920042911; 
 Mon, 09 Nov 2020 03:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20201106171153.32673-1-peter.maydell@linaro.org>
 <20201106171153.32673-3-peter.maydell@linaro.org>
 <202011061911.23866.pisa@cmp.felk.cvut.cz>
In-Reply-To: <202011061911.23866.pisa@cmp.felk.cvut.cz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 11:07:11 +0000
Message-ID: <CAFEAcA-j4NLk8E8WtAC3e18A27E8BDJTnHkOk+ykK+xKtU+Zuw@mail.gmail.com>
Subject: Re: [PATCH for-5.2 2/4] hw/net/can/ctucan: Avoid unused value in
 ctucan_send_ready_buffers()
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Ondrej Ille <ondrej.ille@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?SmFuIENoYXJ2w6F0?= <charvj10@fel.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Nov 2020 at 18:12, Pavel Pisa <pisa@cmp.felk.cvut.cz> wrote:
>
> Hello Peter,
>
> this one is a little problematic. I understand that you want
> to have clean code and no warnings reports from coverity.
>
> On Friday 06 of November 2020 18:11:51 Peter Maydell wrote:

> > @@ -271,10 +266,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState
> > *s) if (buff2tx_idx == -1) {
> >              break;
> >          }
> > -        buff_st_mask = 0xf << (buff2tx_idx * 4);
> > -        buff_st = (s->tx_status.u32 >> (buff2tx_idx * 4)) & 0xf;
>
> There I would kept extracted state in the variable. Actual model is really
> simplified to real hardware. Tx succeeds in zero time.
>
> >          int_stat.u32 = 0;
> > -        buff_st = TXT_RDY;
>
> This is why the TXT_RDY state immediately changes to TXT_TOK. It works well
> for actual simple CAN subsystem implementation. But if we want to implement
> priorization of messages on emulated bus and even simulate real bus latency
> by delay to state change and interrut delivery, then we need to proceed
> through TXT_RDY state. If it is a problem for release, that your want to have
> coverity clean source tree, then please left the line as a comment there
> or use some trick with
>            (void)buff_st;
>
> Or if you prefer, use
>
>   +        s->tx_status.u32 = deposit32(s->tx_status.u32,
>   +                                     buff2tx_idx * 4, 4, TXT_RDY);
>
> if it silent the coverity.

I was going to put a comment in v2 of this patch series to
document that this is where the status goes to TXT_RDY,
but looking at the code, at this point the buffer status field
is *already* TXT_RDY -- the preceding loop does not allow
us to get to this point for an entry which is in any other
state. So while I agree with your suggestion that it's worth
having at least a documentation comment to indicate where the
state is changing, I think there is no intermediate state
transition to document here.

thanks
-- PMM

