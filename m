Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6A95E8C1B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:13:11 +0200 (CEST)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc41t-0001om-UB
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc3z4-00076v-CZ
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:10:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc3z2-0007Jb-N3
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:10:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t7so3621927wrm.10
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=fWoApuiA4TYSy6H8gfY1hZbp3SM8uRptP0lQf38gXYY=;
 b=LGJ/n0K2/A88ci8MeRIEHPYYYltG/CU2UWfi7l8FiLx8X+62fO7G1wqkRO9IYj7OsJ
 gPCp57rvnvRsX3/ODZm72xjQJAY1qk2I2bkUbJIK+uQQNFyueh2PUH4f0S64wtuhMQN2
 kCtGA+hVvXyfSNFHEzUJAjbp/NBxLy/6gB7qjHQGdbw1YWeAdcZ3fsDNA0ee8A09ihYr
 BYyIArFDU0x8NPGG9j2eVtQohq4s9AZdrvA8JvXkVIpnA8il7T6hP8+q3oHLX5peofNT
 pYebketaS+c+RTU71JFMfTxGXaCgY5tJkdvW0TovrV8d0i5gDf3srLLrWPEjlZAC/mEv
 kkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=fWoApuiA4TYSy6H8gfY1hZbp3SM8uRptP0lQf38gXYY=;
 b=5IsyRx0pCwrmjT6VSG4hMdAZHeYwlIl62t0ORZwvok9qHzIapOnpQgur+qNZ4L4vQ/
 3sxY3gn2ujNYpU5qJMgR78PVF8u+TiziaEYK2SL0PYJTLcDf4evdfDWPuaPOqEBHqt8p
 w+BUn769kFH5w9bX7MK+4x7VAouGnU3rYArcjdmWDsV0YAfZvwM3nAK7F9PEgS9IaxuV
 0vQHqjG2/76Uo8EHVxJ+f/17Jaru0+tv6SGwropgIkPbhDhU/k1dxlzCIZSmHNN6vP2M
 ZI7dv6ABskyYHeg80kytq4y2a+nVSuPcFvCvWFlHDTzpQ/3lHOB1Q5DBBvmNIXdxczLT
 LQFA==
X-Gm-Message-State: ACrzQf2dnx63oYqFwcGtOXXEZQdfioGwaFlPXvHRnX3dIufXrfy0hwCw
 x7P2nr/m4Enihh3Kw/Pivro=
X-Google-Smtp-Source: AMsMyM4Asmo16+FoBX4C8Tx85Ps/eFk+50hf8QKoaXq4nuYIdnHG85XaUm8vHNPNWVTFIMTQG1gMzg==
X-Received: by 2002:a5d:47c5:0:b0:22a:6c7a:10f3 with SMTP id
 o5-20020a5d47c5000000b0022a6c7a10f3mr7651485wrc.523.1664021409079; 
 Sat, 24 Sep 2022 05:10:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bv4-20020a0560001f0400b00228d6bc8450sm10349555wrb.108.2022.09.24.05.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 05:10:08 -0700 (PDT)
Message-ID: <bd0bf334-f374-6a28-fa57-4b2521bb4a02@amsat.org>
Date: Sat, 24 Sep 2022 14:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v11 03/15] target/hexagon: make slot number an unsigned
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, babush@rev.ng, nizzo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-4-anjo@rev.ng>
In-Reply-To: <20220804115548.13024-4-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/8/22 13:55, Anton Johansson via wrote:
> From: Paolo Montesel <babush@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 24 +++++++++++++-----------
>   target/hexagon/macros.h |  2 +-
>   2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 8a334ba07b..6741278ada 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -30,7 +30,8 @@
>   #include "gen_tcg.h"
>   #include "gen_tcg_hvx.h"
>   
> -static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
> +static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
> +                                                uint32_t slot)

Using 'unsigned' would keep consistency with the rest of the codebase.

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

