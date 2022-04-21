Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E5A50A5F4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:38:38 +0200 (CEST)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZpE-0002Fz-H3
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhZDM-0003pN-HQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:59:28 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhZDK-0004QR-VI
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:59:28 -0400
Received: by mail-pf1-x431.google.com with SMTP id j6so3070335pfe.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5EAA4xnIStuiQPjfPf7pAQ3nfvqw4Z1dm9ea87z3Ux0=;
 b=lWoGsaS27agKDoIxcdPnZXUeD89yn/unjmt7vP+HhFeHoDB6VOe8VNkEA+TnMrN5KD
 PvCSRv77zYPxu2SdtrH+Vuxe2vcPk7RHFmPMJi1eLO1KLPfG5XEzIVU2hRhtyjtiEf8Y
 Va3Y3oy3//K8TKSoQhMIPuFXAZQPAmw7sPPHO4ktfjw9npq9YSbj6RnhKA4i2AaWQvct
 PJmHGqaNRULvYV0NFA/CniZDGkZ2eAkzLZ+Q8n8BGyoaj6Y79cTe29BoQwS+qiVczuOn
 pk2EOh8xOXvyUe8S+eRBr6VPh8Pl2Vo7x2hS3SruXz/on4Ku/Xi0NxgZZqWuP/NTlxhV
 rCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5EAA4xnIStuiQPjfPf7pAQ3nfvqw4Z1dm9ea87z3Ux0=;
 b=u/vjlfc4//YqseipMv5/bd5w99xvd/3RhrKGJ4msd9EygQKjeBKRVKsoGwzmVl0f8y
 ll76fimx12W7z64vhNZoqESjbBXllU9luDzVZxFCvprh+g6cllLW8yzNTXVvElzTn7MV
 Hphala7mBKuRCMki+QziT7YVSFzDZfvDnaSzkdSrBykvhabFISKUNegZyM3gqtpQ/df6
 QFT5Dbsi6EWi2jyheJTI0Hpo0n5NBwEMOTJRvtF+srMMzyb02imtBc70XLJAM5wjYkKa
 Dky+N9FRestw3cKJnPnvh4CmNAW7ZkvrwZQn48FCJkTu992FuFNEmCTHSzLQ0FgV/y9l
 AAZQ==
X-Gm-Message-State: AOAM531haJoV5g9uYxa1YkdHQfgafQFnfHgopqhR2z+n1Azb+5BBfFqj
 JslgYEyeMMa9P36E/SVeb7HVTw==
X-Google-Smtp-Source: ABdhPJwzTFIoOCArGCxf2i8WbXSuTdrStaPmzwGgo/2EOkkNPAx6aW75bymVBpdkZajtsYWiYEu13A==
X-Received: by 2002:a63:fb56:0:b0:3aa:cec:6b6f with SMTP id
 w22-20020a63fb56000000b003aa0cec6b6fmr87231pgj.409.1650556765504; 
 Thu, 21 Apr 2022 08:59:25 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18?
 ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a630e0f000000b003a408836badsm17943635pgl.45.2022.04.21.08.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:59:24 -0700 (PDT)
Message-ID: <e256a05b-c4f5-261f-441e-05d2919b9492@linaro.org>
Date: Thu, 21 Apr 2022 08:59:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 25/43] target/loongarch: Add LoongArch CSR instruction
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
 <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
 <8193af0c-4ba3-3154-45a5-de8fefa0ddad@loongson.cn>
 <a9c3e36b-4c94-a9d3-52d7-a88bc4734db9@linaro.org>
 <84439ddd-c701-4750-3113-1a1ab15740b6@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <84439ddd-c701-4750-3113-1a1ab15740b6@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 02:15, yangxiaojuan wrote:
> 
> On 2022/4/20 上午1:05, Richard Henderson wrote:
>> You'd use a store, just like you were already doing in trans_csrwr.
>>
>> But here's how I'd improve this.  For avoidance of doubt, all of this would go in 
>> trans_priviledged.c.inc -- there's no use of csr_offsets[] outside of that file.
> 
> Thanks you very much,  I had tested this with bios,  it worked well, and I have two 
> questions.
> 
> 1. CSRFL_IO,   how to use it.   I don't understand  CPUState options 'can_do_Io',

Whenever a cpu touches a device, like a timer or clock, must have io flag set.  Missing 
this flag should result in assertion failures when running with -icount.

> 2./* fall through */,   this may have warning,  should we care about this?

It should not have a warning, as the comment itself should suppress that.  For more 
complex cases we also have QEMU_FALLTHROUGH.


r~

