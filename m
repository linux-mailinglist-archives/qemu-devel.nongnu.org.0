Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB8260B4E8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 20:07:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on1gg-0005Uf-Hr; Mon, 24 Oct 2022 13:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1gR-0004mQ-GM
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:56:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1gP-0002WZ-PL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:56:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id bp11so16862339wrb.9
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=roqW3VoguMusURWxK5tk5Uil4vzoH7U61jRyoR4h2uw=;
 b=WKTHUp6e8LeJn6uakpn+bhcXqAf+gfWuDekLPgplrjTlyR2vZcRjCd2egLEmL+cjmZ
 BASMSuU7vpQNDQ2EH9lOgGLkClVqnbj+qg/7oogJv3VjJNPexJm9VZbh3cOJOJ+x2pQF
 iD0+kjpeLcmXwl0MdVpoc/6RY56Rnml7yGKvBckfl8/NYy1H2QjBw3BmZ1CupLKTjNuT
 IvSK711/EoeRs8HG018+DB3eDaq8NryLb4KNIRCPZ6Z8eRXknVrAdhWIzJ8z2wRBtDfy
 U4FyUrcGTwNwcsPLTRwtL2l3ggLHHT7tsllHL5ZYiC9mkib2gqKxGp0/EdkaXq9DjIpv
 8ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=roqW3VoguMusURWxK5tk5Uil4vzoH7U61jRyoR4h2uw=;
 b=OjbZSTih2Ue6L+WU04PdwLq9ugJy+43D645cSYzkkX6bkwZ5RAKO/GI16dg8J/Hj2y
 wisgfITHhBXYI0REsz1H0tFh0sz/7a28bEmCdMmxyLkMO3D90nsYhcR+NSp6qhaXRjIU
 vSXZQ5RX307i81ZJ+DsxyWpc/qar5o28IN5nbxX0w4RGyW7LoJWlUSuE3kO5GduOntGC
 ttf+sZWsUysaNP0okGTwevukmbD7KYJSUs3nKbLRBnTO/ppkFhZziKkRHlT/6dPp55ML
 +caO/Y4h9Iu2nPvOz7koCo59w6wlr23hl+eUELp9soOS10cy1ksthVNzwQgwFiUUmFma
 Xzog==
X-Gm-Message-State: ACrzQf3c4WCb2Ww+YdLxE4MNAVvkOBccP/5MjnU9bdKYJSZphPVxFimq
 RQHceno9pmtJI7Lg/6HBHPH6IV7HT4WkGA==
X-Google-Smtp-Source: AMsMyM5XwW/IlpoRhfqHXIWEDikO+ff3KTyG5pHIFHZf25VWIOSTAxewmhIo6vIHzFlYU9+/1wPehw==
X-Received: by 2002:a5d:598c:0:b0:236:751d:1cc8 with SMTP id
 n12-20020a5d598c000000b00236751d1cc8mr3366016wri.651.1666634174974; 
 Mon, 24 Oct 2022 10:56:14 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003c6f3f6675bsm9108975wmo.26.2022.10.24.10.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 10:56:14 -0700 (PDT)
Message-ID: <8091d792-d6c0-6a88-57d8-1256178f27bb@linaro.org>
Date: Mon, 24 Oct 2022 19:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 11/29] target/microblaze: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-13-richard.henderson@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/microblaze/cpu.c       | 11 +++++++++++
>   target/microblaze/translate.c |  7 -------
>   2 files changed, 11 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


