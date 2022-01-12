Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8D48C697
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:56:44 +0100 (CET)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7f3L-0000F4-Nx
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n7eOE-0007UP-4U
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:14:15 -0500
Received: from [2a00:1450:4864:20::52b] (port=37722
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n7eO9-0005gf-Qr
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:14:12 -0500
Received: by mail-ed1-x52b.google.com with SMTP id o6so10571601edc.4
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 06:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Sb5t6CyXkfkf+1YzTDvmSIG2CenJjT4HXYNbRTIyfqw=;
 b=Tw6lQOSCEHqxoOtekj9iA92WTT5Hrnc62VLGjv2XzCionFRfbxT5oL7x1gi1y85rQi
 j5yW+HTZCX6jENb70T5Mv5tfVzj6gYUKj7FxiC2TP2dQPZGh2/SGiuPTqshM4mFhNbLd
 K+95oBh/7DcJ5cKqNEj4OTwGANkw0mKmqib1nI//l7DrA58JaGZP47KN2rewlH0m6voD
 fMzFxKw+ZZgegw6ukrMAD71VItegKwitkjWfCq9pKAk+wFs73jXm+iMqdSjkVPjsrx6/
 m5sDyZkR6om1dxMyLGMI/3aSkk+eOm0jMdX22nZ7sEuTTvhQCI0mPkx9a9R54E/78r2j
 HUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Sb5t6CyXkfkf+1YzTDvmSIG2CenJjT4HXYNbRTIyfqw=;
 b=YCpHgw3GyPAttb/Vtd17+C7IJnVVs4KxKO0eD9ZUBmILsIGSRtMltjvqcpozWWG6np
 AWrPM8pfpJ+dfcHCjcHd3zTjFq4CIe15mJ4so1S3Ku3h+nN/65lGvZ1S5YgmRs88/e5R
 AsjwXOHOwAUeIUjqQ2krb3U32g5/Uwq8QqVnx9CZQe6b+TzKBNdcn6tao/36VA7qM9GW
 O8Ia5HirROk8lD/Hqp4mV5WS+bXNRVobH2dTyqFvwy7Yb3APv/MUnK6thfV0G1oC8lYG
 x9S2RD8QV7LwbEAS+2HxHoGps1CKa1E5jib3a5OvvLji3uO1AXJ7iu0AxREgvbze7jbE
 onsA==
X-Gm-Message-State: AOAM531FMFx9CL1B6tBumIYxMgatGXGOU8RiLzOdEJGu9Wz40br9Hohd
 SMf8Tc1o8+VGPZziKDZtdAKA9g==
X-Google-Smtp-Source: ABdhPJyiKtmDSpCjtkIZtTRxRqLT3kI1wC5hInQTlrvz99k0jNoBSFvNmftAJkXq6IWK8jibcEYMOw==
X-Received: by 2002:a05:6402:712:: with SMTP id
 w18mr9159757edx.281.1641996846382; 
 Wed, 12 Jan 2022 06:14:06 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id jg41sm3180539ejc.101.2022.01.12.06.14.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 06:14:05 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: /usr/shared/qemu binaries
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
Date: Wed, 12 Jan 2022 16:14:04 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <FA477823-7F6E-469F-BE48-72183F9847E7@livius.net>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
 <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
 <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 12 Jan 2022, at 15:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> Those are UEFI firmware images which are suitable for using with
> the arm/aarch64 "virt" board. 

Then it would probably be useful to keep them.

For the xPack QEMU Arm package, I ended up with the following script:

```
    cd .../share/qemu
    find . -type f -maxdepth 2 \
      -not \( -path './efi-*.rom' -prune \) \
      -not \( -path './npcm7xx_bootrom.bin' -prune \) \
      -not \( -path './edk2-arm*.*' -prune \) \
      -not \( -path './edk2-aarch64*.*' -prune \) \
      -not \( -path './edk2-licenses.*' -prune \) \
      -not \( -path './firmware/*-edk2-arm*.*' -prune \) \
      -not \( -path './firmware/*-edk2-aarch64*.*' -prune \) \
      -not \( -path './keymaps/*' -prune \) \
      -exec rm -rf {} \;
```

I hope it covers most use cases.

Thank you,

Liviu



