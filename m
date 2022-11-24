Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93B637CB5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 16:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyDzh-00029S-Hi; Thu, 24 Nov 2022 10:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyDze-00025d-Ni
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:18:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyDzb-00057P-G1
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:18:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id x17so2904577wrn.6
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 07:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eqBdcOgiBpx0VbgqJAjqsk8wkUHCZp9MWtstHXhLDno=;
 b=R7kbepsygh273fUkxwzM7Sm1lCfSPTYHMpZ1fRt3GbiHAPUYJLszcIiAOgqnSLoHDL
 AMvwPKovUy07HenKa3BqjhX22jBEXBqXr+zyT7ZNFlN8lNuwOgGCh5QRNU/CZTdTMWmT
 yl3tiCcv3yQ39YWrPP3xSE/D8O5YaQ2p5TK8brEKka3lOtM6VgbRjuOqMaOf/+blQMcD
 MnkWxX97lxnbI1mHHZcdqHahQpc3HWcPFtETFmdl0ukaHg+5fk9V9ZkrE1L47oogLWDt
 LL8spP0QfaKMUr/unEoZ24nVVK2C2+woXRi9RLFjHwm+u4c5wUxlI6Ne72TeoRhOBjwR
 0Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eqBdcOgiBpx0VbgqJAjqsk8wkUHCZp9MWtstHXhLDno=;
 b=7SgHlugE7042aXLFPJ+V3sYOKhHy9wXz42yiOvNJDbIlK8BW1BC80DTLuUrYCeav5J
 QcuC6bADhQg0x8MJWTcGWj9PzFUFdq1PBefBwkgBaL43T/E44PpVVxthhdD/Xpp4anRm
 FAFylBLSlP+8bki2d3SYyAHkCv22PBlQiCnMk0Zks5mD59vXTP+W9ShzHHA/AMV8LmHN
 QHR/T2j8lH0nEb+SdHDrcIIdoCphIwxe2AR+patMybEaCf6GP7/auYb7wdT9YquYk7rQ
 z+E+17/HEgkHPwZYKJQC2N4j4U9G4hYUL+Qhqm/+B2YYZXAokPGjxOOhUauRLg5doF9n
 aqOQ==
X-Gm-Message-State: ANoB5pm3BYp/Nsg75Fw8I+lLlk6IoWd/VKt9Wo/7tFNft4xg9K5MlOoi
 quzkGGY3A8lAJ5Ue7JMg7kgQ4Q==
X-Google-Smtp-Source: AA0mqf6i5+Oz/4oYUPgeYNBPtxVOW6nBcy4Hn0kSfUQwmDhg7ySCJCjkphECjvLfJe05iSTqjRnGQA==
X-Received: by 2002:a05:6000:124c:b0:236:2314:6d4b with SMTP id
 j12-20020a056000124c00b0023623146d4bmr12850455wrx.112.1669303101838; 
 Thu, 24 Nov 2022 07:18:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ba17-20020a0560001c1100b00236695ff94fsm1734729wrb.34.2022.11.24.07.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 07:18:21 -0800 (PST)
Message-ID: <de787c6a-c524-a05d-2714-98ad125bd154@linaro.org>
Date: Thu, 24 Nov 2022 16:18:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] acpi/tests/avocado/bits: add SPDX license identifiers for
 bios bits tests
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20221124135834.924426-1-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221124135834.924426-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/11/22 14:58, Ani Sinha wrote:
> Added the SPDX license identifiers for biosbits tests.
> Also added a comment on each of the test scripts to indicate that they run
> from within the biosbits environment and hence are not subjected to the regular
> maintanance acivities for QEMU and is excluded from the dependency management

Typo "maintenance activities".

> challenges in the host testing environment.
> 
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
>   tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
>   tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
>   3 files changed, 12 insertions(+)


