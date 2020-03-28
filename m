Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C4196375
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 05:02:04 +0100 (CET)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jI2fb-0001BE-D0
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 00:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI2eV-0000iT-BE
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 00:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI2eU-0007zP-70
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 00:00:55 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:38848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI2eT-0007xj-Nm
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 00:00:54 -0400
Received: by mail-pj1-x1043.google.com with SMTP id m15so4621484pje.3
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 21:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tGifXQO4/H0zcg34V8Vb2pmpjIGvPelr84jztsT+B60=;
 b=Lv57QfO9lAkiVHcf1OtzpkLO851PIr5VM9WxTbOIposZKwWaClXw7NAmg58x7wOIXb
 2kSH7HVOfK4poC9UJu5bTT6uAl3QWAfs7/dgh+tEu7kOs005M09njnqnfEqgHts6GDfl
 0pdz4G5tqvlLAK30CwL+//ki8/ZdC8LSj4LoNbb4lNdJ8SIMnYrhfCt2lbV8U6hqYnEW
 Kd/S0ei2Hxisk29YRr0h5naS7l2QZF2coETTL77EyL19XGcurjAWSclGAXp9kswkR3t6
 OZwIPC+A/4/+0TeC8UWPqnSI1P6knCk7Y5Yj5Kuo/hW9cm/O8ozo7126HVGEaPk9EKky
 +t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tGifXQO4/H0zcg34V8Vb2pmpjIGvPelr84jztsT+B60=;
 b=jNEgxFX0rAZDMjiyYmNzo1LMombTIgwf209JfHLIGxYIvRgPa21gojyqGhf+PkSgii
 j5PwPPb2GtRKLlgTaUkHjSMN9n+qiGxi63Bk3MFhmReKv9EAWqU9Jw3OqmuFxIVu0e42
 ZiGk6iTi7BMnIpYZfp835CisFG9FzMMLzk2FaHP6ZsRUVMcV9ZvUX5ySEnqX7vqGoDTe
 FC/KGZyC1+enxIRtih+8N2fVJ0vogIZUR+4hXuen+nweDWGkNnggRwhjEftsQkU1N86w
 JK3sxZ1gPwzwQcC7ETK20fZsvDxpa+F4pjLt1fqDoYDMeGAZ0qfNHSnBlJCVoAUESZUY
 fzQw==
X-Gm-Message-State: ANhLgQ38FCaCt+/ln8IBvF2j429qrPt2Z5AC6tWyH1BhsTBwc+bxpgzp
 hjvCGAQngjRnK5uNYpwrtAzLuQ==
X-Google-Smtp-Source: ADFU+vsxvf0q0zDSNFL6pMGuj8/YZMCYsEmuXX2cd3uz2AKA0bFhn+QTHJLGTeM8CQb+hBYFgRm/IQ==
X-Received: by 2002:a17:90b:430f:: with SMTP id
 ih15mr2863061pjb.56.1585368052317; 
 Fri, 27 Mar 2020 21:00:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id d3sm4737984pjc.42.2020.03.27.21.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 21:00:51 -0700 (PDT)
Subject: Re: [PATCH v6 61/61] target/riscv: configure and turn on vector
 extension from command line
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-62-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9fc7975-b08f-2272-ee12-4c521f778972@linaro.org>
Date: Fri, 27 Mar 2020 21:00:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-62-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Vector extension is default off. The only way to use vector extension is
> 1. use cpu rv32 or rv64
> 2. turn on it by command line
> "-cpu rv64,x-v=true,vlen=128,elen=64,vext_spec=v0.7.1".
> 
> vlen is the vector register length, default value is 128 bit.
> elen is the max operator size in bits, default value is 64 bit.
> vext_spec is the vector specification version, default value is v0.7.1.
> These properties can be specified with other values.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
>  target/riscv/cpu.h |  2 ++
>  2 files changed, 45 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


