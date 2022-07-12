Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD0A572768
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:37:40 +0200 (CEST)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMdX-00063b-6D
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUm-0005Tb-Vd
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:39 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUi-0004qe-J5
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so78778wme.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tyvt5E/uriVHAtRfUsWMEe+NQWl7H39Grmzdu4PWz3Q=;
 b=TgI0+skLmEUOjAXi2yRXl6zL6nxgAyDd8kMA6fqvwmJl6DUAvUO9n8KtkDkY4W/o0i
 aoMQ6hFwZyj+h2jQ0qr1lRQ6wKhqcRGiNFQwN14zbwKjLp5xzNeHYNvfGopS64fC88eN
 Swkp9QcnSAcaFuhU+zjGv9Cej9mXVA2opMAQKhDjiL3VD47GULYqOaZyUJBKG/p9oZvm
 Did8fKysHyiGc+WRoWTVzaHXXmvf/2UMtnPOQi+wXGRQ97T4jhewC26LBr1p00ok8NfR
 23egX0yP8vW6VG3+5+2ubu2diZaAa1vpGiZ/+CAUb4wtaSNMA1faueFcvxyRsSua7Vlk
 Qy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tyvt5E/uriVHAtRfUsWMEe+NQWl7H39Grmzdu4PWz3Q=;
 b=Pf3qirqp+aiH1gUtQAIXpK/gww5QtEq/Dv6q5MgpqRF6+StbCSye6hcnqlbNbMyU/t
 SdnbPukqy7GQeLgVuEDnm2t8KdFGzRC7vBGz+Zptv8Alp+RAf88kj4sTXNnj5w6ACidY
 eWtZCzHzcbaETekvg2exWEQU4yXQQbDZrqtfEGXvgyRI+U6pEh3hj4s+eUTnOitvsek8
 3DNBSeCf4ERQqqAjfAdYGaRDQfyynWNI1rnfXKV/BQ0LJP7BqFUATBdt+tJcj8XAfHFT
 WG2uYhlHL/kSzwqmya2X7UGSOc5kDkcfPNKvLifVbPFb/Cg21TKMHTKVhBCyJVSSWWJU
 xWIg==
X-Gm-Message-State: AJIora/w48zBX+24tH72lH7RVj3xM0gHEa1R2AW5/sBSn7s/CJcR9Ktv
 OWTElUxY18k2ydkXmvQEXM8lQ0tIXIxVEjoF
X-Google-Smtp-Source: AGRyM1scIIEK/K8j7ItqeEUeEiutzrWxn5WWdPmE+DhUITnv/1tUAlR3wZ4QUudTPZW9lm2yvREPtw==
X-Received: by 2002:a7b:cb4e:0:b0:3a2:f3b0:4233 with SMTP id
 v14-20020a7bcb4e000000b003a2f3b04233mr720078wmj.50.1657657711285; 
 Tue, 12 Jul 2022 13:28:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d6941000000b00210bac248c8sm9265614wrw.11.2022.07.12.13.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:30 -0700 (PDT)
Message-ID: <ffa513aa-01f4-e1ae-2132-d7664d418038@amsat.org>
Date: Tue, 12 Jul 2022 22:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/8] target/mips: Drop link syscall from semihosting
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
References: <20220628111701.677216-1-richard.henderson@linaro.org>
 <20220628111701.677216-3-richard.henderson@linaro.org>
In-Reply-To: <20220628111701.677216-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 28/6/22 13:16, Richard Henderson wrote:
> We don't implement it with _WIN32 hosts, and the syscall
> is missing from the gdb remote file i/o interface.
> Since we can't implement it universally, drop it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 9 ---------
>   1 file changed, 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

