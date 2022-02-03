Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925904A7EA3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 05:24:20 +0100 (CET)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFTfP-0004cA-5m
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 23:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTa4-0002IV-GV
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:18:48 -0500
Received: from [2607:f8b0:4864:20::1031] (port=36619
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTa1-0007ov-Fn
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:18:48 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso8858754pjv.1
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 20:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AFW/nw/yagZyS2xM2sirUDuJ8Vj6Q32HbXYN4shOm0Y=;
 b=xk3KeDsM0gAndyFlinzlNNfO7pRF8SL3aseeRRT8/O7yXOGOhffZYqjzNXXx4btpDH
 /4HYHF0Gn+Y49ZG7E55NK4fWsCfsv1Soa8Bi69K7ZKWg9K5phqh0x2wXotKjlmlB6oLY
 brhL6jC0UlYhp1QBa4JTTF5eCTGlM7FP0jDMxQrdp6aYUJ1LTRdVwyFG7Q2URlhSdDW2
 8faeb2dBcooB9q1P6XCdy/l/vyDjAdelM2RITFH7lPOQlDmMR/n1gWwPJLxBY3J4Hc7G
 PTJZGY3j108UntBWz4q4GFWmJ47T7OHQpCPyaSPlIa/+kSXY9yc4dUVoAI7v85HqdU8r
 Jp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AFW/nw/yagZyS2xM2sirUDuJ8Vj6Q32HbXYN4shOm0Y=;
 b=yU0G8bwt10rlfKhzleq4nrjDN9ba3G0gNcq1iW284pbyEslyrJxE6lKglo4s+AogzF
 r+4KJqr1sd7CrYqhXF+FDymZzsez5rI1A4OkXrPN+yZWWx11MOfzh6OvHyNBsL3XHOpH
 tZQh8Q1S9OZrf5Myp1Tp71fsZLI3qs6pj+ww64eesBfQ7i4CFthbvBt+ahMZ39q9IE4r
 mQE28tEKz4GmXiUJE31I3dnXnSy58LRMey5iy4Jxbg8JGDPeKbC2mGp7Jsu5m2cv+FDy
 /6cKO6C/v2YUb5WObkdiy3pRyFvC/f6mECqlrxO+SYoWvPmIxmG23ZEzsladLeUEpm/8
 DqBg==
X-Gm-Message-State: AOAM531npctlE7uztTeauWXOIGOd9Z2fpvtihbtLB2W+NzuwdanZ4yk+
 IYC8P5b7p0ANBd2RuzFaTS90GQ==
X-Google-Smtp-Source: ABdhPJxIaic6mN9nj/ThFh5lbfGz84IzNaodl5lKCO7RGUhuL6/XwLZiiTvmmdCfVEqKo+KBzqBADw==
X-Received: by 2002:a17:902:6903:: with SMTP id
 j3mr2097767plk.23.1643861915387; 
 Wed, 02 Feb 2022 20:18:35 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id f8sm24368552pfv.24.2022.02.02.20.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 20:18:35 -0800 (PST)
Message-ID: <abc3e104-7606-5a66-754d-99c55f1e8571@linaro.org>
Date: Thu, 3 Feb 2022 15:18:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/13] hw/intc/arm_gicv3_its: Drop TableDesc and CmdQDesc
 valid fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:32, Peter Maydell wrote:
> Currently we track in the TableDesc and CmdQDesc structs the state of
> the GITS_BASER<n> and GITS_CBASER Valid bits.  However we aren't very
> consistent abut checking the valid field: we test it in update_cte()
> and update_dte(), but not anywhere else we look things up in tables.
> 
> The GIC specification says that it is UNPREDICTABLE if a guest fails
> to set any of these Valid bits before enabling the ITS via
> GITS_CTLR.Enabled.  So we can choose to handle Valid == 0 as
> equivalent to a zero-length table.  This is in fact how we're already
> catching this case in most of the table-access paths: when Valid is 0
> we leave the num_entries fields in TableDesc or CmdQDesc set to zero,
> and then the out-of-bounds check "index >= num_entries" that we have
> to do anyway before doing any of these table lookups will always be
> true, catching the no-valid-table case without any extra code.
> 
> So we can remove the checks on the valid field from update_cte()
> and update_dte(): since these happen after the bounds check there
> was never any case when the test could fail. That means the valid
> fields would be entirely unused, so just remove them.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/intc/arm_gicv3_its_common.h |  2 --
>   hw/intc/arm_gicv3_its.c                | 31 ++++++++++++--------------
>   2 files changed, 14 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

