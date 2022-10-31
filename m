Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A086131AE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:26:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQ7P-0003TI-J2; Mon, 31 Oct 2022 04:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ7N-0003Ri-6p
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:26:01 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ7K-00032r-QG
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:26:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y16so14825260wrt.12
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQ3+RbPefYy15I24vEHxDKa54ZKc/18d7867RKmQR+c=;
 b=Y5Et1INaMKU6i5poymjnpbQRbMnCK8rF3qwujBkdAOfI96dMZxO7wgH7M2nRIYZAZy
 BSSDNak8Jj8XOxYDGVaRd8h0ZGyaCR8eWRSgWKD+Nqc2ib5+nFq19YoIF8pwI+J3A0Fc
 qHVyDxcFflGZ3l6QWeYqCjKKm/AkZIlS7xqJ+l0lIQ+gEoMn0VK1OTbT18qgucraKJFn
 vOuZjoEsddm21rK1kdAXwZ707nLH/APNYDfoz6Dq+jP9kyI7acTtCFPMPizvL+PNYkV2
 Q58FBQNBX3+M1gS9foUrXzBpKcDmGeULsUk8JpNek89lv+hk1bqb1uAy6B0Y1n+R/wxc
 mN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQ3+RbPefYy15I24vEHxDKa54ZKc/18d7867RKmQR+c=;
 b=LxPonnd96G8wlExPCiMLVAz8d2LXZ3pNEtfrJK9ltpkEKSEKJgQDPkdgjkHoub4oL0
 NAAZ1DAqfwicWQLLTJoPKpdE75TP4fu3ZFW6hsHiYjgsLLDyeMWIrOOMDcOReVorBfKY
 BxyltLClrfjUavGEuwr7iIpsx3370eNtx50SmnFfUGRGS3FZbtO+r1ZPnu3LssJzAlx9
 Gt6Px2joCoIbDCCuGVHi9Hv95VMs/X0TWVr8esXEcRT0/7UyNFJeSa//494ww4noHPNK
 DvwL6XSw1HK4npsJuCnOE2cipHOGITrpuljiF/PxT53Z+GHFR5UUgwtzO3kdMHs8+6wh
 HMdw==
X-Gm-Message-State: ACrzQf0zetUq70ZT2W/vdRJ7sMNb6Ry5T8Wt7OxhHt4OVYSdwDZ/HZxZ
 zyrsW8PiRApVTY6OIKTnP2Q2+g==
X-Google-Smtp-Source: AMsMyM47XSNoselDqpdVVD2jcqF4Ku1BgO7YkG+oAFgjsnjJ0RedsSsdcRpqJlBV4g5MtwhcwgY2jg==
X-Received: by 2002:a5d:45d0:0:b0:236:8201:1cb7 with SMTP id
 b16-20020a5d45d0000000b0023682011cb7mr7108772wrs.417.1667204757065; 
 Mon, 31 Oct 2022 01:25:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b003cf75213bb9sm914725wmo.8.2022.10.31.01.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:25:56 -0700 (PDT)
Message-ID: <3ea4f10d-e807-b48d-0eda-19d70763c960@linaro.org>
Date: Mon, 31 Oct 2022 09:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 11/11] hw/timer/imx_epit: rework CR write handling
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-11@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-11@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 31/10/22 01:28, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> - simplify code, improve comments
> - fix https://gitlab.com/qemu-project/qemu/-/issues/1263

This doesn't match GitLab issues closing pattern:
https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern

> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/timer/imx_epit.c | 139 +++++++++++++++++++++-----------------------
>   1 file changed, 65 insertions(+), 74 deletions(-)


