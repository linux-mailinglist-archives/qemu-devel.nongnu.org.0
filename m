Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3637D6AB998
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:21:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ70I-0007Nr-IR; Mon, 06 Mar 2023 04:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ70E-0007ME-Fe
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:19:30 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ70C-000655-S6
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:19:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g3so8031396wri.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 01:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678094366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=58NVK48NfnWrtVLNjDhVbfVDpCm42d+xmhl5m+sFIt4=;
 b=DoGQQJZdoqFHDOtbxQ73NJqmi02v273gLkXN0yjk+YT/7zY8EqBGtqRcik5T9ez3Nc
 nmJtaAIbHFQJTvGfQOvEa4PBZcuRsqvDJEWjmo2Y2XEDY16FoZoRKjBVKMuwsn9W2ywc
 YBsAIbZM+gzVtaF08BtiIgi6Wri99eR0o0L3Gfc80PI6IOY0c0tXBZL4iJnxqqEz+ljs
 fHix0JKHzhM9mKZLmzeQqzCO/ilr8EOL3K0jV27w82Hi5T8ODkqWcls6gAkKAlVW2ZrW
 k9pIh2xOiSlXwjQf6pZkO4zbxCy4efHY34YrfeAPfSnZa1/5gBxIM2LWwk+zlD6lxx1k
 VwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678094366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=58NVK48NfnWrtVLNjDhVbfVDpCm42d+xmhl5m+sFIt4=;
 b=Zk0CVeJoc+wT1eEJ+yOva4Soz+aam/0VHrjXF6m7y5LWbXwSmSdYp8Suc1vOOhcmI+
 tG7kiKqbitkqTChnI/B7Lpth3cs+K6nxMp7EwDim4W908JuZtxe3WDvwwRgH0HL7QVhM
 DYn1MvIGQZNwlGm4wLTKq/NoEHceUpBuw2a0MGpEjGEANvOShBImFKmzCPreVZqVDv62
 ueVUA2EOBi5csVmFC1U6+Qiyx1ofLp3uQPfbE5deEUzAEhtr9tdMx1Nql9rSiFUaUNCO
 CW8RgPTmcMQrqX9Xq55VSuxOjZrTXcppJw+ySfjlVgfx5l8Sfq1otqP86+AOyCmbZ81p
 bJuQ==
X-Gm-Message-State: AO0yUKUzc3n1l7DMXhw+vcywcdzyuGaELY8Q27XCEhkxRhr/MPv7Arnu
 w+xlTz1RNjculkgOK2pudvUgfA==
X-Google-Smtp-Source: AK7set+jsAty6DpV+HYFXiTVVgLiQ5rrjzNYIewz64rQR7F0LEGTSV6+QptEOtlt0IcQBtu54VHDqA==
X-Received: by 2002:a5d:664e:0:b0:2cd:defe:cfd3 with SMTP id
 f14-20020a5d664e000000b002cddefecfd3mr6817401wrw.30.1678094366348; 
 Mon, 06 Mar 2023 01:19:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f9-20020adfdb49000000b002c59c6abc10sm9449418wrj.115.2023.03.06.01.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:19:25 -0800 (PST)
Message-ID: <e2af415a-79dc-f4ef-6c10-5f6454c11b58@linaro.org>
Date: Mon, 6 Mar 2023 10:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/5] gitlab-ci.d/crossbuilds: Drop the i386 system
 emulation job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306084658.29709-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/3/23 09:46, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU with
> full system emulation, so let's stop wasting our scarce CI minutes with
> this job.
> 
> (There are still the 32-bit MinGW and TCI jobs around for having
> some compile test coverage on 32-bit)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


