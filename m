Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27564DCCB2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:44:34 +0100 (CET)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUuAr-0003mW-QO
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:44:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUu7e-0002nz-3M
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:41:14 -0400
Received: from [2607:f8b0:4864:20::433] (port=35410
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUu7b-0007qZ-4I
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:41:12 -0400
Received: by mail-pf1-x433.google.com with SMTP id a5so7427906pfv.2
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QFrYNcjnKgWjT8ZdSMdmRAqIyK18gnFKcBX7xzidvrE=;
 b=t7Rg2TSQ1fme5VBHLOf7vjQTgbOegQ7CI1yg3zcXHJZlxzhxUVhUzWrF8L4KWdqTA7
 GZWo495pUQVHJNUVgQo2CkKz8l92ttBVq7lT3/y6spvTG+kV2Jh7VMH3lkpAvJVPDkTo
 eosLzKKisGt+DBNOJVU6xRD/Z2n7Z3YtLuKv2UvK0EkzI7d18ytvPxczkBZ7VPOqM48+
 wp6H9dE6jDrbRXP85OXqMBuXUi/XJ0yQwZB9KSAXQxo97K9eA0+yxvtzH/JsCR3Qwh6l
 KmZaYzrAJYuzVmXpho+0ENPB9DiDprOt7Jbji4bGNITnPOwpdpSp24kUKV91ujFB/T3h
 w/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QFrYNcjnKgWjT8ZdSMdmRAqIyK18gnFKcBX7xzidvrE=;
 b=KXknFGxXn19h87i2XzEfz4W9rZanPMjw5FA2+8Akiu6FehC7G9dwnv5YJPDodqBhkP
 0OApUm9vX6VbxTAa8sG655vcI1OER8yKnAnGFrBvV97k4zqNWOcTWahiEI5mfqt0Xr8p
 Xfssk2d9JONeZJ0B0zjQMxZQw+5FGGlnJ59h5Tl5U6K9myQI1lRVc8JfSYgMd1F1SgBu
 JjdZf4Nnb9zrR6o6AHKc/MWhRiZUrkuoQqTaalYG3gO80dt4f1CyU/SGBoByEuisp4V/
 f2r/nHySfcFNsqc267h3SNx3o+CrKpCtxkPHWyn3Ju6UfIVHOI4BXP5s1ceFFVc+N6hQ
 iXGQ==
X-Gm-Message-State: AOAM5303EsOnVHjiLCTw9bKpYHMv3xWPBLSAUN8Ig8nWruAW95FOYmgn
 37IpL1O0Tb7fdIM4JeDHM1JDGQ==
X-Google-Smtp-Source: ABdhPJxAxO2LZ2ciQ91JAz6uNjTdGAtSmxv14HNjXGmGi+epAOfgDeQif6BcuUiRtwfptv9c+vcDgg==
X-Received: by 2002:a63:224a:0:b0:368:e837:3262 with SMTP id
 t10-20020a63224a000000b00368e8373262mr4663303pgm.546.1647538869421; 
 Thu, 17 Mar 2022 10:41:09 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m79-20020a628c52000000b004f6f249d298sm6822217pfd.80.2022.03.17.10.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 10:41:08 -0700 (PDT)
Message-ID: <74f46831-563e-04ed-2591-420f897dfd2a@linaro.org>
Date: Thu, 17 Mar 2022 10:41:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.1 v6 39/51] target/nios2: Implement Misaligned
 destination exception
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-40-richard.henderson@linaro.org>
 <CAFEAcA8Z8OJpDNOBOAWa4mxh4-Mf4C6Gebfe-CuH87ote2_Odw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8Z8OJpDNOBOAWa4mxh4-Mf4C6Gebfe-CuH87ote2_Odw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/22 09:37, Peter Maydell wrote:
> The spec isn't clear about whether an unaligned-destination on
> an eret is handled as "do the eret (ie restore status), then take
> the exception when trying to set the new PC" or "take the exception
> immediately" (ie whether it's always a nested exception, effectively).
> I guess this is as good a guess as any.

The way I read the spec the first time is that the pc as reported to the exception points 
to the eret, and it's only badaddr that contains the misaligned address.  I simply assumed 
that would mean that the status change hadn't happened either.

I also see that I've failed to update gen_bxx for this.  Also unspecified is if the trap 
for e.g. beq happens *whenever* the low two bits of imm16 are set, or only if the equality 
holds.  I'm tempted to do the former -- other architectures would treat that case as an 
illegal instruction.


r~

