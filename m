Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB1529921
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 07:48:52 +0200 (CEST)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqq4h-0007gc-KJ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 01:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqpwP-0005w8-Au
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:40:21 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqpwM-0006OJ-Td
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:40:16 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q76so16015862pgq.10
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PWIIpC8SGjT1ejzgibIDDLaDzQI0X/fPSGua9LRwTM4=;
 b=Cc4wZ74hjDBS3sYEvKYnbtb6Oiu/EH6H7VOTqzweEX+SEqPXwkITpryejNnInZ5b/5
 EaURfY5p3uw9ctpK80OYVGwgL8qZJkw0+gYure1slD9DdeuJBrM0b1DJ+A/+F0TYkFY+
 Om5SrBCjbtxh//FgaMGztNZwoGWmihg77W5fOY335hGYdlpEVIEv9wcH5M3LFlNwNgQV
 TnL3mH2M9VBiIFLJTkQWbyQx0p4TR2U6egVl6VKDXAKKBaQFfODqIy7WoypzdEnoR4Yk
 7KntvNTa5+E26hvPU5VrZwWcD8E9rBOVTSQwTie5TwUAG4gPCJzSq/Omz++8XXSaoG8a
 y5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PWIIpC8SGjT1ejzgibIDDLaDzQI0X/fPSGua9LRwTM4=;
 b=omgXEtCTP0eX6V0/Al5c8MKn2yW4fooNn8x/x3M6y2kxXEoNlJs0p9tj5st8eqDmhX
 oI4dzT24AroukIyDh154SkNARSkxrErYeYfjQ8A0+kYNmHHsnu0mKoIh7U+m35uCHzoO
 JM3lM+BjgJskRe0pyrMf2qD3LydBSoAPWgKgY95vGwVfa+PQ6zp/vGFX0B8e2JPhQUmU
 FT6ebe3ZREtxollx4mROj9Be2g6BrfGK3kC0hdgijsluiu2no+UN5e82kvmGw8GineHu
 wp55H1XIufCIeB36IKsg0OBIWLywwx1IPiIYPco/DQGhun889zBgs72A1UYs25uqODe/
 JVtw==
X-Gm-Message-State: AOAM532knZ5jefG6n0IrY6jjr/KJILlaGp586rE1/wk//USrYKAmmQs6
 Xp75A9YcB1X+6VCA0SgFUW9nLw==
X-Google-Smtp-Source: ABdhPJyga/CaPdc1XMBiL5aTA/Qxm/RKCTHjdRreZ9UBGHU2kXe6+xM2qcIbQu+oIoPfLLsYkYtvVQ==
X-Received: by 2002:a05:6a00:10d0:b0:4f7:5af4:47b6 with SMTP id
 d16-20020a056a0010d000b004f75af447b6mr20882202pfu.6.1652766012586; 
 Mon, 16 May 2022 22:40:12 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 s35-20020a056a001c6300b0050dc7628137sm8350405pfw.17.2022.05.16.22.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 22:40:12 -0700 (PDT)
Message-ID: <344f8d16-51ce-6e4c-3745-be29da41dbfe@linaro.org>
Date: Mon, 16 May 2022 22:40:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] capstone: Allow version 3.0.5 again
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-3-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516145823.148450-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 07:58, Thomas Huth wrote:
> According to
> 
>   https://lore.kernel.org/qemu-devel/20200921174118.39352-1-richard.henderson@linaro.org/
> 
> there was an issue with Capstone 3 from Ubuntu 18. Now that we removed
> support for Ubuntu 18.04, that issue should hopefully not bite us
> anymore. Compiling with version 3.0.5 seems to work fine on other
> systems, so let's allow that version again.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Please update this description with the 3.0.4 version number you found for 18.04.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

