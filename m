Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646E4B221A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:36:46 +0100 (CET)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nISM9-0003CK-Im
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISHn-0007Ig-3F
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:32:15 -0500
Received: from [2607:f8b0:4864:20::42e] (port=47012
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISHi-0006GQ-6j
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:32:14 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i21so13750642pfd.13
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 01:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Eo33H3ZivFxYFb/KQxTJAJxxSCePDkPQcrLNR4d9rl0=;
 b=ms7xeN0FRMDiFw/gTmX+VCsTtD3+1LF/8m6hZqh9VkHB07iGJ0YsnQsliG10lYvaXm
 ROwiJVLIEESYxE7953hVqPIygWMgjwlxiTvD/yIZy7gmXrDRg2coDFp3xR4sIScFgY/r
 A1N3evgv9061BHE8tL+jGiu5u3bnkQfBn7m9Kax6gIELvPudndGPc+7vCrDUb2bZ7V6o
 woR/UR7W7nkVBlhJVpelTZoRHHUpbr7FPeSHw+rncetF97Aipc2hDBeZmt5VAVgsTmFn
 8UMBpL4lE97RcJwIAUDcDkTiuWdc/1Q8FL/zisq/CO+OuXYFZMWsY568eMtBstqxAHAo
 11LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Eo33H3ZivFxYFb/KQxTJAJxxSCePDkPQcrLNR4d9rl0=;
 b=Hm9Qo26DZg3Np1vOtys1KSCdTfHQdVAAqHYaVUI0GSVDt4zMbOuFSm1eC0tT7tkSOY
 XbldSYCicNS4E/Ko00XWuODT8GoV3m8UNQqB5U9tRZOvfat9Csnppbz0I5TVv6eLbHua
 nIJAzNW8pYeVus2A/fY3neilv0k4j4OMjJUct6AY3lWrMhBzheuhK/ysIL82VFDZWc9O
 BOjQ+2+DTiVHFWALvedmgzJ+wRkLCD0r0CtcHpBCqfSTOb93kAzTvVQxDc6qJ7OChDzR
 EP4NvkLcFK7f+g8Ck0YaFiYH6jV/bhXZkxs5WmMRoHxxThmrwPDj6V/o9MkRWM97W5sM
 eKqQ==
X-Gm-Message-State: AOAM532MILw97pJSFENZudVGeH4Wk0J+pIO44Woy0ocuz7ScoZgaR81h
 Q0QlrTRwLni7yCORfmJt3eo=
X-Google-Smtp-Source: ABdhPJzTvYBHi2tBhaIhOWgVgn5NnVTi2ws7IHiPvC2PF72yMXfZrYwCb8+TvB0sSNd8/kpilZQ1UA==
X-Received: by 2002:aa7:8241:: with SMTP id e1mr853096pfn.86.1644571928734;
 Fri, 11 Feb 2022 01:32:08 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id oj5sm4747433pjb.29.2022.02.11.01.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 01:32:08 -0800 (PST)
Message-ID: <eac8f043-25cc-af87-364f-ed816b96af7c@amsat.org>
Date: Fri, 11 Feb 2022 10:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 6/9] exec: Define MMUAccessType in 'exec/cpu-tlb.h' header
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-7-f4bug@amsat.org>
 <64b84847-5d18-4713-e383-a1185937addb@linaro.org>
In-Reply-To: <64b84847-5d18-4713-e383-a1185937addb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/2/22 00:14, Richard Henderson wrote:
> On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
>> To reduce the inclusion of "hw/core/cpu.h", extract
>> MMUAccessType to its own "exec/cpu-tlb.h" header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
> 
> Not keen on the name, unless you plan to put something else in there.

Not yet.

What about "exec/mmu-types.h", kinda similar to "exec/memattrs.h"?

