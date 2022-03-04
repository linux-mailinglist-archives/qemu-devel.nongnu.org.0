Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604634CE143
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 00:56:44 +0100 (CET)
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQHmt-0004nK-Gb
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 18:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHlH-0003L2-1M; Fri, 04 Mar 2022 18:55:03 -0500
Received: from [2607:f8b0:4864:20::1036] (port=44816
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHlF-0001Ok-KN; Fri, 04 Mar 2022 18:55:02 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so9175767pjb.3; 
 Fri, 04 Mar 2022 15:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/C5Efif1d2CDO8LCWs1fSo42W+5+JfZwwTEVjYBXgtg=;
 b=WjAsPkRJBBagAulzUgmzAXzIHjj3tuAN9FlKXSEtx/Yl1N5aMv8+gpU1QmAqaAFFyg
 cTHiKxZFG8qW9vQOPT988Aa1O+LjAX/XOD4pRB+DmqSv5QTC7JWl7bwb8FnZIyL6/jHu
 BL8BXe1VpWxjdVwhjhK/5yunYXe8JLE0Pw4pQLSNTrOvLH1c+VCVEIJoPhW4GVcNKWPF
 amqHqWyWGT5X6979u3dRIPoaP4Lx91RGeGUBQjkMNRETBr56Qwr5+YVvzi78WHvsSG/M
 5ggfiWEw9zvF9/cG7xcPScAsy9N0P0Ph4RiM+SCbiqd6pgzypX2KOCP2hTuOmZ+2aQtq
 wjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/C5Efif1d2CDO8LCWs1fSo42W+5+JfZwwTEVjYBXgtg=;
 b=PG19+6jnu+tddaclMl/OaxFCNIAgrFqBx37uxooa/64M0ao47A8hx0yEXpYpys8GR2
 c/h4NAfHM2RNMCl58QPO7ODMsVao46SeHSjoMl0ZVPw7+NpDU697DjD9Q0yVaOl6+8sJ
 iCR5qNzQR2hFtx9KwBv4pVsfQiPoQ1GcydAep7V2nRYNbk1nGqTcuZEmMPDGp0WmWvx5
 UBghcLUNtz2jkEjZu3lw1n1+FhUe5Q3C/c5w8xe9+Y06HI2sf8m9/eqoZd0djoUGKK23
 17a45rkGO/PkbEzOmHMK66LI41PcW3+DeaRj+h6fKqxsCSThDsEKXMMeFBlELlX6KP9e
 d6RQ==
X-Gm-Message-State: AOAM532aKFXo86efyxyHT45aJ8prLLurl9qTLr9TSjLst+spp9i03o23
 QNyVCdkkpfaPZaQEVr73CXQsdoBR31Y=
X-Google-Smtp-Source: ABdhPJysONT1rteQALPguRCpfyz64AxuGAajPdhzb2n2ByQewCXmslFdGbpg2+IOlle/TSLGGMmjfA==
X-Received: by 2002:a17:90b:1bc2:b0:1bf:993:f736 with SMTP id
 oa2-20020a17090b1bc200b001bf0993f736mr1117079pjb.190.1646438099998; 
 Fri, 04 Mar 2022 15:54:59 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a056a0022c700b004e11d3d0459sm7167566pfj.65.2022.03.04.15.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 15:54:59 -0800 (PST)
Message-ID: <980c5b74-744a-f5fa-843f-31b8f55703b7@gmail.com>
Date: Sat, 5 Mar 2022 00:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 8/9] hw/sensor: add Renesas raa229004 PMBus device
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-9-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-9-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 02:50, Titus Rwantare wrote:
> The Renesas RAA229004 is a PMBus Multiphase Voltage Regulator
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/sensor/isl_pmbus_vr.c         | 18 ++++++++++++++++++
>   include/hw/sensor/isl_pmbus_vr.h |  1 +
>   tests/qtest/isl_pmbus_vr-test.c  |  8 ++++++++
>   3 files changed, 27 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

