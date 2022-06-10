Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E32654673E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:17:28 +0200 (CEST)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeVy-0008BU-0z
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzePM-0000TB-41; Fri, 10 Jun 2022 09:10:39 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzePK-00058b-IR; Fri, 10 Jun 2022 09:10:35 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x138so2022609pfc.12;
 Fri, 10 Jun 2022 06:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0rHmzr+lSuLPw/qOnR7RZJUY834aj3VUFplxiBWmHrg=;
 b=F21ZtlWCRmoJApxtpDPFMaFsItc7i1nGv9hlfR5uomBnHaxmcwuAiLRE9JNUoQRAOl
 +tWGCMnhVbt9CTLullG8X8SkF3DvlghM7R+Eu05I5lnLxaeW2CheDZtepI+e9pKAN5in
 Jj1F9cfreI8oegLZjRZ+/shz8CTuHYTo96zEpIkDWOndw8CJM2X14/9bO07tazlbYSQf
 k3jDgum8oaR1dX/dIPR5JL9KQrM9yRDi4bC7E8Xb11GtkqZO9yr6gVNkpf/JHaw1lByH
 r+ptJXyppwRUU8ApdYXSNLQKKS1tyjOVIQSjhG2gwPGFwOEAdgNtuKwWBHGJCHCHxpKQ
 avxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0rHmzr+lSuLPw/qOnR7RZJUY834aj3VUFplxiBWmHrg=;
 b=kwFZ0RGSZs5KUn00qaceu3mxW304H4ayltPo+JPRwnsANwfvPF1pBL41rsSFcXXjMZ
 6blZxzAcKMldyM+/qVH9AXPtaN3/rZjq1G9kI9LNnYTWkE+V92CWlph+ZB0DfYoBNEL2
 Djqp4IbxbEmSvS0e57Bh0ohIk7zdxsfysPe9ouh/2iW6th9eoutwLqR4ulC081K1MsBw
 tXYfShvajsmco4WW9rXqOsyhv8IbaEYIQxKXN9ZgWsRB53pVXKNeOp9toSrUG8h3N1oL
 m+3PxRKWJV3QE/AXIOEuG8twA6Q1J+5cFXFD/lLzsyl57cs+XLaN6ev2pMJYed1+VRJO
 CAcQ==
X-Gm-Message-State: AOAM532JEGTGWtYxCvkcWEsFpOCaLCIlLqW5Bphq8zR/euD8+wTWN3C5
 MiKQB9gK8QNY6NAjwJzX0bA=
X-Google-Smtp-Source: ABdhPJxl5N2FQ9T4WOZvV971FzTRF5qmt6OWm5+YJUzNlPtxurzdlLbaLq+W0BbOJ3o1j0RMeniuqA==
X-Received: by 2002:a05:6a00:cca:b0:51b:ed40:b08a with SMTP id
 b10-20020a056a000cca00b0051bed40b08amr36055629pfv.19.1654866631900; 
 Fri, 10 Jun 2022 06:10:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z28-20020aa7991c000000b0050dc76281bdsm19356299pff.151.2022.06.10.06.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 06:10:31 -0700 (PDT)
Message-ID: <46561733-29f9-7ab0-c63a-2126ed20c546@amsat.org>
Date: Fri, 10 Jun 2022 15:10:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] tests/qtest: Reduce npcm7xx_sdhci test image size
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, stmao@google.com,
 richard.henderson@linaro.org, jsnow@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, thuth@redhat.com
References: <20220609214125.4192212-1-wuhaotsh@google.com>
In-Reply-To: <20220609214125.4192212-1-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 9/6/22 23:41, Hao Wu wrote:
> Creating 1GB image for a simple qtest is unnecessary
> and could lead to failures. We reduce the image size
> to 1MB to reduce the test overhead.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>   tests/qtest/npcm7xx_sdhci-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


