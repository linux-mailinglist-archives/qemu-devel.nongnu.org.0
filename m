Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804D365F6E3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:34:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYeA-0001nK-E7; Thu, 05 Jan 2023 17:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYe6-0001mp-JR
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:23:35 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYe4-0008Iv-Vt
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:23:34 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so2422212wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h8XX4vF7Q05JzhE04Rw7ItYz4ggwprpdKEvnzcnB0fY=;
 b=BtondXSjwltRzeyO9eZ42DtUDu759VT5pouVnp62BGv/f+F/bjnMkwteoN5x/jYBLO
 cZgDKSO2Dq1A7uVsfsJaf4vpt0xDiVnZE95e1D06ppTm+YmLrokz9k9+IUEOhaUIf4g4
 O2Ntrcd8zudXeyw4VVtPuvjDgZPyZmBspBucGZI0hXwINLwBk8dvZp0O2Hny8ttogsgw
 FR37Tkr+ceFvOgAodTwqrxEulOOjSjw2tZif1dxLoD7F6afI7eptaqt223qZ1DsAEobu
 J4nv42SDLlDX5CDtMNTwJLTNP6p8sZFqN8XD7AjlHnKtGlCRcJMyRa5759lT/ARZeYk9
 1ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h8XX4vF7Q05JzhE04Rw7ItYz4ggwprpdKEvnzcnB0fY=;
 b=PnzGTf1LUHAT6r8dX/j5p3uBx9oEDChpbRv7WHdqVOvygIz3YjWigW5kiaotiATeaX
 PpvEXvJL9/npGyx/D5b2Ku7PpY0KHqJI1UFyVSfxkeg29EotdspOos9RpXNr424NlTiO
 oyIgxkBjPpwbnYTBq9VWHd2SBSEbCqPOaezRBmy1NhuKKTxNGwTiaCTt92sRC3Z6AZNn
 csQ1lR10KvHTB6PTxOKHBHCqKKN2Sn7HDNhVlOrqco6JX4gw6ryou7C0CuNrfnnWagM4
 prqxLUmDFo6+3DGcEIt2Zr+OG96gN5TP6sANWwhzweY6WCPrc52RD5EqjAIpn/GoXYhp
 NVGA==
X-Gm-Message-State: AFqh2krkdC9eIYvCpuoarqbdPsVI1GCXKOTu7skYgRId4a7SquHhqQ+B
 KgYRm0f9zZ1LmtdwbkBWZpTTxA==
X-Google-Smtp-Source: AMrXdXtoKanYmhgsuZj7qDodIjj0sgWGpQUaFhfCyGL5ZiVV+752636nmiIlUJyQjkUxkQ5zROqV8g==
X-Received: by 2002:a05:600c:2318:b0:3c6:e63e:23e9 with SMTP id
 24-20020a05600c231800b003c6e63e23e9mr40750702wmo.24.1672957411113; 
 Thu, 05 Jan 2023 14:23:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a0560001b8f00b002709e616fa2sm37544091wru.64.2023.01.05.14.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:23:30 -0800 (PST)
Message-ID: <a5de8c74-60da-fb88-69eb-cd05ae5efe83@linaro.org>
Date: Thu, 5 Jan 2023 23:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 37/40] target/arm: Move "cfgend" to class property
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-38-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-38-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> Remove the cfgend variable entirely and reuse the property
> accessor functions created for reset-hivecs.  This removes
> the last setting of cpu->reset_sctlr, to we can remove that

s/to/so/?

> as well, using only the class value.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h    |  8 --------
>   target/arm/cpu.c    | 26 ++++++++++++--------------
>   target/arm/helper.c |  4 ++--
>   3 files changed, 14 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

