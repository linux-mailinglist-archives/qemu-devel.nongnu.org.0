Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE941F19F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:57:04 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKuF-0005eI-7v
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKsf-0004GU-N9
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:55:26 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKsY-0008Jz-DJ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:55:24 -0400
Received: by mail-qt1-x834.google.com with SMTP id e16so9392332qts.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D8YVdP8Glehcsg2tRqe3lEccvotdF1NFAbokgTxbk9w=;
 b=L3xjnoroQfgLQU8DJ7KAm4Nta/3xe6GXkOYSPx6MggxeUYGwX+cPFij3TDnVX4Wf1Q
 Waq85NotJuLDbNZQh8Y6k2tjxOt34ogkbWuC0zh9o4RXuupoY7yxTQ+x2AckI8Eq20Md
 ex0t+SzMXvmpFt8YZ7TbpCpJZLQ8aFv7aavD0ad+EoMWg7BPDwwB2C+am4qLHHRpbB9a
 Fl5Xdl24hN96AGD63Kg8PQvvxaEHMlzKPo8ijFa74a0itKJMMkXFUbA+GkeS2a/rvtzN
 jv6B3xalajHqSJ/O0CrqxybFKKhDePhF5PaRKihXwyVc5049C0u2//aQWCjgAUdUrtXL
 4eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D8YVdP8Glehcsg2tRqe3lEccvotdF1NFAbokgTxbk9w=;
 b=glJ8fwrvjUa8L+JTuNCHLfcI6uZUA06Tb96gP38SBrNofBxM4IREEyn3PygXqi+L8p
 HVzsNSsyz1iYgRN5B+qFcQcPd/idDMXwUAs1eLYGC9cTPTt6/YwfhR4F4VRBQhEdV7YZ
 pbZiTvmC4RJ8PQdhxjSphc+MOFEKTNofbNnRDPpUkR3mRGxVbFBb/0X8LCa8JOThg1nq
 v5byhAZiWYWUxvV9l9RgNo7mIaD3KjbsMJhkgr9gCtbzXdMhHz9oG6AUd2+7WbqLd1NE
 tofPsOmVsYCRHx/Y1ZcrP+0FYs+ANjQ7ajZTezdGeux8f5c1fB02cxDVdqT9/iyQRv0N
 l/tw==
X-Gm-Message-State: AOAM5334kteifg264A8nfDdSc8e6yuZvmM2UUxba2CskreZZmslbFkeQ
 oI/ZJainT78ZSEKNUD3tOcP0HA==
X-Google-Smtp-Source: ABdhPJyF7W04pWSpPdLYZx68v8WcX2FHVIVe+TBPMElwZC8F1jv1eKsiZFE2Dw53Yg8BRyApUdpl8g==
X-Received: by 2002:ac8:41da:: with SMTP id o26mr13993831qtm.240.1633103717187; 
 Fri, 01 Oct 2021 08:55:17 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id f34sm2782253qtb.10.2021.10.01.08.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 08:55:16 -0700 (PDT)
Subject: Re: [PATCH v2] Hexagon (target/hexagon) probe the stores in a packet
 at start of commit
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1633036599-7637-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea3a113e-703c-e8b4-1bd9-45ffe79ba6a9@linaro.org>
Date: Fri, 1 Oct 2021 11:55:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633036599-7637-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/21 5:16 PM, Taylor Simpson wrote:
> +    } else if (has_store_s0 && has_store_s1) {
> +        TCGv mem_idx = tcg_const_tl(ctx->mem_idx);
> +        gen_helper_probe_pkt_scalar_store_s0(cpu_env, mem_idx);
> +        tcg_temp_free(mem_idx);
> +    }

So we're assuming that the s1 store happens first?
If so, you could expand the comment above.

Otherwise, it looks good.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

