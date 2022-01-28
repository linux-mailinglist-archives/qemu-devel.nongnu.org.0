Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F2F49F1C2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:23:07 +0100 (CET)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHqs-0003jb-Fn
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:23:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHlQ-0006nq-0X
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:17:28 -0500
Received: from [2607:f8b0:4864:20::631] (port=44789
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHlN-0007Qc-PV
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:17:27 -0500
Received: by mail-pl1-x631.google.com with SMTP id c9so4610991plg.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GQy7nEyfk1EiUxqWXk67kWEIW4HJHuQ1lTiL+uP1GrQ=;
 b=orYpJiLzalft/BzOhQLoMrRahn85u96U/C7ewkCeJDXykz6D2Z7nnaHQUH6+pW9S+q
 r5Nk830h7P6MHw2BcISQ+xymJBBwAUbTPzp5mDF5o7kC3ZOMkjWkhmjpkYmXuix++Fvv
 tdjAkRgGD9XMH6ueNJc1ucvUvRaowjayxEHQ+VBbWQ45qxk3YJPWBGefICHlO9AjAyuy
 CDq5bjiL1LSdzbaxVVFCm7sbsjIEfqddOsFNzE/WCFv8yw03lhceyPyrKiKQJw+N0bwV
 cXnS3C1X1V8ag/A2exsrVUTM0j7L+jGeSTGZFITsoraeTHRwVZHwETymKU2BTpvD2H0A
 j0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GQy7nEyfk1EiUxqWXk67kWEIW4HJHuQ1lTiL+uP1GrQ=;
 b=LPT/jTQ9NQ1EUTR34UmSjd8oHLIFOTjhx9Ub6gIM5KMjC0P9sTAPcqnyBzANrnJNgm
 i4VVj0yxKyGlY1JHbIGQ5zHarx81qvA7452w54kdcEKwFGHWwcdVz6qh33Hr+tddPlXB
 32vEmN4HvPngpDE2dAwu/28JG4CeouOOH1DteT2IhuloD3Q0xwsloGM6ri6YA3j8Reoy
 rwhL4SrU7Nfte6fokS2R1CPfaSTAkggIcvli71Qz2humocTIl88BMRcbHzKKKpkbng1Z
 XQxo9csorPY7Yo5DmFaW2fQBqLDadFyDIJ2pkmx1N3meFs/yK95eDmsx9giySBjnN4l/
 bw4w==
X-Gm-Message-State: AOAM530OnYgHmskFwjMkgt9P0B65QGpWHzx8oisqQCjhS6U2p9PihXRu
 255HQIcR5G5i+G88o3Ird7yMgw==
X-Google-Smtp-Source: ABdhPJyOVpzFAPsW204UdjuFj04/KmS8BoFGFlDpBblNg6Mqgc2xqbGS9rt56B+JJdTAOVVrGq5DmQ==
X-Received: by 2002:a17:902:6b02:: with SMTP id
 o2mr6162912plk.56.1643339844389; 
 Thu, 27 Jan 2022 19:17:24 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id ml14sm645248pjb.10.2022.01.27.19.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:17:24 -0800 (PST)
Message-ID: <0142b4db-58af-0303-9ae6-89b8d16857c0@linaro.org>
Date: Fri, 28 Jan 2022 14:17:19 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/14] hw/intc/arm_gicv3_redist: Remove unnecessary zero
 checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> The ITS-related parts of the redistributor code make some checks for
> whether registers like GICR_PROPBASER and GICR_PENDBASER are zero.
> There is no requirement in the specification for treating zeroes in
> these address registers specially -- they contain guest physical
> addresses and it is entirely valid (if unusual) for the guest to
> choose to put the tables they address at guest physical address zero.
> We use these values only to calculate guest addresses, and attempts
> by the guest to use a bad address will be handled by the
> address_space_* functions which we use to do the loads and stores.
> 
> Remove the unnecessary checks.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

