Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5755BBDC4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 14:25:19 +0200 (CEST)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZtMM-0003iD-RB
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 08:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtGg-0006Fi-GD; Sun, 18 Sep 2022 08:19:27 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtGe-0006Tf-RV; Sun, 18 Sep 2022 08:19:26 -0400
Received: by mail-wr1-x42c.google.com with SMTP id cc5so33177803wrb.6;
 Sun, 18 Sep 2022 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=2kad/dsKzDGrYCj59lNZ4GGu2fdTfkes4bs5OZNxsW8=;
 b=V5XmnNJH5m2utcI+nniAWeu+1rG/sBDA78mYRDQEIIN7JunU5nf6T2bMc8FueSv6Li
 HOyiBlUm4aD7XI77SCiuuniOKV41qRx6KtqyV7Rph4izqo/13TQIBb1hdWIQOQ8CqON1
 vgI+e+RAezYu+48K0l+RyLj1tO1xjKNTwm8+mMZz+af9zKgeLDLTxxMDeQkp3+mAgCMD
 CiaFSpei7J79Id5FBfMq8rDyGt1gYB8RvsEk1I/nizn6cqlCPkn+2N+Do427STtifl7X
 ZWSH9afdRe2H2XhOsMF+1jFV4AkuaFu+0TSPRgNvTneV26dFpgIgvTdNiSHOasp04Ldh
 0Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=2kad/dsKzDGrYCj59lNZ4GGu2fdTfkes4bs5OZNxsW8=;
 b=FYT31qrotMtW2qhAuAVwnfj7+4ttjZvf6fpFuJE3GmEKK/g8UXX4/iaCtB4F0T9h6Y
 Fif7FmxxDrksNE9XED/958HQJI4x6/0OaEj2JGwLHvHQEanDnwPLi/vt89/YNHeH6lZk
 deD2Q5FKn7I7y5LZ80xjqMxV6bNwdDilrQ5J91uXeA7GuXhHh5KCKAKwPPs0uMTxNt0M
 CK7t0zEvS+B/4N+BnNqePTkSBUEf44kVTJNxH2RSf/0m+H5J9Zv8W+I4HF2OaXwIx1Uv
 SW3gcD46g2Db4/dqBxdHiddZJ3ibcJAouvpK//AtbNQo0FjZrOBZGMzt3MJTa2uKSPPe
 jsDg==
X-Gm-Message-State: ACrzQf05ML1CTAZMDD0CTSflnADlWf5inDEkwahQ2uH4t3+6HLEHXsv3
 jeSW1zAejaDNRtRYlsHC4NCLhozfyis=
X-Google-Smtp-Source: AMsMyM6lO9u34pJ3wt/btIMjcyB+hYxkPM12TeuMsN2x+f5VrAtU/FCHvlpIaRryFZlbGoIkUYuRcA==
X-Received: by 2002:a5d:67ca:0:b0:228:7ad5:768f with SMTP id
 n10-20020a5d67ca000000b002287ad5768fmr7881407wrw.163.1663503562653; 
 Sun, 18 Sep 2022 05:19:22 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c28cb00b003b462b314e7sm9405022wmd.16.2022.09.18.05.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 05:19:22 -0700 (PDT)
Message-ID: <0cbc6000-f792-6ba6-299a-1624c952a39b@amsat.org>
Date: Sun, 18 Sep 2022 14:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 08/11] hw/sd/sdhci-internal: Unexport ESDHC defines
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-9-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
> These defines aren't used outside of sdhci.c, so can be defined there.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/sd/sdhci-internal.h | 20 --------------------
>   hw/sd/sdhci.c          | 19 +++++++++++++++++++
>   2 files changed, 19 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

