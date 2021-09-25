Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603B4182E0
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:51:55 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU91t-00076s-Rr
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU90T-0006OT-6e
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:50:26 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU90R-0003gn-Cy
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:50:24 -0400
Received: by mail-qk1-x72c.google.com with SMTP id d207so31947454qkg.0
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gaIOrfxl2z5ctTtDDh2zB8L1hpeADmNHCDP5gIJK6iU=;
 b=EXd/G9/64bIf/saZEjnZThfWoJoM3JmFcGnrUfDQ60fxti2VOjsd5S/H3KVXZgHbls
 2Cf2CRzcUYabVmoOgMBZSx9T0GEUuea2dhYfJDgn7yIkCFBQSojNyQ2Rp0Mo+q5UJqLj
 iLTHXKl78v08f54vKXFWMYUciLAt8wOTwadjD82DGgs0c0nuFUykvwdNpIS9EC5tSze1
 oZ3jDm11W0GAC4ax2bcPGrZkuYzipMcW3SJLhXGT7+Ccki7Rj9YN9T0yMPOgfVzB3kWu
 RjFFN6boU7vnrnCKrOQ3ho68Rec1xp76wDQksDnk/T+TO1eUjL0a758O9/8c9kPs5xnD
 Aifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gaIOrfxl2z5ctTtDDh2zB8L1hpeADmNHCDP5gIJK6iU=;
 b=M/Zz/C5K14i0DtfsY2U15iXu3qfZ78DPUHbiJPTnYJtrALfQiMBgfdzCMGlM0sCLep
 mM2g57RVRX31We7hWgji7CgrwkufxgFmswoMvwkQwRjTcyzrc3NmpTA619LG03KLKIWg
 sAMnlbfzMgyU0OU4E8svAyBY6Tc4vIkjCXpdyCodXaVpvpmKvVVIbZyAB1Pdrtvrzzv7
 6im+BSy9MiPI3fe+COP1H3jpZeEifBHrkyyYaetS53JWrB49epQbm0NeBzx6rxR08tbC
 csl5nwkXb8ghMqtm6Jii/30p3KvJY5k8jPbRL3RNtoILzIF3Q5Bk8EMr3u3HY0M+TGxr
 U5jw==
X-Gm-Message-State: AOAM5316ujCE4xcGND/nwEwHwxcc7vbwWzU9e798auOw9gnh+/P0mv0k
 rYPgPps4Lk61GmmYhM5CZAyfgg==
X-Google-Smtp-Source: ABdhPJyUb2E1JmAsycqagqgJXj6k5MeHyyZMc9MLAZe1Vt9zVzc5YMu1pGiBP+l3ny3+zGKtnyW5Cg==
X-Received: by 2002:ae9:efcb:: with SMTP id
 d194mr16136181qkg.306.1632581421820; 
 Sat, 25 Sep 2021 07:50:21 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id p17sm8714878qtl.52.2021.09.25.07.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:50:21 -0700 (PDT)
Subject: Re: [PATCH] seabios-hppa: Update SeaBIOS to seabios-hppa-v2
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <YU4st/zcLcg6RKNn@ls3530>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf7db983-af77-6f73-6adc-f006d0cd7454@linaro.org>
Date: Sat, 25 Sep 2021 10:50:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YU4st/zcLcg6RKNn@ls3530>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 3:53 PM, Helge Deller wrote:
> Changes in seabios-hppa:
> * Include all latest upstream SeaBIOS patches
> * add support for the qemu "bootindex" parameter
> * add support for the qemu "-boot order=g-m" parameter to choose
>    SCSI ID
> 
> Signed-off-by: Helge Deller<deller@gmx.de>

Thanks, queued.

r~

