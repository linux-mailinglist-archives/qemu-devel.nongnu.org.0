Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB48021E2A5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 23:49:37 +0200 (CEST)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv6KO-0007JZ-PH
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 17:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jv6Jg-0006u2-84
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 17:48:52 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jv6Je-0006li-EM
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 17:48:51 -0400
Received: by mail-pf1-x444.google.com with SMTP id 1so6621526pfn.9
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 14:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=82fsQZMrFOltw2iNmOUVipl+oK8+TPJWEBYmit5bM3M=;
 b=p5l9A/3B6gxCwRrAquC5Y9onkrWvkpPi6SCPHrNqH59+jKqEA/tSqGo8/oZ3l1n8Jn
 7e0q9S7rzVa5eBqwDu7PULqPAzKBudTun0b+eDUWFBEITXnouVzXRpHZSD5mJoMhx61m
 G9kZGPkzYTCCFN+qcDho+5GHuQUkupOYpL6yGmNhCCZ4OZi6uNq+mP85R2kTArkDN6om
 I03Ovge5BjOe0mGILedwRr3v3wW6vU1+/0HINFV/kvKYqHJnKYxyVn4rHcr3c9l1mNbX
 h6/OyhAaV0gIdhZbROs1n4ecZRLChWIm/CBKFprPw41evUKClFXbmN04ad8on/7S2RMo
 f3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=82fsQZMrFOltw2iNmOUVipl+oK8+TPJWEBYmit5bM3M=;
 b=O4YHihSJsdhX2mQ3FMZOLVIejDcf7WBVYhoASbV2Kxrm5K8TQ+EbP3YVKYx1+Lov57
 p8B2OSVmUcftDT2ljNmXH+zyrz+pnMiGzhG4LRX3mwA/NSqpf9soUJcH5xVLJYWB3koq
 0197DR+rT4XvB1p5WpnrqcE9GKl0SFvN0ra94havs6arHVjF9flRdHqBJH5OcXks7kj4
 /Iiq5Ehd/DfZhLp/uenH0eHOi5tkjWLwAIok+mB25Bqok3dYT6J//hyPtVTPqkDgtFss
 3bnUyguwI+V7I9k66DeWMLpS8fTiyKIwDYeaNTw/8DBAVNRq0gkHef1BsS7i6SFQvq8k
 zQsw==
X-Gm-Message-State: AOAM531ardGz6nCBETyG0X1taEBePfZP9KGEOJ7dt6atiySbtjwpyrS1
 UEDbAfshnhPHokCunrwRb/oXEw==
X-Google-Smtp-Source: ABdhPJxrCxaVeanztGSP6biGtefZNAlAuUHwJ7d7Uk8m0uDgCyP1J+3zL1Q8yBW1at7bqUR2XeloHw==
X-Received: by 2002:a05:6a00:843:: with SMTP id
 q3mr1556961pfk.107.1594676928550; 
 Mon, 13 Jul 2020 14:48:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id k8sm16719419pfu.68.2020.07.13.14.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 14:48:47 -0700 (PDT)
Subject: Re: [RFC PATCH 5/8] fpu/softfloat: define brain floating-point types
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20200712234521.3972-1-zhiwei_liu@c-sky.com>
 <20200712234521.3972-6-zhiwei_liu@c-sky.com>
 <1c090feb-0101-ce1a-af8e-2f7e45fd5053@linaro.org>
 <710a32d0-9289-a3b1-9dd2-59a09125c162@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a94cdb80-4ac6-326d-5829-e2b707ba4784@linaro.org>
Date: Mon, 13 Jul 2020 14:48:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <710a32d0-9289-a3b1-9dd2-59a09125c162@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: wenmeng_zhang@c-sky.com, alex.bennee@linaro.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/20 1:22 PM, LIU Zhiwei wrote:
> Should we just make bfloat16 different or remove all other references?

If you have time to do a global remove, I would be grateful.  Otherwise, let's
just make bfloat16 different.


>> The word "brain" is better translated as "neural-network" in english.
> Do you mean the comment here should be
> 
> +/*
> + * Software neural-network floating-point types
> + */

Yes, thanks.


r~


