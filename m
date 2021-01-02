Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F052E8769
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 14:12:39 +0100 (CET)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvghx-0006Tr-RS
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 08:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvgg0-0005lG-Pe
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:10:36 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvgfy-00074Y-0T
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:10:36 -0500
Received: by mail-ej1-x634.google.com with SMTP id n26so30433145eju.6
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 05:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wlDIpUr43ZAf37YU3KRm1HVNnmlBjlh7NGRsUlNwSC4=;
 b=M8kvimYFopRQYAQWFMX64Tg7i8ns+0wGw4Hl5yVfWQCbwOX/EHgFWsVf53U0ti26WT
 nC+sEqENZ7g+fHLt0wtFLxor4gO6co/+92GQpA9i+UfYcftmC+KjtVWm+tkBDBjt7bVU
 BzCBt1AiyV6MWepBJq59b5ViXTzNHE9qaRUhuQE9ST1WxrC1LIwB599nd+INGzwV6txH
 zPYJr0naSOtC6ckJ+2gRUWjMQMdzj7x0oN2hANSsj7LBeqoEQ/XAHtMuLGZJzhrLkkzt
 YNtvxRd1ooJ78v/hjk3x9LtHiHk/Rg6Rt2d4mKtmICr1Dkq2HcfNYlPKXgIcPBXsXsQf
 1D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wlDIpUr43ZAf37YU3KRm1HVNnmlBjlh7NGRsUlNwSC4=;
 b=sT2GI+zWTnyMI7yupjUE/qz8Cx1gSUfYQCyLf7FdjFjJVWHBaLJ2b24JAipmZRWrkQ
 AOqIdPS6d1DV4gU+OwQa4pGhFlUdjxlIYGUNWXBj/pLEx8nl8GpAzTbyj5DIqsUZSuNN
 ml3DnqieqB7TfZyDxAv5VahO1pEXgYZPaVjgkA51tNIKv4aq2KeVrjDZjIibLXsueMQU
 hIdf9GEr4KlJ79jEOfguNI5cv9N2MX8NixVCIF050rlPD3nBj/dKeflOb10QAlTlcBA2
 VMoAWhslz7vd8k4AZxDwaALGvnjd8u1Ty3DoEf5gj9QDrWLKDVQUSLbPbrsdZm3WODej
 VzIQ==
X-Gm-Message-State: AOAM533EC8xSiwow2+fOAUOJvg1Dv8v09rp62q4z8N703IjcEw3FluDM
 WuOcH3KmN1SgAuYHtTYLj+P2M7QV6V+weGBPNc9/VA==
X-Google-Smtp-Source: ABdhPJyhSQl2Iwd6Yx4csgdU1u4YBAp0HqUrxEmg+unCem6UwyyE8BMwKXu3ybCeyqa4XeTYI97Z7TLRUG/Vims/nW4=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr60222079ejr.482.1609593032391; 
 Sat, 02 Jan 2021 05:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <20210101231215.1870611-4-f4bug@amsat.org>
 <CAFEAcA_Hi+4BAPL+0BhDgbsXtzDQjiCs0SAs44mKgUbcSE+XCg@mail.gmail.com>
 <2da14074-a4ef-e90c-ea42-74d48ca06afd@amsat.org>
 <293aa484-89c8-acc2-b9a3-37f17a506a2d@eik.bme.hu>
In-Reply-To: <293aa484-89c8-acc2-b9a3-37f17a506a2d@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jan 2021 13:10:21 +0000
Message-ID: <CAFEAcA_s_jOhL+1rVqvCHAEJHU-aAp2-1_zpQ1rC8Hjt_6H4KA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Qemu-block <qemu-block@nongnu.org>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Jan 2021 at 11:22, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I have similar code in the series I've just posted where I'm mapping
> regions of serial devices. I did consider using set_enabled and
> set_address but ended up with removing and adding regions because I'm not
> sure what happens if guest tries to move one region over another like
> having one region at a default location while guest tries to map the other
> one there (the pegasos2 maps serial at 0x2f8 which is normally COM2 on a
> PC). This should not happen in theory but when removing disabled regions
> it cannot happen so that looks safer therefore I chose to do that. Not
> sure if this could be a problem here just shared my thughts about this.

I'm not sure what you have in mind -- could you explain further?
There should be no difference as far as the MemoryRegion handling
code is concerned between "this memory region is marked disabled" and
"the memory region was deleted and will be created from fresh and added
back later" -- an MR that's in the hierarchy but not enabled is
entirely ignored, as if it wasn't there at all, when creating the
flat-view.

That said, doing memory_region_del_subregion()/memory_region_add_subregion()
I think is also OK -- what's definitely not required is actually
deleting and recreating the MRs the way this code is doing.

thanks
-- PMM

