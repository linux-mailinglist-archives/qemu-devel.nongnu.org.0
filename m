Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB609601B2B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:18:28 +0200 (CEST)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXVD-0006ZJ-K3
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXQy-000258-Mz
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:14:04 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXQu-0002dm-UA
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:14:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso10911692wmb.5
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pFSHV82ejGx/Jw64CuhugXaThUtVXVcOBYrJoej4yfM=;
 b=lvdhLmtgOqhAM56ALWRfqOhyYtJ2CYAFfjvlLLZ5h85g5Um+er8WJZzAhUeKXlaoKN
 QEKWivlC2zjlvTxbnIIT3PWcmNu/pu40tCfEDr4EwgK8VcBjn+mEhKZ4GwJ6Zrw/jHDe
 tDOedif5przatgT64ai3EZkip0n0naqaSaWhp5L0dDTqUHRM8f45kb//Zy8EpXyJyHNl
 zDe+KYjG5RoS2HP3Jez+QlH0e97KwNRFvD0Vx2rPnjLLHQmerMyrfnltce/w1zQpxYtd
 Axfoqcu5xPphPYxuN+oGVWmo+Ysqg476TdZfkd5O1M3FayvCheiBuAPgTc38LG4wx0iM
 XSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pFSHV82ejGx/Jw64CuhugXaThUtVXVcOBYrJoej4yfM=;
 b=fewWIMe8nTWSfb/dXHwnGLpam8u5mE/jmynjfDIW1ZngMp/WOAiEX99MEOcckaFphJ
 w9EKbOOA/wj+GEBLLINcpMU2Y3LnM17uneVFOzUCeGjf1OOy3hc3DC58ieV631t2bWv1
 JeWlxBm6R0pAbZg79NKRbeVpJkEP+IdEbZWhqFFFD+678quuqEJugs8k5VHMMSEclMXA
 unu8QRS+WBBR9ERhBEas04nSC2c6UfHFiursC53AimyVaIOgdNrHkWZJYwPTnWyCb6ST
 bKSZwgH7lvmwZ5YPCSI+XCXlX9FsIwk2uEnXT9f8h+ipcYyY9/yt8op52r6QT2OPb68C
 LQRg==
X-Gm-Message-State: ACrzQf0UHRi5+nTxHR2PRtqt5Nx6e5odrJWWDsy0mBwjVoYFrG8l2Cl5
 b6SgVwSyCWJrPianzSv9x9LuDA==
X-Google-Smtp-Source: AMsMyM6ZaibTB6YV5zU1r2XNJZPfcQgR2zYV7LweJs+MmZo8d2rx9tdurjaZlSlAfdkZkjJj5BX4JA==
X-Received: by 2002:a7b:c4c1:0:b0:3bf:e351:4ba with SMTP id
 g1-20020a7bc4c1000000b003bfe35104bamr12180817wmk.152.1666041238364; 
 Mon, 17 Oct 2022 14:13:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a5d6d4d000000b0022ac38fb20asm9342683wri.111.2022.10.17.14.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 14:13:57 -0700 (PDT)
Message-ID: <5df81a97-8fd7-8ee6-f631-7c979a2e58a0@linaro.org>
Date: Mon, 17 Oct 2022 23:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v4 01/10] acpi/tests/avocado/bits: initial commit of test
 scripts that are run by biosbits
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
References: <20221014173508.222823-1-ani@anisinha.ca>
 <20221014173508.222823-2-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221014173508.222823-2-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/22 19:34, Ani Sinha wrote:
> This is initial commit of cpuid, acpi and smbios python test scripts for
> biosbits to execute. No change has been made to them from the original code
> written by the biosbits author Josh Triplett. They are required to be installed
> into the bits iso file and then run from within the virtual machine booted off
> with biosbits iso.
> 
> The test scripts have a ".py2" extension in order to prevent avocado from
> loading them. They are written in python 2.7 and are run from within bios bits.
> There is no need for avocado to try to load them and call out errors on python3
> specific syntaxes.
> 
> The original location of these tests are here:
> https://github.com/biosbits/bits/blob/master/python/testacpi.py
> https://github.com/biosbits/bits/blob/master/python/smbios.py
> https://github.com/biosbits/bits/blob/master/python/testcpuid.py
> 
> For QEMU, we maintain a fork of the above repo here with numerious fixes:
> https://gitlab.com/qemu-project/biosbits-bits
> 
> The acpi test for example is maintained here in the fork:
> https://gitlab.com/qemu-project/biosbits-bits/-/raw/master/python/testacpi.py

I missed the previous iterations of this series, and wonder why copy
these files in QEMU repository if they already are in a forked
repository. Why not add the fork as a submodule?

> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2430 +++++++++++++++++
>   .../avocado/acpi-bits/bits-tests/testacpi.py2 |  283 ++
>   .../acpi-bits/bits-tests/testcpuid.py2        |   83 +
>   3 files changed, 2796 insertions(+)
>   create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
>   create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
>   create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2

