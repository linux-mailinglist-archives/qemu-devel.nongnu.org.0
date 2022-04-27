Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F138A511C35
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 18:08:08 +0200 (CEST)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njkD1-000471-Km
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 12:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njk7P-0007TJ-FI
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:02:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njk7N-0005d5-MZ
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:02:18 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d15so1945813plh.2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KTj1anzyIy8EpmxdNo8bsTZF19d1L0/4kWXS7+k75/Y=;
 b=yNJF774aG3ZE4jUf6RBVAukl5mkxy+iVI/cLkWZryi4xL9ST+IpnBevVE2qIFk0iw0
 AAQOHmaDKhFqJIsiAhf7Pnm3IbNte09vmu50dboUTJKtdkTf9rjuaQA6C2MVXelbUEKX
 rzbC5JCVUdKrB1BvZj+0ChAF9kf82oOZrwXomZr1FUzO6EaBe4FK6QC2ZWGwtnzUh0Vc
 lQagdR+CgebKFcpFo5rBFxB4WfBH3XT3DAboA6HSHJ2fHHfRIOYNqMD00518NHhrcptE
 LEYDOvrQXY/SdEFxKOnu5iEkEJIoJl9P2EByqW9wjMSsI2EVcLUBhE3qrgTyHLveTdxp
 Aiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KTj1anzyIy8EpmxdNo8bsTZF19d1L0/4kWXS7+k75/Y=;
 b=3QOo//DV2qYnG+COXHz3Zg0R3RQz0dYTUJXTPMItqD+TqtC9zmQkPKMI38VFQLcuw4
 lAcHUkWcRk5vumtFUUO2QdlzZ2xLxju+kizqO099hIYjCo2N464xieGL7FmWBlp5j495
 Hb6UFihfpp2/qUv90r/DHeT7VgXUtDaI4emESiMP+tw4KcvK1p4K74PTfRhqb40Ef/OT
 NUTOOiNMV0pv1SLJyrfp1eYnOi5KLN/0K2dCsYmw7Vv990jsW6bcCkqUCUT6X+VUSARe
 qrGizhZi7SZwKEy2zOZrXrNETK9X7dNP9sEKyMwf4GZ58cYEitRlZeHc7J13ifAY6kaJ
 hHpQ==
X-Gm-Message-State: AOAM533Ds2qriS3UppfIwXsZCaN7X+MwCzH5jZwfViYxZu4NIUxHeAg3
 41owernTXpYt/OI2r4TrKtf8Hw==
X-Google-Smtp-Source: ABdhPJweWj2VvuvcKaUizxukoM2al17JGdS0Wtk3O7dsdfaeh2F0epoW2H1KdubF8jlxCkivdn3qOA==
X-Received: by 2002:a17:903:22cd:b0:15d:1e6b:4363 with SMTP id
 y13-20020a17090322cd00b0015d1e6b4363mr14247599plg.36.1651075336055; 
 Wed, 27 Apr 2022 09:02:16 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w187-20020a6230c4000000b00505cde77826sm18900135pfw.159.2022.04.27.09.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 09:02:15 -0700 (PDT)
Message-ID: <33a13867-e31c-5f73-7a2d-957da471e0d2@linaro.org>
Date: Wed, 27 Apr 2022 09:02:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] hw/arm/smmuv3: Add space in guest error message
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
References: <20220427111543.124620-1-jean-philippe@linaro.org>
 <20220427111543.124620-2-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220427111543.124620-2-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 04:15, Jean-Philippe Brucker wrote:
> Make the translation error message prettier by adding a missing space
> before the parenthesis.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   hw/arm/smmuv3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

