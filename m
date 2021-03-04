Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A6A32CA50
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 03:04:59 +0100 (CET)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHdMI-0003FG-Oy
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 21:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdKy-0002hM-C9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:03:36 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdKw-00038l-VT
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:03:36 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l18so5712155pji.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 18:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rkwh4s7pQAfsSrIJ3AM64jjb5p8K54Y0GIiVSIhs1Uk=;
 b=NeICh5seTvs0+h3eCoToV0G9Ifi85ocdik/ICpg7alVPtMV8vPqL73Gb/dfhRpOV1r
 vfeQrsKMIT5ByVxw74LeBq/e/06sLSvsBYXF7aGXAEZ/poVojaqoEq2Rku9MNNeSqE9e
 ZvQKqaiXKmDcFFt6Zitaba5KsJcpwGo2DueClrIcW5OI4+VYbp2FqDUiyAaMf+Dk+TJm
 peyD7oourvQbymzRq70RcRI7/RSNglIG5qSG+NwfbzBZSjdwLGQgKSFAtv2U1EaRhU85
 1oettoSrH31RmY6D4+3/tq3G9QP+10FT4zUDvUTT0aNBEwctl9Fv+NvYw6/v2aiBUVEB
 QGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rkwh4s7pQAfsSrIJ3AM64jjb5p8K54Y0GIiVSIhs1Uk=;
 b=m+wwWlPFyh1H4NQRm9TwLmVBvVg4WD01OI4cM/I+BiiuPwnhbesLacvSerOD1MLzlU
 9PsbQ+DDeZd6JUbPoeXFxmaCsBMuzDt4o45Li+1KIBXgcjNKVU1QGSw27eYdgZu0hSK0
 IbH3S271S0n46Yo4wsHFh+B2C+dJddKRmG3T42y+iYW6UAOVT3aHPWi/4kz2iewvSEfu
 vR2+dyKzdZTtDREk5XtelU9St1Xlwxe6s1F9FWI4JkHBdvfQ3ywYxmbA4maGrDJwwgFh
 D4kBgXR+ekYdbw1Vg90oruKwKGJLXejSw+L8Ppv0azdPU7IacAd2c/CUk2aTa3BkjtSJ
 4aHA==
X-Gm-Message-State: AOAM532xzZrkIxq69EtE/vcWn99LyCdV86IRmqzvDR/T8X+pFhUv+uvQ
 7NVxGrIefS3lG29Fn5W2p4g0XA==
X-Google-Smtp-Source: ABdhPJwt++++YmarTAxwYlyl2mt9Ql5F9jmiKyCfmKZUzlK33xdkJR3recxX4bwU4gllqznzn5Qdmw==
X-Received: by 2002:a17:902:c14c:b029:e5:cd82:a0b with SMTP id
 12-20020a170902c14cb02900e5cd820a0bmr1908458plj.34.1614823413459; 
 Wed, 03 Mar 2021 18:03:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v126sm24408673pfv.163.2021.03.03.18.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:03:33 -0800 (PST)
Subject: Re: [PATCH v2 20/24] hw/arm/mps2-tz: Add new mps3-an524 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccd5a3e6-247e-9d2e-e1ee-c2171c5752fe@linaro.org>
Date: Wed, 3 Mar 2021 18:03:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Add support for the mps3-an524 board; this is an SSE-200 based FPGA
> image, like the existing mps2-an521.  It has a usefully larger amount
> of RAM, and a PL031 RTC, as well as some more minor differences.
> 
> In real hardware this image runs on a newer generation of the FPGA
> board, the MPS3 rather than the older MPS2.  Architecturally the two
> boards are similar, so we implement the MPS3 boards in the mps2-tz.c
> file as variations of the existing MPS2 boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 139 +++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 135 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


