Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B58458A96
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:33:54 +0100 (CET)
Received: from localhost ([::1]:36858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4lt-0006bb-O8
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:33:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp4gs-0000Mh-Np
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:28:42 -0500
Received: from [2a00:1450:4864:20::433] (port=43856
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp4gq-0003jh-FW
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:28:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id t30so31059688wra.10
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 00:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=88LtnuJpVaLZyywhlZJYJ8dQSEHIE7/E51WfRMd3FVU=;
 b=XjL/UwVN6i0ol5alovCRzJ8F40AGRe+2lJSZNNucSI7k2+ElsWr8UZfGJVRaNueVTY
 Ov2s4oxQXBXIaAL85Rnaed+GzIk8u7fmMK7Wc4BxoN9PXoGNM93JcLJXUhcke+tZjzTx
 Bj2jGGc2cpnCwji2IEKmCKxifZbWuxntO50+/4Koe0z6XeKNopI/Anny16fLJAult5Fl
 3Z4/ov7XrjjE9z1aA4MO2whR7vYcsRBLeswEDtWHES5nEhPuZ0kk9dmeAVPTvAHiZWLO
 qafkWQzGy5b1QP6gBjHK36JymsP6rYC3fOXJyaZJcSCu9cQGpjuGUwTfBB2Y9F1YjgtZ
 LX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=88LtnuJpVaLZyywhlZJYJ8dQSEHIE7/E51WfRMd3FVU=;
 b=4TWA3pwT/nPux+qvt3Fq+bgUbeU5rpFMu+1Ke9ZBRz4ca8mKcEoizdHBdk+w3V2/ob
 rvl+f1aAKVhQpVFzSptpqK9cv8ZSPeuDKasC6r49YY5MrM+x/M6N0sEiIAVshFKVFLte
 +V1IBJ9kBUGf8B7iR20e6IPOUT3rHLZEC9oiPx2kTjoNDPU+jZxmsVDIqnaaa8AQFeVM
 DcnE3sI/gOdJhDag2BRG7rKDYVbwd7BkG8vf3/pTr8iZ95UA+2xi158lalQoLeb/qen1
 4lcn7P+5Kls/LmIywTeTKhhEFlUNUDb2HBEt6ztfypKwUXJ/GwqzZu/FLLxBQ3XdTLc1
 CG5w==
X-Gm-Message-State: AOAM531tWo/vfvZGFnwxqO/CEkFJnGH3oTGIaK/7SoJU5pWVFvjplMHQ
 /jXcQP6+7oFdEWpAz4PqoOULwA==
X-Google-Smtp-Source: ABdhPJwpPfWZudI7boiSp14gtCHkN1AS4wELiToLoCHGL43fRVVczTkoqBhu2DikRGQTR/k4HCK79g==
X-Received: by 2002:a5d:47c9:: with SMTP id o9mr20463636wrc.348.1637569718778; 
 Mon, 22 Nov 2021 00:28:38 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id l15sm8258988wme.47.2021.11.22.00.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 00:28:38 -0800 (PST)
Subject: Re: [PATCH v11 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: gaosong <gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-5-git-send-email-gaosong@loongson.cn>
 <6ccd9c56-9db6-7a40-d59c-22bf3fc2f6b0@linaro.org>
 <b6259138-0f0d-c0dd-c4ed-632f76e507fb@loongson.cn>
 <e7b647bf-bb0d-66e0-ca9f-f96eb2a2550c@linaro.org>
 <7f2407f6-c9d4-96bf-eff2-f0fc36932da3@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c97d4d68-8e3b-6c9c-02f1-0029052f0d8c@linaro.org>
Date: Mon, 22 Nov 2021 09:28:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7f2407f6-c9d4-96bf-eff2-f0fc36932da3@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 9:23 AM, gaosong wrote:
> On 2021/11/20 下午4:56, Richard Henderson wrote:
>> On 11/20/21 9:52 AM, gaosong wrote:
>>> You're right, gen_set_gpr not need EXT_NONE at all, and we need not condition around 
>>> gen_set_gpr.
>>> I think that if we know the dst_ext is EXT_NONE, we do't need gen_set_gpr.
>>
>> But that assumes that gpr_dst did not return a temporary.
>> I think it's cleaner to assume that gen_set_gpr is needed.
>>
> Does this mean that we gen_set_gpr where used gpr_dst, and gen_set_gpr need EXT_NONE?
> Such as gpr_dst in trans_atomic.c.inc/trans_memory.c.inc, should we need gen_set_gpr?

Yes.


r~

