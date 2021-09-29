Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D776741CB05
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:23:15 +0200 (CEST)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVdIY-0006bN-4v
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVdA4-0006Zs-FB
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:14:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVdA2-0006wj-Vt
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:14:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so5933648wmq.1
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gm4JvMApiONLtfTFbBMVD53zibg6xRgXZuZbcgLaINs=;
 b=g9fw9WgA4J1WN6Jhw0YVodR79oCPABjM8gkffmzFwiW9JQPnkwEf3UGZQ6yqG7b4b3
 3g7ZePiArhXQi1UllU0WxnH2mjU2P33dMuuln8S+2Gwp4rwh7ipztHZCLtXHhIxqtFzS
 vCq5XxwlZ4omhRlb4JAU9iyGuu4H9lz6sQR1y362WNOJRa/a9+KJFDgzLzzPK6SKysSn
 iL0Etrr1LpHIkvzDOJzLZGQtP04OPQygBWxfUQqDsYK3wEg22sCVmilG/Qb6MjP8VNON
 vPywrFR7lIHvzWeEAs8/rGZjI3Sfip7zlqxVQmwOOMLzbFI2GQityO45l7gO94sB3OG1
 Tb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gm4JvMApiONLtfTFbBMVD53zibg6xRgXZuZbcgLaINs=;
 b=PQcEBbQIR+4nfI24d01qvrL/gRJNv4fttqC5gLKJfORAE4C9tosgrV7LP5ZH0a0ehc
 CxunhSqsoOcTqpUO5TnNqCtXvCOmm1sCPxMMwlRFkadZlTP7tQ2P23Q2oseRdg0VB9IU
 FkHZ+9IA7DaStOhW+OQSNGmEtlwz0XTya2YDMyhIwL701JK+9tXV88oIaQQjFhjqL/bn
 BpNB1WqVb43uwF7zNm7zq/CqJjk0DBZeLIQcgta6+aQ425zEXHerNLHMuzUnWymFoC/b
 UFdWfU/CW4Ud0xQEczXY9tZips3g/KEQsCDwNL5io42nmX3WjV1Jn6v/Q46MmeWpRMZe
 GMiQ==
X-Gm-Message-State: AOAM5309IXeoWMRHq8EdL08w249ZjqZylaNfSuAscw0W+kcT9z7+37w2
 C56TrfRGFAQX8ifSJVQVIsY=
X-Google-Smtp-Source: ABdhPJynk9c2RbDXGPp4AxxWXVEIZ+D9dw8Me2Px5YeTTwI3ZEAaxbIVaCf3JDfIRO809+v4NAdcQw==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr11684095wmj.65.1632935665460; 
 Wed, 29 Sep 2021 10:14:25 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v191sm403300wme.36.2021.09.29.10.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 10:14:24 -0700 (PDT)
Message-ID: <b29de397-548e-201e-44ea-00951cd7117b@amsat.org>
Date: Wed, 29 Sep 2021 19:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 13/30] tcg/loongarch64: Implement deposit/extract ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-14-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210925173032.2434906-14-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
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
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 19:30, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/loongarch64/tcg-target-con-set.h |  1 +
>  tcg/loongarch64/tcg-target.c.inc     | 21 +++++++++++++++++++++
>  tcg/loongarch64/tcg-target.h         |  8 ++++----
>  3 files changed, 26 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

