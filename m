Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3F81873B0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 20:56:31 +0100 (CET)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDvqg-0008Aj-Gc
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 15:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDvpb-0007VN-4n
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 15:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDvpa-0004Oc-5i
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 15:55:23 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:35313)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDvpZ-0004F7-Uu
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 15:55:22 -0400
Received: by mail-pj1-x1044.google.com with SMTP id mq3so9260692pjb.0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ov5h57WO5/+zhyBMPAFbc1OhO1yQRqCkUshvDOAUP7s=;
 b=r4ux9rXEn528yNo+tnFiuAEEcyAyUcAuWVSrlsR5KXwYPGjy9WVtwJXvMq9iSDTqhX
 GFwsZmtH677CVkv8ibaHzvr+GbTJ6ZT0Gb2++YP906Lg66cc1K5vUdJkbY6smfNteEFp
 U3Fi288zwkXDqzeAuc7Kvj6h5oQUBA/ppcT5f/cSWVpFzPBUkH39YqDmKypUGVVFDPQf
 z2crm4ba6pF/Dvu/mVQfK90ayT/UxGgKMFH7vwkm1IwYM7z+THVntecWhUDTWXc54WTS
 JvbSJMNWQ2jfm7TvUirNuKO0GNrwVbIZVa2ZlQ0Wv83aSTpY/wereBLXWd6TYHDqvT2h
 gKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ov5h57WO5/+zhyBMPAFbc1OhO1yQRqCkUshvDOAUP7s=;
 b=sKkNuVEQHpV1r4zBniZMU0DaoAp2S40ZA7DCwP1HGVLIBmWus17F9AXLdBZoFJHD2k
 r93KbhtXaPcWtiiHu6NLTnB20r6mddMufsHDFDZbMzBpzNkNgjR5dRjxd41imI2+PSOU
 rXXZnadGOaGumnJR8Ipbi4h2TOtwUvHPsBf431mVV5D7BjAgR9sPO9r77Vc051EtNFiQ
 uAYxWWPlbLzZ3o2Ub86u2XWRJGp+nJ6yhD0nzbqka6t/vnciEjHxct2vRamU9Jynipav
 h0OT2A8rpNFhefUvnvtfHboN/Qokr2ToI29oMXxAioAtWhFlof8jR8UUhnZfNIgDPY26
 TdJw==
X-Gm-Message-State: ANhLgQ1RUgUIjys/lqZhKdDkhiLfXq27srACWcT1IgrwlXY5aUzW0nuv
 WS+7J+DJZ3iS1S+J8Tb+Dd4Idg==
X-Google-Smtp-Source: ADFU+vvyvrLaxbAe3TneK14pPHxfqzUe+6HvE8zB/G2jcYM7gSkCqhbHZm3HzszRYNwHHWJ/fR3dug==
X-Received: by 2002:a17:90a:f50b:: with SMTP id
 cs11mr1202297pjb.145.1584388520824; 
 Mon, 16 Mar 2020 12:55:20 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 s98sm533513pjb.46.2020.03.16.12.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 12:55:20 -0700 (PDT)
Subject: Re: [PATCH v3 13/19] target/arm: Restrict ARMv7 R-profile cpus to TCG
 accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57b35f0e-cf20-14fd-7a05-82242fb84c35@linaro.org>
Date: Mon, 16 Mar 2020 12:55:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> +static void arm_v7r_cpu_register_types(void)
> +{
> +    const ARMCPUInfo *info = arm_v7r_cpus;
> +
> +    while (info->name) {
> +        arm_cpu_register(info);
> +        info++;
> +    }
> +}

Likewise wrt ARRAY_SIZE, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

