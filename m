Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CF4A7A23
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 22:21:26 +0100 (CET)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFN49-0004u3-8i
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 16:21:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFN1M-0003jE-84
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:18:32 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37479
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFN1I-0007V2-Cl
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:18:31 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so8040566pju.2
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 13:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KPjoAuIHgpRFNPC1FBrX0D2EYcqa2vADIu71GbGLf5s=;
 b=qMhdU1cRCKrxAtBv1vgtGVPqvAzB2RnKPudvbeXFc7aUM/dfj7jRTaRdiSBcZiDDIb
 5Rk+bj9VSjKvcEVHipus1KDbls8pz6zd5MxMdkrjN9fzC/xsttkdGPoZfhrrI4PM3CWm
 ouo1HMbEIZ6XE8Su5VarLmqZT/8TldPPi4d5pwbt99J0iLSnxngkSd/zSsIzCh/No967
 IQm6Y9rR2u291E/30nCLtlyrYNTaILnrVoM5fjUDWFnxxNJr1s+0LEPNBOL2m4crkvrL
 TWuUYNgw3ocXnd/CKe43rKqDEeCDgGfBPWsd10o4zgw7PN/m/j94SZiAnx+GgGOML9Zi
 Cfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KPjoAuIHgpRFNPC1FBrX0D2EYcqa2vADIu71GbGLf5s=;
 b=IJGhRENCJ/1wHes/NKkmNgAhGJjwYL6vzhONBiCZ5hcVt1ViDxIQlL83H22DKJU8cZ
 +g+Zqen2UjNLLd4lkvVbYbXfYthyxyhHC7vNIEUpuWDH+kMmYvMzKjZGabAAciQm0h5Q
 BUW2y7+7vh+Lat9eH/wE0oi35H4yFJYrYQvOfoSYXsl3i7W4nXb2QqeO8RC6KTNky49b
 X1njCuFOqhg92RmGQZNsTuSiFrjMnUa2OUdDfkJ3OL48xGaM+o6RBUe/mWAAb72cw56Y
 VaTPdfmoOWErxTALt/FVhukDYfnxLTxOtWZv8ZopTzIvIA/5kCFv2JKb7YK6C942xOQx
 ePqw==
X-Gm-Message-State: AOAM53276zCyhgXsJrp4QaC1YA6AvA45iTJpNXFY17yRvsrjjtoSZ10q
 2bUN5NcqsLTRpuEf8VovoAIsKg==
X-Google-Smtp-Source: ABdhPJzwhYgbLxOAMglA5jafiACAqlRz9IQbyakACrgrQgOnUxUVX4pyT0GS52X89tQo/IS+zVlkyA==
X-Received: by 2002:a17:90b:3b42:: with SMTP id
 ot2mr10155426pjb.204.1643836706904; 
 Wed, 02 Feb 2022 13:18:26 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:420b:54a2:470e:6ebd?
 ([2001:8003:3a49:fd00:420b:54a2:470e:6ebd])
 by smtp.gmail.com with ESMTPSA id ne23sm4000424pjb.57.2022.02.02.13.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 13:18:25 -0800 (PST)
Message-ID: <be64d2d6-b80f-704c-933d-e998c8096fd4@linaro.org>
Date: Thu, 3 Feb 2022 08:18:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 4/4] tests/tcg: add vectorised sha512 versions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <20220202191242.652607-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202191242.652607-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, David Hildenbrand <david@redhat.com>, f4bug@amsat.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 06:12, Alex Bennée wrote:
> This builds vectorised versions of sha512 to exercise the vector code:
> 
>    - aarch64 (sve and sve2)

Again, I think you want to test advsimd as well.

>    - i385 (SSE)

s/5/6/.
Here, might as well enable as much as we can: -msse4.
Oh, I see, the pshufb comment later.  Ug.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

