Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9D54997F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:06:14 +0200 (CEST)
Received: from localhost ([::1]:33530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0nW1-00059z-7k
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0nTX-00044n-8v
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:03:39 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0nTV-0005QJ-Qb
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:03:38 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso6537293pjh.4
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/ovdiNxRKjnY+t6cQYmWO9KPB4VlNY95dAMOk15bUxw=;
 b=Mx0zBGFYlMdDPY/682lv+XMp/ZNYxhK9zSkhiAoQkd869bOwewJEFzd6xqM0M8dZPh
 5yTjZDasQst2rGo/bJe7bJPV/qS/O3AhWFZMacshqZ6MqucmQozm1U+ZZ2zcqVEz0r9Y
 jhVSs2lT6CAygodIg3eOw50jI8dvOoaDinRHMilf3W5n6UNQyILxb0vvhUGsWwwYTs7E
 OAhCV/n6wjpjtiRrhSypIrtotZg3aKXPPQQwMDHTLfBpHPL43l3gNW8GylJPPrzBXLQ+
 ylkYAt3X1q4CXyt70igxZv8heLM8+SHLBDa980uEwgIHmva+z9G6Z1j5ZNHsEYt486iq
 VPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ovdiNxRKjnY+t6cQYmWO9KPB4VlNY95dAMOk15bUxw=;
 b=GcitLLQzmnzV/ywrgSIa/68o+xJgLiE6Q+zMexUPPz3XiecSMNPSxj2dnj+x0aPV2+
 heC7rr42KJAE6GydwjL7DoqQvyazeyzOwGfCBmh5JszAnpFag1HdR/nIJsx+T4MdAYDl
 0lXkBsgj6xRa2nVmcfO9AulZxQQMHp1eLI7igQE4aB4K5brdpZMvXZ9aRl5gPLUhAAwz
 Cz8ZO7Dl+2PmoJyMgYctS604AMEjlzqLNlwHVlTH6jQZPT2jSNfSBoxTHmLwCUVukpO0
 edbduj8x/8FhczTZ6XOgEdjGsMlYr/TuZ2xp09LPwISys7whRNKTlmt5hBmbblw0lU5L
 qPxw==
X-Gm-Message-State: AJIora8Xiwm/c6/JwDzjMEX/YggTgECkE3LuBbPPp/dF97J7TsHwE+c6
 aSjxqZ1nEbjzttxdlwLbH7UVIQ==
X-Google-Smtp-Source: AGRyM1v9wuV5l1YvGk7EaJRVbgIXf1HFE0F3LaDcaUPW/6L1ELz17eC3Pg3ApOoX7LrQGkXxLqB+Gg==
X-Received: by 2002:a17:90b:503:b0:1e2:f129:5135 with SMTP id
 r3-20020a17090b050300b001e2f1295135mr802648pjz.22.1655139816010; 
 Mon, 13 Jun 2022 10:03:36 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a63b108000000b00404fd2138afsm5758257pgf.40.2022.06.13.10.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 10:03:35 -0700 (PDT)
Message-ID: <6225c45f-a07a-05e7-05b7-51ad96feafd2@linaro.org>
Date: Mon, 13 Jun 2022 10:03:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH] tcg/ppc: implement rem[u]_i{32,64} with mod[su][wd]
Content-Language: en-US
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20220613144350.642278-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220613144350.642278-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/13/22 07:43, Matheus Kowalczuk Ferst wrote:
> Power ISA v3.0 introduced mod[su][wd] insns that can be used to
> implement rem[u]_i{32,64}.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++++++++
>   tcg/ppc/tcg-target.h     |  4 ++--
>   2 files changed, 24 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queueing to tcg-next.


r~

