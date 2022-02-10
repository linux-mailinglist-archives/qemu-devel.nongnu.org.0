Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF14B1950
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:18:37 +0100 (CET)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIhw-0001Dl-5s
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIId2-0006I0-O4
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:13:32 -0500
Received: from [2607:f8b0:4864:20::102a] (port=52145
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIId1-0002Rf-8w
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:13:32 -0500
Received: by mail-pj1-x102a.google.com with SMTP id y9so6540950pjf.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BdV0p4hdIdK+u4Qk3zkoP3VfC9oQg4dbxD2/kAsnZuw=;
 b=sZ2lLkC54a/WNNB33+I/sYPDjqJwyDVm6dIEybifUdrUBogNLPoD5dMVbSB/7k6WDl
 jBH6sWIn14bjgrKPJ1j1cWO7TQYiocymUXFhl4kswtU9Xvxo+mSR0NRmUFIb3VsTMNNI
 EHYcSv5ntyKsPsUbDyvYfmLVJII/svrrRSZNqk4Y9Ha5O3W27XTyrvz9mOmLKbsjsHtx
 B/saGOJWKGxlOBGH91KqMrW2px/xMHVsVS+3vdXa/mrQtKWzuWqzAQTpW0ZrdpMxUVxB
 aZuGqkoR1z4g89EpFUz+mmQurdp+gMjgY20JxgqMG90TmBQ8U+tDIK9b66feIkVROxQd
 bMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BdV0p4hdIdK+u4Qk3zkoP3VfC9oQg4dbxD2/kAsnZuw=;
 b=o3xjKBpKaZew7P1wHhuF72o6iKn0+Pj3gmblE7PicP7V9qYnQ4N4XpMQ7L5nHH59JP
 KkiBiIVAh9Y3+SEhl89Eo8miQnMn1jc+CA/+ZOJfUp8sR6PJTv2b2W3M6KDpcqRmcLh1
 zzLBlqKA9JgggxPamUw64WcvoluqrrtIx+aeqzniCumCbNgwvLWAi+pbcY1rezU5ilvc
 dQXkNjAkvEo3GB11KieFA6CWOToAAfkY0sLzsrL4UOtBdvi4JIAwRaAUJE3Qkf8m8huQ
 Jxi1qD0Obw7qVgeqNKhjrCQ6pXDX/UtDNMPSMhcKo0Clzj2TwHEe6qSn8W4+91EFm0qM
 2Eug==
X-Gm-Message-State: AOAM533dN2/AMgNKl9l7BnLUKWs2L9R7nkMj0mXd//9WE+wfpSOiwLwW
 qQWLBZY2AJ3JLgR4t3eoSBkiTw==
X-Google-Smtp-Source: ABdhPJzdW3p3MLmicO6qPO03ACZyTYMIx5kfew7+g00IKtY40qUpANphf7eQZqITA6D7DqtyRDmgrg==
X-Received: by 2002:a17:90b:4c8e:: with SMTP id
 my14mr5217682pjb.243.1644534809942; 
 Thu, 10 Feb 2022 15:13:29 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id f12sm25877916pfj.37.2022.02.10.15.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:13:29 -0800 (PST)
Message-ID: <e1fe54bb-6a2b-e8d8-5fed-dc80893a7bde@linaro.org>
Date: Fri, 11 Feb 2022 10:13:24 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/9] linux-user/cpu_loop: Add missing 'exec/cpu-all.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209230030.93987-6-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
> env_cpu() is declared in "exec/cpu-all.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/cpu_loop-common.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

