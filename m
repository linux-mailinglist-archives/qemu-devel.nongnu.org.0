Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623D4B1B2B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:24:11 +0100 (CET)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKfR-0002Qz-Pu
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:24:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKdd-0001lL-J7
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:22:17 -0500
Received: from [2607:f8b0:4864:20::62d] (port=44995
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKdb-0005hd-EH
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:22:17 -0500
Received: by mail-pl1-x62d.google.com with SMTP id y18so3377691plb.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VuBYYI0TW5EbsluUOgY9MxzO8GEMjFDcyDtmEmy3Tmo=;
 b=yQ5tWDYahKTCji9ANOxLZ5X3UaurMMAUT3i7579niGWTJTUVDFHXR4K8iOD2r6fLTK
 DjRlLYN+GhA1MlX3iOdS0Fln71B8fGOvEpJZNU4ifhPzwuwoatkPuo1w8a0aa0KxQGsJ
 pnvThRcwFFlQsaCZUoeiCez0xahVE2sEl9YGBF6ReLoj22RFSSJDg9O4C57y9BqMusfD
 xwHTRSCcjLM8/gCHxN8DzCkEPPPjMe+ksf4njao8bAN2s99rUORzLGf5nt8XDqvXyYCo
 7LG73CUnVaXYAlJJuRFWcHJkNgVbNpcqu5e5YFTA4vqCFxxOuX7vbM63p/wNbfK0vtZY
 6fHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VuBYYI0TW5EbsluUOgY9MxzO8GEMjFDcyDtmEmy3Tmo=;
 b=WjREFQu4osc1qjmPOiZP6JxTZ0MzHJEK2GvCRUcanZTkjYLAb/aaoasM6ISWFySyYV
 m6kwsQiTRDkJYKK9ii4gx/rvFicrhdyHg1m9u/WnJ0zl/x/ushoXKqUwj7RzCw8bKGMu
 hHNwvUWxMwzZnIYVpFEvTa+/nbp2mLbgFtCQdXFvWyZFXpnAd/mMLImqKrJpyGbTFS91
 w6UR6QazMwi9QdXCTBKXyLZ1kKdVxxd4cTARdwaZ1hfN76Y8CIQeF4ZrsPDi6i5fi3qp
 OA+ncyJKk7rFpIYuBMnRdf5v5CpsTbSoHmSQKUPRyYlXYv3DaAET1piA5MxM9/GJQS7J
 GbDQ==
X-Gm-Message-State: AOAM530fLywojRqR8L38RC3YLvLD3VcU0rCDlgCRwlF5tAXpau2eHVuA
 w7qmhFQIDEjJ90POPG/q1ALoZQ==
X-Google-Smtp-Source: ABdhPJyFhTD3BIYCy18uNQyG/XOub0TesQsTRm8YPUdjiMiZHur+B1PQKFk3gSsH3xbMPkL9zMBBdA==
X-Received: by 2002:a17:902:8344:: with SMTP id
 z4mr10130014pln.12.1644542534011; 
 Thu, 10 Feb 2022 17:22:14 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y30sm4394853pfq.142.2022.02.10.17.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:22:13 -0800 (PST)
Message-ID: <048e19d0-0dc7-919e-fd46-3130f1b08111@linaro.org>
Date: Fri, 11 Feb 2022 12:21:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-12-f4bug@amsat.org>
 <83e91592-af1b-de86-83ce-a3fcf467fdf7@linaro.org>
 <SN4PR0201MB8808BEEAFCF4A89EDBB2165DDE2F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB8808BEEAFCF4A89EDBB2165DDE2F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/22 04:35, Taylor Simpson wrote:
> -#define HEXAGON_CPU_CLASS(klass) \
> -    OBJECT_CLASS_CHECK(HexagonCPUClass, (klass), TYPE_HEXAGON_CPU)
> -#define HEXAGON_CPU(obj) \
> -    OBJECT_CHECK(HexagonCPU, (obj), TYPE_HEXAGON_CPU)
> -#define HEXAGON_CPU_GET_CLASS(obj) \
> -    OBJECT_GET_CLASS(HexagonCPUClass, (obj), TYPE_HEXAGON_CPU)
> +OBJECT_DECLARE_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
>   
>   typedef struct HexagonCPUClass {
>       /*< private >*/
> 
> If that's correct, the typedef struct HexagonCPUClass should NOT change to typedef struct ArchCPU, and the typdef of ArchCPU below would stay.


This is the change you'd make with the current state of the world, yes.


> So, If I submit the above as a standalone patch, then Philippe wouldn't need to modify target/hexagon/cpu.h.  Correct?

But no, Phil would need a change, because he introduces

typedef struct ArchCPU ArchCPU;

as a generic typedef very early.  You cannot then redefine

typedef struct HexagonCPU ArchCPU;

which means that we still have to rearrange the direction of to

typedef ArchCPU HexagonCPU;

etc.  But it's definitely a smaller change (and matches all of the other targets).

I do think that the conversion to OBJECT_DECLARE_TYPE should happen first, via whichever 
tree you choose.


r~

