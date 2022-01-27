Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC9549DAB9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 07:32:10 +0100 (CET)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCyKF-00016D-Ti
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 01:32:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyG8-0007gA-M6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:27:52 -0500
Received: from [2607:f8b0:4864:20::62b] (port=36650
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyG7-0004pm-1h
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:27:52 -0500
Received: by mail-pl1-x62b.google.com with SMTP id b15so1670025plg.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bu+7Nt1FTKucSasdPc0BYvoas/K7wVBlbsxiKZzezuM=;
 b=l4KvJ2APLDiL3wviG+xM5xUY0qQTnGhS0ikSl6bWeZSw9mBzvW9hKH8TaFxW69IrmH
 f4LGQHqu2OqoeJx9D9+XERv4Q/PCWQPpFXBW/23gJ3r0BkU791BaZY5DkdWR1Ym63uvr
 OZYlY1684UR5aLql+2E02cWbgZRSEoNn5n+wA4c3J3Dht4J/MW8U6crXtohEbi+9zt6b
 6rjoyeYCax9bpWdjWtzOQsVzhmbwdMqVIqXplprFvVFoWHqd1SWsav5gm5ogoNQRTXDK
 yJuSYPoJc/q6dyV/HA8+WOEj3F5HmDcRXBB3XckRPtNToDCPxcj0h72TgxwJqQLR4jxv
 d7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bu+7Nt1FTKucSasdPc0BYvoas/K7wVBlbsxiKZzezuM=;
 b=o4+9ZYPVEeVZXPUYjAsKsDQ40tWhnYaNWLQ+Nwfn9VinUDXXbMuBz0TgMiPbcdv7+4
 l2y5Yuu6qFDKFANcU03Mnusxo8DPqpsLiKeQ+wtX/yMZyEvPQ6vuExNNr9T5TGQxoD+K
 Ndzj1rwFsIRUabpQGRAGTTMHkLO+KOsV0VC6LIxGSdlpm426h/Pfxu+5ikeHk3R7fSr4
 sAyL55zfo/4YVcA5LqGtb0DMwcWQZW/p7gi4W0sxVxJo9HCKlSPEsbfJ0cP1sthfVM6d
 aZAMrNd1Gr2JYbeF5MCWUQs5whFUdc77KVJJbMBRaAKdaFFWq9n72hbg1YLrzM99wJ+1
 tXbA==
X-Gm-Message-State: AOAM5321Ht2lImB72WpmMFIqTGBdIW0Jq3xIRjL5S416uMomqw+5FlQO
 ffU+UX4riCT5uMS1Cz9Mm1pvDA==
X-Google-Smtp-Source: ABdhPJwguvXnQI3p8ijzSgcpgB9jcwKuPqkMUxZIJwHUlYzhvzo+VCEFVDVhYi+4LlMi2vdP5kQRTQ==
X-Received: by 2002:a17:902:ab53:: with SMTP id
 ij19mr2023604plb.45.1643264869357; 
 Wed, 26 Jan 2022 22:27:49 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id lx4sm1349588pjb.44.2022.01.26.22.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 22:27:48 -0800 (PST)
Message-ID: <8d876840-8743-0e8b-c477-ca8a6e067d8c@linaro.org>
Date: Thu, 27 Jan 2022 17:27:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/40] bsd-user/arm/target_arch_cpu.h: Use
 force_sig_fault for EXCP_UDEF
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-15-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
> +        case EXCP_NOCP:
> +        case EXCP_INVSTATE:
> +            /*
> +             * See arm/arm/undefined.c undefinedinstruction();
> +             *
> +             * A number of details aren't emulated (they likely don't matter):
> +             * o Misaligned PC generates ILL_ILLADR

As I mentioned, misaligned pc will not come here for qemu.
In the Arm ARM, see aarch32/functions/registers/BXWritePC:

// For branches to an unaligned PC counter in A32 state, the processor takes the branch
// and does one of:
// * Forces the address to be aligned
// * Leaves the PC unaligned, meaning the target generates a PC Alignment fault.

The hardware will either refuse to allow bit 1 to be set when bit 0 is clear, OR it will 
generate a PREFETCH_DATA_ABORT for Alignment.

QEMU will do the latter.


Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

