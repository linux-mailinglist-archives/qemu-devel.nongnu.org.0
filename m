Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9837436A380
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 00:40:26 +0200 (CEST)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laQwr-0001bZ-5b
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 18:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laQvD-0000f5-No
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 18:38:43 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laQvC-0008Fu-85
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 18:38:43 -0400
Received: by mail-pj1-x102c.google.com with SMTP id t13so852764pji.4
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 15:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JyOjC4hnuqpZs4dLJ2oDGWTASNQw4MiSTPeP8nSRLU8=;
 b=ZB1D2ugfow0fItNEc7bImTRx+1Q+f2e6jSr7re6hY0M7UGta0SgjISmDiXFuJ0oODA
 YUM/r7FVGrKESZYKNjf8piVmNOmehyx9QIwx5g8vZVMozpprWGrZ7zsI+Ql9RrYwhFKF
 bHoygcNwK5VARpQdT0pvmey8kRMFWVYl1i5u90IeUEoNpycu2G4Lo0thDJXhNSofG//t
 ZgTBFRwKAqcn8phHevDpOpDzNfdXyQlNY6o8wnWC7dPYqn2DubgdcGpbufCuoCHzZzlg
 QkisPeFSTkQqK2RRc5zF4N5rHwIZcISzuWBFcEXrUfb4N2Wv2QUcD0Bvz7xYe4OT9Uld
 e2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JyOjC4hnuqpZs4dLJ2oDGWTASNQw4MiSTPeP8nSRLU8=;
 b=YSKffxIs7UqucSKhrm4RK0iKORjwwGMQBLWCq4Dlmp1dJuiQz27tSrJQnXe5hpQlVC
 C90f2xKv8W1pkWS9nBS8j3Fh/HFlea6Ddxz7icGlxQoBDw5ZbSBFW/AIN9z2xi5d4GAT
 ymJ9v/Ln8YqbTy/NS3kgorQyUf+l77wQc0vtCpdQurECgirhvBMtDdnPCiKw3dQxrudF
 QafSveTRNmC/0dO7E/ATU+piZNKcE2ymsbVlbLLKI8aTdmqKPgRCZ8x6iS4AMaA1iRX7
 0vKnaN5+Y83oS2OeEpu/+Uir2Iy6nipA8CpL8BMiEu+gWtUl3+5OrulQuJGWt24DuVgZ
 C+Kg==
X-Gm-Message-State: AOAM530SYJICpoNGjJZLJcQ/FDWBEs8qo+Q2BJ9+696uJHfneXImTIoz
 uISUWPcAbD9wI6WONlTTbVIe3Q==
X-Google-Smtp-Source: ABdhPJz6JpH5zWB/TRFQpbepuVTQnroY7Rn33VTgj4R75UbgHzxlxkIjaao9HnuCeVewtMmcsuS0zg==
X-Received: by 2002:a17:90b:1b0d:: with SMTP id
 nu13mr12905976pjb.149.1619303920738; 
 Sat, 24 Apr 2021 15:38:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id ne22sm10848393pjb.5.2021.04.24.15.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 15:38:40 -0700 (PDT)
Subject: Re: [PATCH 0/3] hw: Restrict PCMCIA to ARM target
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210424222057.3434459-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <951882f8-c12b-fffd-44f6-9697c52b8de0@linaro.org>
Date: Sat, 24 Apr 2021 15:38:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424222057.3434459-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 3:20 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig
>    hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
>    hw/pcmcia: Do not register PCMCIA type if not required

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

