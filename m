Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522651EB49
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:29:59 +0200 (CEST)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXcM-00005A-Ht
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXbJ-0007rx-Jl
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:28:53 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXbI-0001Jq-1t
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:28:53 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t13so9311325pgn.8
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=szWxphWbwZwQWrT4rezyFSO572gkw9v1c2Iqsgt7XMM=;
 b=Az0k/dpLy/b/tzkGXKMbV+FIFPi5VgNnDZ8SybvUwG8Ean4az5aUkeqh1ECyeYmRYf
 4QPb0EmEBIH5nV1iktxaJOHqff0l0vCSKoWnylmQfDbxlIS5ALQ9A3Y/MqKAjkrLyy2M
 oJpr+0WLg+tCROFgRVb/rGiT3WCYQRBh7Qo8EEre5u+CmHBAZgDk/XdKnWBOplgtD6yq
 Ep3gkoduDv973U/j2WSwbqDG6gh2ii0UIMTonnfzEHqfXLJCTZnFcAB+j++LJDJAYl3r
 d0x7REEkHBiXI75T9F1T7UBMm4SnZlKkBDfe7uIm+CaIYKzlIH7pnSYuvgHhPp6SGTKc
 y/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=szWxphWbwZwQWrT4rezyFSO572gkw9v1c2Iqsgt7XMM=;
 b=XEo3pBcV9D+GQX5juFxoU5jVJacHjxDd3ikjbAcZKNatqmo6culSAmZe7lg0OaTXhs
 QaC3vW/zN57UBGpDNSCQFYRpGxNb/013bUWjjMz8q9b47E1vmBKJ8OTMUjfH8LOQlpfF
 HdHIq0S8dQPw1yw5i1h0Tr3icx+TuG/I9LretHikX9i3mXEa99ifj2ZLiQfLBsMge71d
 fi5SFX9wqQnCR+cqSJHx4FRTRToKerhHSqHKF5KRu7flDx9Tk9NxzHgZhNKOKd0BHNf8
 R8wI64TjVtwI3mmyuxqRNUxLGIENBIecwggntaMHgK9cK9bxir/YDT716JyM5A5xDPQY
 Sutw==
X-Gm-Message-State: AOAM530Su3S3bKG4VdIy6vlWRLVlll6zn2+ZyvzgbzF9HjBGVuF5t+kV
 Zj4au2XKWl1LQ//GYgBpSYjaaQ==
X-Google-Smtp-Source: ABdhPJwa5VCzg+fAaZYkX/8Bo/X7ctFyhbKYGNX+RU8t31lVBGwRKcycQRzt0IBg66fYEIDdnyYjsw==
X-Received: by 2002:aa7:9085:0:b0:50d:35ae:271 with SMTP id
 i5-20020aa79085000000b0050d35ae0271mr9955031pfa.42.1651980530391; 
 Sat, 07 May 2022 20:28:50 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 m7-20020a1709026bc700b0015e8d4eb1f0sm4330666plt.58.2022.05.07.20.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:28:49 -0700 (PDT)
Message-ID: <3811336f-561c-42f4-b926-4ea6dfa9ce41@linaro.org>
Date: Sat, 7 May 2022 22:28:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 1/7] target/ppc: Implement xxm[tf]acc and xxsetaccz
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506121844.18969-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xxmfacc: VSX Move From Accumulator
> xxmtacc: VSX Move To Accumulator
> xxsetaccz: VSX Set Accumulator to Zero
> 
> The PowerISA 3.1 mentions that for the current version of the
> architecture, "the hardware implementation provides the effect of ACC[i]
> and VSRs 4*i to 4*i + 3 logically containing the same data" and "The
> Accumulators introduce no new logical state at this time" (page 501).
> For now it seems unnecessary to create new structures, so this patch
> just uses ACC[i] as VSRs 4*i to 4*i+3 and therefore move to and from
> accumulators are no-ops.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/cpu.h                    |  5 +++++
>   target/ppc/insn32.decode            |  9 +++++++++
>   target/ppc/translate/vsx-impl.c.inc | 31 +++++++++++++++++++++++++++++
>   3 files changed, 45 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

