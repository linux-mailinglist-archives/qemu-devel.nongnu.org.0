Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CAA3FF43B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 21:33:33 +0200 (CEST)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLsSq-0007HH-At
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 15:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLsRS-0006OI-Ba
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 15:32:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLsRQ-0003ln-NQ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 15:32:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z4so4693880wrr.6
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 12:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0u3nbYfpuw+uj8yqgjN6v07UGrpFZchrMpPQM/WdZF4=;
 b=Bx0UzQrnvNcou0Xct41l+rytoG7ieDDtkj2FIZj/WfAhNXOdb3P94kxqmg/6pL6hfV
 clWlq6bnidxVRPfp6bvZ8YPYsJeg5dyicPA+fI5vj2kaOShQF5XLYDTB+KEb9MvAoq1W
 Yx5PKrCPGQdOmdkJuij2wgf2uPBSPGKSy9jFfdTIE2mkZOtmXPZ9S78eUXvTDgRO+TEC
 5DH9jjDcvI9UvxlAg87ZZ+Xs4+yz6etG3tME8WB8jsHMj4BBp0xoTosiKcq1idVzjMJg
 XVyCN9xR7q3c8ewaA30T2e+eOWIcLdl7Q0NYo9kvcQvIzcGcGdWrUMCL8YRYfvvasBzT
 L1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0u3nbYfpuw+uj8yqgjN6v07UGrpFZchrMpPQM/WdZF4=;
 b=S5H52Xs+ENm9YLO97CWUN2Zf77w4X9OxK9w4gDCfjC6Ljmuy2zs2724qnEyLSRIILR
 ImfHHEEiLJP9eK+Tnz7NHApsJi3tx3J5fMe4dKPMM9ETcK4LKWZrZg2APZXWnD1+Mdot
 sEpCHgcng29fKw32NPim8DSJu6GxA7O0/MiMnDo4KmH7W+2VCBI6eiuY/rtgK7NRifpH
 XzmhOiWTDRIiCphY5moFZ3QVSVwOdOtqhNw9VzItVozTPzJERmIlzeXAqbhqSKqqQNog
 WervlEjMX4J8P/jc2qPkbXRfW7lnoNgVE3qUSUSVFg8qylgYgRMmy/ehQHwhNaCPnYql
 7Qvw==
X-Gm-Message-State: AOAM530PvWn6hCmJzzQCffl9I701lZ0T8DndK3gHknhhJC8ZLpC2mHKr
 eoD18Ge+H1KyMNSNnBqdS1rXpUk9g+5tL4P15biCRulcguk=
X-Google-Smtp-Source: ABdhPJxRvn9dBE25jV+fgJ5lX4mt3GldudzhtcAQ5DS7JvXqpVbBJ3oWMkgyMnHGnt7vwQcKWWwAuZRVakSLGZod9uA=
X-Received: by 2002:adf:b748:: with SMTP id n8mr5620671wre.133.1630611123236; 
 Thu, 02 Sep 2021 12:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
 <20210902102205.7554-5-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9hr6r-QpGQL_JmDrcCHJkTJdD8ZWKYuf8U+2VA0jSCPw@mail.gmail.com>
 <fa9b6c97-7d76-f613-4005-9662283b9d85@ilande.co.uk>
In-Reply-To: <fa9b6c97-7d76-f613-4005-9662283b9d85@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 20:31:14 +0100
Message-ID: <CAFEAcA_g5jVFRp4Kwne6hk7wn0YbmhcFLaxnLoRd0N3ua+j8vQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] escc: introduce escc_hard_reset_chn() for hardware
 reset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sept 2021 at 18:46, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 02/09/2021 16:42, Peter Maydell wrote:
>
> > On Thu, 2 Sept 2021 at 11:33, Mark Cave-Ayland
> > <mark.cave-ayland@ilande.co.uk> wrote:
> >>
> >> This new hardware reset function is to be called for both channels when the
> >> hardware reset bit is written to register WR9. Its initial implementation is
> >> the same as the existing escc_reset_chn() function used for device reset.
> >>
> >> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >
> >
> > The datasheet says the only differences between hard and soft
> > reset are for registers W9, W10, W11 and W14. I wasn't expecting
> > the functions to be completely separated out like this.
>
> I did consider doing it that way, but felt having the 2 separate functions was the
> easiest to read against the tables in the datasheet. What do you think would be the
> best way to organise the reset functions?

I think having the hard-reset be "call the soft-reset and then
clear/set the handful of bits that hard-reset touches and
soft-reset doesn't" is probably clearer overall.

-- PMM

