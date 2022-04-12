Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5B84FCD46
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 05:46:08 +0200 (CEST)
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne7Tj-0004dR-ER
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 23:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne7RW-0003A2-6I
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 23:43:50 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne7RU-00086s-Qr
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 23:43:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so1358045pjn.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 20:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rIR/BsVrtEXQTVhiyiChZH+gHhGdz4AL86dWPEQclL0=;
 b=ND19jIiXaxX1nCV4bjGSBJKQXTw/1dIDhO7CMw3Ii+YN/MrTPVE4lLYml99fkRn8rZ
 cXcXdgFoPDKkVpy39bYrdh5tJmkyYjkbAIUVhpZ7ojxh9NV77/4HbwD/NnY83fq0dgxw
 QfzQz7DHV/laKX/PiKbqtgzRuC63MYPwdrXhgDV5AyWCeIhHc2eIOUjlDrRl9Yuww306
 sFaazt6jEvD/rfeIAm8li8kHrOXxa9eBDZaFR7OrGK9l9KbrusKO8FiSH8znxQDnYAtl
 kJNPfgvePeiu/Hv+olBsmQpNLaPa9vba1TrIi5rD9/KqLzfvO9nkPC0XvHd3OWU7/xGL
 9CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rIR/BsVrtEXQTVhiyiChZH+gHhGdz4AL86dWPEQclL0=;
 b=tho3B1gpAOCo3FMDSELHI2Nxsd+nMPX30rRBxaSprwAdgXWMQFpm2UUiekNwmuAThW
 Yqo6xKhFQTDmmN+xlml52+zxPXu9V7XMwpHdD9qjAn/z54yyU+y1DTo3Rxb2SvFKB5jm
 OlMkeXc/Q7+JsuQkdRMVDmqHCn35up4AT5mNPYyjy4eOeqot6uTTZxqaV2X+ThYIdqT6
 sSC2NrM+uV0DARYF9KEjwuzpybVF3Ny9mEhVuePt0gWPdUmbig/pZ7Hgu0pNMZe6oRnb
 dOzof37wjc/vsN+1q3cS+omzrKONY3/yvM0UbIgiBn4F4IyAaSfB5+3u8EYTgP/L5mQa
 fFLw==
X-Gm-Message-State: AOAM53240d18QQJln0t35VhGWbScd0BAtpETxrQa0KHOVCYywolUV1IX
 KE46CQ+6LWnPU+btcDCBY8CO/w==
X-Google-Smtp-Source: ABdhPJzZ7Egl+aoZkgdqhDIzFrbguyfYi3r6Ofx5GPp9kfrY7VwB/A5YtJ2Hz3cqDdPQKZggYCXSBQ==
X-Received: by 2002:a17:90a:d083:b0:1c9:94bb:732d with SMTP id
 k3-20020a17090ad08300b001c994bb732dmr2722027pju.106.1649735027417; 
 Mon, 11 Apr 2022 20:43:47 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y30-20020a056a001c9e00b004fa9246adcbsm35274735pfw.144.2022.04.11.20.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 20:43:46 -0700 (PDT)
Message-ID: <f7f968a5-df8f-1fea-e44b-fc9508c568d4@linaro.org>
Date: Mon, 11 Apr 2022 20:43:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 8/9] target/ppc: Implemented vector module
 word/doubleword
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-9-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220405195558.66144-9-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vmodsw: Vector Modulo Signed Word
> vmoduw: Vector Modulo Unsigned Word
> vmodsd: Vector Modulo Signed Doubleword
> vmodud: Vector Modulo Unsigned Doubleword
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  5 +++++
>   target/ppc/translate/vmx-impl.c.inc | 10 ++++++++++
>   2 files changed, 15 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

