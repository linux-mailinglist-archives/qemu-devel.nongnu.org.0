Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290036A295
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:27:00 +0200 (CEST)
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMzb-00027O-EH
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMu3-0006d4-4W
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:21:15 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMu0-00051G-5x
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:21:14 -0400
Received: by mail-pg1-x534.google.com with SMTP id p12so37385285pgj.10
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8zmzSyi/T74/ihTeG7Zn7N16CapH5OP1inTKLCvBIyM=;
 b=C/3yibFWnKVebLt/z7SJqTyryDyEax/oOaxbuYWn7EPEbP1Qeu7jtD1m0TF73QECEG
 CTGs3uZ71UKdKO7DrbJWJHCp3g1OQgoy6C5MAq5bDNmOeIEUp39KSqxMwTeFDS3UmKo5
 Eztk/nKPJ3gsaTB4k6BtI9tHDOLwD5vhRIsDojraBjNPQqB4PutkaB/rzjfah6ElGyFd
 cPeo/eZI8teJGq2jDxzF77AneBXHWK9zV7M373rLws9hFa1ubjzZS4has/mtAK6FVcmE
 0Nx6vXgLGHtDDKDWLXupbWs38yomo0rGmqUGMTVKcnkTFSNL/k0l+qIMtGfBOlpdqiPz
 6LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8zmzSyi/T74/ihTeG7Zn7N16CapH5OP1inTKLCvBIyM=;
 b=hiEtih+FikobEcH5lADNpSheTeGPkWXIR9tDcpNmGt0m04qFSfVmr1ZyVBoJWVhx0P
 u+Bzegh7F2puAfe+QzuiYigefHoTCJ3SvD7M0yC1FbzP/ZSoqxas+4Nc6JTYWHpArMMv
 GD16ZF6vfvTiVhsuGZlqRqpXckFctxCCmZolq8sMnvNTIlKDlbJc+rReX6xCS729TCV+
 QCBxClyi/bSKD8yGTEFoAysOuQas9/cVU5JKw/Wn2hzLka//UMEvYhvTi5f8X/HuFzDU
 C/bqx8/4nzO4vaLPk9mJ7k61x6qGopK4uyyECYV5DvRJL613PhpYyXCLCgtuJdtiFfmJ
 aS9w==
X-Gm-Message-State: AOAM531QCd034KTMG+yMl46uQ6cWbTB0ASM+2wHuRnKjjYSrFzWCu9/S
 0kuAEMmF50aHbj5kMLd1w+6Tdg==
X-Google-Smtp-Source: ABdhPJyKqdMoVaKwl1m/KK/462LV8Fy3O8IpbsdoLwIv4WTErayiOm5Mhdhfg83ZnpquFVKB96aPbg==
X-Received: by 2002:a63:ef18:: with SMTP id u24mr9596970pgh.418.1619288470827; 
 Sat, 24 Apr 2021 11:21:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 123sm7537338pfx.180.2021.04.24.11.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:21:10 -0700 (PDT)
Subject: Re: [PATCH v2 46/48] bsd-user: style tweak: Return is not a function
 call.
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-47-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9454b967-4515-b1dd-0509-9a1fbf8388e6@linaro.org>
Date: Sat, 24 Apr 2021 11:21:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-47-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


