Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B384744017E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:52:27 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgW3D-0000ky-Mw
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgW01-0006YQ-Ig
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:49:05 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgVzz-0001Yw-Jm
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:49:04 -0400
Received: by mail-pf1-x434.google.com with SMTP id m26so9922789pff.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 10:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hm5QmnkrZIhETASbxBl/Gai4bQLddxcRZmD5lW9fOW8=;
 b=ufzdcMoSSlfMi1Wi99z5v7dy6T4eWZXtiDDNO51zfMAFKHcOZZqAd8J8qPcw1br1O2
 DkU+E3VMOlAPXH33YV8nOPg1utSXU4CaRBqgOV4S1ewT5ImdUN9ps9ZltqjPrlnjT4eN
 aNUOSAndspqr/Om+FLe9+ouIuz1B1VYWCQo7Ugc2/yS516TYm/gaVvMi7hTdM3Llo4q8
 e9HLHrwMtFF9UBFZonQRy4NaYQqvt+sFWbetm8Qn+TFue/xVScEXiWyj9z7yx8kxC8yc
 7wRrtDxdHULvsFNd9J2r3PXL4p3CwKAUnm36wtnErc1qH7k7Mw9R3RodcmEj722BSOd5
 AQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hm5QmnkrZIhETASbxBl/Gai4bQLddxcRZmD5lW9fOW8=;
 b=hIbOoehmUkMHzVyO6sz2+eVUh/fBJK444m+iQAi9/MM/hvl2h43gX+JgYHS1rcgFMo
 GP7tHDpNP+3gQPz0RtJ/yt26R83OhkSktYKaYJPlYGntsgvjk6loGU4msIgderXmOp3W
 QvuvyR5uTJiqk5iiczdQc1hHs6xpUKmL9X1yqN9Do2gl58+35ZF+ELoOFMhVXDACNIJ5
 lSwAczaOloaXARKUE+yk2Xmu3POlQwdPbDD4fsn1R/VFljJsqvh0ynv2K56+M7UqVHIO
 cCYYBCAcqYnPC0H3UtWzsHBVA6Dl3GQpLfECghNtiaR0TRmov7+5dNtbfFHotd+8h43Q
 FpAg==
X-Gm-Message-State: AOAM533b2qkxxZVFXwbSsbbJ94XstMwMnN5eIUHN+a2VsP4C2MIP3qFN
 SaCgEQ5y6GGs/+Zobq770fFHfw==
X-Google-Smtp-Source: ABdhPJxsf94gA0Y35sPz6XKmbRPTsBOdyDP/ZoyEMXc10aWhl1PvaEP4DhVDPmiw0WZNdqc01lHWxQ==
X-Received: by 2002:a05:6a00:140e:b0:444:b077:51ef with SMTP id
 l14-20020a056a00140e00b00444b07751efmr12308282pfu.61.1635529742057; 
 Fri, 29 Oct 2021 10:49:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p17sm7358895pfn.191.2021.10.29.10.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:49:01 -0700 (PDT)
Subject: Re: [PATCH 08/31] target/loongarch: Add tlb instruction support
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-9-git-send-email-yangxiaojuan@loongson.cn>
 <e2b3f726-aa78-3be8-d85f-18f3bf98e7a3@linaro.org>
 <caaeaa89-2ea3-8093-e7c4-c96ad86adf36@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a00f0283-753d-4c5d-2d93-647f5c40b573@linaro.org>
Date: Fri, 29 Oct 2021 10:48:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <caaeaa89-2ea3-8093-e7c4-c96ad86adf36@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, mark.cave-ayland@ilande.co.uk, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, gaosong@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 12:01 AM, yangxiaojuan wrote:
>>> +    env->CSR_CPUID = (cs->cpu_index & 0x1ff);
>>
>> Any reason to have a copy of cpu_index, as opposed to just using that field?  CSR_CPUID is read-only after all.
>>
> Yes, we need this value, the uefi code read this CPUID when Start slave cores.

That's not what I meant.  You could arrange for the csr read from CPUID to read from 
cs->cpu_index instead of env->CSR_CPUID.  You don't need a *separate* copy of this value.

I'm a bit concerned about the masking as well.  It would be better for hw/ to ensure that 
there are no more than 511 cpus.  Otherwise you'll have multiple cpus with identical CPUID.

>> ... we have defined interfaces for getting random numbers.
>>
>>
> Do you mean the qemu_guest_getrandom function? It gets random values that do not limit the range.
> But I need a random in a fixed range, I cannot find the  Similar interface. Thanks.

Yes, I mean qemu_guest_getrandom.

     uint32_t val;
     qemu_guest_getrandom_nofail(&val, sizeof(val));
     return val % (high - low + 1) + low;


r~

