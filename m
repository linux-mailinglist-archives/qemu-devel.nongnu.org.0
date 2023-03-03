Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7CB6A9881
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:35:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY5YK-000280-Md; Fri, 03 Mar 2023 08:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY5YG-00026V-C5
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:34:24 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY5YE-0006Yw-Oz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:34:24 -0500
Received: by mail-pg1-x532.google.com with SMTP id z10so1464232pgr.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 05:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677850461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxfVBHbfO7bPVVLS0HEXJ8Y/rqq/AIln7l39Y/FXZsE=;
 b=eCkPWEAI4W+rIFHnwQE+Vq1NVGcuHRqo9eqf/SFodVSv2nc6qJb/veYzKFjt1R0HYH
 ytxkzlgPxXpliw1PIT1O5PCsEP2AEZsYNSbe540sNE1kMd/ZUp9UY7k/+QicPhfFgB5l
 5/quvle+UzV/bJ3rFyU5VaxD0Q6srKL//n33QxEpTt5Ic4bq0DMLcbEU1gS51NSvNsS+
 lqEblDVN6Od0MmGnuCjVynKHSHqlHsRTn3HaICJnekOjFFoO8fDiUaxhdPjiZSsktcwo
 BFkBMiANxU1wdzRNPkSRNjlDIJLv8XJSorT6vPcxHQd3Rv1p1Aq+0CCKLT5L0eOy46mN
 OILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677850461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxfVBHbfO7bPVVLS0HEXJ8Y/rqq/AIln7l39Y/FXZsE=;
 b=PGaRiYtGstPUVw7drB/Bu8cPIb4tiS0eb1CauMZmGMjC+kr+QiMs9po6HGmobz69l3
 5B6CP2vKDRfMnNB9NRtqQd+5zxa0aoRj4aoW/pe49l91g+lq7RAsgsbqtdFtGMIiEHax
 cYTowbITMd76eh9tOfeBUKR6ZWg0skxYXdpY/cvi6yTXuteyGZWLzUavM2hGKCishy/g
 a0U8P1gcjjmW7LrBUzxmrMlL4xazAkq4d+YgP9RmTN0r4M+yJWD+CdlSKtSkjBPCZR0Y
 7iCUbdVFCgpIWABw8w4qhFxZKs7OU1lGz46rBriz4Kb8n3v8/vaCiiHHzvEceCwWu3fs
 wXCg==
X-Gm-Message-State: AO0yUKURdiZPMn9vBBR/VtyuqR5oTsjbASXfL9q6hvKwbtrRlmMrU+qa
 yCsZJvQuK0cQVqCUrI25hSvJBEDBRiMaEONXhaZVTdIoleLQxg==
X-Google-Smtp-Source: AK7set+wzqS4bIYRG1Z9/TDbW2tl+URKnUr+lL0ZGVTQwYFIo+/PPNGQBOij89VzJqICQkB2ZrAlMzrFEnkPnkTlhdI=
X-Received: by 2002:a05:6a00:225a:b0:593:c9dd:9069 with SMTP id
 i26-20020a056a00225a00b00593c9dd9069mr905743pfu.5.1677850460936; Fri, 03 Mar
 2023 05:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20230302174206.2434673-1-clg@kaod.org>
 <840ae915-390e-5cb9-3186-360856ecf407@kaod.org>
In-Reply-To: <840ae915-390e-5cb9-3186-360856ecf407@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 13:34:09 +0000
Message-ID: <CAFEAcA-HvviZFZXBwJQXhxVsqv473=5BW=WJgKSd25uqmschXw@mail.gmail.com>
Subject: Re: [PULL 00/11] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 3 Mar 2023 at 13:23, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Peter,
>
> On 3/2/23 18:41, C=C3=A9dric Le Goater wrote:
> > The following changes since commit a2b5f8b8ab7b2c947823088103a40f0ff11f=
e06b:
> >
> >    Merge tag 'pull-tcg-20230301' of https://gitlab.com/rth7680/qemu int=
o staging (2023-03-01 19:19:20 +0000)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/legoater/qemu/ tags/pull-aspeed-20230302
> >
> > for you to fetch changes up to b22a2d409b1acfdf0d63d1bb3595194ceb3d94da=
:
> >
> >    aspeed/smc: Replace SysBus IRQs with GPIO lines (2023-03-02 13:57:50=
 +0100)
> >
> > ----------------------------------------------------------------
> > aspeed queue:
> >
> > * fix for the Aspeed I2C slave mode
> > * a new I2C echo device from Klaus and its associated test in avocado.
> > * initial SoC cleanups to allow the use of block devices instead of
> >    drives on the command line.
> > * new facebook machines and eeprom fixes for the Fuji
> > * readline fix
>
> This one was merged already. Would you prefer an updated PR instead ?

I'm not sure what you're asking ?

thanks
-- PMM

