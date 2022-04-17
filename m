Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B50D50494A
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:24:00 +0200 (CEST)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAV5-0003nO-5A
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngAG5-00022x-Uc
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 15:08:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngAG4-0007nY-3g
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 15:08:29 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso12338036pjj.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YzL/aCtGNMtbMeDgypJlrLRzoPBHK05dGl6yqa0+0Sc=;
 b=xO8kxyXmNEjVpyZ6iH+FdyESHTf6WcknYsw9rAhJJqOrGzzQeq85IY+9w0v8k3G3G1
 kcwphKMq3/JxNPerfGFxWdWE3h3mxuqGZLzYWZ7ygPX06bnbvMVzrc1JMIXEq1O+WFWS
 vGDxC69WuUpyKWra3NcS1+3pEzJ/YIEgY3SCdEJxjVhLfjk416ROhGhZuff/lxF5ya6Z
 VG3Hvi3lAdZkAafvdfSAYbtZdI7NESksgHJMZwwBctzK5K1dGXjnb0WVgl5VxQAFB6ft
 Gas1g0BVgvOA4U9lkqoLSU8C7vmQHNaL5Q/tNYWHRBtp+aDaWUGj0sZnbtfVFXyQUhEi
 xY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YzL/aCtGNMtbMeDgypJlrLRzoPBHK05dGl6yqa0+0Sc=;
 b=7+5Eso8Cm5Z+R9MNtFFFEx6RPF1aTLDUG6aatMpEQonJ9o29RFXmuv46ojsYjCh4AP
 pu1u776/IZroYfzRId2aIWthGVKVNt/9x5yTQfa+Fx8+9w2H573ZWopC3kEaIY9tBEms
 MlYFG/Lx9wURiayqN5A0ulSIburAAsTsUMRtEfNR8h+ASh1ej7zrHUaor1t1/FG5a/GE
 WSeAaSZMERGfBOV3J/8Ly3yX1E84afFORgxCLBgcX+JKHsa+R4piO54CbpzxrbIbFaen
 kfQoeXO6B1t3NzHATOvBOX1UlAZplXtK86bkkfbWEU/cT7wXv4ULqTPinwO47GdJBtxS
 L8RQ==
X-Gm-Message-State: AOAM533aoCOlG+tyzyFsWZj2pWXc2egU8EhdcS8wXpBNgUmvwMiL1smM
 9mfg7jZTmRcZScje7zHqfS73Ew==
X-Google-Smtp-Source: ABdhPJztlZ8WQfYd84k7IkfK4/g9i2lttsYhylGC3uISLuwkcs4gfOxby1clqvw2OSJ7YSrk1yboEw==
X-Received: by 2002:a17:90b:164b:b0:1d1:b0b7:9033 with SMTP id
 il11-20020a17090b164b00b001d1b0b79033mr9365797pjb.164.1650222506473; 
 Sun, 17 Apr 2022 12:08:26 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h7-20020aa786c7000000b00505bf336385sm9423796pfo.124.2022.04.17.12.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 12:08:26 -0700 (PDT)
Message-ID: <3561134b-4760-5f1a-84d9-89264ede930d@linaro.org>
Date: Sun, 17 Apr 2022 12:08:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 30/43] target/loongarch: Add gdb support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-31-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-31-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
> new file mode 100644
> index 0000000000..f33fa1590b
> --- /dev/null
> +++ b/configs/targets/loongarch64-softmmu.mak
> @@ -0,0 +1 @@
> +TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml

This is incorrect.  You cannot add this file until you can build the target.
Adding this file at this point results in

../qemu/meson.build:2178:2: ERROR: Key TARGET_ARCH is not in dict

which will break bisection around this patch set.


r~

