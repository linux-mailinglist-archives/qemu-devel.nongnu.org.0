Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F494D692A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:43:23 +0100 (CET)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlAX-0002P4-Tr
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSl7u-0000ed-W0
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:40:39 -0500
Received: from [2607:f8b0:4864:20::635] (port=38435
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSl7t-0007fX-E9
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:40:38 -0500
Received: by mail-pl1-x635.google.com with SMTP id n18so5811467plg.5
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 11:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uB3cOPdTVSaEFJNKrtqZlo87hT/sMt7iDUZgZ61GsV4=;
 b=Spzcpt8CLLmOOtRsxS7RNnci2qSQ87DCRRzLK1CVP3Fmrrp3LieMHk42EtPOdd3gJx
 5ajKUjSBFvsQrrWQ141qz2kx8TpkSkXqHkvsLDncQGiCER65mSpk05IrIJbIlLRn9DH8
 NlSSemux1pefFWNKB11xbREy8IM0VVt/4zOVKt93pm1d0rQ8Td0eMHW+ACWvN8uZzEAL
 XVHvETBcHgITchGzk/WenN2EGEvIOt8+klq28Aa3RvpO4mL1I4qecpvFgHVM9RKEk6YE
 Yl6VEOtDe7zwVZ+szv33ZXgIJfw3v8gW66ujrkjOEfEfE7gDq2r7hV+kQP96MgoHqNDc
 ZuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uB3cOPdTVSaEFJNKrtqZlo87hT/sMt7iDUZgZ61GsV4=;
 b=tVBXJkO2tGgz9EF347go0ekXr+ALO/CG4fk5abrFkXuR2uOlZOqoAyXnr6jkyS/fCu
 kc3j2pMcxDQUWNvQU7q2Njk8HOqUs7rb70dotgTrwJR+VW7MvJ3TpbZFJlMr9B4KNY3m
 rGDDT6udaYJSjtAs3JtFRZwcXpim5sD2xSn6Wn08tonVQYhFi5htKCJg9SCwhJEfA4aj
 e5t7Xbk9hHtvfk/pYQty6yREHodh2Z6cbrm1S/W0WYbq4/A3k1dskD5JFAuSrFgm0ku0
 7aP7bpfnUbSrntPPrX0MWlhZM/+jQp4UEn8U1FAsOhWKFZtEszD2cqRPZ1JhjRNf1TVI
 EXPQ==
X-Gm-Message-State: AOAM530nEdYGl1+5aRIl658zOWDg3xZz+rPEH4tlbhYbVJ9Kvr693n6c
 lEU5Pk150SbM1/gYPx08DImnhg==
X-Google-Smtp-Source: ABdhPJwd85/stYy1b5Cx22GDTs50M98HlWgnuPq5d8mTwddUhjaLsBA8xfQfyPmjcs7BBByHnDqF5w==
X-Received: by 2002:a17:902:9690:b0:14f:fc09:fd02 with SMTP id
 n16-20020a170902969000b0014ffc09fd02mr11669358plp.66.1647027635752; 
 Fri, 11 Mar 2022 11:40:35 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056a001a4500b004e177b8cbfdsm12025701pfv.197.2022.03.11.11.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:40:35 -0800 (PST)
Message-ID: <2f27f08d-c28c-7ae7-d5da-d41d5b617963@linaro.org>
Date: Fri, 11 Mar 2022 11:40:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/9] dump: Remove the sh_info variable
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-3-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-3-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> There's no need to have phdr_num and sh_info at the same time. We can
> make phdr_num 32 bit and set PN_XNUM when we write the header if
> phdr_num >= PN_XNUM.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> ---
>   dump/dump.c           | 34 ++++++++++++++--------------------
>   include/sysemu/dump.h |  3 +--
>   2 files changed, 15 insertions(+), 22 deletions(-)

Nice.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

