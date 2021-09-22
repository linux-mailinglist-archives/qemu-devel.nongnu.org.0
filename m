Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9F414E6D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:56:49 +0200 (CEST)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT5Y8-00038I-CD
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT5VT-0001bO-Rd
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:54:03 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT5VS-0003k7-CN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:54:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p12-20020a17090adf8c00b0019c959bc795so2798520pjv.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=i+/0G7sj2BORX7hJoSNpuNyqQW1P1b60J85H0nEtSpI=;
 b=yiMlU6nl9R9lcN+xKMYqridQbDGUIFOov8ceIpT/ANUB9MefL/tzZnlshD/9nM8LK1
 Gj7QsLHuodbXo8cJXWV90ykikeei/4YvnAwfjw8iVMsulLkIYBnW1xfNLEPoC24NBaGQ
 L5pKlYWS8zF/P5Qutx+g31OUn6mmUyJzqC+dZFPcCCJ9UCH5NqzXQoAtVQ3h33eQpNRJ
 OGIqYVOgoyu5WvaH0XcFxqh+6p8dUGh10xFAasdPMIsDbYYZRPT8ZdhQ7nB5uDTLNPNU
 ZqvdPfsISR6xX9as/JEkKxMpZI2AVN3LyyBBCshUBRE8ulhHiS3UUjAm7nVRd4G2vPgq
 Usig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i+/0G7sj2BORX7hJoSNpuNyqQW1P1b60J85H0nEtSpI=;
 b=nJrXExNrRlPspZLn0PHKVlKS3riUSj/hIyRpT0jJKHIvKexaV7DIXx/iLRu27SGp+I
 jvBfzhVHnzbmQFakw0/0IaF+etrs9BdItHSqkkk1HZ6JMh6+MvHWmf4b3j8Zv0ffPVUi
 K4qTwiLhB69ULf2EdaSmWEeEGiJe++VJBc2LtKRCef92yDuLCm7PgI1yoJBQJU7SlcZ5
 AtI4YmUy213N3MW8ZFoCxO+b74rcJKvNG8Qa2I2FBOe0opTlRJegHEOHG0VRJFTV26r2
 e22zJUsqM9zsWBR3r3V1ycMHFFDhWoC7KQvh5nj1T2w0H2SpH/ThFt9Yn4Rf/d2xhwmP
 Ncpg==
X-Gm-Message-State: AOAM532H+dl8jHOKJ+3YmJ5xjPKoJZyv0CNjiVaOKVCu8CG/9NnaubWC
 jNaHLPkj3QrxknFCQqQYHduLk5AAh+8oSw==
X-Google-Smtp-Source: ABdhPJyl7G1vKHDeyFHwjKUd56i1xFBRRc6Lf3N7l703D0irBaJ9NBMCsglLDZVp4dy3btNEOhANNg==
X-Received: by 2002:a17:90a:9310:: with SMTP id p16mr9999pjo.204.1632329640766; 
 Wed, 22 Sep 2021 09:54:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b17sm3337031pgl.61.2021.09.22.09.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 09:54:00 -0700 (PDT)
Subject: Re: [PATCH v2 30/30] configure, meson.build: Mark support for
 loongarch64 hosts
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-31-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67c1c4bd-b6df-eee8-8229-942dea2446ce@linaro.org>
Date: Wed, 22 Sep 2021 09:53:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-31-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:19 PM, WANG Xuerui wrote:
> @@ -269,6 +269,8 @@ if not get_option('tcg').disabled()
>       tcg_arch = 's390'
>     elif config_host['ARCH'] in ['x86_64', 'x32']
>       tcg_arch = 'i386'
> +  elif config_host['ARCH'] == 'loongarch64'
> +    tcg_arch = 'loongarch64'

You can drop this hunk.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

