Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B286449F1BF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:21:11 +0100 (CET)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHp0-0000A5-Q2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:21:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHjF-0004CQ-EY
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:15:15 -0500
Received: from [2607:f8b0:4864:20::636] (port=33427
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHjC-000788-Mq
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:15:12 -0500
Received: by mail-pl1-x636.google.com with SMTP id k17so4711583plk.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4O7WF2dNEv6+T07efh0scbDlUd0TBIs/BbpZ7LzoPl4=;
 b=GwUVNmtElfFlEPjs3OzypA5TaiD4VpgNuMMFKtOuPbLKAuSkx58ztQWRPpmuK2OrSQ
 vLK1LzQ8qw++VUxjX4O3z71qr+kVshRPxzwUhU41Y8uMJG2+rO/TjsM0YhvW8YV7dLxc
 VWoLX4RdSBc28Nmg42zfPs1NJ+miYK3U4DXQfoNoZ7/E3dN16k3nP8SMDJj5k7N3Gfd5
 dbr9YNKcCvxK4EuLlaDZjTb9LdoAp8gq3j3IHlvaQ4d75HSI/MbmS1awSZtelM16pc5Z
 k93iHz+JLyCTSbjkgWBrDPBeS01xUT1WHSHoyHmhb4lyM76GBEcgm3q9OnyKoZbqZrXC
 sVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4O7WF2dNEv6+T07efh0scbDlUd0TBIs/BbpZ7LzoPl4=;
 b=YOojySNao1gk0C2Awu1tKToNsRGGMktLfvU5H+IxX2qq3ROfV6LtX1BgwmpvGISya4
 SMCKsz48LKE2VUKwZRzRXF3LYsta0LiC5sSRsstyWn7s++newZzUHvWCmv2rLvQuyysc
 ru/9M6wN/g7XRlPK1GzeWMkcc0CxlyKiEoWmnaaCA0EJkyWYmR/7zQQ0BU8C33869g1K
 /xKHw7XLqWBVwsPfXdbN9wKO4DozHYBhnUo4fNp64XjfPnW0rwI1sxXM4A5w2025ShjA
 m6StyYIR7R0GRxpAw8BFdmGW6CqtR7f2hqC4JlW8Kwh4vFvTsKrVuaW9yrYkd1CHVstt
 ETfA==
X-Gm-Message-State: AOAM533CZ8edLIk99ylAMMRjF+ZNCDywEAHwR5Hn9CSqae+nBnUJKBK/
 BYNeD8YuWHUXlkAs37+V8TFFkg==
X-Google-Smtp-Source: ABdhPJy0fwmWYfps28f4W3rnt1XKZQD3n05W7vvOhsQaCL7hEhHLquN6VsendhnAnHV3JV2+NPQLcw==
X-Received: by 2002:a17:90b:4b05:: with SMTP id
 lx5mr17391743pjb.128.1643339709320; 
 Thu, 27 Jan 2022 19:15:09 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id t14sm662954pjd.6.2022.01.27.19.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:15:09 -0800 (PST)
Message-ID: <b3df3bed-104a-0a64-501e-a4216b663a45@linaro.org>
Date: Fri, 28 Jan 2022 14:15:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/14] hw/intc/arm_gicv3: Honour GICD_CTLR.EnableGrp1NS
 for LPIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
> The GICD_CTLR distributor register has enable bits which control
> whether the different interrupt groups (Group 0, Non-secure Group 1
> and Secure Group 1) are forwarded to the CPU.  We get this right for
> traditional interrupts, but forgot to account for it when adding
> LPIs.  LPIs are always Group 1 NS and if the EnableGrp1NS bit is not
> set we must not forward them to the CPU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

