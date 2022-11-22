Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A52633DA1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:28:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTJB-0000yB-R3; Tue, 22 Nov 2022 08:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTJ9-0000xq-J4
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:27:27 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTJ8-0004iz-1c
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:27:27 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 136so14111187pga.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 05:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ofRCumZ3/37URAXPux1nonscFt8GPW/MI/AdHounDgA=;
 b=Wep2zsWzJVoBSSdFcU0wY9ogu6uW9/1RzSUmtD8iYa+oB2vIfHa1idfOfoSw6YC5Kn
 GigZQMBoUIfjz5XTN+AM0ol24iZbfn8lCIb5QHXnwsJHX438MGJc41BpcHbi1HrNJl4V
 lBNG6irYITouPCeSIUjoUYXa//CmnUDkn/c8JevU94WYP3lMI3MjVtz6Lwa8JpBY6nh+
 vpne9OESRt5mq4qQiGsVNqNzlMMKhubhFvfF4v1fLzt1wiYKi2as2Z1h+9umldUruzlD
 Sh0ZrE+x/nCjndL2Ww8/sH+V2ZUHuQsWHX8iLGeQcqP95HFOojVqLeOgIKN+DUcF9T8k
 SRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ofRCumZ3/37URAXPux1nonscFt8GPW/MI/AdHounDgA=;
 b=SdnhHpM4TjCdSuSp7S0H9mmCympTNfpXEMFX0qPp3XrUFPpmNYiSy8BZra4BvufR75
 iw8MnKmbDPpab+nW7ZGjV5dU9mjwzkbuxfYZlmjkizdhAhcM1MrmGe/iZFPTKMSzPhIw
 Aw8Popu7+A40xV31Qnu8cOW2IRGQOrfz0JR62htNfxQO7ic2fFQqhCaRQByUy3nEbNem
 sdtifsZdEF7CZquU8ZY8xcASawHNOI025s6Fmjv6gUpieCyLfsAsnfLrLiZmv9qmGVH6
 bm22/YOXUoKvJxk7S228lw6aWcFBHYpecplqfBcl0s3YVzAAFPDIYOzMd1mU3xarTZZM
 OmQA==
X-Gm-Message-State: ANoB5pkwOoMYf6IsPcqXoOmE1k1x0kHjr1bV+vckqkMx2fBjV26AevgA
 smbVdLg00hzMQWU9GT/kZHGkcSTzt+wmrvu4lcvGMg==
X-Google-Smtp-Source: AA0mqf6x5YeTLFzQg7THXYAjIDkDNdP8/J7tCm65rgPJJOcHKsWQ9rUQ2VNRT07IKmfcBMM/gh4XbPeynJIFDQX7H3U=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr3536391pgl.231.1669123644436; Tue, 22
 Nov 2022 05:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com>
 <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
 <m2edu3ig2s.fsf@gmail.com>
 <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
In-Reply-To: <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 13:27:13 +0000
Message-ID: <CAFEAcA95+NaE2Oh_7AKkibDObvpuifPOLw-Yh8u6qSXS6LiMgA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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

On Wed, 16 Nov 2022 at 13:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Nov 2022 at 06:11, Schspa Shi <schspa@gmail.com> wrote:
> > Yes, I think we should accept this patch, because it will not affect
> > 32-bit devices, and provides support for 64-bit devices to put initrd
> > above 4GB.
>
> Yes, I agree. However since it doesn't cause a problem for any
> of the machine models in upstream QEMU, I think we should leave
> it until after the in-progress 7.2 release, so that we have
> plenty of time to investigate just in case it does cause an
> unexpected issue on 32-bit boards.
>
> This patch is on my list to review and deal with when 7.2
> goes out and development reopens for 8.0 (should be in about
> four weeks).

I've applied this patch to a target-arm-for-8.0 branch, which
will eventually turn into target-arm when 7.2 is released in a
few weeks' time.

thanks
-- PMM

