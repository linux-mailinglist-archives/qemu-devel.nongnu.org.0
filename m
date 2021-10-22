Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6D4378FF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:24:42 +0200 (CEST)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvTL-000786-Mh
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv4j-0003y0-F8
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:59:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv4h-0000a0-5P
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:59:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id d13so434892wrf.11
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GaFQ+PMovluvyEBa0FSes/XYZ8u136xUeLkR3LUF0Ps=;
 b=bbbvSonwv3z8eayo5g35apf8oUCxb+tDtKUFz2qJEyyaIO+ONzB798kHdrKxXvTThc
 DmqbPhV8079AA2MuQVgpUQLko20tLIhM8nA08QUW0MtCG7wnli5DGLmoOb13eBwiHqsc
 Pq+EtIFfDVDGoZ6gSMETOj/lWgn7tQJzOWj8u7oBd51IpluQINzS/ku0M9xhvP4Llb5O
 aWUzhoXwQhobgixIvyHviXpnOnIX1/QVuq6ltRYye+lG58J5MHbygaM2NtUQ6msVksuJ
 erxyMR5NnkkcpEV7jb95UYpqHji1W2kmggg/z7HftctW7GQN6ORhjMwdw8+GWRQeQGjy
 A1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GaFQ+PMovluvyEBa0FSes/XYZ8u136xUeLkR3LUF0Ps=;
 b=IJLLn8EUOB8aqFFUcICezPCNFGKZ+YEwJtL2oNCjcnIPBByAVx9tGH9IyoehlOHNEA
 3c7kqY8kv9QPqfKYmW1t6ZUbyOVYUYHefQa/+qBEO/QTRLpgDtczZFuHtKxeUJp2KDLB
 gisgQWKYpRxq42FJuzpciQgI807aeC6SLZvmKobxk2HXoV6nZ17DUITqPDpYsyDNGzAy
 j25AAeXPwfc7R/ESUJyNAyZT1cn6DUciaDdqqmqIIyiNok9mIGmo1u3HZTAgFE54Fxk6
 E2dcm+ec0M8Md8DQv8dTaNTIvWjRtuTXd572jwFc+IWPMKnWlsriqfPC5qshdhjr7rrB
 Ghrg==
X-Gm-Message-State: AOAM531riiT+Q2vdcjTabQUepERm5LRHxhaj4Ri2kfOiAVj4JAmQTC1s
 kWQmMIhp671vC8+vG25XDuo=
X-Google-Smtp-Source: ABdhPJxia2ARFQCQ6812Cq+2f9b0xutknuQqeHS5VSTN90thcX6vskLtDp7ZCfmBG2ClI9+vDgSWDQ==
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr9790wrx.143.1634911149548; 
 Fri, 22 Oct 2021 06:59:09 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l2sm7957916wrw.42.2021.10.22.06.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 06:59:09 -0700 (PDT)
Message-ID: <34039ed9-fc27-2378-2d5e-7f9f093738d8@amsat.org>
Date: Fri, 22 Oct 2021 15:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 19/48] tcg/optimize: Split out fold_setcond
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

