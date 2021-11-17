Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D218454BB2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:11:08 +0100 (CET)
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOSh-0001P7-NF
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:11:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnOEn-0005M0-V4
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:56:45 -0500
Received: from [2a00:1450:4864:20::333] (port=34398
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnOEm-0003Hh-Eh
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:56:45 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 z1-20020a05600c220100b00337f97d2464so4156791wml.1
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5rVxXkibI2683edxn7sAuH6lF+smCrWeiYqSa0CZUYo=;
 b=RROvQC+tgjbSg0NGpee1rJZOiiLRXPGy/Io/fLLpyheyqsX+iBlg6havboljoBZH0r
 +4wsA1Zyfv3UY6SK9Hb4Agop3WPZ2S9sj0p9ZR0Yufj/j/XLU3gtv2RK6M4UFyhlcxAy
 dqsNheTskACs6xE3GBEMAfvX8632RxtzCGZCr50ybQYflbrfKM7k0CoOZY28fMpNSwAZ
 QHE4BtUK757Mq/REFtt2nQK6vcOwrb81OdTT8fOJKAnRdLsf45zVxPeuAZSecNGBSQSr
 4/7xfl3Wgob6f2R6cmm9cVneYjpjBYw/Fgr3vsVEBbDj8rfuZYaibA6V70Ao1enZHt9t
 Oi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5rVxXkibI2683edxn7sAuH6lF+smCrWeiYqSa0CZUYo=;
 b=KWJVviZf248+trfH7aiMWZAWpS2suo9bbvz3fYsD8WRdNzoI7uT9qQXNnwKMtaRrfj
 TRshRo5JMrYCFBAKtOBnW5spYNHbtI73REMMbuh/XCT51e4mPsTLN3vbaxBK6xsjNaBI
 3tmFyCt1CdFPICVCBkr0NReOu5cbWoY7VC0H/oSt6NuyPpvS9QmDt5XyHDtYBX27cDRw
 Ky8Ye0Jz9SBUh9NDIztX68LKILzJKHZRQmUDiQfcnIK0pzaoWccSKloZHMfIY7M9lxqP
 7tUDVcojsyOIV94f2IX5gBv1zoKrpamqbxCn2Vk6/RL8QCsacDNX/vSPfxMfC8f5n3JP
 d+Pg==
X-Gm-Message-State: AOAM5303G1KvHihYlksrPnruTJnB/2A/ubcRACJX/PKLSSkud4BGHwUe
 3M7sCtlYJN9I3Q9aZwkSZJo=
X-Google-Smtp-Source: ABdhPJxWB6Qcs26pgx3PKKAhQ6RYJ+7C55N1ZHfkVcsqbIIcX1bgOvF/cLi09WgQQoHzQHaTH0BQzQ==
X-Received: by 2002:a1c:8093:: with SMTP id b141mr1290589wmd.129.1637168202766; 
 Wed, 17 Nov 2021 08:56:42 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h204sm277561wmh.33.2021.11.17.08.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 08:56:42 -0800 (PST)
Message-ID: <c0538966-6a6e-8315-474d-6208122f7e49@amsat.org>
Date: Wed, 17 Nov 2021 17:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 17/17] meson: Move bsd_user_ss to bsd-user/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211117160412.71563-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 17:04, Richard Henderson wrote:
> We have no need to reference bsd_user_ss outside of bsd-user.
> Go ahead and merge it directly into specific_ss.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build          | 3 ---
>  bsd-user/meson.build | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)

Similar comment than linux-user previous patch (avoid wasting
buildsys resources), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

