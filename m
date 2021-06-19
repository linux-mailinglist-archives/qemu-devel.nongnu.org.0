Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F903ADB39
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:08:04 +0200 (CEST)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufNz-0006pC-45
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufLW-00041r-NP
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:05:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufLV-0004PE-35
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:05:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a11so14568822wrt.13
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yTfKBoglapl5NgCfc5b0u36xKFdM9psYSGYsmXGbw+A=;
 b=T4UKZkVYlsMccARlxXmO0uwm2OF6sZxLr/wkmNjsF5haOrIfPJALih8O9GqiaRqqO1
 23SMJSc8tMUkP+V48ZTw3FwwuLEcb77x4ceEWGBmOEjT/nj5KniuA9M0nMDGMa/E5Yyi
 6HzjVruLy6Tg/Yc5cbPrlncUttAaoIlPJnSR9yQLa+eGhFw+zkrTvquW6yE3LA/z9Bqp
 u8ogxErP5pUrbX4B7c0+usyJjOqzzqQRpRvq5Mz9uVoXbOlzDpSdSZo9C/HjT+y953xW
 8n/HlH9KS7Kyw7FCuorZDf6tuCi5c9bQgs6tvP1B2wIEobuAm1bBEz2hjhCcL8X5MuF7
 +jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yTfKBoglapl5NgCfc5b0u36xKFdM9psYSGYsmXGbw+A=;
 b=rMPaq4Gl2q9QljEg7QO8m3i8PqvFGQbMyYM6p7OASPOFsBV97IW9kKIeF1/DU3gDgR
 JrR2uhK1N7RU2mR6ON5TWhsHT/ppNLTnXes3DqFWbwM6nZJ4Ml2tfJVF55PwdjGTt5Mm
 M8mSHo//SGdzmx3Sf9q392JAp9DZyGmyNFMLUpHikvQSK5DeKCeV1SXvB0pfVUWV5hbV
 4L7OG57uwHxI5Sz1M6cEf2209ZIEqcu70HtvT94Ja00ECZ26uC/K7/+qQRemiH76zQ78
 r5LcQgOLCELu8Q+q5xVtxq9048zZJPf9vSOduMAGIxVJ/1r/RJB8lw7BB8KNQnpjjulZ
 p+iw==
X-Gm-Message-State: AOAM5311fKF4curDp+cvE12dVth/BItka/YnZ6jTpLxb3VMLRJ3HKusq
 Bp7IMlBlfQmdaKB/v7dEe1w=
X-Google-Smtp-Source: ABdhPJyW3T14e32X23nOlYTi6xn80HTpc7Yt26nOuj2BNvm7Xde+MZyq0KKhj7cpiKpmGYcniGxW2Q==
X-Received: by 2002:adf:fc82:: with SMTP id g2mr11355895wrr.323.1624125927621; 
 Sat, 19 Jun 2021 11:05:27 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a12sm12396721wmj.36.2021.06.19.11.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 11:05:27 -0700 (PDT)
Subject: Re: [PATCH 0/9] target/mips: Various fixes & cleanups
To: qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d748e437-4909-b1f9-f8c6-399c359d4c71@amsat.org>
Date: Sat, 19 Jun 2021 20:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 7:43 PM, Philippe Mathieu-Daudé wrote:
> Fixes and cleanup accumulated during the last month.
> Nothing particularly exciting :/
> 
> Please review,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (9):
>   target/mips: Do not abort on invalid instruction
>   target/mips: Fix more TCG temporary leaks in
>     gen_pool32a5_nanomips_insn
>   target/mips: Move TCG trace events to tcg/ sub directory
>   target/mips: Move translate.h to tcg/ sub directory
>   target/mips: Restrict some system specific declarations to sysemu
>   target/mips: Remove SmartMIPS / MDMX unuseful comments
>   target/mips: Remove microMIPS BPOSGE32 / BPOSGE64 unuseful cases
>   target/mips: Constify host_to_mips_errno[]
>   target/mips: Optimize regnames[] arrays

Thanks, applied to mips-next (addressing Richard minor comments).

