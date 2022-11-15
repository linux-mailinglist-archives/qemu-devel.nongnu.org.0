Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B1B629F5C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:44:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouz29-0004NR-FW; Tue, 15 Nov 2022 11:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouz1v-0004GP-Ke
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:43:25 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouz1r-0003JV-J1
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:43:21 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 140so13157010pfz.6
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VSkEv28B8tpClWEg54VGYRbqRTVzZ7xyp6z7qVm9u4=;
 b=JQsAJox7qOt1RsL9sqAMyGPuip2qW0ieLvOyZPFdU+7yewD7f9lvTYnmIqHZ34+92m
 WjKW7eJRQwQx2RRICJhAOCrBBZ7Aw5RyZIrFugntqNgY9QxUQCdN7wGJpBSK+fTFmpEE
 JOGSU6VGjkUYDm2K97pna5dLM1DWhMNNchbSIYnsZdT88OQqGWombVSmhkdH/gmYIIal
 RI9qCfqLLQ02JQHkb5b4LoF1tEugdMxR0HlodfflHWIB0v2WOPJXBog1M7RGHAhQhL34
 RG49LJcT2BmyPFtJHfp9Z4cpkkBbocvEninQK3NzmIm8HBYGSjiVJZVFWeMs07ej4mfu
 EI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VSkEv28B8tpClWEg54VGYRbqRTVzZ7xyp6z7qVm9u4=;
 b=kJfNxSduRt0FRviNhqGnnm4ckfe7g/28ZJ9a9/PsFUlvD1PebFfGiIT6NZNJx+Caya
 AgRAKVNfFcffddTdVNVC8c1PtURWK7pnHvntu/grrGtgRsH6BA1agAr2zWZDUjW974xK
 7e3918B4iyDkwKS1yprx8/NyNtii6MRgWZxNER4Wft9HFnyY5KbcUsxsuGo+FRxGfQ91
 c2djJc7JV3mzGyoweLjVokOtFqKyk1/mAP5ByTe3fE9gIQgTvjYai4+vpjBwR80xAtfD
 NUGbDqmC8YWagCcBgIqdHYNKhsWq/Po5gMPUCJc4o9UIjSxtlxj7rDZ63AVzIMhrpedg
 x2Ow==
X-Gm-Message-State: ANoB5pnzwh4Erw8JcAkAJ4SwDBzUAxhOlHbv4macE16UvTKBFLBKWiMV
 0rBvipmWJMBrpT+M92eHnUuD0aKJW2fLZd8cffcCXQ==
X-Google-Smtp-Source: AA0mqf7S4x7huFcA4Z83QeCr84AFGO20SDPWHWyEzAx5+91YtST/sLhijFe/or6YTfzg6PxsDD0IjAyIfq0LFm1ZlbU=
X-Received: by 2002:a05:6a00:4199:b0:56b:bb06:7dd5 with SMTP id
 ca25-20020a056a00419900b0056bbb067dd5mr19411929pfb.3.1668530597428; Tue, 15
 Nov 2022 08:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
 <20221115161736.2425584-3-alex.bennee@linaro.org>
 <8900f3f8-0993-b479-8080-0276d20b0c4b@linaro.org>
In-Reply-To: <8900f3f8-0993-b479-8080-0276d20b0c4b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 16:43:05 +0000
Message-ID: <CAFEAcA-LSU+io9HokYvgcj6AfEo_zYru521PiAY=0k2_+z7mVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 15 Nov 2022 at 16:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> Possible future cleanup, define JEP106_ID_ARM:
>
> $ git grep 0x43b
> hw/intc/arm_gic.c:1671:            *data =3D (s->revision << 16) | 0x43b;
> hw/intc/gicv3_internal.h:743:    return 0x43b;
> hw/misc/armv7m_ras.c:26:        *data =3D 0x43b;

I think that's probably not worthwhile, because the datasheet gives
you the hex value of the ID register for the device, and if we
hide that behind a #define then now to check that the value is
right you need to go look at the #define line.

Put another way, the important thing is "this register holds the
value 0x43b", and it's just a point of information that that happens
to correspond to a JEP-106 manufacturer ID code value.

thanks
-- PMM

