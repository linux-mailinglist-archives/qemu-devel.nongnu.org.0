Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F389C4B3B6C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 13:59:29 +0100 (CET)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJETQ-0001I9-Jd
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 07:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJERT-0008P6-Ef
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 07:57:27 -0500
Received: from [2a00:1450:4864:20::42b] (port=39490
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJERO-0005FO-JN
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 07:57:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d27so22724754wrc.6
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 04:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2c0SI7m7ZB+m4RaXReFLA6+iDUdiDg4G2NOqfn4wgmQ=;
 b=aIWlNEwWaI2UJKNAmkRKc6aBrQm3cGtJHiz2aA0Z7odhnA3B1av2838F3V38ouojFQ
 rQJIUHmH7pK3pIlfJvyojEXJ/jrxYmrHkcXH9+jHkcspcl8lzYfAjGhisTB91qaFWZ1W
 2BwwhmEX4y9/G17HyrYXTsfnFrYzQ1J6IZAyF2541fRZOA9GOZ0fP0FRfSDDIae9Bklr
 yXZadDm4hD8lk3qwt2ny3UlFloyTzA5v1upVlSIMM2Hl9jvykTVNK31f6Nh473mTdALw
 bVLtsY5lBiBenxv4FUbogTTfxRPiTSKH1Kmx0i8KUAHWT51UFIXTHJ6GjoLWC/WgDprv
 /C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2c0SI7m7ZB+m4RaXReFLA6+iDUdiDg4G2NOqfn4wgmQ=;
 b=Dh7lt15fttdTg7tLEww+XGZcDHNFuyGWGyRnCTyQLaaSiXzrXdzFv2OB+yaDfGGaFG
 vtQqd2Jj4igi9rMawPNE8WJmusHHosRlR8M4/Ivt6cbg3tuV/CNX8uiO5EjCd92z7cwd
 3MX/G7qz9CaSXYH0okEJhylB4SyZbEb4YXiTSuPZ1ZlNdma2UqDfn+lAA2EmCAm2lnsT
 SGoC7RORdlyCo/2W5b0SrDyqtHuqPmEZJZB6bs6kLEuoab8mvoXe8ePKGPfxWbtoMCJU
 MlCiFOt+o0u8OMoCtaHrtO/9U6JlKSFEjcnfL97uvazIzxF74sKXpRaatJhfvBjzH81X
 thig==
X-Gm-Message-State: AOAM5311ZZJvlxmd6m2TaYZ+3JyFhgCFXVOa3rhdqufZo80M/KOM+94u
 oZVAjVRFC7be4dpcbyP8w17UkbxYc0l66+8fuF2hcw==
X-Google-Smtp-Source: ABdhPJyhWkmqOt5Qv5V8sVaUI/z6NPBi3j81Oxw8fxbdgicbVi/hBwNisw0rORYtSXJDU+bZsM9nUw4+Wq9rLZHPZF4=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr7776005wrv.319.1644757041279; 
 Sun, 13 Feb 2022 04:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20220120123630.267975-1-peter.maydell@linaro.org>
 <20220120123630.267975-19-peter.maydell@linaro.org>
 <3f4f5e98-fcb8-bf4d-e464-6ad365af92f8@gmail.com>
 <87iltjxdz6.wl-maz@kernel.org>
 <CAFEAcA9yR4=PNCGJk6iMEq0EHejwwt-gQJfvByEk-EN6ER5o_g@mail.gmail.com>
 <CAMVc7JWUm7v6gt48TP+ugzEeHwo6FA66TeE3h3fqyHmHsShoig@mail.gmail.com>
In-Reply-To: <CAMVc7JWUm7v6gt48TP+ugzEeHwo6FA66TeE3h3fqyHmHsShoig@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Feb 2022 12:57:10 +0000
Message-ID: <CAFEAcA817oN+UNJC=o-GTAXo0UypgsTkm7MvcLKDSR-9amkPXA@mail.gmail.com>
Subject: Re: [PULL 18/38] hw/arm/virt: Honor highmem setting when computing
 the memory map
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, qemu Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Feb 2022 at 11:38, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> I found that it actually gets the available PA bit of the emulated CPU
> when highmem=on. I used "cortex-a72", which can have more than 36
> bits. I just simply switched to "host"; hvf didn't support "host" when
> I set up my VM but now it does.

It's a bug that we accept 'cortex-a72' there. What should happen
is something like:
 * we want to use the ID register values of a cortex-a72
 * QEMU's hvf layer should say "no, that doesn't match the actual
   CPU we're running on", and give an error

This works correctly with KVM because there the kernel refuses
attempts to set ID registers to values that don't match the host;
for hvf the hvf APIs do permit lying to the guest about ID register
values so we need to do the check ourselves.

(The other approach would be to check the ID register values
and allow them to the extent that the host CPU actually has
the support for the features they imply, so you could "downgrade"
to a less capable CPU but not tell the guest it has feature X
if it isn't really there. But this is (a) a lot more complicated
and (b) gets into the swamp of trying to figure out how to tell
the guest about CPU errata -- the guest needs to apply errata
workarounds for the real host CPU, not for whatever the emulated
CPU is. So "just reject anything that's not an exact match" is
the easy approach.)

-- PMM

