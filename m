Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B96949BD3E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 21:36:40 +0100 (CET)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCSYQ-0001Uy-Vq
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 15:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCSVI-0007oW-7g
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 15:33:24 -0500
Received: from [2607:f8b0:4864:20::62d] (port=39672
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCSVG-0002yS-A0
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 15:33:23 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x11so14690517plg.6
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 12:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0kbzPFkyqyAxBthUgOscSfQA8F7WfmaNB8gPEls3RRE=;
 b=Fsvcm8PGj1fzZTdU7Vmg7IYhBYrzse9XRx+uAEQ8nKFPJyiUAeIKGadGp60ixgIgDe
 im9AiVaqAOeI6Vh+AAFdTiqFF1z76UhtdGphyjr2ogiGqkTVdK8v2kbQZT5v4CMf6xH+
 QBHQSd/JDrtgY+WiuZLm1hb881gHBxIMtjz2/kE8v/Q+LS9WQ3Fi7J+5a/+ovFZCrXds
 TBVo8gtOjBBpsF8LuLPuLpwwMOm8Qg00o7RpOSBlKHI8hd+ney4pFt6rc180U3J3QQS4
 DHGepYsJyk/I0qOkGQxlZ1Yb7/gHDjKEfl8W8Bb1zobqQsTRTGXqb9jibK4Tk7L9y5+L
 +DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0kbzPFkyqyAxBthUgOscSfQA8F7WfmaNB8gPEls3RRE=;
 b=z/LUcRC1V0TPNDaHG7TD3pU9poDGMVjIPitT33CaGO2vb/thugxIV4skoeR8gFaE5c
 HWj5ojxTZYFcaOLER/AoFo5WWkdmzcmpTfg+5+ow1OSGV2oFA8VZZ0NVC5h/I2UZQ+KE
 jmeCxlJI4rUED6E6yxAUJt4jbMiQcWNopcI8fShfRXwm7OzWb0yT0DnVG4RGZ/Y5t/Ea
 Zze18YB+Hkf7CyZdHZUBF+4RmsaDGoioNN4udziRNiGEkpUBVqX7Hf1Sy8BnFr8mMxfn
 MQxipwYwe632G5Uc8GBOpSJ+wfpdwjPfFXGu1csbNA3IrG7OvM9nAn0j14NMiY6ZLWp2
 gawg==
X-Gm-Message-State: AOAM530CUicrIKo/sEopz80A8d2qEZyFrl2ecbBjDmR71B96kVao2Me9
 TKpPUUcMqvvwGTYPUu6eboM=
X-Google-Smtp-Source: ABdhPJyh/opMGjM9yRLuaFFGewSYf0D4aO3uHivVm0w5Dd8ObDuAmpI45YRs1Ww3s+TNxuhUzmxKng==
X-Received: by 2002:a17:90b:4f84:: with SMTP id
 qe4mr5232286pjb.209.1643142800948; 
 Tue, 25 Jan 2022 12:33:20 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h9sm9010430pfe.101.2022.01.25.12.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 12:33:20 -0800 (PST)
Message-ID: <b9155b07-b7fa-f442-13db-53d65442745e@amsat.org>
Date: Tue, 25 Jan 2022 21:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] cpuid: use unsigned for max cpuid
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <20220125192232.99101-1-mst@redhat.com>
In-Reply-To: <20220125192232.99101-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 25/1/22 20:24, Michael S. Tsirkin wrote:
> __get_cpuid_max returns an unsigned value.
> For consistency, store the result in an unsigned variable.
> 
> Found by running ./configure --extra-cflags=-Wconversion
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Richard, if appropriate pls queue this.
> Thanks!
> 
>   configure                 | 2 +-
>   util/bufferiszero.c       | 2 +-
>   tcg/i386/tcg-target.c.inc | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

