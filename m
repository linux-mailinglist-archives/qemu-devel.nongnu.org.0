Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44955509018
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:13:50 +0200 (CEST)
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFlt-0000sV-AA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFi4-0006JK-Ct; Wed, 20 Apr 2022 15:09:52 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:37620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFi2-0001xq-GA; Wed, 20 Apr 2022 15:09:51 -0400
Received: by mail-oi1-x22d.google.com with SMTP id q129so3157116oif.4;
 Wed, 20 Apr 2022 12:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pKoO2wN75DtupX6mh5AhB1m6iPHSiuSU2OUM7+BKpiM=;
 b=ekTWcOeYj6/o8eamcvB9urreKto8MDGNbqe2khWBflh5cnazdBaZYakYVOaK5fFdDk
 U51dAoAbRL3hPYVYFlVRFT7Fqlx8KloiHCo0y0H86XQnsaLfcQkyH2pn/iohbiHsWsl9
 Y1yNjXYELtm+HYf36X7+6ZGv44jdz/rkT7isYn8jn6G9/AB6YEVwmQCiHhtuVC6Qe7+z
 Vz1PfSjgr1WKeAa0Ke72573/OtLYou7e4gZ3M89McSIHpgLE4qrhbbzhrzanuAy7C4Ss
 wLCxf+qWmNc4poEOU4ZUK4pPjIbtDA1q1EZgqMYrMf1rzM001nzX7ukAjuSRuFJr2jMU
 /3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pKoO2wN75DtupX6mh5AhB1m6iPHSiuSU2OUM7+BKpiM=;
 b=o4fGDRIAu2noJpk6mHb53RGDdQtVqZxnuA7rDilGH1MW3mobDbKPSQ9MJQK/QTY5H7
 ZFCny8pFI9XTmF6ECqYYv6M9p1LfSHQBQ4DE3OovHWFQtVr55BYyHswy44mRr7BCq3Y2
 46WOzCKSEb59OGKjhDxZydYf6z7S0QpPuG9oDeO38itkqpMuwKhXtkRHte5aWACEE4lY
 zCq2AvjgT50rNmjN17CyUsM6t82v+MTby96TEHzy+9AHSMB9kAJ04sGx/YFxTKW/X0m5
 /k7fkxJs4jV53FHfUg9g2z4kTrQqoCrkypRHW5kMc3ql+RzUjZYilPgUm2jrxz92JdW2
 0oRw==
X-Gm-Message-State: AOAM532Ueg82doG9totQ1+eGjjlBxEWAecBC9ymmsVybt45bK7wTJAgA
 6mXRErTf+P0YZ9juGvUMyUs=
X-Google-Smtp-Source: ABdhPJzUNTogZdcjUcUykEtv+P0hPlJnUZp5siz8dbo114hzqnqbHI7GcMafVDdQ8v8Pj9ZCL8/lTw==
X-Received: by 2002:a05:6808:10c7:b0:322:b2a0:8b7e with SMTP id
 s7-20020a05680810c700b00322b2a08b7emr2574599ois.224.1650481788900; 
 Wed, 20 Apr 2022 12:09:48 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a4ab3cd000000b0032830efe365sm6966207ooo.43.2022.04.20.12.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:09:47 -0700 (PDT)
Message-ID: <71f1a4bb-2ae7-b2e3-37be-e09c0e266879@gmail.com>
Date: Wed, 20 Apr 2022 16:09:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL SUBSYSTEM qemu-pnv] ppc/pnv: Update skiboot firmware image
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <CACPK8XfoKNxr6_KkDFFZm0P5w9m_ddD5E4SeuAkypXXr7swR7A@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CACPK8XfoKNxr6_KkDFFZm0P5w9m_ddD5E4SeuAkypXXr7swR7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/7/22 01:24, Joel Stanley wrote:
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:
> 
>    Merge remote-tracking branch
> 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05
> 18:03:15 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/shenki/qemu tags/qemu-rom-skiboot-v7.0
> 
> for you to fetch changes up to 76b349cf7b40349069892bbc0bdae5e5363b27c9:
> 
>    ppc/pnv: Update skiboot to v7.0 (2022-03-07 14:50:50 +1030)
> 
> ----------------------------------------------------------------
> Update skiboot to v7.0
> 
> ----------------------------------------------------------------
> Joel Stanley (1):
>        ppc/pnv: Update skiboot to v7.0


Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> 
>   pc-bios/skiboot.lid | Bin 2528128 -> 2527240 bytes
>   roms/skiboot        |   2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 

