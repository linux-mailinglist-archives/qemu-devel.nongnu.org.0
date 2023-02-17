Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4E69A91A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSy1g-00021z-Jj; Fri, 17 Feb 2023 05:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pSy1e-00020Z-Om; Fri, 17 Feb 2023 05:31:34 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pSy1d-0002CI-8Q; Fri, 17 Feb 2023 05:31:34 -0500
Received: by mail-oi1-x229.google.com with SMTP id bg20so262646oib.9;
 Fri, 17 Feb 2023 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kCTlagYfWgLEiXnsIz5tTMEmvqpOXp/IYE2XzsBlc6E=;
 b=AlLNmN8aRlcCmfxD2qlxPQK4T996KOWzUxmjO+Y1rcUgL4nCrjytYIqP0n0P0VfxCB
 ygKe4YLRSRUhU7LfXx8XBxqovHazVIFDlC9s14b7RhopUmP12yBgTiLb3iisl5Efsjjx
 mtB+Y2DQnx1tklad9ba08gxRUNw+Y6fNDQIAc7JAh14e+3nGI66v61V6rkegTXS3nOn9
 d7ko5oLG4enhMNb4Bsn1a0FR08QR3rHbcy9M/TR3g2ypBHtulovQyYaM926xRq1iPeiI
 AUNA2Mp2vnJgSJSHCTBSKqI6uPc8graTh27EuCx3eFzA7BInAaXjGSagHJb4cPJ85WPR
 CHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kCTlagYfWgLEiXnsIz5tTMEmvqpOXp/IYE2XzsBlc6E=;
 b=6rMLODSu5t1EKmr+BmHsEkaGxdgzWhElUAwn+So2yxnhSQlN/UdEQmGXlC81n24eDF
 9ChI3FhLTPEIzdfqeGEFC/yPu/tCQeSmKawucyhQ9P19tbYp2HdBUQQUFURTKm5l+oIx
 Qu4+c+KnsIOfuXO6evXPRO7mZn0SeR/LerEmSprFlQdtAHOntvXx4y9he6ypL+CSnamF
 8XyEMKjSbG8Yfz/SSvs1OXUzs/7kLX2YXFy968R42g/lOP2IKxHuMwNNQQV3JGeWKoz3
 j+w/Bq7lb3mkrrvtEPOMf/I3ofRBFzceLR0lF6eJ7HsEfRg6X2MwZdPlnJQGqWqRpX7H
 ywGw==
X-Gm-Message-State: AO0yUKWaRuWAmjmeb6osDWvBCLftxIXkdd9tSRTbQbbWBvXmtoEsAQ01
 Y6JV1SAy3Ahb8CjnS08AI7I=
X-Google-Smtp-Source: AK7set9p3UFtR0CdpkWMCgJJy8rniXbJW5Mb4/IybBVwaELfXTnZv3DV4SemQvF7jOxpHws4x6KVNA==
X-Received: by 2002:a05:6808:bcd:b0:37f:523e:1da6 with SMTP id
 o13-20020a0568080bcd00b0037f523e1da6mr2685885oik.11.1676629890314; 
 Fri, 17 Feb 2023 02:31:30 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 b65-20020aca3444000000b0037f879e46b9sm1602280oia.3.2023.02.17.02.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 02:31:29 -0800 (PST)
Message-ID: <8a573926-42d8-4e7f-7c8e-9c2b39e32bd7@gmail.com>
Date: Fri, 17 Feb 2023 07:31:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/5] spapr/ddw: Remove confuse return value in
 spapr_phb_get_free_liobn()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-3-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230216122524.67212-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.351,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/16/23 09:25, Philippe Mathieu-Daudé wrote:
> The '1' returned value isn't used because
> spapr_phb_get_free_liobn_cb() isn't called recursively
> (it is only called once in spapr_phb_get_free_liobn()).
> 
> The next commit will convert object_child_foreach()
> handlers to return a boolean indicating error.
> Remove this value to avoid confusion.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr_rtas_ddw.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index 7ba11382bc..98f1310c6e 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -51,7 +51,6 @@ static int spapr_phb_get_free_liobn_cb(Object *child, void *opaque)
>       tcet = (SpaprTceTable *) object_dynamic_cast(child, TYPE_SPAPR_TCE_TABLE);
>       if (tcet && !tcet->nb_table) {
>           *(uint32_t *)opaque = tcet->liobn;
> -        return 1;
>       }
>       return 0;
>   }

