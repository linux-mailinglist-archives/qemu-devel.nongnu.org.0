Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA151FE0A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:24:41 +0200 (CEST)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3NQ-0006HJ-1V
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2vm-0000xV-1Z; Mon, 09 May 2022 08:56:09 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2vj-0003XL-NL; Mon, 09 May 2022 08:56:05 -0400
Received: by mail-pg1-x52e.google.com with SMTP id v10so11951750pgl.11;
 Mon, 09 May 2022 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1P/eAYrw95uJZoO4ATHeOqxbOJBAe2tUOUOZV4h2kG8=;
 b=OWxDhM0gsnl6kKGIcWbJXfvKTzYOXNRlCNc8OSP/I40UR8LOJE6ZtLpizdD4tz803Z
 wS9neapuq7Fp2wM58Db+3pY6/sZe1xT9NiqNQeqxq2YcktVawV1kYV0dpOgNtUtSJjVN
 FfUUVX8ILMl8crrEflgm4W0w9hr2cVugHiOFrnREpA/klWEktNPY90GsXilitAFscA/P
 7f0Z/RntaEeE6qX8AnYwIX0MycLI3STWAbbrXzIpDOxpmJXhYqso1yCdcfUC+Md9abXe
 g6jRWyN2/XfFr2lXMImirVZquk6mMTrqe9uP77DnUMbLGho1SNhAlGYqT+oYqcNFYDeQ
 otPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1P/eAYrw95uJZoO4ATHeOqxbOJBAe2tUOUOZV4h2kG8=;
 b=oqTH0r80fVc+2U6ocEYltbCQNAAkIOB0YIDH0DwRi4RJr88CaVXxKwqKRSZr/uE8z8
 JYKhfrFiWqhEpGGmbxDO6+wUTJZIUpeZRyaKYnu78vGD/uJrbtn4srq66uykeCczbG9W
 gPTBWu4m6Zz/8vt+jzmrEUh26+G2loJqnbdiUe2PTvvx531xfCqguxNJTqKzgH3O9kU9
 xfw4dzOOoz2AD231FEzXykwnTlSbu1kC0TK9C3Pvv4rZaJHjBqq9e6uGc6+bPWbbhtmu
 FlNkNVzqxF+QmQeKRm5ltJS9Xf/lRd0og3NhT0XDTSZ+od5ZCq5iezoCTFmYEl1wrOuM
 tpmQ==
X-Gm-Message-State: AOAM532RiHhIiOLVAvfLlRqP8S0kZ1LaFjA5vigCuAj6sZpS8q9Lj44M
 NobVm7SGGtclwYJKN00KTpU=
X-Google-Smtp-Source: ABdhPJzT9Z87mLkya3K9pVv6K37R9AkPYCDFnX+2UYwZq3DTL6cpJNFKfzm/3VlikxYLcLLXkfWsRA==
X-Received: by 2002:a05:6a02:113:b0:3c6:4389:cd6e with SMTP id
 bg19-20020a056a02011300b003c64389cd6emr12770006pgb.414.1652100961811; 
 Mon, 09 May 2022 05:56:01 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 6-20020a170902c24600b0015e8d4eb20dsm7035524plg.87.2022.05.09.05.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:56:01 -0700 (PDT)
Message-ID: <f5e05a7d-c565-93ba-3c17-cab549c98d82@amsat.org>
Date: Mon, 9 May 2022 14:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 08/11] hw/net/fsl_etsec/etsec: Remove obsolete and unused
 etsec_create()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "open list:e500" <qemu-ppc@nongnu.org>
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-9-shentey@gmail.com>
In-Reply-To: <20220505161805.11116-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52e.google.com
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

On 5/5/22 18:18, Bernhard Beschow wrote:
> etsec_create() wraps qdev API which is outdated. It is also unused,
> so remove it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/net/fsl_etsec/etsec.c | 23 -----------------------
>   hw/net/fsl_etsec/etsec.h |  7 -------
>   2 files changed, 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

