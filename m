Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CC26B20A1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCuO-0005n6-FE; Thu, 09 Mar 2023 04:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCuM-0005fu-0b
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:49:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCuK-0002Kk-FC
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:49:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h11so1238363wrm.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678355395;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tHlJ4qy55ni4VF5z7w/3mASU7NrBcUC7CwfZ+LylpCw=;
 b=HstWCm3G78usbErZPP1OLEYP2e+er+n8ykeKJXjEbi3oToHrTwCCYaaXp0fTvHJLI6
 DV2AIdxsK3e+5JCaCmgggh2LQuK4Z8IYqsXuMcixCP/6JcjhDSgNAnYn0XyaF7REQcbV
 ONThIq68nr0vNv+ATY5mMXFjXs8tC6cYIJqhUzJwtYTrhPwHAMXDqxOgNgPKMHOV5BwH
 mr8UmoimdvdhCpBL1IsHGmT3RCnGrJw3U0eYeqFGmRNDM6oGH74b5hZyPfogUHRXp8x9
 hHI3b5mmhgGsQwycUotTiHIPBdVZwqQ35rmbgi2HOV76QWQsmI2iGpGt8in5vZqUse6/
 KTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678355395;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tHlJ4qy55ni4VF5z7w/3mASU7NrBcUC7CwfZ+LylpCw=;
 b=DsoTcBK+o0O6FgtSfMhBwLSq/cpw/9LNlZofsJMZi/iwoTu8BSFPLAnLudDbk87C+F
 +xgk78r4VVXRkbspo24D2lfopQ82os2pQYXx6HEu6M/h2pSPz0v2Dj9gZ7ZNrsr31ji1
 pA7h+kJT5gixWhsLX+5gWM7lLAFt5XP9juZNEaXuJwJ+N9Ng1uCxm9lW4npHo+HcsDK4
 p5fMRmndMxanTnu979tqSNMSXl13kZGFbZX78xfjTE50E7L06KBz6bGbzXsfa88fxh0z
 Q8vXPHnlPOp+5ZQZOj4zK11ZCg5aPYaTKOCI15EES9Gm9kn88uFRdht31sqsUmgoqxMu
 9jVg==
X-Gm-Message-State: AO0yUKWo/pCaE8gqWTtB++3pz4WtYREISjdyR71EdEoi39wP1pmdsbDv
 xkWSp8wO8UDjPBynPfbohbCi8SYkXWNdsCqsW28=
X-Google-Smtp-Source: AK7set9bV25PQBcXoIDG62gThhD8ISLWWu2L0apViAk0/+ARtcCzmEIq8nP4/KYMyOuhCk7L3bDMwA==
X-Received: by 2002:adf:f389:0:b0:2c7:31cf:8be1 with SMTP id
 m9-20020adff389000000b002c731cf8be1mr13600860wro.12.1678355394914; 
 Thu, 09 Mar 2023 01:49:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003e118684d56sm2234370wms.45.2023.03.09.01.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:49:54 -0800 (PST)
Message-ID: <fc5e2074-d602-782d-a8b2-aaea1fb12186@linaro.org>
Date: Thu, 9 Mar 2023 10:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 15/25] target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 19:34, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate/vmx-impl.c.inc | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


