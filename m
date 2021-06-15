Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D143A78C5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:07:48 +0200 (CEST)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt46t-0003Bi-KV
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt44Q-0001bJ-OF; Tue, 15 Jun 2021 04:05:17 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt44O-0002XP-15; Tue, 15 Jun 2021 04:05:14 -0400
Received: by mail-io1-xd36.google.com with SMTP id s26so13318800ioe.9;
 Tue, 15 Jun 2021 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DDxycEP+amo/2i66FxzZSk5sT33AMu/ZG42ZpU8J0Bs=;
 b=bhRNpDsTExs3EAVGYlYRIPxNzj6QPVvBjtJ3wV4D/taut6jP0LnUjRtSF3PAN+LIM2
 T2tB+w/Bu60RjaeSQZx17IL5r/99BNuVcWfswYUqey5V17NEJik+p5ui/D9cl3LTYbOz
 yOrPyMsLj4NYRtVyErGVc30E8mqz2u4ADXQLIkAAlO3NPNri2oJcrW5ESJYcQRDNh65r
 aLuA8pKcXrmj9OJFg4xE+y9BiB979DN8emq98TiyDtNac9WtTgWGTgNKnbj1fqtXgwET
 Hm7i7mX2eFikFs/A5xRIux4O3PhY39aRGklEb8Mawt4FvTsYZbDPuMEjSNhwkEG2H58E
 bGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDxycEP+amo/2i66FxzZSk5sT33AMu/ZG42ZpU8J0Bs=;
 b=CKNpyqa5ymY33XoWXvMI+1FfX2lcbtnNDbJvyfy1BDywwqp/XulvarP8XV0+wc0KI8
 KVcHTsI6PBYLiEoPx9TZD0BItXMfW9rXR6++N0deZ5fz2vpaFm+HWqDB6QUxVTIZp11M
 JTwo1Qb81f9vS7pREXWNnKqnQXlICvS1PwN4p6ipVDoE8dpni8jk1P50SgGEPxoh5a7C
 4+PgRSERDVOu8rZWry9t8fMgkvBU3lehPt5Nwi2Cq19ukvI2ox0QZ4aXQF9NGTvT4nsh
 CJvo4GUadsThPmaNRbXVvdOSPkhYSvcFru5AgB8fphap5n4VEx17+SwbgOEAt3wvyCnj
 n4Rw==
X-Gm-Message-State: AOAM53230mPzWaOtj8axoxmiagRotatqgUjfDJ2nNcTh/7vFkFx26qtS
 5JwpT12/+rtCicizI3cMhBjaGAwq6ZinrHxfmWg=
X-Google-Smtp-Source: ABdhPJyoC6L+ZsO8WHJRWaVtAQsq3Kt6MlqGDd9W1FFWo/ae4zl15uzzlVEHDiFvSHab/ryy8se42zLwTJXowZpgtm4=
X-Received: by 2002:a05:6602:722:: with SMTP id
 g2mr12041011iox.118.1623744310485; 
 Tue, 15 Jun 2021 01:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
 <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
In-Reply-To: <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 18:04:44 +1000
Message-ID: <CAKmqyKMETmc0sJbG8FdUokg9Ke_hg5ohZ2YnLzyQO1xwzpXMRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 5:50 PM Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
> On 6/15/21 9:41 AM, Alistair Francis wrote:
> > Aren't you missing some timers, like timer[5] 0x4000_0C00?
> >
> > Alistair
>
> I double-checked using the reference manual and the datasheet and there
> is not timer[5]:
> - page 36 of
> https://www.st.com/resource/en/reference_manual/cd00246267-stm32f100xx-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf

Strange, https://www.st.com/resource/en/datasheet/stm32f100rc.pdf
describes Timer 5 and page 282 of the document you linked talks about
timer 5 as well.

Alistair

> - page 30 of https://www.st.com/resource/en/datasheet/stm32f100cb.pdf
>
> I believe ST is skipping numbers to guarantee that timer[n] will have a
> consistent address on different STM32 SoC.
>
> Thanks,
> -- Alexandre
>

