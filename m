Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C092999A6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 23:27:30 +0100 (CET)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXAxd-0006L2-56
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 18:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAky-0002f2-NG; Mon, 26 Oct 2020 18:14:24 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAkw-0006px-UJ; Mon, 26 Oct 2020 18:14:24 -0400
Received: by mail-ej1-x642.google.com with SMTP id p9so16132069eji.4;
 Mon, 26 Oct 2020 15:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IqZdFuxZIgRYJvizMKfIjMdKNCayeP/lE7qlR7OAGGM=;
 b=u856KuGF2eMWOyTgaIw/+CAmbSxpECpBnJpfCBqbVIBV9yoALMh65SpJHE4nw5+RJR
 GE87hX2cjrzVj+lQQ+Dc7hgqIBC3Udkn2upyCMlOGe3Fe103/zquTawGHUa+0+bydyq2
 jEXbOsQZF/wB7pzkBnB2dVmVrbsjYDg8Ngvo9vaLwyNnOG8sZLg3+dZhqHFyDWzxldCc
 68nbc6xDOEySShrE+AeUpd16B2PPZtNgnSZGVgBZ+cq5aE1uaGP/hN6KrWwDFQLGfOpG
 KxyZ/dCLZ2pmBWkSSsYtimHTQwysZWvvSSX6nNZ/YrO1Riz5Qz9rP6+y3T9nM9S5viAU
 CGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqZdFuxZIgRYJvizMKfIjMdKNCayeP/lE7qlR7OAGGM=;
 b=sIWxJg05oawZRr6x4DQbkCYG6PPVWBoV+MxE6L1+fcR/KhyZfMpsjG9L9dWZTko4+D
 wKQ2fAsZTwTTsNKERgIG91PeJB2wUTCUNRoctW1YofUzipVqplzntKdcbbHyjMziK7um
 CNu4La1fPuNhC0W+vgoEl91Ji8Ln5neEP6jhDQ25U4i6WBWd1Rkun4hYpHGPH1SnoWnC
 aAhzJdcT1/zUEVz3PV4MnxVvmqG9zp6ZLcstbGnx2xNfTNoFZYkkZLVo5b+Stjnxhe83
 zPSmBSPm1nO8sZDl/Fip2MOpkIQ8EnAB9RrwAJtRLkc9BGCHfbr3j0xitbgwClIR5/4w
 RpAQ==
X-Gm-Message-State: AOAM5308NOx4WkQx7c2Fpi63vAqJ2VqZWOvTmDbiX5fYvPRpchGQC6D4
 PfLVpMjZGwy70OS2arAGzIdiK+O2Znw=
X-Google-Smtp-Source: ABdhPJzaX/PvxR/HxCo7701bBUJW2BNtqB/PvzDJQOxMmkhQ+cOhI8A4DXu9qYFyA2tyToiy+ETKxQ==
X-Received: by 2002:a17:907:118c:: with SMTP id
 uz12mr18127479ejb.98.1603750458776; 
 Mon, 26 Oct 2020 15:14:18 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id op24sm6576255ejb.56.2020.10.26.15.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 15:14:18 -0700 (PDT)
Subject: Re: [PATCH V2 04/14] rx/: fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>, qemu-trivial@nongnu.org
References: <20201009064449.2336-1-zhaolichang@huawei.com>
 <20201009064449.2336-5-zhaolichang@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bb1673cc-4edf-9ec3-b7e6-b179fad29f41@amsat.org>
Date: Mon, 26 Oct 2020 23:14:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009064449.2336-5-zhaolichang@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.167,
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
Cc: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/20 8:44 AM, zhaolichang wrote:
> I found that there are many spelling errors in the comments of qemu/target/rx.
> I used spellcheck to check the spelling errors and found some errors in the folder.
> 
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>
> ---
>   target/rx/op_helper.c | 2 +-
>   target/rx/translate.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to renesas-next.

