Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B049F1F0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:43:23 +0100 (CET)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIAR-0005li-FC
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDI67-0002kg-MI
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:38:51 -0500
Received: from [2607:f8b0:4864:20::433] (port=37691
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDI66-0001fC-2o
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:38:51 -0500
Received: by mail-pf1-x433.google.com with SMTP id p37so4921932pfh.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1bNRYm61u3wzfZM74ZvYU9IkZ0YmO0e2GB7pf2XyzRw=;
 b=rbtsbSvl0E1y99+r0B9hL5xqdI2aaQCPO8y0scyfgCQjYT5VkdXkhmgmNrZC/3snNU
 YCYxjk9RbbMD1+FTT708B6fBeTuot0tFzio82Ttnbxfcmn0d8/ZDJ3b0AyUredXjeq90
 ZjjIPbHsEYB22VR+6VLSaif6KqJvD6HdmNkepVsxwts+EGicJzqw1hYAxh4Pma4krd49
 MHjQr9+BfU/9mkzC4IxYPnCbQ5D7w8T3nl6atyqWaTMwTsIc839uSPs2jwcnrC+wTy81
 69HAbv3KNzVPgnKRe0uXkEQUGtlvpTy6OiJ/c+MCW6jjcdqVwLuAqv9mCy5CWbJSqbXg
 Y57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1bNRYm61u3wzfZM74ZvYU9IkZ0YmO0e2GB7pf2XyzRw=;
 b=YTrJY9ICIaUvKUTWWQgDGOA00A08clkNyNvRzNdFsYoS5+jh7lnmx9V5pu7NaD3cyN
 jYxTcwEr/tUu2mCkMPXO2G96hT1g3sawwURlkNNpm4z5m58MhknLQ4VueZ472DWMwgnC
 LFo0riTFKpu4k7Nzs855DGBqf497/o4Li3Ckjyklsd37ET9hx/0VTOHCxcvrDa3DEWy8
 yd5i5/l5kKSw9pfPQuWE8rhe41Q5lIzzedyK61lSWHKH+TM2iqxE0q+AAfGOVRI4CEbW
 /XA+fxt705CnytgJi34MUEXR9blvFWDSf7k9tdKOOqLFgjUQ1FHlODUvd1qklQ+w49xD
 JePw==
X-Gm-Message-State: AOAM533xrzNY5/j+UU9qXb/YrX7KoN+L0AVRo6ItP1aFUO9+8SSdcRES
 ZhNvBLeLyggDyxkQ4lVo4HGRNQ==
X-Google-Smtp-Source: ABdhPJzQn2d37T0STfccpSxkLPAvQOiyIV6HLMDDYHV4+FokcOTIqM72ZUxvn7+TvarByyz7pcSOzw==
X-Received: by 2002:a63:6cc9:: with SMTP id h192mr5004307pgc.486.1643341126235; 
 Thu, 27 Jan 2022 19:38:46 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y191sm6913577pfb.114.2022.01.27.19.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:38:45 -0800 (PST)
Message-ID: <cff79bec-6c8f-74e4-799f-cb9ae56b074e@linaro.org>
Date: Fri, 28 Jan 2022 14:38:40 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/14] hw/intc/arm_gicv3_its: Implement MOVI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
> Implement the ITS MOVI command. This command specifies a (physical) LPI
> by DeviceID and EventID and provides a new ICID for it. The ITS must
> find the interrupt translation table entry for the LPI, which will
> tell it the old ICID. It then moves the pending state of the LPI from
> the old redistributor to the new one and updates the ICID field in
> the translation table entry.
> 
> This is another GICv3 ITS command that we forgot to implement.  Linux
> does use this one, but only if the guest powers off one of its CPUs.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> All the "validate guest command argument, log and return if bad"
> logic feels very clunky here...
> ---
>   hw/intc/gicv3_internal.h   |  16 ++++
>   hw/intc/arm_gicv3_its.c    | 146 +++++++++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv3_redist.c |  53 ++++++++++++++
>   3 files changed, 215 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

