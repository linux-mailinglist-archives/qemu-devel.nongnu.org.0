Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBF4EA34F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:54:10 +0200 (CEST)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYyFV-0004H2-4b
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:54:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYyC5-0000I8-Cm
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:50:37 -0400
Received: from [2607:f8b0:4864:20::32b] (port=38672
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYyC3-0000vd-GA
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:50:36 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so11668289oti.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KQ3m2m357VN8R7CUAG412Pvmv3x8GqapTKVjRSt+Dcs=;
 b=FVZAIRiIyiQ9cwXcczOBkYx8NaFYLou8N0bRkkOgG1oxOq6bFUpW3412x5Q+aaNhbY
 nXGS2oWq8kSXgpXRyV4DgDga92svdPaInf8Q2HsW0KJR6+ruIw8ELTEnvox4SVu6LiWO
 gfBY8YgmqM8LZFGLB9cHa9yEZ9sT6X1rPmVEoQ1thdb8DzfFCcgCbbF7s89YYfFzUMl9
 2QXfuRAh6CjinVKziYFjnHT9uWOwuR3n/8PtrF7UU4aahdyzFq6Xvp5+lacREx1i/tMa
 KqaICjfrdhkgk4V7gp7rmW177kI8pOE6qsG1eteHDye/F8CjsesH1/2np23+Pw2U3Sr8
 +9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KQ3m2m357VN8R7CUAG412Pvmv3x8GqapTKVjRSt+Dcs=;
 b=gSAgtJz+Yvs8VZV5wOQ3EBKYViLeDT8qaoRuKnERGNrkmCoDWT5+3UlSq3Fvm38cZQ
 FXbMDXPH9+pH32J2O1AgNec3dCB8mBC+ezaYL1qs6oR3ztdfEXRZoYODyMpEbtRPHtDZ
 ovaidOlNM6gzHbt15uu+852JKvzMLz0NfvQ8DJSBKwTIugL+fmq+5Ef+sL7t3qug3oMq
 LqjXY70nfPENtSsqqDoLB+nNCdz1+intmw9HNYVBSbKSyqiNotBEkWtzJz9vDEgHtEcj
 lWQbFr6BlwnpnPTR3LD+MvUD+H6jCR504tBm3GbyWfpEwqLrxQiekhFKN/c6zcys/tgy
 curA==
X-Gm-Message-State: AOAM531/m3Ni2FbHL5U2Hzn1G7zzEkdltw8P9toC4TiskgyURfWpFlGn
 CHmStIyvLTcZ92dW9TzchcslEQ==
X-Google-Smtp-Source: ABdhPJz8bDs0VRQypfcXMXgq6g4CKIrL48ygWCcWLWAkN/xexHXg/D7lhC6jRTQlb3Ai4RzhjERzwg==
X-Received: by 2002:a05:6830:25cc:b0:5c9:5fc5:32b1 with SMTP id
 d12-20020a05683025cc00b005c95fc532b1mr10994303otu.138.1648507834109; 
 Mon, 28 Mar 2022 15:50:34 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 190-20020a4a0dc7000000b003244ae0bbd5sm7626347oob.7.2022.03.28.15.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:50:33 -0700 (PDT)
Message-ID: <4e1c4d79-3772-9852-3eec-bfe15dd78647@linaro.org>
Date: Mon, 28 Mar 2022 16:50:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 09/29] target/loongarch: Add TLB instruction support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-10-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-10-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +void helper_tlbflush(CPULoongArchState *env)
> +{
> +    int i, index;
> +
> +    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
> +
> +    if (index < LOONGARCH_STLB) {
> +        /* STLB. One line per operation */
> +        for (i = 0; i < 8; i++) {
> +            int index = i * 256 + (index % 256);

Another uninitialized use Werror that you should have seen: You're shadowing the outer 
'index' variable, which means this doesn't do what you intended.


r~

