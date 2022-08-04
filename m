Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1D6589F26
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:11:44 +0200 (CEST)
Received: from localhost ([::1]:60372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdRm-0004in-F0
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdMw-0005oN-RF
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:06:42 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdMu-0005YZ-Nv
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:06:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id 17so19799497pfy.0
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O0mHpIAQByPpqWcq8Ym21S5LVUvNHsYiMCgceAATTHU=;
 b=ZSGjux1nuEIkF38H4gSRsSZs4Rv6U0yT7240vnaQM5PCE60SijkFs8qxiJWSl/cFWr
 ueifN3aBqgY1uRpXcVFBUeXcZItmO4ssHqVqBs0TYjzZTvdrx5IguwEaQBRVuQlxiSWx
 J6vBR3GFbEpKmwioVl+m7wuM+jPJAckyoL9BBCgT+ycabFrOjeYPMuk3It91UFlexvpA
 fC6YcIFISU0qxD/nFgBcyfmXDn9zVuBFQNZ9pEezXkyYxwraY+3p69ws7se5mh6ezwb1
 e2ZLajTC4x54Pq5aSs8mf4MgQQNYZ8Ahb4iSK4rG16hLEqN33fMlCLpqQJQkJPDWfABR
 n/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O0mHpIAQByPpqWcq8Ym21S5LVUvNHsYiMCgceAATTHU=;
 b=wBB1JZCqFvww8LJV22Njfxdb/SBLzs04OBz7YWnwtX/z+me42XhIKyAdAdTaMrjtAw
 +LrTnWpiOUD4wfH4zBHoRQPQ4OJaumwYxCh3kygunvAlvOjhWNFtXaxL0vNF9WovjYIH
 2Vija+rpmsb/V9fRBFFCngMbklXfAIkPrHaQBojw0hlRkA9b1WivZsGAmMrafFWP5o+H
 CxpRZecFkMLPjac1UI5alVjKgEwKW+9AyyZCmsDB7sT2HGOatszBuFSgen5qzb4Nc5ri
 O8BETkGBapChz1xHHabb0vVGK5HMPVpFfWvnRSj+Cg8do6PikiEzTsi+kD+1k/1OSLBL
 TI7g==
X-Gm-Message-State: ACgBeo0LG4ydisXlectW36Fw+q8VBGEdqeu4FP65C8y4ownG8CKq1XS9
 +3DGIGxNaYRZ49ObrVSnbrDKng==
X-Google-Smtp-Source: AA6agR4VMPhdmO6p8WAFkEaYEz34fESQeaSmS9luGB5m7a6Ke3Os90GkicLhCixrThRCIbixlwxzTw==
X-Received: by 2002:a05:6a00:23d0:b0:52e:74be:d52 with SMTP id
 g16-20020a056a0023d000b0052e74be0d52mr2435407pfc.62.1659629199374; 
 Thu, 04 Aug 2022 09:06:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:c349:7b49:2925:a0a?
 ([2602:ae:154e:e201:c349:7b49:2925:a0a])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170902ab8700b0016d01c133e1sm788178plr.248.2022.08.04.09.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 09:06:38 -0700 (PDT)
Message-ID: <fec78f36-159d-50b0-1113-e2286e464d99@linaro.org>
Date: Thu, 4 Aug 2022 09:06:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 4/5] target/loongarch: Update loongarch-fpu.xml
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220804130213.1364164-1-gaosong@loongson.cn>
 <20220804130213.1364164-5-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804130213.1364164-5-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

On 8/4/22 06:02, Song Gao wrote:
> Rename loongarch-fpu64.xml to loongarch-fpu.xml and update loongarch-fpu.xml to match upstream GDB [1]
> 
> [1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/fpu.xml
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   configs/targets/loongarch64-softmmu.mak |  2 +-
>   gdb-xml/loongarch-fpu.xml               | 50 ++++++++++++++++++++++
>   gdb-xml/loongarch-fpu64.xml             | 57 -------------------------
>   target/loongarch/gdbstub.c              |  2 +-
>   4 files changed, 52 insertions(+), 59 deletions(-)
>   create mode 100644 gdb-xml/loongarch-fpu.xml
>   delete mode 100644 gdb-xml/loongarch-fpu64.xml
> 
> diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
> index 483474ba93..9abc99056f 100644
> --- a/configs/targets/loongarch64-softmmu.mak
> +++ b/configs/targets/loongarch64-softmmu.mak
> @@ -1,5 +1,5 @@
>   TARGET_ARCH=loongarch64
>   TARGET_BASE_ARCH=loongarch
>   TARGET_SUPPORTS_MTTCG=y
> -TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
> +TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu.xml
>   TARGET_NEED_FDT=y
> diff --git a/gdb-xml/loongarch-fpu.xml b/gdb-xml/loongarch-fpu.xml
> new file mode 100644
> index 0000000000..a61057ec44
> --- /dev/null
> +++ b/gdb-xml/loongarch-fpu.xml
> @@ -0,0 +1,50 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2021 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.loongarch.fpu">
> +
> +  <union id="fputype">
> +    <field name="f" type="ieee_single"/>
> +    <field name="d" type="ieee_double"/>
> +  </union>
> +
> +  <reg name="f0" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f1" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f2" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f3" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f4" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f5" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f6" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f7" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f8" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f9" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f10" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f11" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f12" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f13" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f14" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f15" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f16" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f17" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f18" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f19" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f20" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f21" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f22" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f23" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f24" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f25" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f26" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f27" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f28" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f29" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f30" bitsize="64" type="fputype" group="float"/>
> +  <reg name="f31" bitsize="64" type="fputype" group="float"/>
> +  <reg name="fcc" bitsize="64" type="fputype" group="float"/>

While this matches upstream gdb, the type of fcc should be uint64_t.
Interpreting these 8 bits (lsb of each byte) as a double is going to fail badly.


r~

