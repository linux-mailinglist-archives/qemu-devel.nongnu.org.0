Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E58353016
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 22:01:56 +0200 (CEST)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSPzP-0004hK-DB
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 16:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSPy5-0004Ck-35
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 16:00:33 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSPy3-0001m0-83
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 16:00:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so6601583pjb.0
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y2DSWaCw6g1v5VbgJJT4SdwfZtUUTDqeX7PknT6PoIY=;
 b=SxDbQpozsHSuRy9y5vaE84CmW6zVaXLmYeR6m2jBbYbPFLqzMe0F1/SywTP78wsqVz
 iU3GgGjsZe5gT94JOVptlDHOebeW40mWbp/X2o3b1tBVDQECaoIi5IN6rhTaekHlFC5f
 QiqBPIm9M3CtvzLif1K39lZ0OP9SSn+iVV8yfaRCQuA1XjMjep98NTW++/uHLGGMcy1M
 SF/91WjhCwbdGG7nEqnHMP9MILJlvaeU6ygvB8ptkD992SeD9VP/yvssfguhsFKbdZVf
 xUYQcaninO2HfLVSNH+muziTz0j/MNoHbsrp9z3oBt6H+Y4KqQ2yz0A+26zDUFTLtpIv
 KxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y2DSWaCw6g1v5VbgJJT4SdwfZtUUTDqeX7PknT6PoIY=;
 b=d/KhYCchGZQVGP1bORy8+rCAyE957OvwyhCOiCPuiFtPKbtM2sYv/cDHDdGANuzr8v
 Oi5M3gWGEO6RgqqWnyJT0oGeGGI/cf7Wru+MinyLYmZ7GQ96+WJocQFmZXuySX/GiUbw
 P23EdeiFpl2cKXoqWoIKF9uDpvFdd7uqY7Rl0fUGfrZv5rRG8vMR+3rQRw1fDudb0gw4
 I7ga0gWQqMvuH0tAqluU8Aimxe3b1h354MUIXhh81ne/8rmsIuJNJv9KXVM8jn/ZbYsW
 f9fcqJzfGBYjLmkeaSZVQ3XMLP9krW0PpA81qLLHrY6x0+imb20Mlhg25LFVoPQ5rRLT
 TA6w==
X-Gm-Message-State: AOAM5329/3ShRLOQIiUpZi/amfyoXpSvRwHrqIpOWBjNNDu7ToV8O1EO
 nrLj+TNwLhZZpkH4CopdQ20VwA==
X-Google-Smtp-Source: ABdhPJxBx64C3di0RcrivfVEl4wgeMAyYFE2u4SRCBpCPYEr+Cz+GOcdRgpm3McK9bAqmjNCF9u5ug==
X-Received: by 2002:a17:90b:4d05:: with SMTP id
 mw5mr15204022pjb.236.1617393629483; 
 Fri, 02 Apr 2021 13:00:29 -0700 (PDT)
Received: from [192.168.106.34]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id u25sm8918786pgk.34.2021.04.02.13.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 13:00:29 -0700 (PDT)
Subject: Re: [PATCH v2 01/21] Hexagon (target/hexagon) TCG generation cleanup
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-2-git-send-email-tsimpson@quicinc.com>
 <0cbf66d0-e306-972a-ca39-aadae2e9dc27@linaro.org>
 <BYAPR02MB48860C83CC91FDFC9D9DC06DDE7A9@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42fcb60a-b6ee-c4d0-fad0-9fcc42c27314@linaro.org>
Date: Fri, 2 Apr 2021 13:00:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48860C83CC91FDFC9D9DC06DDE7A9@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 12:42 PM, Taylor Simpson wrote:
>>> @@ -43,12 +42,17 @@ static inline void gen_log_predicated_reg_write(int
...
>> Having looked forward at patch 5, it appears this could be further improved
>> by examining ctx->regs_written.
> 
> It's not obvious how.  This is for a predicated instruction (e.g., if (p0) r2 = add(r1, r0)), so the checks need to be made at runtime.  There can be more than one predicated instruction in a packet that writes to the same register as long as only one of the predicates is true at runtime.
> 
> Am I missing something?

Whoops, no.  I misread where we were here.


r~

