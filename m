Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E1572763
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:37:11 +0200 (CEST)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMd4-0004zr-LD
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUt-0005Wl-6r
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUr-0004rM-Rl
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id n185so5370188wmn.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SjoG880/7FC0yHFDhx1lxacJ6d3TnKp4COwJuhCaIz0=;
 b=VczUoFt83kG9/K645GPZJBvu0734eO5CjySffVSvdWoeOZAP4XG22tid5hNFjENEIA
 TVCFpw+44uzLbnnW2XUK7J/QjIEb0p4lAT7cQ6pcMuspXlwoRD3Q31/wh32jEXxQEA/s
 Qvg0TRDiWgDyl6TpkbBuF8y9XG+OppmvOakl07V/hPudkeExMUbE4Ya+6sBrDc2mJvaa
 j71nrAg6+mTgl40rMzwGnC4PQ2iYcQQ3l0TwxzWns1gQOB8y288aWxE6Z/TUx66kDI6+
 t8KkJhbV23sWJs08OxXVxieZ3vUh7yL+MnhJQ3rH60ri/tbOS9l1hMf0iSWSJCBMPgRi
 2aLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SjoG880/7FC0yHFDhx1lxacJ6d3TnKp4COwJuhCaIz0=;
 b=BgKtBalvHvlreecnajLHLGQDekdOsfd0bxTWTmlKApekmq++TJbGIvyfuBYurgyFjm
 ajE3u7qGsEJib/8XCmR3PclkEC5c/To4y+Xrg7FpT98Io4m3ygHecEtitWqGviKOiVrh
 fO7WfE8fv9rPi6zkcKDQdJUHVqO8dgW9CBObKDQNE8SpegsooRiI1K+ONVJxxS2DP9E5
 Ci4YUaK+ga85vHtbA3q97j4D7P/XUBbPZDE9xuYoaKWCW7H7p1UCrE4t4C6J+YcRKvM4
 TYT1Ya5fgkEZ25sVtgpBOjdL70DNBgaTLDcQixUEDPk3Si4sz9H20SV/TXcY4+79vdzv
 6J8w==
X-Gm-Message-State: AJIora+ZeULRV7bl9nYlIIlU9LvFdM0lysOAv2fvQoHZ8xd5kT8ZGC+T
 fFzdb5+at3UWk6PggTpiKQw=
X-Google-Smtp-Source: AGRyM1sywQH70xcnh68L006CCiv8Dp1YVKqFXG31jmAsETKKGkC5FIUT91S/I6qqDW8thVjBa0UkNw==
X-Received: by 2002:a05:600c:3641:b0:3a2:df38:7ec8 with SMTP id
 y1-20020a05600c364100b003a2df387ec8mr5908030wmq.34.1657657720588; 
 Tue, 12 Jul 2022 13:28:40 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a5d6050000000b0021db2dcd0aasm2815540wrt.108.2022.07.12.13.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:40 -0700 (PDT)
Message-ID: <4d03b474-88a1-eb52-b010-4454519b8aed@amsat.org>
Date: Tue, 12 Jul 2022 22:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 7/8] target/mips: Simplify UHI_argnlen and UHI_argn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
References: <20220628111701.677216-1-richard.henderson@linaro.org>
 <20220628111701.677216-8-richard.henderson@linaro.org>
In-Reply-To: <20220628111701.677216-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

On 28/6/22 13:17, Richard Henderson wrote:
> With semihosting_get_arg, we already have a check vs argc, so
> there's no point replicating it -- just check the result vs NULL.
> Merge copy_argn_to_target into its caller.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 44 ++++++++++++++----------------
>   1 file changed, 21 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

