Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CE564CE7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:18:10 +0200 (CEST)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ETJ-00075o-JI
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EP2-00049y-BQ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:13:44 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EP0-00011M-JW
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:13:44 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so12465911pjl.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FPlhmMpt1AsgT+f34c/eL4ilsYS+8+9lcDoy/duXv0A=;
 b=uM2wkyHkHqoIj7Gg/Bjg5N5vUzUPAYeL7Ri6V0ZO5alodEa5HOAVa5Jt0XpsV+s2gA
 WTJisx8mmbFsAz3tGfdiF6svlGLkTvopNBQ67JdmaxM0zsn2Ww+z1h5AjBroUYvgVYkQ
 4KatKUPsXtcApGy04NkBvwkAf6CvAy2MBuRCGbOgQ6pE0QR+LGGtdI6zJePGyev8QlA8
 xGIsOhRl3DLSM+fk9u5lzZGiqyqr8aqc+Bd+ILEDaHoPcdd5VIkcD1jCQ+EPIec9ZA5Y
 byowK89OSH9YidkmOa1yUKMUTLQ+XKfVLBf4+FFyzzWebq7l+cpn1/pHKjlmyzQAUXgV
 o1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FPlhmMpt1AsgT+f34c/eL4ilsYS+8+9lcDoy/duXv0A=;
 b=JVoVW/b690YQs5Zd5iMllZsrPreKSNMIDYjdWC5i4LARPFN79/oXNV49CBc7r6F+0s
 lQ4Fe3+HkcekYV0MjwnJjJnY1uvh0CjBE7eOjDnbrtlq9iSg/UaLzzTxSGAwSPT5gzqX
 D3tsNs6iSkA7xqb4RQl0gGA0dLvEcAKyfiEr08KVGbWkmV+HD815eAgE9Hk6CG5afgRT
 B/FimbJjF5rqNrGK4zkv1mrclwTirBWTm1txwybGabJstxJxjupSQJjivpud8WQFqJwK
 OpVeaAccuMDDP/WHzuwQ7S6/UP/vD8/9FOKj1kT2ntRzCLnM8q1ozbZr5LkK4+qrkzIX
 CrBQ==
X-Gm-Message-State: AJIora97c0WyJIWp29IWvz26Z0w6OYzIze/Xo64ZoAILIV5eUP2C1Tek
 E3rjRYqwOtAf2E8n2tTqxvpbOg==
X-Google-Smtp-Source: AGRyM1sKnI+ChF6oMIiTcNd6DM6EsHmyUsIGwzWeRi9h515FuOID7TChd3+CVQRMY05HVYP/6ttlKA==
X-Received: by 2002:a17:90a:4cc3:b0:1ec:7bda:2e68 with SMTP id
 k61-20020a17090a4cc300b001ec7bda2e68mr35736806pjh.33.1656911620077; 
 Sun, 03 Jul 2022 22:13:40 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a635541000000b003fcfdc9946dsm19214468pgm.51.2022.07.03.22.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:13:39 -0700 (PDT)
Message-ID: <2a67c117-6359-6a4e-ec01-b37ef4d41db9@linaro.org>
Date: Mon, 4 Jul 2022 10:43:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/11] hw/rtc/ls7a_rtc: Fix uninitialied bugs and toymatch
 writing function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-2-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/1/22 15:03, Xiaojuan Yang wrote:
> 1. Initialize the tm struct in toymatch_write() and ls7a_toy_start() to
>     fix uninitialized bugs.
> 2. Fix toymatch_val_to_time function. By the document, when we calculate
>     the expiration year, we should first get current year, and replace the
>     0-5 bits with toymatch's 26-31 bits.
> 
> Fixes: Coverity CID 1489766, 1489763
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

