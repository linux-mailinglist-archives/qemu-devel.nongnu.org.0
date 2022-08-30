Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B020B5A6373
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:35:41 +0200 (CEST)
Received: from localhost ([::1]:41420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0Sf-0008M3-0n
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0HS-0004yH-LS; Tue, 30 Aug 2022 08:23:46 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0HR-0001At-4E; Tue, 30 Aug 2022 08:23:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id l65so802376pfl.8;
 Tue, 30 Aug 2022 05:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=0iqPzw30CpvEwTI8U+przrbDdR5NOLPInZVDqqE94tY=;
 b=OlW6nVd+RUBiGjjI6Ji+5EVNfct7lw5G3JMud4xcvQssSGgi537nJFOoppp+v1mzAw
 q5byM63zIA0X8IxES1pCfXC9zeMR6e4GlWZQaIiM/+NjXDt9VY3FjhomsVnlYLXfXRY2
 NzPvdSFLvaUFMXvADpt4/7kLIy/BChD8jCWau7AAIwRXJmaChhsa8wuBJxodA5LdL8qJ
 sjKEDLyNJDQf07Hz4nP9NDOhtuI8rya3IcWpjAbL4+zJbkF5kLuEnYx1U2JG5mVY7npL
 HZpOi+2fj3m3rf3vyMoelAd5KCElBo9DsTghlSHjM5/ubxx553C109l+ZtOAKbLRdkML
 8VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=0iqPzw30CpvEwTI8U+przrbDdR5NOLPInZVDqqE94tY=;
 b=C4+CMXZehrOoBFDVyO/RKrzQDCiGgJccxu0lvQaP5b2K+JH3IupfUeslYfd/AioegO
 3VdOydvWm2Qc0lVTs6X/n5VvYOqcoKnTI23aplmLMUTxGsWdkBsqG2l9fDkT7lDXHx2c
 i/d4tn+oiel09L71Fgp7xmrcSVxJxlZtxyH/TBDU0XJYCMhCFJ1bCqM6jen8OuAxG6kr
 8d3gWONSbxnrcy4ouZY9O529ABQMC5c9MDy50Y18iDRVrh5Ynbre0X79RszFGqdI0EtF
 liWWZ7godIE8K+k9Gbpi805Qt/pfqno1k6vxgy1RPzApAtxTYGFCcc6Dt3/27+CQxpTk
 EWfg==
X-Gm-Message-State: ACgBeo0v62E+NMy9Ug/s+vypoJ+w5bHzEhAsButLISIBxJuKxV/J7HJu
 rbKk/x2kvKq+oV13y+vCoHI=
X-Google-Smtp-Source: AA6agR7vHNpNlRH1EbRGU40k2zj2vtZiTFj2xW+4A8KcmdSOOWvfnYiHL9gunCn3Y8MYEnMJ9ZHK8Q==
X-Received: by 2002:a63:a55e:0:b0:42c:202c:5c5a with SMTP id
 r30-20020a63a55e000000b0042c202c5c5amr8026840pgu.39.1661862223216; 
 Tue, 30 Aug 2022 05:23:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa7956a000000b005387bf85ea0sm1952134pfq.128.2022.08.30.05.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:23:42 -0700 (PDT)
Message-ID: <cc4d372c-7eca-d50e-16da-409e4c1afff4@amsat.org>
Date: Tue, 30 Aug 2022 14:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/3] util/aio-win32: Correct the event array size in
 aio_poll()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <20220824085231.1630804-3-bmeng.cn@gmail.com>
In-Reply-To: <20220824085231.1630804-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 24/8/22 10:52, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
> object handles. Correct the event array size in aio_poll() and
> add a assert() to ensure it does not cause out of bound access.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - change 'count' to unsigned
> 
>   util/aio-win32.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

