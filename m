Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0259D4180F2
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:08:43 +0200 (CEST)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4bq-0005Y9-2q
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4a6-00045y-9X
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:06:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4a4-0004tn-Sj
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:06:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id w29so34879216wra.8
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D6N5eoDkq9bvsuykfuq/8hKaiUdVWZz06X4lnIx54nw=;
 b=lZGpChpDd5jveMyveKARxR++0PqSHb78QEXue7tMvaGDCbVr0M47Y9Q3tIcm1ws/4F
 0HFIPwJF93rUVfUeJXEDBXJ6TKp331dHtYsy4JaEgP0+4llpCgFgEK/2A9KKlVId/4Kg
 jOnhcPh6W+07MgHf5p9jZCQ5hbHYWR91qQaNMg5ZsbdIoGhAGBNkMdynpDJsPHD7xQPy
 lPTWEvJCdibxoB6BaGcuUURze6nXaQ2asO7W519aGMnAfoFz3NJpblI02k9LdtuLucKN
 7NfKoGkjwpFPDGeMH4YiAUqTU7DwBrIUR/HaXHuWbUA+2pT4IMPDGzxpO9cn+vpbGJvw
 YVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D6N5eoDkq9bvsuykfuq/8hKaiUdVWZz06X4lnIx54nw=;
 b=ovzbrNoc1qq/Z3wH7V4hpZsWLTNmx1UMYF+7gBZMg863O8peEiA/Q10ui+br5wKmHK
 Un6s8ltQ9Iq06dk8kWWTzqfugt8gOue6la2yXwx3pucyVaEqU/VGWx7CbWi17tQzBYrJ
 jvvipEH2CGhxG+sJsPDau9vPp7NPdbcCiWW2z9iYf2akR7pK5LeO5NnVG25vCCA72+YU
 GCdflFO1P4nJ6g4cL3yd8a+QveH4VKSq3vekdxRrA8vdNKy9XxyvgXPHwX7hRNHMQdX6
 DCbh5oCRnmdjyspk5KchAQvUW3hgT06NRRW8oWGjai9B7t/n3DqYdCh1P0d5mQk+lOXV
 Fvgw==
X-Gm-Message-State: AOAM533N5VASQa2wPmfG5pWx9y94qGmLDa51C0o4/8rzWzr/3yQ7xR7q
 2Megnm6dwi+uslxcRr6UnkO+Nn3Cor8=
X-Google-Smtp-Source: ABdhPJy+Cyk+sOsOToktr1r5k7h55te83yiN53BT2H3NsNIJHnn9/pGeNs2afwv1Iiz6Vb+gpeHZ8g==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr16094600wrb.274.1632564411663; 
 Sat, 25 Sep 2021 03:06:51 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d5sm11003729wra.38.2021.09.25.03.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:06:50 -0700 (PDT)
Message-ID: <1ba531aa-dde7-ca3e-d48a-2e8776659753@amsat.org>
Date: Sat, 25 Sep 2021 12:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 18/30] tcg/loongarch64: Implement
 mul/mulsh/muluh/div/divu/rem/remu ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-19-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-19-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  1 +
>   tcg/loongarch64/tcg-target.c.inc     | 65 ++++++++++++++++++++++++++++
>   tcg/loongarch64/tcg-target.h         | 16 +++----
>   3 files changed, 74 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

