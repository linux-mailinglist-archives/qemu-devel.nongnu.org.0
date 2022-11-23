Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3B635B6E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxnl6-0001jE-C8; Wed, 23 Nov 2022 06:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxnl3-0001ig-BS
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:17:37 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxnl1-0004V9-8r
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:17:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s5so11688140wru.1
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 03:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iCtmITeEGGpLkNYHfBRpt3urCq6aAjH32Xd8pxfyowY=;
 b=hKERkHd8doycjeSFcLwT/Osu81ohy4GkMgpHS1X4Z9UXRNVPTeQQEeZiQUdbzrQrDZ
 N3B0EubuQA1XiBGgfdYWBBA/CDPYkqmaz55Yinv5/vlZq4qg5YdATKm+E/Hwtv3RJuWz
 karHxoROZVkh4LWdU0i7gKbHcB9UN+vYCbLHI1sPp8LxMi5ZrRF2pJkDzpVH2pjs3bMj
 i9U53E+gvhquiNEg0ch6l0Twn1Ip3FPoOI1feA0WHDaeSccAPfgA4dewmGQ2jaAS4dbp
 IQu4fPcJcBGqbXgrwOWYFbMftQDO9nYaHCb4w9PU+FgVFEI+pglNuPeW+4cp0YgoCYiJ
 PnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iCtmITeEGGpLkNYHfBRpt3urCq6aAjH32Xd8pxfyowY=;
 b=U5Zx8ayunXJyc/b6H9LJZU3t3b9bWDs1lfqJTQU25M9EQXPFpnBj3iPHVUFL5jVtzA
 dsqcJOP21SxNrYm7SIxOrTG1J9oEVpmbL73Vvf44HX5bpXxuI5tPYn6KthfPPci+Ztrv
 wNJ2tw2fnKdOthkO4gY22Rvqz7qh7tbebNS0zVuQ4FVmNgNyqIxDx9G1Jy6qtB0Zirax
 6cdE7VkVJA/dop5zfKlkz/AAt6v+1a71kz9cQSRDptX2H4aqfKbU+VzU1JIelI3Bqh2r
 PFQEODu+NjaAS5PWgdTMb52bxHKi34VbcSuFPMkkj5LE9yCzanRqog3CYwm2OMFs4lEJ
 XMsQ==
X-Gm-Message-State: ANoB5pm+4FYb6LhXN0HPEEr+uWx/gbwXZAxfk9k4UaOJ9Z59toAZoz/U
 U9AUhtZ5HyU0LRkQC6AGBHq1zgsIbWFLTQ==
X-Google-Smtp-Source: AA0mqf4hALXIuFlS3Q7kL71e0KKdzgxVfFAuueU4GZHjhE/sh4rTNKif2++5DlnDO+M0yfF45ndubQ==
X-Received: by 2002:adf:f98f:0:b0:241:f327:63b0 with SMTP id
 f15-20020adff98f000000b00241f32763b0mr860458wrr.507.1669202250588; 
 Wed, 23 Nov 2022 03:17:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a5d61c5000000b002362f6fcaf5sm16665024wrv.48.2022.11.23.03.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 03:17:30 -0800 (PST)
Message-ID: <647da42e-b33e-00e7-1480-4c2cade2ece5@linaro.org>
Date: Wed, 23 Nov 2022 12:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 3/2] ppc4xx_sdram: Simplify sdram_ddr_size() to return
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>
References: <20221122134917.1217307-1-armbru@redhat.com>
 <87a64i87zp.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87a64i87zp.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 23/11/22 08:06, Markus Armbruster wrote:
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/ppc/ppc4xx_sdram.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


