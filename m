Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4A749DB39
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:11:04 +0100 (CET)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCyvu-00031O-QV
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:11:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyQI-0006EC-MK
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:38:45 -0500
Received: from [2607:f8b0:4864:20::102b] (port=43856
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyQF-0006FN-O9
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:38:21 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so1962796pja.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rURQZaEMcRavOz3xwgn1RmSnug5waeeQz/68QLBzpxk=;
 b=fHszrqIfWLeU8TospGK6fRSdBoYBJQ5lUhuYt/gjIa3Ll0ji46Bd8fQNGfM7ddkQyo
 2EV/A5xa0B9KOTA0pTJ+Qf6kIn0QLVXhKBYHLr0teHNHIlYA4fgIeolmDhxZq5ihbCqC
 ji6iOy0tw1nlvEQzVSdtvbMyHeCsZqTSEoPgPH+ZD3pJNb0E9IBjewko1w7PAIoJvc6q
 RQwgiKsNMQEx4RwWXfB9HFsnEe2DTx/tYmWyzMOfJUIeCPZOnkdU//c5I8hY6l0oaeDX
 Iizwx8btRK5/Cx8yYgdFnxY/StHbpiy7POs6G5+JOkARQONq58r5J18lBT1C7K/PEjZN
 FXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rURQZaEMcRavOz3xwgn1RmSnug5waeeQz/68QLBzpxk=;
 b=EhvDOTZv72fhooAWot0UngKNxy7I0e7fjOquGIXAzoRq9wTj/+caIOcj/Lk6drpAOq
 CrcOa36w3JffeCBBhhzAm+wIzNk8gBYqZo5/3A2g2LJ3DKy9ljXT4xWT9O9iNeNZVrlz
 pwj901gLJUs/w6UfR3bvyRjT5vt4odap2ux9SXozQVWZfy/NCLtqyDN1tXtFqURst+9L
 M7Iv+0vuXDMGdxfDKv2sY9wMlnCZnhs5MPDeQ0Cg1dnKPktFoIVFgwHJY4Klu+cj2+m3
 FHjVq7n3UMpz5IgyLTrtYLImHRw9WXTsgNasHOe656QPzegbf8Txkka2nigv4n+YSOXi
 FNHw==
X-Gm-Message-State: AOAM5301wNtltQeF8tKaftQcRPYY350dZlUFYUdqvSf99CV2+rSjPvhH
 8uD0t2xiH4zqmrgnQ7F5LgHHFw==
X-Google-Smtp-Source: ABdhPJzVkw7uK1M9mCIo3cW/IIdXofG22yEvOxGkTfmZYA+YxBJNazWLKD7Q5ZZA6INf4nrxffvzxg==
X-Received: by 2002:a17:90a:db90:: with SMTP id
 h16mr12377131pjv.66.1643265491863; 
 Wed, 26 Jan 2022 22:38:11 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id s12sm3904996pfd.112.2022.01.26.22.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 22:38:11 -0800 (PST)
Message-ID: <ab4db8d6-0401-dc61-06d5-77a8c81670c8@linaro.org>
Date: Thu, 27 Jan 2022 17:38:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 18/40] bsd-user/signal.c: Add si_type argument to
 queue_signal
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-19-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Mirror the linux-user practice and add a si_type argument to queue
> signal. This will be transported as the upper 8 bits in the si_type
> element of siginfo so that we know what bits of the structure are valid
> and so we can properly implement host_to_target_siginfo_noswap and
> tswap_siginfo. Adapt the one caller of queue_signal to the new
> interface.  Use all the same names as Linux (except _RT which we don't
> treat differently, unlike Linux), though some are unused. Place this
> into signal-common.h since that's a better place given bsd-user's
> structure. Move prototype of queue_signal to signal-common.h to mirror
> linux-user's location.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal-common.h | 26 +++++++++++++++++++++++++-
>   bsd-user/signal.c        |  5 +++--
>   2 files changed, 28 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

