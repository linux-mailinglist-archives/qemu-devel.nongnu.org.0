Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8776A195C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 11:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUtJ-00076W-Nb; Fri, 24 Feb 2023 05:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVUtF-00075q-RC
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 05:01:21 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVUtB-0003Am-OW
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 05:01:21 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so2281218pjb.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 02:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fIpW5o/lwx5wHe1JSVFqSdCGwYSvhStqSq2nhloYdUo=;
 b=Pic5DRlUoUwE3IEiaWYzSpFdS2Xr042ErnHHr2Tsy5lsWi5C9z67K1Hjwqm6QzWFcs
 7IzKH45UTprpGwCh5771evS0RW0s0uRqcbOK3QthRktjxg01MH68G0vNYhkLjwgbx7NC
 22GkkklRqUJnrQHhi3BBpSOzRtmUr73sOdnv+je1NnqCnsA3D9LjaUIwMdfimYPxwCTl
 Q0NnbT0gHMsmNGUDh9Qlowlq6HhGHkgEe1EnBB7DJF1JvhMwVYk3bFTBETIkKr0TX/bY
 6g4zF4IvoWHZ0I+MfYG8AV0mQWDMUOp5PGQYnwg4sBY6dOtpIjf7UlDp3F8i0JE6QbQ8
 KHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fIpW5o/lwx5wHe1JSVFqSdCGwYSvhStqSq2nhloYdUo=;
 b=h9x1wSu3lIphhPCQY9L/LGCW6Md5rCVBqXyFlEXb8zrGFneHv60gVm/wOfu+/aEcXa
 aOQ79yKsK8G08XkzK3ooAbkMLEks91AYL9OBgRc37OR+MHfWlKrohO9JdAdCESfzqrO2
 klsZPEH0+e+cIl0d8ggl6YVUboCCF0FFQha2sLac+ca6p6mQOB+Pyg9YtNn6ffp9/yVc
 NBQ9r7mvWZd+lx3z0qHwPvjBztQsVcswtBRcvYpqEOKokyG8SeeK+S6yf65Px6+06ft1
 JeAubxaooSpjYrCB7oBLC/BRsO21KVClFXIfMGCXQ4moCaYLLr6xDK3g1o53hMikuS+q
 FmOg==
X-Gm-Message-State: AO0yUKWTP+V79D9wlyHchdD0vqJQFvlxo3ZVlYdpw/kFe5x6NVwjWzpK
 xe5Xpt4KATQUY74YVDInhKeDXLSqgQlNDI1BA6bxbw==
X-Google-Smtp-Source: AK7set91/trvxWolpQHxZsESrw/lDLmv5EBYlgSs60j56i02wMvtFKqWeDbzh7o8xVM2gFy1Tx9PWplYGz+sooYjtZ0=
X-Received: by 2002:a17:90b:118:b0:237:50b6:9a09 with SMTP id
 p24-20020a17090b011800b0023750b69a09mr1531357pjz.0.1677232876256; Fri, 24 Feb
 2023 02:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20230224001852.4B813746324@zero.eik.bme.hu>
In-Reply-To: <20230224001852.4B813746324@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 10:01:05 +0000
Message-ID: <CAFEAcA9w68d9ChqMq6zwfiJwMjkbHXbDefCk4Dm7Z8aya-7CPg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/sm501: Add alternatives to pixman routines
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Sebastian Bauer <mail@sebastianbauer.info>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Fri, 24 Feb 2023 at 00:18, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Pixman can sometimes return false so add fallbacks for such cases and
> also add a property to disable pixman and always use the fallbacks
> which can be useful on platforms where pixman is broken or for testing
> different drawing methods.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> Also ping for the other sm501 patch I've sent a week ago:
> https://patchew.org/QEMU/20230216144043.D632874634B@zero.eik.bme.hu/
> These two patches are needed to fix graphics issues with AmigaOS so
> I'd like them to be merged for 8.0
>
> @@ -2010,6 +2035,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>  static Property sm501_sysbus_properties[] = {
>      DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>      DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
> +    DEFINE_PROP_BOOL("x-pixman", SM501SysBusState, state.use_pixman, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -2093,6 +2119,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
>
>  static Property sm501_pci_properties[] = {
>      DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
> +    DEFINE_PROP_BOOL("x-pixman", SM501PCIState, state.use_pixman, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };

I don't think this should be a user-facing property on a single
graphics device. Either pixman works, or it doesn't (in which
case we might need to do configure time checks and have a
fallback), but we shouldn't make the user have to set an
undocumented property on the device to get it to work.

thanks
-- PMM

