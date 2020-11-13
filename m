Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46412B26C3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 22:29:51 +0100 (CET)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdgdi-0003EQ-OD
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 16:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgbI-0001BP-7c
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:27:20 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgbG-0006nI-NC
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:27:19 -0500
Received: by mail-pf1-x433.google.com with SMTP id c20so8701829pfr.8
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HchRy0qvK97I/8MArW4zQtV/25UEVbu3e2IYvDyPE0U=;
 b=ijHL2CYUEwEzHwsPTnY5LqKw5VCwK59uWlix9VVp2YiarzpvD8BUWvnV9Cbm4ssxf6
 /Eg6lg5t5WPR4uWy9Ccq2pG3lNuoEgWB3eSIc/aQQM2r/fjE+/+DOJmwHiqJBMttfxtj
 r8E8z5otgmcPMmdGgAZnEDMiCbxxHr2UAahbIMOqWg6k6ev7gTHMZiRbzU8kMl1w4+G3
 BLV1MlJiRurdDiW1cYmDkZeqjyZ1rXAuzSRLdCyhiz1RmpCsPGEPxBKaix5l9tyGb/Uw
 OqF6uDCXISeC+AydL++kQHmYB0LodEHEI2znF+Qx3sPTwnIWrloJ+NMsdtAuZGccCHvE
 I5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HchRy0qvK97I/8MArW4zQtV/25UEVbu3e2IYvDyPE0U=;
 b=MK6xKTlvAs7qz4tTQDcHiZEw132NUbtpk6suJQfonunxHIxCZzihMemAzpjtEQZFxd
 hIZEQPuizuJF48E+yf8P+qBqC/vAKNJDo+RtW6p/uP8DJNLWqphAM55mztmvdQJ4TFcT
 YoxT0ZL1GjYJ+KLcwug911U5zKUwaScN6SpijTWxbIwQRTBlVlagMzLUbVFhz/PkVMJW
 7jNoSdfYaVf4fAMp63+prUcltAXM7C8uxrKQSRKz3TV7gZgFNXUmvu4cmLiFZlxg9700
 kHBvXIehmXuSXvEK/BlapzoJWZMjLu8hyE/lJmWqaUrnShMHdB8Nv7qTz7EEm1QArdpO
 tNcw==
X-Gm-Message-State: AOAM533nYG4dDprKtZwaxzi/YJr1T3dxs/1Gwt4nT7GNbPjLCay7g51L
 If8REuwvqvbU8wZqSIhVmz2X7h9AAYu28Q==
X-Google-Smtp-Source: ABdhPJxzTv6yNi0VoZKlLZ2votgeFGVO1UIlse6/T/3x4fKeDSzpWryBDDaJ9dtpAXNpj5bxhVdV0Q==
X-Received: by 2002:a17:90a:a58e:: with SMTP id
 b14mr4773174pjq.203.1605302836936; 
 Fri, 13 Nov 2020 13:27:16 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l20sm11080443pfd.103.2020.11.13.13.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:27:16 -0800 (PST)
Subject: Re: [PATCH 10/17] target/arm: add ARMv8.4-SEL2 system registers
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-10-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41d975b4-0030-a249-32ea-057fbf66e017@linaro.org>
Date: Fri, 13 Nov 2020 13:27:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-10-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h    |  2 ++
>  target/arm/helper.c | 24 ++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

