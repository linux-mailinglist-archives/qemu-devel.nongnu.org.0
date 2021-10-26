Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A795743B538
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:13:05 +0200 (CEST)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfO8O-0002As-OG
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfO2W-0003O0-K0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:07:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfO2U-00031d-U6
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:07:00 -0400
Received: by mail-wr1-x432.google.com with SMTP id d10so15763243wrb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Z6Z41YNP6xgQmg2q0dNQQo2VCoV/pg8/td3AIcTk8U=;
 b=Igu0cN40twJTTRSBZhqwqcogAdKpvgvOVteen0zV21IY2eKcjQs1SjdqxhNmpO2Ovt
 zy9xuyJczeXabl6V2YsrPHF+LeYslhv1waQDmhfRddFv/EQh3vOFzYsilc3gd5eym4Vq
 mSMEe5SZocukGx1VzzkkswRvY1FLtNnvk11Halpgw9eKVl1shiMaeliUbYUewcDIsFAT
 QW4T1YNwH7N/N1Drl9D0djpEYoBuDiH9SNF/xU8XMpOZR3ZpJnU0wQddRAzpTur/1yY7
 teI0/+KSv7g0v2MKvxF+KbG3OXpUPoP1l3NvLB7/TVVryjenwd84y3bnQZVAEzOiwifc
 AAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Z6Z41YNP6xgQmg2q0dNQQo2VCoV/pg8/td3AIcTk8U=;
 b=k5KxkQp9MwXU4AdAsZ9QNHUmqO50DXEbvPu/NwaWgnAM5KtIqBd4GAdacjLccoNt2a
 o4Km1+5bjJH12W2pWZhIhBeMnX63x1L41/sksLfQjnzX9uCjN/clitZB/zf0vwpQXmJ1
 7dTu2xWdn+ncx05RYoXJQU4RoiUDgcczMCTXWO8OXev/aAHOb6+/PFXp+6R82YG9l6Hm
 lZ1uthVf4q1bm4FZwhLqMf3oMhPmfMdK4v08V2VfVCJX19TYP57d8EE9xcwGV1sbmmcj
 WiaUubbQtv9QgMLscrADLc1l7RDVtoyQqPaBHcK0oEGy4VCFnI/G2NU+dPEZrrliedyi
 UHNg==
X-Gm-Message-State: AOAM530wSI2AGwvaHyFoAz6z40LUK67awiNCHwUOqmwiuCSE1tzL45CH
 4BMYvM9+lOyDIu+LCWpWJTw=
X-Google-Smtp-Source: ABdhPJzl/NIvO6YbcpRJNDsPYfHcHFym/97/UP3hWt/Dz37CeR7zGQ2UEg1/f3QPXL2A4bUNvX/x6Q==
X-Received: by 2002:adf:a1d7:: with SMTP id v23mr31887105wrv.171.1635260816508; 
 Tue, 26 Oct 2021 08:06:56 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o17sm934666wmq.11.2021.10.26.08.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:06:55 -0700 (PDT)
Message-ID: <ec3deac3-8e62-dd38-cce6-4eb014f68e09@amsat.org>
Date: Tue, 26 Oct 2021 17:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 13/28] plugins/cache: freed heap-allocated mutexes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> From: Mahmoud Mandour <ma.mandourr@gmail.com>
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210810134844.166490-2-ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 3 +++
>  1 file changed, 3 insertions(+)

