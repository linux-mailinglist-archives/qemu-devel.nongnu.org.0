Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B275485A6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:10:19 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0klm-0007yy-00
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0kXs-0001Sq-3X
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:55:56 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0kXp-0001GJ-M5
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:55:55 -0400
Received: by mail-ej1-x631.google.com with SMTP id n10so11347846ejk.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UMX7obzk5YeLaxns3T9l1Y1/4Ki/IzZuNyLPLNvF1D4=;
 b=QlPhmEx9wt99lqh9irgdWiOhkE8f3IRI0pkOFNfuMDDdy2FfE2ERep+BV4Ir/NLntD
 VwKdEQ2EWlCwP/93d/HPq0093eGOLdT64eKw6LcOUcAS0zNtw9Rn0A6JCZOkevekwr5N
 dxZqXB92HsCVbTIOn1TWECgaihiPcq8OkZFmGbqdblAwlvPcUeFxEbbEmmnskXsyvzwa
 NZFf4hP64bLpOua1e9NEq1iLM8Tw1LWAomso1eYcdokZ6rmMkP+er5zECQRF7q8j4eyC
 D7eWkLtWXMjK2WiYqkBEhLFTs5qzNn/57qv9ZGwcFt9kdMdP1EeTRYIOiKUciLiYNRtD
 SCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UMX7obzk5YeLaxns3T9l1Y1/4Ki/IzZuNyLPLNvF1D4=;
 b=NrSO59R1rlxQ5vwxhfS7L1Gh6hWR3YFhy7oHKwBxZRvd4i7u4XSiD/17Sus2tTxoi+
 UpAAicDxueLdfnGpLqB6PL7joNheUBjgNTWaAb2bRm364P/yO80+ZNQ14GWkW+Tk42GG
 m40o7rwvEjFK2ts00r0wSoSt3F2di21aWdoVuu/igqLm93pBwKwlst/21KVb7v/goaDz
 Qtqx2eAKRnjY4qWYpjICHEwB19u38+exan+4xzHnZkfocjG7Ji9EPvvLd1VEHyHtw0Rc
 a4SmblFTeDISxOAE7t5s7WdE4/RQTKtNJZwXSA8P8Kl6Rrfh9pofbrKogEciVYoDu3GW
 X1wg==
X-Gm-Message-State: AOAM530yiSqCr80GFhFgvTl+2KJfRuBDBiDqxPbksmtvjnSHtl8sm7cQ
 h/XdR1E8bmu04Y7x6+csQxTt1+a3xkc=
X-Google-Smtp-Source: ABdhPJzH8aIG+POhJv5o2RiCgB5QDt16YZw+4KTdug8KpurmFodTlNe6+C4+TKyVvZBzrFg5fJ+ehg==
X-Received: by 2002:a17:907:160f:b0:70f:cceb:d78c with SMTP id
 hb15-20020a170907160f00b0070fccebd78cmr45586163ejc.247.1655128551109; 
 Mon, 13 Jun 2022 06:55:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a05640226c300b0042e17781fc5sm5035187edd.49.2022.06.13.06.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 06:55:50 -0700 (PDT)
Message-ID: <54a51027-6e56-ce7d-2872-2f3e6c144198@amsat.org>
Date: Mon, 13 Jun 2022 15:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] crypto: remove "qemu/osdep.h" in rsakey.h
Content-Language: en-US
To: Lei He <helei.sig11@bytedance.com>, mst@redhat.com,
 arei.gonglei@huawei.com, berrange@redhat.com, qemu-devel@nongnu.org
Cc: pizhenwei@bytedance.com, jasowang@redhat.com
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-4-helei.sig11@bytedance.com>
In-Reply-To: <20220613084531.8086-4-helei.sig11@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/6/22 10:45, Lei He wrote:
> Move 'include "qemu/osdep.h"' from rsakey.h to rsakey.c.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>   crypto/rsakey.c | 1 +
>   crypto/rsakey.h | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

