Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF86AB6E9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:22:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5AP-0005hB-Sl; Mon, 06 Mar 2023 02:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5AN-0005gv-6R
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:21:51 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5AL-0007Qu-J6
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:21:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id j2so7719745wrh.9
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678087308;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Cnc3YHPG6ZFXniauuki5t9u8pNn7OfQDHrp4mrzAWo=;
 b=ZT2aDwNNBExBrji+oViCELc0iMIlVS2r11XxmO5prOJwWwdV6HQfiIJzsXjPl9Y2tZ
 8cdsgaY5u4JY03c456Z091cezXs4nGoS3qZ0HjCIquXU20cmIEJUyFDoNut3hsudv1HP
 zsfS8oElOoDuNEnIiy6ijp66fWBgjvXW2zfukceHE2Z2fyHJkqhW/9f97eY8bcDRAOvQ
 4G3bGnD4BGG9Q5Z07gsvon6OZJOFetwTwRY8YWPneE6sF9qOTHhIrL+TUwrRle3QYkQx
 xh8WeedN3LCgeiCJce5pV2rke5Z67n+KVapzQWwxYpTVk+YFb2ZRm1c4VFJPrrbwKLVY
 wEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678087308;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Cnc3YHPG6ZFXniauuki5t9u8pNn7OfQDHrp4mrzAWo=;
 b=Q6k/hukeerR4PeDtumlkpSJ2qlt8T0L5G/9wtqWQ/w4Wdhu/Y85CAU3sAs8STf+TPm
 Kh2VTORc+oo144r2P+VYEPIKiVnxgpKcKHkbo3rS8+0pfwpwmOaX+fTRAR6Tc4sT6jan
 1U0ZG0v2PPkfwZC+VRDIjiYgHXEoTGQ5IQ9SAp0J60x4RxdgcTTB4AN4ZIIwJw61ADX9
 9E8vwyfCAbPKOUbVRPheygZ5qlAeEfN6O07DUrdqGjhJV9nF+u4C76uznyuf4ujGgXw+
 bI65nqsAl2SqVWrr9WG0+RLayy3T+qkpA2CXpLCqyxN8W+eiNyalwwIGX6HyfLFTdcLD
 qzHA==
X-Gm-Message-State: AO0yUKVzZJz3hDAYbogcIN36KnD1Y5xIA2IIAZHbSJ3qvxxMOQVo/N/z
 qqr0L2DDHApo+G7BiwemDlVLAw==
X-Google-Smtp-Source: AK7set/474LGLdzCBLOwZJtjc+w2FbypE7SngtX8Q7/lhHSYjW/RX7dBlyHftvQb8Y+ZiGp/yVT35Q==
X-Received: by 2002:a5d:4d02:0:b0:2c5:58fc:e1bb with SMTP id
 z2-20020a5d4d02000000b002c558fce1bbmr6903009wrt.10.1678087307866; 
 Sun, 05 Mar 2023 23:21:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d610b000000b002c5a790e959sm9037391wrt.19.2023.03.05.23.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:21:47 -0800 (PST)
Message-ID: <c7fdef84-7570-c9dc-0fc4-b5ed434620bb@linaro.org>
Date: Mon, 6 Mar 2023 08:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/5] tcg: Do not elide memory barriers for !CF_PARALLEL
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
 <20230306015710.1868853-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306015710.1868853-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/3/23 02:57, Richard Henderson wrote:
> The virtio devices require proper memory ordering between
> the vcpus and the iothreads.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-op.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


