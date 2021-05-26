Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEC39223E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:44:01 +0200 (CEST)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Jo-0008It-RG
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm13C-0005iP-3W
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:26:51 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm138-0003sp-UU
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:26:49 -0400
Received: by mail-pf1-x430.google.com with SMTP id y15so1946387pfn.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EI1Od89kSJbw4wRJK5LS1WJ2MlpRLwbddSUmNHxY6Po=;
 b=dEZvHVdwCmeSswKv0H5IHKLM8mfKdvffuhxpIxdYtioWD513Z9DwZzPP4nm8XLh9xC
 MqKYtGvhXGgN/izNjo/TC59MzHqEeYNUC8EJPuy7OhREX9G3VYWzrbBfWR4mGUk5Dn6o
 ht1FhFyDKoZBEwFM4ptPA+guOlsp9OHxVb1HQViRK1lCuMjCRXTyTDOvF3QlU+THj3Vk
 tIhCngSHBPp+TycgTPrJiGl4atOaIM4rG/6QssRFB3RK2PbedC1sqG76IjhyS/5TbuY5
 vLWYZgtU4j6RV1iIot5LsDc8G3htBARr2rI3zBlB95LaEKVYf/E9jGSa0XINQixfLZkA
 +vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EI1Od89kSJbw4wRJK5LS1WJ2MlpRLwbddSUmNHxY6Po=;
 b=jcaCKtNbQTh07j6zXTPHWDgDpy2idRVYmJiTUNDY2Je9xDBWASS17qDM4vyTyZAuF7
 kATHDBw+SO7H1Phh7Q+2Ja+v5l3MkN4PslsJ1gFDDwsBnjWoFYNYnHr/frkLlIxKRKo5
 UHNdndcnbRv64H7cltNKRe844IGTdfFVpDbbZEzOyeglwo8cfgUPT8vQ8kODYwkKA+uX
 mhVL1Vl2OOps5nHlC2p5FStE8aGTnMjZu2vZatvuRcf9WdbnbUt+c7ywbxdcHZpPUM6J
 kn8RXB9HGW+0CQLwMLY7A8q2HYII1n24/vTIWjgDroiBbQ9sbGTumANYUcXvb8qX++Jz
 RVJw==
X-Gm-Message-State: AOAM531Z1NS2Ruse316UsZb2InMr5eJSWAxEyDQ2crrPw0WA3Jm2WjY4
 YFmaiHPlGiyX4+ceaznWTnbmyQ==
X-Google-Smtp-Source: ABdhPJziPr18C15QUl56NBjybD1MfhoSBCmFGgDvuT7pfvYVc2ZR0gbM2AJ0CekCWITlRT44QyWrQA==
X-Received: by 2002:a63:1210:: with SMTP id h16mr451612pgl.189.1622064405654; 
 Wed, 26 May 2021 14:26:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a7sm119273pfo.211.2021.05.26.14.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:26:45 -0700 (PDT)
Subject: Re: [PATCH 3/5] target/ppc: removed mentions to DO_PPC_STATISTICS
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-4-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36d2834c-a1c8-6b04-9ebb-fc7a184a5c70@linaro.org>
Date: Wed, 26 May 2021 14:26:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526202104.127910-4-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 1:21 PM, Bruno Larsen (billionai) wrote:
> Removed the commented out definition and all ifdefs relating to
> PPC_DUMP_STATISTICS, as it's hardly ever used.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/translate.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

