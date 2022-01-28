Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A649F1E6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:34:35 +0100 (CET)
Received: from localhost ([::1]:42874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDI1y-0000nC-Pm
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:34:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDI0E-0007eY-OA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:32:47 -0500
Received: from [2607:f8b0:4864:20::429] (port=39794
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDI0D-000119-4D
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:32:46 -0500
Received: by mail-pf1-x429.google.com with SMTP id a8so4903327pfa.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HSjJFbQbLc5yNE8+vDgwiD9bgfphfoTCCRrfsIEn0rY=;
 b=kQgIxxTDGvl+FwgqCSNZ10arm93+xfFac+ET7D8zo3+GfAonPMtxZ+0DWXy39b+krl
 jIRp7+qPNeGVYFlujzoNtXHF02IvdExN8hKL+M1/MQs8Ez4srs4JCIi27S/6z3/dvbNq
 QctG7JCviX2RZMqKXZSXAjIpkwtPS3MqWIrK7TH4t/ukZeCfi2gTl46+62R+1id2LIwg
 qOWzPR6By0NEiYMIYmeuyymT64rxVR9mYCOM4B4wdkuy7r2WrQcMWXI9t+8z/apBdaSn
 6UR6lmVU6qR1OQo74dpRFjrWk31mrUJxXU1o/Qvbf2S54Ul7jwiF0bsNfNkmBPy7Mrnw
 pT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HSjJFbQbLc5yNE8+vDgwiD9bgfphfoTCCRrfsIEn0rY=;
 b=0u0pjaLsth/z/6j4Xig/olanzyTUbcRODsCrTRyKUyZnEJKFU09KV64qgPr+shX1XM
 QyMZDv/JYkl+AKFmCGjlcI8Q5QLGrsC9DrYttVQgFbuGwR3d0YDouMtnGxkGbjjQ46zz
 AR57UTj0YkTE9ZJYJ/ifOt7wGDl9f7Kf6JhcDhXVMg/+kKMJDvjMUFnS4S6RYRMtcwM4
 qV1oFTMGkyXzRnFm9cBCAt3BpMttmhgyaCzJRZnmCTbKw6cUFoZgkfNzQHJL+vfjTTqa
 hl+KMwxicoryYKKomcf1eryUuq/yTeJv5GOQfQ9slhEEQ/2Y9NCQ1iHfbRrE/poeLWdH
 GL+Q==
X-Gm-Message-State: AOAM531050mYNoSreffOyqn2MZMGS8WQYdN7Btu9Wirv8mKADv/2QuxS
 nTNcUrkDoca/Pg+p0kCTjy1vwg==
X-Google-Smtp-Source: ABdhPJxfAo9AkiIpAP0GEiaE68xKTwvSxb3yjGaBYsI8BEQN24I3ru5ZtCRREr+ypnZL5pAeXkRwrQ==
X-Received: by 2002:a62:5383:: with SMTP id h125mr5938708pfb.30.1643340763006; 
 Thu, 27 Jan 2022 19:32:43 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id o13sm15641272pgu.89.2022.01.27.19.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:32:42 -0800 (PST)
Message-ID: <c3d680ce-8b0f-67f9-e591-ccad16c114ce@linaro.org>
Date: Fri, 28 Jan 2022 14:32:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/14] hw/intc/arm_gicv3_its: Check table bounds against
 correct limit
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> Currently when we fill in a TableDesc based on the value the guest
> has written to the GITS_BASER<n> register, we calculate both:
>   * num_entries : the number of entries in the table, constrained
>     by the amount of memory the guest has given it
>   * num_ids : the number of IDs we support for this table,
>     constrained by the implementation choices and the architecture
>     (eg DeviceIDs are 16 bits, so num_ids is 1 << 16)
> 
> When validating ITS commands, however, we check only num_ids,
> thus allowing a broken guest to specify table entries that
> index off the end of it. This will only corrupt guest memory,
> but the ITS is supposed to reject such commands as invalid.
> 
> Instead of calculating both num_entries and num_ids, set
> num_entries to the minimum of the two limits, and check that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/intc/arm_gicv3_its_common.h |  1 -
>   hw/intc/arm_gicv3_its.c                | 18 +++++++++---------
>   2 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

