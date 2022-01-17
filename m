Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D38490B57
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:25:11 +0100 (CET)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tsc-0001ZL-Ic
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:25:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TZl-0002md-UD; Mon, 17 Jan 2022 10:05:42 -0500
Received: from [2a00:1450:4864:20::32f] (port=53050
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TZj-000336-Ra; Mon, 17 Jan 2022 10:05:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v123so21037759wme.2;
 Mon, 17 Jan 2022 07:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JA4lu5FXKCvgKQvWtDB69hBUzMuqbtqYnLe9EQr0c9g=;
 b=Tz+xVW7O/iBtIGDo3MMhWaXgI8fjfPSBVo1ennB41boPyNJL1COUMzaZ91S7J8Wyo6
 FdjkdIEMUCsOvOlqeVqBupd74CK9EFMUo8FsnxtQYSGGg/eGCV2Y200N959HPnzLqsAh
 UBuoyPHgRz6MHsHfSYjIncU/RbZi99SBJxsMd+tfnd8AgmIttYe3dBc0SMJj3AeScpHA
 GHPWU7kDi9LJTWs+qIMnKcevDouQSS6kRR+PKpYiPpBYIr3UIW3YSjwoCme5ZOB/NbXH
 X/aHw2wM7DPu3XChNoc6jJRmspXGBOSeeJhBRq+Edx7gLPShtQEvf8Z6cIDINWrU9V/p
 cmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JA4lu5FXKCvgKQvWtDB69hBUzMuqbtqYnLe9EQr0c9g=;
 b=LPy29h823MwlJMtcBsE5YSp23YUeQ1gmYu6kDDUIw6HKD06ufkR9kXDgBnlyCqPzYP
 ofUKfnw8nbdVf84JkbfBv5C5PVJbWrt8EoHLRLRyVrD3L3nBZfFl+BxijfKDCwJ8Jv1i
 yyLlZeBbE4D0BBZh+i0ZrcKAJwtFQQd0yn0vW3hUM0bXb3yFkcuh3nbduiA59MjQbmUL
 r2ppzu9OJEIPTwFp7x0BJoTUTRnMrV2LzSG6Qkx+xD33nUXxhoeKePA8tNROjFnSOwl9
 3QOWh2YEl6bC00eioqlfmfBcAxNodFTGQB32zVgzqYGm63Isj4zc0RLLrogrExjwppiC
 Ywpg==
X-Gm-Message-State: AOAM5304zV+RSn1da6JeEFAHJ2EPd4zhWuGDlUJO0PvNR9bIvQ/5s/7B
 zvlX0s8NAgnZ1U01C2hN/RcJw+LwlV9Shg55
X-Google-Smtp-Source: ABdhPJxAV3mok9DDx8BJMX48kk64J7y3c1PVNQAYoQzISNJn10/vYV/UlP24/kvmr0ag1Sxz+fdVHA==
X-Received: by 2002:a05:6000:1d91:: with SMTP id
 bk17mr19365143wrb.684.1642431938055; 
 Mon, 17 Jan 2022 07:05:38 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l9sm13541063wro.16.2022.01.17.07.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 07:05:37 -0800 (PST)
Message-ID: <95297265-3201-8bfa-a1f2-1ad7519c1fcd@amsat.org>
Date: Mon, 17 Jan 2022 16:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] checkpatch: Ensure that TypeInfos are const
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220117145805.173070-1-shentey@gmail.com>
 <20220117145805.173070-3-shentey@gmail.com>
In-Reply-To: <20220117145805.173070-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/17/22 15:58, Bernhard Beschow wrote:
> Now that all static TypeInfo instances are declared const, prevent that
> new non-const instances are created.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

