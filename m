Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08D633B53
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 12:28:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxRPg-0000Sj-ER; Tue, 22 Nov 2022 06:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxRP7-0000Pl-DZ
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:25:31 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxRP4-0006D6-Ps
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:25:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id d1so12115265wrs.12
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 03:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AHDMnCA4/fC0wvWqj3E31SsczfgnQXzZzT6ecXkDsKg=;
 b=il7f8cPP+C8DVo34YzPpvKmuvuVym2KXauy73+VLX0Fu2ubZcH9qrYvqrF/XzoFO3W
 Q1fhdnK9a3WWckUgE9MHvCRAjVWCjuRPo+Lr7dnQgnir7RpUKq/bMungr7sJNOT6z8ZY
 Ge0OJqRoMO/gN60BvZ/4ny0msMM32ze0K4cLtjHGsCgeHHEME5+YA8PbxAt29R/KziIR
 Lq5HTGOWK8dFcVmGyGbdeEKrwXH3wagCXPLpADvPyl7QgNja+VVnyIRl6OTLdgLTO1JP
 cyTsLMxhLPInt/3crSDPBgKLA1brMME1TmL3Kgfal8EFZfUjDBi3jYHvrsoRye7JWsXU
 x7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AHDMnCA4/fC0wvWqj3E31SsczfgnQXzZzT6ecXkDsKg=;
 b=Smg0vX0Kucv2axMEwnvOa1hJrq0szbJJJvjy81pI9DmljeV09dKFCtWJRu7o/b7tpo
 88XdxdfTkANtSymPBrk4oaFrvKXXZ22RtmfyfxZxiqDBq949JW4mMfsqe9dM1xovh/EC
 i2pE3/ce/9t3pLDekCrZEr0lvit3/r/yWlc8QqMo04GaYuDVCjmOw+hmqKo0xPPjIUbV
 TBMii+io5dhSYqoMHQiEYf85EI/gKapvNCiktZfwChPDVYLjDTrrrd+8n82gnYy5Y4Cd
 FLDpudJiYC9Skp0VV+tYXugJ/2mpVHdRYobillJ2JER5toANi1K42KUYOkRG4nkMD7C7
 jGrA==
X-Gm-Message-State: ANoB5pkdlo2rH4a2WbTOeBjMmzKc1aS9awGHpWId2z0hMNq2UPTk3RF9
 PaqcIPfK17AytMLm9EybX9jquA==
X-Google-Smtp-Source: AA0mqf5GvLrnG6OuOfRK4ay4nt1r/ezXkmOV+mR4e2llzTVymkwsQH7/yWK6aEbls5XV8JNos76CqQ==
X-Received: by 2002:a5d:6b0d:0:b0:241:cb64:e260 with SMTP id
 v13-20020a5d6b0d000000b00241cb64e260mr7802331wrw.126.1669116324200; 
 Tue, 22 Nov 2022 03:25:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm1876001wms.3.2022.11.22.03.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 03:25:23 -0800 (PST)
Message-ID: <9d611d8b-702e-0d0e-d39a-23725f407c9a@linaro.org>
Date: Tue, 22 Nov 2022 12:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 v3 12/45] tcg: Allocate TCGTemp pairs in host
 memory order
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111074101.2069454-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 11/11/22 08:40, Richard Henderson wrote:
> Allocate the first of a pair at the lower address, and the
> second of a pair at the higher address.  This will make it
> easier to find the beginning of the larger memory block.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-internal.h |  4 ++--
>   tcg/tcg.c          | 58 ++++++++++++++++++++++------------------------
>   2 files changed, 30 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


