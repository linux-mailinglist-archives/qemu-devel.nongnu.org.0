Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7BA354361
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:20:28 +0200 (CEST)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTR1f-0001oe-Rd
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQxL-0006RO-IB
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 11:16:00 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQxG-0001B9-Ol
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 11:15:59 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so7991997pjb.4
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 08:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mZEs4tSQPamJhbgW31vFNoCTY2NVA38obnapLMRs08A=;
 b=AAnd7PCUJ8en1rTdEDx1pHall0ZLyAXO4CpR4aXnbskmofWYDoX1cIC7+DikWw+8Mw
 HmGjyQiH4K5nAzrN4NGVOLYxZQwR5hCVBtxQPVQ1VQmivlSh8hfFzNPCHcgw2BFDp1v+
 0i+EApWnX81vtuH2YU7OtMOWewhfouvsNmRcHIFZ/Vd+/KuPMDqy/lMdbSHtotkqKcfX
 NmHFLPAD5ZB2ooxYvoJ0mmUJNUSPfngdedtcnrtARuWbtfyYlhBfYt8643n0InXEtDcx
 Rrow8pN8ZPrLv3MT0qrEsuqE4OrsnTfHFzYEs01RzUuUvbA4AHBvuiCnLPKiXCe9lUrM
 +UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mZEs4tSQPamJhbgW31vFNoCTY2NVA38obnapLMRs08A=;
 b=i/1dI8cSNV2px/OoIuf0KR71yx/fvCGjhNa8s01hX3FwQREXoMl9Zx6L7+tZVus552
 40KI+Yn8yaFzdM5UCZbmoBLfQNmFreVowoF6Hv0N4JHmKmizsNUfpz/2AuaZzhtj33mp
 XlE5n7XFgKWNXWR4VF4K9tHUCoVgOtKWmxXWxx4eTl8d6mQWX0WBtpSJRLg6/CP9Tept
 G6FmXUvE+Rc/PdZ8QlabQzOetmGRzEPRYpPT0PYGGSJSy7hyDKZXfKAh00i10gOwIJsi
 trEl9jekzIdhWh7eRDN/DnNOvGFphOHoj6l9Uu6bzeq8Ofh9aXspB4zBoZej4Nl/3hdY
 zo7g==
X-Gm-Message-State: AOAM531/i5ELojfh2oNHjDHTqmgaMpBw4mHtW43ZWuak1CgX+PAUeQmo
 YyQPB4YbwfbrS2psD2BTnOZRBA==
X-Google-Smtp-Source: ABdhPJyu3u1h6oJ2WopUfpZCHDbXqaDHVIMji45Q0L0rkptYtkSXmevSzK/50HrRxgRkFCUm99Gq/w==
X-Received: by 2002:a17:902:6ac3:b029:e6:c6a3:a697 with SMTP id
 i3-20020a1709026ac3b02900e6c6a3a697mr25148536plt.2.1617635753278; 
 Mon, 05 Apr 2021 08:15:53 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id l18sm8851804pjq.33.2021.04.05.08.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 08:15:52 -0700 (PDT)
Subject: Re: [PATCH v1 7/8] target/riscv: Remove an unused CASE_OP_32_64 macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <aebf46ff114a04335f26cf7a2aae83be66dd5b42.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cd5c386-a7ed-71e1-6d77-9aba47d4b9da@linaro.org>
Date: Mon, 5 Apr 2021 08:15:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <aebf46ff114a04335f26cf7a2aae83be66dd5b42.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 1:02 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/translate.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


