Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF23F7BC5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:51:26 +0200 (CEST)
Received: from localhost ([::1]:51380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIx3Y-0004WD-DN
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIx2l-0003s0-6A
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 13:50:31 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIx2j-0000aT-Fq
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 13:50:30 -0400
Received: by mail-ej1-x635.google.com with SMTP id h9so206158ejs.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=pAisI9aQMSZmrKiudjt/KvCw0q/hrXMk1wPqFglufmQ=;
 b=ZvNOwHAcW7qiPheYLPWRH0d437e7Z/j+UNMOgdKP/frO5UNcbUdFHwuyfF6x1cVg2U
 a6F8avghLzOJa7+5gUkQXWyDPaUZIttPbS8wb1dDv/CY8+kNt+GiezKOsZJGh5tEEyhe
 l6hCVFei4tcmKfWhfI07LLj/sMOhQ/vIClS6Bvssmwh7Pl+Xpnag28B0AdYlVqVM9tf+
 oS1bEDOmAISS/lncz1cb7ZYBVy13HcNUs02FBD5uVxDTMid2B/+gSI8rhdYijgNs3+BK
 kve/FueuYhtrcoz2JdYKLyKGkkigJbxl7n9dkdiL95UfBmggW6pd3RTkyaXYMecSZpiI
 /iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pAisI9aQMSZmrKiudjt/KvCw0q/hrXMk1wPqFglufmQ=;
 b=BFUIjRibu3M++HrgrorW7V5Nj16ZFl2fep4sbMN0NoZ4MY151AlSVt4/3b+DIOyT85
 sKLjzsPZXuV63GY5KBkYWjjYnhYlMQdbt2lDawX3XYn20uVGi7fKVHrqdaVvrtSHUn6Y
 z4rUi3zkwWs30l2W/EKWs6HrQgw2ergNizTJr5jOZ43BjFy+/Y9vOG3sRMu+SLxYi8Dd
 /6tKbywbieZO2XvolXwYxpZEfmeLyoNQlBNmymwKrSb+y5kfTPcrvBK9zusEnaRDU+VM
 YFlLCks7L9m1JBcW4qktN4k3xWlEBoB+T7zcnHNQtnzaAztWdHrZgwE8l2CoVkLMArl2
 b3Xw==
X-Gm-Message-State: AOAM531ebjwkZLAF0pHIulZSt4VFaCOgdG6iw1+S2oPqRVoUsfwd94+h
 bWbpvNC6phAcxD6vu2NMZ/0so8jG0x1F+lDtogUAOMlQCFM=
X-Google-Smtp-Source: ABdhPJxOvy5bUaJy4A1M9yahO5MqtmDSwcnO21dDMLHmbIZya6n5942ozSsChqIwYr58VYpSI756RVJwCKfKQv61IPc=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr46324111ejb.382.1629913827682; 
 Wed, 25 Aug 2021 10:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210825103534.6936-1-peter.maydell@linaro.org>
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Aug 2021 18:49:40 +0100
Message-ID: <CAFEAcA_KGsH7rUgALw+=9E1mEWz_46MqPwT3mmxZQBzxWf+j_g@mail.gmail.com>
Subject: Re: [PULL 00/44] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 at 11:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> First set of arm patches for 6.2. I have a lot more in my
> to-review queue still...
>
> -- PMM
>
> The following changes since commit d42685765653ec155fdf60910662f8830bdb2cef:
>
>   Open 6.2 development tree (2021-08-25 10:25:12 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210825
>
> for you to fetch changes up to 24b1a6aa43615be22c7ee66bd68ec5675f6a6a9a:
>
>   docs: Document how to use gdb with unix sockets (2021-08-25 10:48:51 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * More MVE emulation work
>  * Implement M-profile trapping on division by zero
>  * kvm: use RCU_READ_LOCK_GUARD() in kvm_arch_fixup_msi_route()
>  * hw/char/pl011: add support for sending break
>  * fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as unimplemented devices
>  * hw/dma/pl330: Add memory region to replace default
>  * sbsa-ref: Rename SBSA_GWDT enum value
>  * fsl-imx7: Instantiate SAI1/2/3 as unimplemented devices
>  * docs: Document how to use gdb with unix sockets


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

