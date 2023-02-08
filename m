Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553768F83D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:44:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqLw-0005pp-Aw; Wed, 08 Feb 2023 14:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPqLk-0005l9-NV
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:43:25 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPqLf-0000ak-M1
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:43:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h16so17898818wrz.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CEazKaM/1u9oaDf//nz0zrwJKhfX63xgm7ST+zsH1rk=;
 b=o+uReQ83nevrKHVn5o5sr3Ono7aZo9IG2glUTTIEWREi0b9kkYYMp49OztNl3HU8lQ
 mYgMOXkKgWWok/1eSG2uTk/63bJ7DGporbSaPEnQuzY0Jpl6wpkYE/PaOWQr4FVTMLNU
 emcHLcEPTNPF1Jtx5uT0i/2ipqRlsrHHPuXABYgPFL0gu5gWWLAdlVFi/PF1SfBJVqkb
 NxtXuVEa2joisGCXMHadL9F6N70RFkyyzyoG24i7+SgktBr+rV4hQvtFmwuA4PnqMJSC
 P1O/2mZCLpsqFuAJkiuyTx8PAaU32ZnYemDhM+Gjsy7qrDtq/9mWeTWx7BnfnJfm0UEL
 CZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CEazKaM/1u9oaDf//nz0zrwJKhfX63xgm7ST+zsH1rk=;
 b=YRGdKLXX8HZyldN1PCHC/rv8d4UvdipHQvSTgAFbvHvRhj5KzRHToMyZqodJrSrzBl
 Jci8KE+dzc9xh35WWBWAF3POtBX6TnVI4NBB816EbsDKXShfiDcWQCfJ09faXeLK5XkW
 lE4pUkTG3360SuspQVYgL0DN56xzGR4CVBXN1o16JwRzhZRFGWc9K/xGFVw2hrKI6Y2y
 Oe0PHPpzdDgSwam/0SVU6pHEEIqZD/niiph6JVdZS4YB9kO/dY6NWcuPsCYihtLdENSf
 dDCP2H/LU1pTmt/m1QUzHimwwoYkOxy5Oay7tFT+pdKboh2cM+EbpmfetFOaC18XPHag
 gHeQ==
X-Gm-Message-State: AO0yUKVhUQ438zkBvsRX8RA9QShbDW3OSB2NhtSPVU8syaZcWJYJio8B
 1A85hFf5rqktSNtj208GF8vRmw==
X-Google-Smtp-Source: AK7set/GQq3FenlBc5VViUNKsTRETFzx8pKwg2ZFt2HcYPq3VM4B1ngoctfMguTlpnZ9uFEaK9KZuw==
X-Received: by 2002:a5d:61cb:0:b0:2c3:dc62:e682 with SMTP id
 q11-20020a5d61cb000000b002c3dc62e682mr7714856wrv.10.1675885390508; 
 Wed, 08 Feb 2023 11:43:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a5d4b87000000b002c3e65c9533sm8855500wrt.67.2023.02.08.11.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:43:10 -0800 (PST)
Message-ID: <f859ba36-c39a-4f86-741d-7920d28c9aaf@linaro.org>
Date: Wed, 8 Feb 2023 20:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 00/10] Kconfig vs. default devices
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230208192654.8854-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208192654.8854-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 20:26, Fabiano Rosas wrote:

> We currently have a situation where disabling a Kconfig might result
> in a runtime error when QEMU selects the corresponding device as a
> default value for an option. But first a disambiguation:
> 
> Kconfig default::
>    a device "Foo" for which there's "config FOO default y" or "config X
>    imply FOO" in Kconfig.
> 
> QEMU hardcoded default::
>    a fallback; a device "Foo" that is chosen in case no corresponding
>    option is given in the command line.
> 
> The issue I'm trying to solve is that there is no link between the two
> "defaults" above, which means that when the user at build time
> de-selects a Kconfig default, either via configs/devices/*/*.mak or
> --without-default-devices, the subsequent invocation at runtime might
> continue to try to create the missing device due to QEMU defaults.

This will keep bitrotting if we don't cover such configs in our CI.

Why do you want to get this fixed BTW? I'm not sure there is a big
interest (as in "almost no users").

I tried to do that few years ago [*] and Thomas said:

"in our CI, we should test what users really need,
  and not each and every distantly possible combination."

[*] 
https://lore.kernel.org/qemu-devel/81aca179-4320-f00b-d9dc-7eca449ebce7@redhat.com/

> Fabiano Rosas (10):
>    hw/i386: Select CONFIG_PARALLEL for PC machines
>    hw/i386: Select E1000E for q35
>    hw/i386: Select VGA_PCI in Kconfig
>    hw/i386: Select E1000_PCI for i440fx
>    hw/arm: Select VIRTIO_NET for virt machine
>    hw/arm: Select VIRTIO_BLK for virt machine
>    hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
>    hw/arm: Select GICV3_TCG for sbsa-ref machine
>    hw/arm: Select e1000e for sbsa-ref machine
>    hw/arm: Select VGA_PCI for sbsa-ref machine
> 
>   hw/arm/Kconfig  | 7 +++++++
>   hw/i386/Kconfig | 8 ++++----
>   hw/usb/Kconfig  | 1 -
>   3 files changed, 11 insertions(+), 5 deletions(-)
> 


