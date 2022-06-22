Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E250E554EB1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 17:08:41 +0200 (CEST)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41yC-0006Pt-OK
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 11:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o41vd-0004ka-4Z
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:06:02 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o41vZ-0003IS-VQ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:06:00 -0400
Received: by mail-pf1-x429.google.com with SMTP id a15so9163415pfv.13
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RgEcfu5iF2PeT5ldbl7AOT3ermnbl9DaSetCOW3P3Tg=;
 b=kifRaW4ByHxImE9Cn5bi/e3m9MNY9T0HNJ7nKMdQejx7ftG7726B74v4qk7v9RZhRe
 zbnlOj45nA81HnYaMj8iG1hh9t8furOsBZeoLx4c2Akyr3TmdyN0CNhg42Ooam9J97kV
 gtx9da2Mgtno5OTBhwWTGdUglqQo+vUbB/3MWunXkzUTzZZ65SL/Vl7nlBGwUhe5dved
 Y/wW8bXWzk5+V4FIT7aQz3fqZgYouizDpUP9sWLE130d/Ah6r9R627FW+k6s+Cm//ulX
 Yn4QFixeVlMZfLRanp6LxPbII0gJLSk28t/34et73PNog0MEyYS4fxv897W+qU3NI5xk
 3LHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RgEcfu5iF2PeT5ldbl7AOT3ermnbl9DaSetCOW3P3Tg=;
 b=gwH08ssjSka4qmyL4qwQa4/E7Fv/5p0iwIAnzS0Jg93zbkDYextwepOr+vm/zSRAaF
 WMeRjpaq1XyEVmh5G6I68c609WmCVVR3i+FgVoi6KsrVuxWTxprQEMKcMBeESTpqePMq
 WyYsNqrkUErOzdS7tRcrUbKW6CkquPUvp9zw8PNoxgQvfZHrkdFs8DGr0yeygKC0zNdM
 klfkzNNER5ab+RWo7hDmx5jGiK3ags37MI9Gf7y3jtVqIGGelluUQDvIz8iXSPLuV0ks
 aq0SzqwONSAIU3DF4WNabBcinE8jSiqpI59OFmeRp7mSAd6kKl3XgsvB7vGLmf+zgfZ3
 vh6A==
X-Gm-Message-State: AJIora8tY2uD0sSULqihy6HNMWHa4NR+o9UkrcemCYA2oR6Fek7odaqs
 yS8PHX0YDglXh6Xe4Skd7EZMpQ==
X-Google-Smtp-Source: AGRyM1syhAC73qArHBEqps4tWON6NN49Z7fe+Cdayp6hRVJnXRD0uEJqVj6K3VIEdzOLGvX9S/NRgA==
X-Received: by 2002:a63:4d65:0:b0:408:9e5c:f7b7 with SMTP id
 n37-20020a634d65000000b004089e5cf7b7mr3272699pgl.553.1655910352013; 
 Wed, 22 Jun 2022 08:05:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:4bf9:2153:b33e:91d?
 ([2602:ae:1543:f001:4bf9:2153:b33e:91d])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a62f94c000000b0050dc76281f8sm13604061pfm.210.2022.06.22.08.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 08:05:51 -0700 (PDT)
Message-ID: <e4fa2ebb-643c-35cb-c433-284a0deec9ef@linaro.org>
Date: Wed, 22 Jun 2022 08:05:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/10] hw/loongarch: rename macro prefix LS_PCI to LS7A_PCI
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org, chenhuacai@loongson.cn
References: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
 <20220622104301.804447-2-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220622104301.804447-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 6/22/22 03:42, Xiaojuan Yang wrote:
> Rename macro LS_PCIECFG_xxx to LS7A_PCI_CFG_xxx to keep consistency
> with other macros.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/loongson3.c   | 4 ++--
>   include/hw/pci-host/ls7a.h | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

