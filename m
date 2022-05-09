Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A025206CC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:40:28 +0200 (CEST)
Received: from localhost ([::1]:50942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noB7B-0007Aj-Kp
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAyS-0002si-DY
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:31:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAyQ-0001ga-1V
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:31:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id bg25so9070683wmb.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jd2z3cl9y26LM1TGxfm7nATyS0X8O761VDxPYaQrdnk=;
 b=DS0dU6s+N8Xj4w/NG23OGARelgNaDVmApdoi0LEUcjElaBqF8EEBIXeTaGrhSVWk6O
 IsRIIoPffbaGzpxO/t6pZaielj0gQ/hR3Lkn3CE7CfP+snG5IzKMZFgjVZS6iyryrLyn
 NPaLBurWkE9XqECWT20N2JBaeYK1UxMR0JnupoHJFdH4eo8yYgxf0Qp7XSUcaredD0Jh
 ShUPcVRa6aSH1fQrtMfFRmR2pSWjZ6gia2b/Hhy4eWYE4Y0VR5Dl1LPObtG1WFPa0BcR
 4Jy52O2W5chvsVAYv5lm5YVBv2oOj7mkVXHfe1taBnDG2jvA9Bmtl1J5rRMcCjmBINsv
 fXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jd2z3cl9y26LM1TGxfm7nATyS0X8O761VDxPYaQrdnk=;
 b=5BBxNV7qHKmIONXRTepoUr7jUvp11BxECJEPEUxBLupzLtl0efMZCdCDVTsW+h8moA
 Dc/kYgSaqpHjgAHdFlEtk0/OyE7/ODG8pvS2eOExpWqaMaeGLeUHl2iooaXS8WFY06lB
 PC7+XPr/qRt/VDR2q3WMSTop+2GeeA+aWADI5jKx9oF2Mx0BYS3M3eOY/TCGJWzjvTAU
 +fjNYZNDFBvcAJlZtDrMZQ2I2erzMDYQrO2r7ZUbV9Ql6c3D0rzN4+xAZiqXn3wTRsKP
 hHOfWoCC/MM0lebRzQDn7tv7srQeNtcy3ERD3JXRwVzb8CR5jNk84ViI0MQIl4d36n8i
 HgnQ==
X-Gm-Message-State: AOAM532UbE+ocPPMoFOH+sbPyybCwwwXe4n4Euisd0LkrjfU07vl3/zp
 mt1qZVYDn6j0hu02u2vnbC8=
X-Google-Smtp-Source: ABdhPJylnTGKf1LS+tyMtviqU2UeFTXh0TVWv60QieAtjQlj6zNAkFsSVLt+sM4TmTY7KSMcBlCeBw==
X-Received: by 2002:a05:600c:3798:b0:394:454a:df74 with SMTP id
 o24-20020a05600c379800b00394454adf74mr24938925wmr.174.1652131879833; 
 Mon, 09 May 2022 14:31:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j9-20020adfff89000000b0020c5253d90csm11612916wrr.88.2022.05.09.14.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:31:19 -0700 (PDT)
Message-ID: <060896c5-fb75-02d5-e70d-2e32390a0474@amsat.org>
Date: Mon, 9 May 2022 23:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] Hexagon (target/hexagon) move store size tracking to
 translation
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220509211405.18581-1-tsimpson@quicinc.com>
 <20220509211405.18581-3-tsimpson@quicinc.com>
In-Reply-To: <20220509211405.18581-3-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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

On 9/5/22 23:14, Taylor Simpson wrote:
> The store width is needed for packet commit, so it is stored in
> ctx->store_width.  Currently, it is set when a store has a TCG
> override instead of a QEMU helper.  In the QEMU helper case, the
> ctx->store_width is not set, we invoke a helper during packet commit
> that uses the runtime store width.
> 
> This patch ensures ctx->store_width is set for all store instructions,
> so performance is improved because packet commit can generate the proper
> TCG store rather than the generic helper.
> 
> We do this by
> - Create new attributes to indicate the store size
> - During gen_semantics, convert the fSTORE instances to fSTORE<size>
> - Assign the new attributes to the new macros
> - Add definitions for the new macros
> - Use the attributes from the instructions during translation to
>    set ctx->store_width
> - Remove setting of ctx->store_width from genptr.c
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h          | 16 ++++++++++----
>   target/hexagon/attribs_def.h.inc |  4 ++++
>   target/hexagon/gen_semantics.c   | 26 +++++++++++++++++++++++
>   target/hexagon/genptr.c          | 36 +++++++++++---------------------
>   target/hexagon/translate.c       | 26 +++++++++++++++++++++++
>   5 files changed, 80 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

