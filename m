Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F076B61319F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:21:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQ2B-0006Vf-0m; Mon, 31 Oct 2022 04:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ28-0006Rm-Uh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:20:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ27-0000R7-Bz
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:20:36 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso973652wmb.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=antTnk6cY/pZzC55G9i2DZHe+xIHwkpGAISHIwCwXkI=;
 b=IqRvojKHik+uG351o+EdVvi33P6tHE3ALY0LAhjgR5/alWQTeW7xIJom3hrczYCIw/
 drshtpl3PsN29KKqxgdCQ+NvSyDSFOewD3BtlOjpbaOpBhzYpP4ZBNXJtoBF3ZOeAVcI
 TX+jECdzjaa79hyY4c1akV8mA2JlNVf4SW4lEENEPNd/kuf6ysdQdUzcytCuGTy/TkEn
 XgSRuadJXlSbmWJEcBoZGOE6FRR5w3UBi1kPUHfrx2tYhZhvoGVYcn7JdKLGkoD+ugjQ
 Px7CGPbDjyrgT0ArAE76da+Yhn46iOBkudwrQq+uP4q5y6UkiHIaHe7tasqyO04kEjPt
 ZEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=antTnk6cY/pZzC55G9i2DZHe+xIHwkpGAISHIwCwXkI=;
 b=v6/zcC23Q27qy5B6WzhabZmJCmmSqnJ5GBSqqtCiBHlpMRHE+7K+L640kooiuBBeyI
 ipSj3LE1aYgSfDCJVxumwDx+9gWeZrljxbDT+bVirztgynw0Z9pTg0giCxcixxFpWTnB
 DcdkRecSGECLyCtagmDYUL/MuFHHs9ci42Jt00DXen9zTDpB8kKTLJ7pyb3agbPs8lrs
 AC397sGHDVfksv64ap9mIfhJIxvTJ/QnsfR4ebgtMYUevS0Uspm8xR6iXyZ8EMsMano+
 ii9NSs3hHBo4jxI/gdvp3lXmg3ofT3o34atg2FAIJU0xJHsqLj0N2xDat5ZaKYdKbcDa
 cefA==
X-Gm-Message-State: ACrzQf0EevazIticOkTJ6wKVMQY2/C8TVwLpisdm2ySR+748xLCdGOuR
 hX4oMMFMIAzEW9ksmuIhvtHgWA==
X-Google-Smtp-Source: AMsMyM5y3z/hlxIDkql/y1idU+Rmd2N+jssktAVnB6+IJevnBVryDWbakZVS5GH/jaDYXlDpoHo2AQ==
X-Received: by 2002:a05:600c:1d2a:b0:3cf:7332:946 with SMTP id
 l42-20020a05600c1d2a00b003cf73320946mr1406387wms.126.1667204433987; 
 Mon, 31 Oct 2022 01:20:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002367ad808a9sm6311102wrw.30.2022.10.31.01.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:20:33 -0700 (PDT)
Message-ID: <1f724d9b-550a-413b-1fb9-dc068d766953@linaro.org>
Date: Mon, 31 Oct 2022 09:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 02/11] hw/timer/imx_epit: improve comments
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-2@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-2@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/22 17:33, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/timer/imx_epit.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


