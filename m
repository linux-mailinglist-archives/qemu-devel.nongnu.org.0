Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43660BE66
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:17:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6fk-0006WJ-Q9; Mon, 24 Oct 2022 19:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6fZ-0005tP-S7
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:15:50 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6fV-0007Cj-HP
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:15:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id h2so3826938pgp.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bScAIMAQnaee7P9QNK8Qmogz3YuSSoc1+y/ZsG7Flfk=;
 b=vp5lB59VOk+dH7VlePd1OP1SQPoEsqQuNHBeOwTVte0YCcJ94rSFxBe10BffrBwEwn
 55XhEJ8UiHmVMxV89eYTw1ZaN22a3G60p/Cp9j0qFsMKLJQudP8Sxns83rVPZHpQDmaW
 PHYa/21GMT3GIeKe0dVLqEyDxOl6KHC7W+HXDYG65RPY/zU7R8HNZ2aofMGUHlRu4wcQ
 Jg9ftItW2lXGRi6MObThpMmkMCUCV/8oxbXDGLV0qLmS+IuKiz2bQp0ufVST5blYHKsK
 ofhZsrs70o7Wu1laU3hnooGKDp+Q+dM9vTFczQ8PtzIXDmYjBROl8hY8+4Qu2XMowiP7
 lg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bScAIMAQnaee7P9QNK8Qmogz3YuSSoc1+y/ZsG7Flfk=;
 b=YyUiH8Ff0g4v3nP/j3LFPvSMHIUzPQa9b3BEktKWVMNdfDDsUrSynflcIublIOdK4W
 CknLoHQ6ynZitPFgTj+oqGr3H2J3llc7ogT6wWlYbSavIKoBUllBvaxdi2b2I/obWkeN
 w5SovpkS9hkIvw0O/V+6GvNd+i5OP78+okgentz3myX2NrSAj0B8mYYzqjZ6lXuTOaN6
 S+ph3ULJlxYXM6Ar+RpZ88+hl8Dtto1jFFJYMyp6zdhswYe3niJZdLEEzb/hip7efLZo
 PP4UT6shTwwKpXU8P0zUcQLx66PmESKr/EBTJQ9nn0zijFRLsjd2Ex3Y1EHktvas1vZk
 V9sg==
X-Gm-Message-State: ACrzQf0+O44Fz5VIht6NoFK3gPjzNU8jMyNumUXbsQnU//trQYc/Xdfy
 Tyr4UrrB4cbfUzu2A1zCPDszCw==
X-Google-Smtp-Source: AMsMyM79wGKx/2j4NLOhj+8wUVwyeufNE+yD5Fuq0pCKd9WRxzKb2v3TPs6+zKNVpvM9xiiKu/VJwg==
X-Received: by 2002:a05:6a00:32c9:b0:56b:a54e:68be with SMTP id
 cl9-20020a056a0032c900b0056ba54e68bemr11526469pfb.16.1666653340056; 
 Mon, 24 Oct 2022 16:15:40 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902da8a00b00186b5c1a715sm222246plx.182.2022.10.24.16.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:15:39 -0700 (PDT)
Message-ID: <6e784305-d256-151c-cf28-d32e84e5c821@linaro.org>
Date: Tue, 25 Oct 2022 09:15:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 06/11] hw/ppc/pnv: Avoid dynamic stack allocation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
 <20220819153931.3147384-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819153931.3147384-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/20/22 01:39, Peter Maydell wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Use autofree heap allocation instead of variable-length
> array on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Acked-by: David Gibson<david@gibson.dropbear.id.au>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/ppc/pnv.c               | 4 ++--
>   hw/ppc/spapr.c             | 8 ++++----
>   hw/ppc/spapr_pci_nvlink2.c | 2 +-
>   3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

