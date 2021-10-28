Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DA43D846
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:56:56 +0200 (CEST)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftix-0008Bl-Fx
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfted-0006pV-LN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:52:27 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfteZ-0000eU-M5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:52:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id in13so1029493pjb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sMi7gLggzWQvoWoUXCe8YtKjg0XCU9cdeyqmkMf1mak=;
 b=AgMYR9jFzT/yMzL5w0sDZH86/AX22/RgXZvDcclHkBk8ZR3V62wARWux9OdLRR9znK
 3aNnPQEqJv4oldOsTQzWOZsitGcwtSx5qUusJp0fQnzApaOc6+aPeNnBC2A/aA4Qk6fw
 lggYUrXfj+IaMF4jiUMlIBhaeeT+YZYt79wmTjA4dwj1VfyIsZL4d/bT9V9/nb6fIhbw
 ZBcEART/8AEBvzCSxb2rrXYM5ymug2HPuomP+w1+njRnQ3KwSaW093nSKQoWI+kiWMSR
 Bh/W9vSFJ11YNyDpwAPvm+yKzgtBu6ZO3UCQgLWt0U4vmECSMn2Pjpjc/BtlQzYnUzro
 fG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sMi7gLggzWQvoWoUXCe8YtKjg0XCU9cdeyqmkMf1mak=;
 b=Tt2XroK0rJMQXN5nd6SWD3qWJgA5Qm+7ez3WFw1MPqJenttrjVZXc8dHF45t6neB7p
 ELeDOC8BtO9ctGJ1PFlpSi+H3WgRjP74xL3xUIMdhxM+jEAauGt42jAOVJN+JcPG7vME
 2deUZspzFDnvtg05Vl7uXNhemsz/r8SeQYC2FziC6kjGEm6pWe33ztBas8bUk6+g65hY
 M9gdFROHqMOES3wRkGXu1zu0yX2gNYWB8UaXaDTg43NWE+VFH6KGMoRcCjICS1cR7xdl
 lY+zM244BVVZETlUn3/AbrU/dIrtKqlb6Qal5cZlGuKS17Zvdrub580VIzSSe3D6f1Zo
 b+mA==
X-Gm-Message-State: AOAM533vjrT1XrvZWOjUHhEMHwuqz6bzCIPizPtAxioU9EGQhq4uwrbS
 op+R6tjrTRQ9WzC1fRkEUNWoyw==
X-Google-Smtp-Source: ABdhPJzFC/rMaJ3CH21SHfeGgSp7G9hzYayF+hCI63b1QzDDXzTlN4ycKOwqPs0r5aSt4irnP6lnWQ==
X-Received: by 2002:a17:90b:4ac9:: with SMTP id
 mh9mr9449914pjb.173.1635382339708; 
 Wed, 27 Oct 2021 17:52:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k19sm1109591pff.195.2021.10.27.17.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:52:19 -0700 (PDT)
Subject: Re: [PATCH v3 11/18] hw/intc/sh_intc: Drop another useless macro
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <d2a83545a5da042e07f2a5bf9f80a12f7c0b9bc2.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0fb45ace-575e-8b8e-b0e5-1e681e110c7e@linaro.org>
Date: Wed, 27 Oct 2021 17:52:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d2a83545a5da042e07f2a5bf9f80a12f7c0b9bc2.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> The INT_REG_PARAMS macro was only used a few times within one function
> on adjacent lines and is actually more complex than writing out the
> parameters so simplify it by expanding the macro at call sites and
> dropping the #define.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/intc/sh_intc.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

