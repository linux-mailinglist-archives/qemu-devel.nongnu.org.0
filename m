Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3576958275E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:09:30 +0200 (CEST)
Received: from localhost ([::1]:55404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGgn3-0000FE-85
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGggC-0003RW-Vz
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:02:27 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGgg7-00066f-Hs
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:02:24 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31bf3656517so174344347b3.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZkqvVkDWqwP6RaiyLAqRHLRTVZUhAvXgxeyJWAadmXE=;
 b=CYJpjHoHSqJnimFBaNskzxrLtUR1wfsyvrw1RGX7XUiKv11PgGeVJdm1BArwkLr+ot
 ot8RuzWH/hnlcRa/WhtpWVjrHUMj/kXPBLF8vrk6KG3ni1FUgnK9KPURzM4nVOpu0jBZ
 g/j+Xys5TrFOZYcOkoj0qCTU+BJQ7vAGWlArpOA/LLYg8l8FHcMpb/6BA4eTo+7P4TkR
 GrgbvhouLMvpVIZNa8odUIIrUZIaNFk90hn3BuJMvdHZ19nm1ApAGt/U22DiZazM0NMb
 Ag9NqlZWTlztc2ybDkrf1Ag3Pqppl5I+zrceJx72deRhQ+L2Nx+fwMFsFbX5wMnXuQqK
 LhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZkqvVkDWqwP6RaiyLAqRHLRTVZUhAvXgxeyJWAadmXE=;
 b=Kt8jFSLeBY9fs8hVWqb34qr2lZMtTY/SsAVjryTbCWtrbCCWfGsgs4Y20s54CGbHIN
 1yOpNrDgoq4MloDhpNIEuKVZlzP7nU7+E1DFG/Jq2bqa4AT+m1VBbiMqyQd7IwdB/7P5
 qfsMWlvyAYIWO+HrDZVEK/1ZmCPJlYPjHDUtA6Bnkd5iCZsj955WZdIDrwkz7OU5Brsq
 7VgYYXX3ej4RHln80oYbMp8p/2h7itiFBlO3PEcIyIPA7CYmk3cs3sk9kUUMXab52tfu
 4joA+bdmk0fAUzZr+GYyJE9Ohc/iBCnGpngit+QmtzKTznL3IiOymCQErM6P2kvrniN0
 Odmg==
X-Gm-Message-State: AJIora8Mjr7JU63ljjTJC8LbzKNt6crYeEikB9ZA0nhopSmbyMfaESen
 GkgzI9qIhNTp7PgpyOogIwg4Z5auGxd/pFEhJMliMw==
X-Google-Smtp-Source: AGRyM1ua2r/Y7Tk38AmQQP966X7HcERGYXBmKZ+KpkZdA/0YORyDep5P/MN2tdOECPyPoFE00XbpcYMqmnOh+ERChHw=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr19305947ywg.469.1658926936029; Wed, 27
 Jul 2022 06:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
 <a7f02b8a-a132-5b8f-6ceb-0d6920ce2a22@kaod.org>
 <77d060c0-6b8a-5c20-58c0-ed6f0d45e99@eik.bme.hu>
In-Reply-To: <77d060c0-6b8a-5c20-58c0-ed6f0d45e99@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2022 14:01:36 +0100
Message-ID: <CAFEAcA_5dS=Mng3bpptRrGpD36AsOQLNQ_2ntokSBK0X+oLPUw@mail.gmail.com>
Subject: Re: [RFC 0/2] Fix Coverity and other errors in ppc440_uc DMA
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Wed, 27 Jul 2022 at 12:55, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Wed, 27 Jul 2022, C=C3=A9dric Le Goater wrote:
> > On 7/26/22 20:23, Peter Maydell wrote:
> >> This patchset is mainly trying to fix a problem that Coverity spotted
> >> in the dcr_write_dma() function in hw/ppc/ppc440_uc.c, where the code
> >> is not correctly using the cpu_physical_memory_map() function.
>
> Likely I did not know how this function works when implementing it and ma=
y
> have used it wrong but none of the reviews spotted it either. (I may have
> used some other DMA device model as an inspiration but don't remember
> which.)
>
> >> While I was fixing that I noticed a second problem in this code,
> >> where it doesn't have a fallback for when cpu_physical_memory_map()
> >> says "I couldn't map that for you".
>
> When can that happen? If only in cases when guest gives invalid parameter=
s
> then maybe we don't have to bother with that and can let it fail but
> having a fallback does not hurt.

Mostly it happens when the thing being DMA'd to or from is not RAM.
Ordinarily I wouldn't expect that to be likely, but the DMA device
here has a "don't advance the src/destination" option which I assume
would be used for things like DMA'ing to or from a device FIFO.
Perhaps AmigaOS doesn't in practice do that.

> >> and partly because
> >> I don't have any documentation of the hardware to tell me how it
> >> should behave, so patch 2 in particular has some FIXMEs. I also
>
> I remember I've found some info on this in some similar SoC that had docs
> on-line but don't remember which. Maybe 440EPx/GPx or something like that=
.
> It may not be the same but seems similar enough for AmigaOS to work. I
> think the two main sources were PPC440EPx/GRx Embedded Processor User's
> Manual and NXP/Freescale Application Note AN2661 Software Migration from
> the IBM (AMCC) 440GP to the MPC8540 which seem to be similar to 460EX and
> have some info on the DMA controller registers.

Thanks, I'll see if I can track those down.

-- PMM

