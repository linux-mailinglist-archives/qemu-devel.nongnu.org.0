Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCF2B9D9A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:25:54 +0100 (CET)
Received: from localhost ([::1]:39378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsNF-0001UK-12
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfsGq-0003m2-E2; Thu, 19 Nov 2020 17:19:16 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfsGm-0003Hc-S6; Thu, 19 Nov 2020 17:19:15 -0500
Received: by mail-wm1-x342.google.com with SMTP id 1so8116671wme.3;
 Thu, 19 Nov 2020 14:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AfCqwQ38PQlncdp2Fer4nTPH8qpS+HclWqc6+Hvb1+w=;
 b=tBXCHZx6DoIeyYYPIDEJcrF8itYaYPK9Y/HYN192N39N+C2IKuqdNzoWIdkbb3bQ8e
 mt0mJkuaTxS/IehIIdNTM7qNPJ2XK9ZO5HDAkX75a1Vbw7pTxvOM5YKAaf4ZjsgIO9Ko
 pHFNpjNw+lBhJ8t7fKO5GqkT8JKfg2MAdo7p/M+Ha64r4s6WXxtKuP+xSnZlpWlqs07a
 4EJ4W9ES3uhgYTWEv4qBBoZ6UJULo4AqWY/IaFKYRQJygpizaT5vKP3G2Kf5qIv4Ba6s
 iiMLBaiZJOEL9iu0M2nBW6IJnABOKheKO0L/9szDiF9h/cqQ0/yCw/0TgBiCq6uBP/8c
 06DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AfCqwQ38PQlncdp2Fer4nTPH8qpS+HclWqc6+Hvb1+w=;
 b=N2AlItTRnQcFz0654C4x8/SROzahdq/sCHDqcWZryO87L8VpTDjhTnrdKzVpuvPsPg
 yjVQ2wScd3V4i9+kYz1eGvGa8Zbk61u4V+WNFCh8j6jQzCcuNBIAYWtHXEckkHhN7T0Y
 BUpzEdZQkqMSI/BLxJsk80VmlD/Ns8HTxVRQsNcxJljTS50I5TsjNN3JFVc9DAlgoZyC
 NgaTjwLEElt7irtS8KuffyN7zazea07Lg4pUobNrNE3P3G+wgD913WESRf6xQP/INrn6
 oQMela1bIS18zcQ5GbVKQFHSMlpfgvb53Gd7+Gj2m6QJm5TWmArNNZeG4aKaNto7zL63
 VjrQ==
X-Gm-Message-State: AOAM53054J+IkRJiocnDhizLyfmVND41UX8WsXY9GmwZPNJU5rlAn0Pt
 jw63G0gPN2Yr+ZY1XK/nD2Q2WiGCePw=
X-Google-Smtp-Source: ABdhPJwioU9SylN3f2fOJ4NImuazcltH66aBgfaR/0hHPtGRW1wu9kGwJo/Uy6gOl3e0c9xFPm1Qpw==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr6681356wmc.186.1605824349853; 
 Thu, 19 Nov 2020 14:19:09 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 8sm1840826wmg.28.2020.11.19.14.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:19:09 -0800 (PST)
Subject: Re: [PATCH v2 27/28] hw/arm/armv7m: Correct typo in QOM object name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-28-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6ad2462a-71f0-b850-5fe7-1c52f862b89b@amsat.org>
Date: Thu, 19 Nov 2020 23:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 10:56 PM, Peter Maydell wrote:
> Correct a typo in the name we give the NVIC object.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armv7m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

