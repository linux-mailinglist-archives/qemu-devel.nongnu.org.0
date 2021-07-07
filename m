Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68843BEA7D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:14:32 +0200 (CEST)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19Fv-0000wc-Qg
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m19Bf-0002LT-9W
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:10:07 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m19Bb-0007SY-6h
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:10:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id g24so1720510pji.4
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=caJxtZUVCx/fNijleFqHimQSXrTENRVdwHE0GhMAjWU=;
 b=NRuRRtHCgH0sDLfpJDO6w/mAAGtUmGQDlhlA0xumpaZAQD/3yzZUarWHW/MiHbLpA5
 /ur/u7I2IruJQ7sD0bjISpcwX+8LMhuUBVzItAfpiOuMrEbycd8F3NjZL7IFSdUujD09
 sB6iWQyw6OqbwsV/u67DUJKarh7u0z8VTmwcC7D9bX1fpeswh2EvgsEt+24ziULkrUPl
 v2p4zKHFZr8ytF8smw0BvRiCAgx426kjM6mbTuRUzhGS/OF+A+kV92QwOlsZunemEDUX
 7+80C+1xVag/4DFEyuQgALYNuXveEmHgO0YtRB5iLeGXemlH427+2BGkC2pKPReeP3AX
 LP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=caJxtZUVCx/fNijleFqHimQSXrTENRVdwHE0GhMAjWU=;
 b=eKMXDlTotKenVaz+ZfAM5eVyonmJN4Go5ZuYkBqXSvQ9ZQr4er6meg/kYv+npHONGQ
 MiTWFQS3RXq06W0M4nnvIMckK74OrNKt5mjRKkh71nMlC3XWdcw/OCvU32VwHtv7DASX
 6q0eu1afFC0AsG4l8rP051Zl9V0BgKmaw2CrDikrsgd1yfPmMKGGPRcj9vizIhF/pq6O
 QLXCtGC+7vjAXDk/R1WSDiglqPH5cZ3YF8h84S4C/sd4fbTksKVPnOZZVOF6aIGI6A+6
 a7ij+PPP5ozl4DO3AYema7dPEvkQeNvbOKdA/pMx0H44jXJde440CXf1QU/y9DeasowG
 DI8w==
X-Gm-Message-State: AOAM530KrmuJpy85UQoB1mP6c1Qh7F0QrGkifREpG0J7tNYC6yZyJCc7
 w0GYB8Bm9NI4i8PcLaKClOMiFQ==
X-Google-Smtp-Source: ABdhPJwfHkD1s/9CCkG2LFt8laRKru9Mi3GI/OebKZtCcDmttRH2/ucoSCidCCDqNhWTluRjsRl+oA==
X-Received: by 2002:a17:90b:350e:: with SMTP id
 ls14mr12325675pjb.31.1625670601577; 
 Wed, 07 Jul 2021 08:10:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v11sm18127709pjs.13.2021.07.07.08.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 08:10:01 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] configs: rename default-configs to configs and
 reorganise
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20210707131744.26027-1-alex.bennee@linaro.org>
 <20210707131744.26027-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <064ce1ea-3e6d-406e-e264-12ae1943e7f0@linaro.org>
Date: Wed, 7 Jul 2021 08:09:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707131744.26027-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 6:17 AM, Alex Bennée wrote:
> In preparation for offering variation to our build configurations lets
> move everything and rename it to default. Common included base configs
> are also renamed.
> 
> During the cleanup the stale usb.mak and pci.mak references were
> removed from MAINTAINERS.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20210621152120.4465-5-alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

