Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D15BBDC2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 14:23:14 +0200 (CEST)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZtKL-0001wv-Av
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 08:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtFN-0003ty-9k; Sun, 18 Sep 2022 08:18:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtFL-0006Oe-R6; Sun, 18 Sep 2022 08:18:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id h8so36043996wrf.3;
 Sun, 18 Sep 2022 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=O5FR/vwNMxQVS2jlik/akEU/ruMhXSCdrJnYzugBRmo=;
 b=cyw2P+Q2xwWgNghn1jOzVaHYFBHSPAKfiLTfa0QIpdGX6mL8z7Ll47fhbQpjEyV3fk
 ylA6NNnDtFWLMmno/rxmvD7o3s8HMGZCa3To/q0U3vewmiSCBLG1DzTsM9C6cquHGj0g
 0kB8KO68oCZrRa36CNJozm6hcaqKHOoqOzkTLqP5adIigqP1fVWe5hZM/dfw5KH9U3q6
 C7i3LSlDw0tjq59YNvCTNwiNUivhiOMYZDlSDvXZmTYJ7jc8ZprXGGm4AnPKuwa0YPbz
 5/DDS5QqePwmR+Ic6vtubuBf58mMZRdQRLHRIolz4aWTeMuKl+5cmAr7n+nRTEU4TLBM
 x/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=O5FR/vwNMxQVS2jlik/akEU/ruMhXSCdrJnYzugBRmo=;
 b=3qdgsbRm0j9npjC/8pnwv9Roa32iqm4tVJYOwZ1X08cJcczppOqxov/9DfQJI0vrp2
 16wFuan+1ClTf9XVIc+Apl6PmviMq1gtzSte1QV9Qo2szq8hh1dWZcZxOoMdxqkaQoiq
 L8ciHqwigRFIMT7t8vI2HOXnjpV9KTXAqIPaVekLUi+9lzu9/uc1eQGUpnHEgy3uqi1Z
 CJde/PcZ3gDqofYMSrpFnnMy0/s2SW8WXNd4HKtnTD6393ucoJBfzo/LQa6aQGTJIm/9
 Hh7lT14SCWowkE3FauCy+MlKgmRlZKc1BRO7F2IWOfNVpkdu0xAsXFR0uToVF1PNS3yv
 AdjQ==
X-Gm-Message-State: ACrzQf1bFxHoHNrRv3Fcbmis1egD+N4BPUPBi7vQ9cegU8ONbebenpcq
 VLmTHG960ct+qcrgGKu9S/lvVKLzix0=
X-Google-Smtp-Source: AMsMyM6NV/RPg2r73U8FJ0ppOaSZvYuHqnO+G232W8cN0rmKQNntaUoBDBT5QEKIGizHnocFyFSJOw==
X-Received: by 2002:a05:6000:1ace:b0:22a:c9a6:e203 with SMTP id
 i14-20020a0560001ace00b0022ac9a6e203mr8211206wry.694.1663503480735; 
 Sun, 18 Sep 2022 05:18:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c204a00b003a5fa79007fsm9364753wmg.7.2022.09.18.05.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 05:18:00 -0700 (PDT)
Message-ID: <4d36e8f1-0c1c-ee09-9de3-ff2b8c5cd5c2@amsat.org>
Date: Sun, 18 Sep 2022 14:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 05/11] hw/ppc/e500: Remove if statement which is now
 always true
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-6-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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

On 15/9/22 17:25, Bernhard Beschow wrote:
> Now that the MPC8544DS board also has a platform bus, the if statement
> was always true.

s/was/is/.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/e500.c      | 30 ++++++++++++++----------------
>   hw/ppc/e500.h      |  1 -
>   hw/ppc/e500plat.c  |  1 -
>   hw/ppc/mpc8544ds.c |  1 -
>   4 files changed, 14 insertions(+), 19 deletions(-)

