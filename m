Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED85F67C9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:24:11 +0200 (CEST)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQrB-0005qf-VZ
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQk6-0007Wv-P3
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:16:50 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQk4-0001rV-Rn
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:16:50 -0400
Received: by mail-pf1-x42b.google.com with SMTP id f140so2044098pfa.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bhq0gLPgBRwVmUz8FFj9g9ki+6rhOWuKsjpZQv9rKn4=;
 b=waoPhxvdFO0zSWRhhCMAQ60CHHK96mIVQnRJowOc9UXlfdaw18WEoswja0BbneARjT
 NRCoHvtI0acjCVD/kXWwfew/JFvpr93HXhfAGP5VsyOmq/QyheLuZcV0BsIWXbkhCrER
 Ag3qa/W64xOQSBc/ni/EDewR12/+e4HGfrYoEfByp5P3EzQnC17J5rjmrgEpGbWKEQUB
 HrQHClpmH1tfpMY4obErjEDTRYrABapmJvY0HaH43B6iD7ZgUOGsuZz73CnzxL+G7d/S
 oXKcEvpyrPGupFuSVquQbcWVmy4QTTuNbPzeftC7O1m2yaPHt16j35v39n67YKG2l3Ds
 mwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bhq0gLPgBRwVmUz8FFj9g9ki+6rhOWuKsjpZQv9rKn4=;
 b=Xdz1lPHHftgHkZADt0/7MOTzNne6XmnarrlDoLH7WLK1SRXwNNUbNITxtKw0sNat5T
 AxMHD8EdUw9zWqSkJAJ4okWu6Q5GtsMq9z2K75rFxMmRuCw9lq+UdHZ59S5EO6ttxr1U
 CspY14oxXqB95qBTVqwOZnyvkJb0ojipNA/8fVOVaVYgDAMi+kwE/8MwHMvAPRVeaiL5
 0reIuMDOGo4kqomowkEsfyXJEtFvnuVER0CjpPgbJpZD4W641/pFbQD6D+4rNofgcdfd
 FKpks+HDf6Dsr26sHudlvEXGJ4Fssw288fFyKPWBqX39iUaCDZT4kEkX/GMDyhAxOLA4
 I9XQ==
X-Gm-Message-State: ACrzQf3CJpfeH+CQ8jsROX91Y/z6IML/AJhwyJLM9DhvtKJ7UAd0Pay3
 iQ+CqkBJKePseC5xQPOtdCKp6IC56Mq2IItbF6F9NA==
X-Google-Smtp-Source: AMsMyM5ymU2r2R6Kg9p3CCAWbmeLyDTa1IwZApoWF/4ePssh9PCfRu4+OniPoE6uazPm4T74oNbf3LOk4VKtNWSEWLA=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr4564989pgi.192.1665062206628; Thu, 06
 Oct 2022 06:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-1-Jason@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 14:16:35 +0100
Message-ID: <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 30 Sept 2022 at 00:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Several
> architectures require this functionality, so export a function for
> injecting a new seed into the given FDT.
>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Hi; I've applied this series to target-arm.next (seems the easiest way
to take it into the tree). I'm not super happy about the need to
use qemu_register_reset(), but (as we discussed on irc) the amount
of refactoring of the Rom blob code to do it some other way would
be disproportionate, and this is no worse than some of the other
implicit reset-order requirements we have already. (I may come back
some day and see if there's a refactoring I like if I need to do
some reset cleanup in future.)

PS: if you could remember to send cover letters for multipatch
patchsets, that helps our automated tooling. (I think this is
why the series didn't show up in patchew, for instance.)

thanks
-- PMM

