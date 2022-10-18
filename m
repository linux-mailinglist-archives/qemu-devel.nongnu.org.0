Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57F602BF9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:44:41 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklxX-0004pL-Rk
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklHs-0002E5-CA
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:01:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklHm-0004ct-Sn
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:01:36 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so14807712wme.5
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EBX1sWqWuScabdGTb+kBm3UOgU3J+Djju7/nqFMR+38=;
 b=HS41jJezNAL9rA7b72omPq1q2C662nV1UOPfjNRbQayhm3Uhdp+Qk6ww75bveCsX1I
 pmSt3P5nSg5CzkgyjSrzwu8ipz5Y1gja53qigENGQfHYFjy3ipdRCn2kNw7wekG7x21d
 BRXBunCOhIfrxSNZXnJ0IPNYgLs1IPAFW4ORjqPNAIld9F/QU6LRPmCYIGAN78sstxLy
 GbIr017pwqL8+pZm1c4aish8pTExJSGaRqOp/XOa8NQikYFUXqoZwEHugmhZngYZbqfP
 nx4sIMYyBsuexuja1NqplPa3T04eOpgPAR3hBE7sFdfzI+BPyj/7VDYfsWEdSyb5LPaT
 Bx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EBX1sWqWuScabdGTb+kBm3UOgU3J+Djju7/nqFMR+38=;
 b=S+7dz7LJVfmI2BBOYQxxp5oULzzO/cMLYPxdtxDN3ZWQQFxrd/S/9Lbsy11vCfqseg
 oX2PahlO70n5J4f/MwatjefFvLdI8ecwcUxQLbkfaW7uMcxF/wIAULdWKz61BsT9g4kK
 qHnKm66ioGkwy5v/j3OlY8Ezh1nOZW/OGZNI57PQhmxEHPeIIZxuG7Yi+QsMP3u33NzZ
 rLtb2/N/kW0nlAvvYwxa6tK1+3ZxVZUhw4mwM2f4wE58vjNA7714YQqzWDpGWOGyDUHP
 StvnZkyO7IPw+fOd81b+uCW7YVe9pmnzEJ8JCuulO4k/n207X9pN8HF2x5zFHYVeBZZS
 qKdw==
X-Gm-Message-State: ACrzQf2IgERs1LRR7m/XjjJxPKeTmkODXkzlL08a8031OaxPhu7EYr5T
 4dallmkMHF23NZWw10PMFIV3cw==
X-Google-Smtp-Source: AMsMyM4/hg0m6FGNv2nw7SQDi8vFU9eMkDI0lB9Smk5jOExjHXU7QibRpXMNhUY3zklObYd/Zk+LUg==
X-Received: by 2002:a05:600c:3b12:b0:3b4:a6ea:1399 with SMTP id
 m18-20020a05600c3b1200b003b4a6ea1399mr22257989wms.49.1666094487069; 
 Tue, 18 Oct 2022 05:01:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o18-20020adfcf12000000b0022a297950cesm10839168wrj.23.2022.10.18.05.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:01:25 -0700 (PDT)
Message-ID: <752bcf6d-d37d-5605-d3bb-8e46c2e4b47c@linaro.org>
Date: Tue, 18 Oct 2022 14:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 23/28] qapi tpm: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-24-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-24-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/10/22 08:28, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/tpm.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   backends/tpm/tpm_passthrough.c | 2 --
>   monitor/hmp-cmds.c             | 8 ++++----
>   scripts/qapi/schema.py         | 1 -
>   3 files changed, 4 insertions(+), 7 deletions(-)

> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 8f8bd93df1..378f5b083d 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -885,10 +885,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>           case TPM_TYPE_PASSTHROUGH:
>               tpo = ti->options->u.passthrough.data;
>               monitor_printf(mon, "%s%s%s%s",
> -                           tpo->has_path ? ",path=" : "",
> -                           tpo->has_path ? tpo->path : "",
> -                           tpo->has_cancel_path ? ",cancel-path=" : "",
> -                           tpo->has_cancel_path ? tpo->cancel_path : "");
> +                           tpo->path ? ",path=" : "",
> +                           tpo->path ?: "",
> +                           tpo->cancel_path ? ",cancel-path=" : "",
> +                           tpo->cancel_path ?: "");

Or simply:

             monitor_printf(mon, "%s%s",
                            tpo->path ? ",path=" : "",
                            tpo->cancel_path ? ",cancel-path=" : "");


