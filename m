Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE97B4FAACE
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:36:43 +0200 (CEST)
Received: from localhost ([::1]:33654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHp4-0003c0-Jf
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHnJ-0001BE-Oq
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:34:53 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHnI-0002sX-5m
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:34:53 -0400
Received: by mail-pf1-x430.google.com with SMTP id j17so9846071pfi.9
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hYLTGxA5YoI+jfTgeViKB7T2LtvC9eCNcON+OFMF8jI=;
 b=pnr/gRQMp2tH/RbnwDk+ZdQC7j7LwnAOl0CKko+mD1+XgyDGabcVg2A9bCtxbi/wGN
 Cf3AoPl7tzv5dYl06hEW0E9RF1F1gwAspJiaQEX2NoLyFsqVmhDY8LJCe8LA62G5XCce
 pibDMZxN6xed/p89UXGGn2X4lXE7hguzDZ1XkpaAdsOE+PZKsy4ucNhEdEIHaBqpfSj3
 7a+RidPwKcKtnoddSxbL2x8VrvgBwBYzP71H1HX6L36KAthJ8uTFE9m9XyZFzulFvw0c
 Q6NoMNPuja1iZQab51T2p9E9rGagGjPdig02eo1MeV75/hH6HfPl7p86wv2Gx28VZMW7
 3LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hYLTGxA5YoI+jfTgeViKB7T2LtvC9eCNcON+OFMF8jI=;
 b=sF52gMTCSIXN7yzNlf7eZq8M1p9b1GHy9bwlnAAhhcUCBWhhYp9wGRsDEIuzzNEq3k
 FK0ER04SkotktfpW6QsFNJcK9cQNbYRIj2FDHXaySWgUpquoaMue2FcaASwQ/xITpd+i
 D8YEfoRISHzhyjBf7lnEQW0sj8pJpwxXG0173aiDvOHIl+YqtZojEaXTXX4wntSYJKI5
 5/bW+fXbfBlo8dWotp681SnOm+IvQU68bbvpQd/Ir6ctcBYNr0ZtLeWqZ+3Q0cZU5Cr/
 XE5xZ99Es7yHeDYMyxwqGep/4ZF2zk3lqdz8TM0oVHD0Ntj45lkNeNHpuKg+CAXqPZoE
 qJsg==
X-Gm-Message-State: AOAM533Ethty8gJzFL2BOJxol+vq06M18Ku7X72in0rWKDDGS8QMzMnv
 EZNxrG5INHb6mVVv7OwHcJ5HBA==
X-Google-Smtp-Source: ABdhPJzzxNmNt66MDDDlOtGNOjwMV6kBgJsoOOIdQa1iYVESm9bPJzqFSS+SJSn/RZQ1RkLT3DCbHQ==
X-Received: by 2002:a05:6a00:16c7:b0:4f7:e497:69c7 with SMTP id
 l7-20020a056a0016c700b004f7e49769c7mr25317852pfc.7.1649536490264; 
 Sat, 09 Apr 2022 13:34:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a63ae4f000000b003995a4ce0aasm13923684pgp.22.2022.04.09.13.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:34:49 -0700 (PDT)
Message-ID: <e86f4b1e-7bd0-d038-f6c4-a56b3ee60b07@linaro.org>
Date: Sat, 9 Apr 2022 13:34:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 33/41] hw/intc/arm_gicv3_redist: Use
 set_pending_table_bit() in mov handling
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> We can use our new set_pending_table_bit() utility function
> in gicv3_redist_mov_lpi() to clear the bit in the source
> pending table, rather than doing the "load, clear bit, store"
> ourselves.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

