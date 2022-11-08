Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA71621B96
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osT3r-0007xp-V1; Tue, 08 Nov 2022 13:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osT3o-0007xK-Bz
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:10:57 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osT3e-00077y-QF
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:10:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id a14so22282217wru.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 10:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hNU/IJxTalF4Uu3oU01DpM9WIVHF2Z1dGZRMtmv2vXw=;
 b=z12uufuVlyku5+u6oHB+TdpkGwzNhgCUfXQcQSmDKvW/0lbgwBrUrFvBdyEtuQBqg7
 0rAaj6W6BY10ezk9kms/MN3nlmQIXfkfRk4ELS0UoyqVrFVjwO89CkD05FqRajTKzKtK
 sowIthmi3C4r7kNhS6kAYya8XJ7dhgP8flhqXj/p7fHGbx9gd5ePYd5ZukliajXp35ym
 zscgT2AjdSq5yuBMVi1DggW2SocQ70o5aUdFbIY3YXlRb+eIl8lMNC/sLimPJToHRn/3
 aCak6jS5XbWjQfADToyRQW8azvDdtozl/bzkAI6poQX0c8aT4nwEoTcFDbMoz/c2f4im
 m/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hNU/IJxTalF4Uu3oU01DpM9WIVHF2Z1dGZRMtmv2vXw=;
 b=FbmgUGwhp+26lgJElHEd4/TUvy69pqlpAd3Fi42uTv5LU5kjMdB30r7EZV8zOpOCJ7
 33dJ5yGtoUX2rrBVMMYHobSIQM6SBJFyjItu4NNCD3HMEVALu7PNPuXoMu3m3HK3kq1b
 BVq4Kr4aqNyaM0sMymZNpTXJYYzru8JAawGDsRY80qqlYjhFXth1emdTlFA02ACFaD0A
 pvrubtlWwe0TnYoICGdk/sc3lF1JP/u9NBWIEN/NrrIDHV9gja7HJrP5f/ph0Ixchh1L
 K5L1ouZgI3RUPcnq5eDghJ/pSVeRrunvd6Y5n3GBBZ3MlOnmVHcSBbvDesOZfmjHZayO
 pWLA==
X-Gm-Message-State: ACrzQf1Rt3CEcK0e1ZHR8c6aX5PJYn8EiY01khT90v0Yv82QW0V8YkgU
 S3ZvOhzGaNAlXKB3F6IzJkN8Gg==
X-Google-Smtp-Source: AMsMyM56KzmQG8OTML3wPQSDzGRzzBwf/YBZGN8M7Z3jySyQWDtHyCM4+a368GnHw7JQgI2CDrcVxA==
X-Received: by 2002:a5d:47a1:0:b0:236:6f4d:1db3 with SMTP id
 1-20020a5d47a1000000b002366f4d1db3mr35848451wrb.383.1667931044173; 
 Tue, 08 Nov 2022 10:10:44 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bk28-20020a0560001d9c00b002365b759b65sm11166136wrb.86.2022.11.08.10.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 10:10:43 -0800 (PST)
Message-ID: <3c53ebf8-7be6-7838-63d6-0dc232399669@linaro.org>
Date: Tue, 8 Nov 2022 19:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] Revert "hw/block/pflash_cfi0{1, 2}: Error out if device
 length isn't a power of two"
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20221108172633.860700-1-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221108172633.860700-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 8/11/22 18:26, Daniel Henrique Barboza wrote:
> This commit caused a regression [1] that prevents machines that uses
> Open Virtual Machine Firmware (OVMF) to boot.
> 
> This is a long standing behavior with how pflash handles images. More
> information about why this happens can be found in [2] and commit
> 06f1521795 ("pflash: Require backend size to match device, improve
> errors").
> 
> This reverts commit 334c388f25707a234c4a0dea05b9df08d7746638.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/1294
> [2] https://lore.kernel.org/qemu-devel/20190308062455.29755-1-armbru@redhat.com/
> 
> Cc: Bernhard Beschow <shentey@gmail.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Stefan Hajnoczi <stefanha@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1294
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/block/pflash_cfi01.c | 8 ++------
>   hw/block/pflash_cfi02.c | 5 -----
>   2 files changed, 2 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks, our patches crossed :)
https://lore.kernel.org/qemu-devel/20221108175755.95141-1-philmd@linaro.org/

I'm queuing yours which is first and will amend the description
(if you don't disagree).

Regards,

Phil.

