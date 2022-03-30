Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DB04EC5ED
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 15:48:24 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZYgR-0001Rx-3U
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 09:48:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYey-00081z-Oh
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 09:46:52 -0400
Received: from [2607:f8b0:4864:20::332] (port=46911
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYex-0002g9-6b
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 09:46:52 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so14921013otq.13
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4ilR6iQPXg1a15gkXIcu/maOlm3zoGqKdoy1Mm3rEj8=;
 b=fW0qTqAGpQd6i4u/eAI6xWN0GljZCFZiFoDApNBbrbYQCH9vZ4zqgeInrmZnsWKJ+J
 BZNZ4nAlJp0rpGf5ByIp+EA7f4LVjrPYtdjhqGebI6Up37yxxtoMjzbRekolS0dhkG52
 WsFsbLkhQWCN6Y8Fo3aiQyADmSQeS//K6su/4w0s5bWOoNNug/BSdvTNcakkvtdBxSC8
 p+wVCIqH8BJQNAbjJ+qidQVOrYU999GbdUVvf4vCGCHcxO/Z4whxhzKrQqh2S8/FGMtl
 /H9Ew8jRODhQccMXodWY2grX6TwCEY5C9GyfmJgCuxOPOHXTq+ob6uVH6Kng6uQTUYh1
 SXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4ilR6iQPXg1a15gkXIcu/maOlm3zoGqKdoy1Mm3rEj8=;
 b=7bGz/U73DKif1HNHB+8H5wUDQrQ76HWh/rGHVgZQxpOCVZcYAO59qaPD15qZQpAX5k
 qzQ2MGyvroYuDDqW8fjfTNJc2VAhn4xMo/dB7jcDrThsHKLnz3PQgI0GnHn25teFedhj
 sJdetRB1itkBgv0SmDRawGgFRgE/YOtmdR8ZZLrH5FJnqTmcdfslNzrI4KYncZYPsiEU
 mGUjVtrU6NdAdInTtho2ZUQMnC8Q9UBKf3jGN2WGGRggen6OFYoVctPc8Z7lmgz6ZpWP
 XUyFhnuvnSv70Ov+qzVVcnh07tRa7EsozMXKJSsJcnvPVj2PZJvEWMuJwlEvnNNki1NV
 iXxQ==
X-Gm-Message-State: AOAM533awoZ+wEF/0yok2NzsDTrxeFX//2sFXp0+C7uG56BzHUi9iyFR
 DRJE8D8Mb5Ff7DMw7T8sy5o04Q==
X-Google-Smtp-Source: ABdhPJzKiD5ERh9NSsRTA/LpYMOwrDmYwVKAtDwlJHiY0cX/ZZwAQpEWEIAHn01v2lEgwbvgciAvuQ==
X-Received: by 2002:a05:6830:1d70:b0:5b2:2c27:be29 with SMTP id
 l16-20020a0568301d7000b005b22c27be29mr3182479oti.89.1648648009405; 
 Wed, 30 Mar 2022 06:46:49 -0700 (PDT)
Received: from [192.168.249.227] (172.189-204-159.bestelclientes.com.mx.
 [189.204.159.172]) by smtp.gmail.com with ESMTPSA id
 s26-20020a4ac81a000000b00322a2b5d943sm9962299ooq.37.2022.03.30.06.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 06:46:48 -0700 (PDT)
Message-ID: <b5f52d76-ae43-505d-489e-7a0c469be57a@linaro.org>
Date: Wed, 30 Mar 2022 07:46:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 07/29] target/loongarch: Add LoongArch CSR
 instruction
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-8-yangxiaojuan@loongson.cn>
 <aa21e33f-6729-d148-96e6-1f0617ddbc39@linaro.org>
 <f3f98d53-5f6e-3971-e583-617858dbdf7d@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f3f98d53-5f6e-3971-e583-617858dbdf7d@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 04:01, yangxiaojuan wrote:
> trans_csrrd {
> ...
>      switch(a->csr) {
>      case LOONGARCH_CSR_PGD:
>          gen_helper_csrrd_pgd();
>          break;
>      case LOONGARCH_CSR_TVAL:
>          gen_helper_csrrd_tval();
>          break;
>      case LOONGARCH_CSR_CPUID:
>          ...
>      default:
>          ...
>      }
> }
> And the same in trans_csrwr, is this right?

That's the idea, yes.  However, you'll want to pull these switches out to helper functions 
within trans_privileged.c.inc so that you may reuse them for trans_csrxchg.


r~

