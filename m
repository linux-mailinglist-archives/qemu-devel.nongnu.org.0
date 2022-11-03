Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20AA6184E4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdFu-00064S-JQ; Thu, 03 Nov 2022 12:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqdFo-00060a-RV
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:39:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqdFk-0003EW-FQ
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:39:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id w14so3603787wru.8
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OSjqgYLawBEjbFiJvKh3r2CjhBQY2fN9pKwJ/19xcxE=;
 b=o1AqraIEcRY9KpVBaGIvMd/0+2PNncFpDFSN1cZkgZAlTCW4uqm8VXjk12G8cRZwPI
 38sriwz32TA+f+8hCJO9OAgSrr9jEWnuUZUuvukGOi+bfQ9bfKrH/hQdVhA0cP5SpLVN
 kGs5k6tvJxzdtDA6wbBzpwDzuH/i+FLpSDdn2a+zNQxBTK8u5xAALkFpJSnPqPWPDstn
 fs0pMMIvIFuklH9USYdbDs33xU8vWBSsZPIJcwceKYpD7jP5sAQyNKYsUA5rIqrwRp+C
 jreBVvlXJOzQn5/QQd3NhXDbZPLQAUakhs33pDEBYw6GtpeJLXsr5+rtxdnhyBtGTSbZ
 0nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OSjqgYLawBEjbFiJvKh3r2CjhBQY2fN9pKwJ/19xcxE=;
 b=zskUPgDZhYW6qYJ3qgprv3CJtXI1ChRXDWcIZp8DtaPKkK1CSzXBO/eowCB0WZfIMr
 CBa/W5P8hA0MLjbWfE+xQROUgzZehwVBG/l89FVs4/un6XBuPGGG6H+T2PxFKEqdNFGt
 lbHfzWrDy8e0rd9bZNS1Ontui8fzEaSBuuHl/+Z6qgnSSQuDgfDtnf9ddnYodOhxrRik
 eelzlaqZhdc5pTA97w0CdFzcAKX/n5VnsNRiH+cae96IswU6tnhvoDhwaZ/rPPFgDPIy
 45ZyLG6uzf44OiV6PBKJJAtfCZZjOPROaDCwu3sjEHyEOhR7U8+3s7edNihm8+KVr92N
 mnbA==
X-Gm-Message-State: ACrzQf2Ve4nfUbUHA/9Zfk7IgLXytvnuolExcV/SBuM3VJLDGQTJaURE
 785GX18HzlG5pbGlpzpqaG08tg==
X-Google-Smtp-Source: AMsMyM5RGelBgjo3iGNXwS999P0hb9ejioPwFefPDQ6DiFVyzGFFGAQbJnH44iEzBLkXjyKYtk48Kg==
X-Received: by 2002:a5d:5967:0:b0:236:bd27:f1b8 with SMTP id
 e39-20020a5d5967000000b00236bd27f1b8mr17076781wri.390.1667493578337; 
 Thu, 03 Nov 2022 09:39:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a1c7219000000b003cf774c31a0sm364191wmc.16.2022.11.03.09.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 09:39:37 -0700 (PDT)
Message-ID: <02a62e9f-de07-3c5b-4398-2957f00dd03c@linaro.org>
Date: Thu, 3 Nov 2022 17:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 0/3] ppc/e500: Add support for eSDHC
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org
References: <20221101222934.52444-1-philmd@linaro.org>
 <72e7c23d-5a07-8d51-2bdb-cf957b84ac2f@gmail.com>
 <29fdeb41-5032-fca0-62a8-c8ee7fa611e7@eik.bme.hu>
 <e83d45c1-ded1-5176-2229-0053579a45df@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e83d45c1-ded1-5176-2229-0053579a45df@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/11/22 16:13, Daniel Henrique Barboza wrote:
> On 11/3/22 09:51, BALATON Zoltan wrote:
>> On Wed, 2 Nov 2022, Daniel Henrique Barboza wrote:

>>> Queued in gitlab.com/danielhb/qemu/tree/ppc-8.0 (since we missed the
>>> freeze for 7.2).
>>
>> Could you please always use ppc-next to queue patches for the next 
>> upcoming version and ppc-7.2 for the current version? Unless this 
>> makes your workflow harder in which case ignore this but the reason I 
>> ask is because then it's enough for me to only track ppc-next if I 
>> need to rebase patches on that and don't have to add a new branch at 
>> every release (unless I have some patches to rebase on it during a 
>> freeze but that's less likely than rebasing on your queued patches for 
>> the next release xo using version for the current branch and keep next 
>> for the future versions makes more sense to me).
> 
> Note that doing "ppc-7.2" for the current release and ppc-next for the
> next release will not prevent you from adding a new branch at every
> release, e.g. for the next release you would need to add a ppc-8.0
> branch.
> 
> 'ppc-next' is used like a standard, a way of telling 'this is the next
> pull request that is going upstream'. Can we change it? Sure, but if the
> idea is to avoid new branches every new release then I suggest the
> following:
> 
> - ppc-next: keep it as is

FWIW I use mips-next the same way,

> - ppc-next-release/ppc-future: branch that will host any code for the next
> release during the code freeze window. Note that this branch will become
> 'ppc-next' when the new release cycle begins

and use mips-fixes during freeze. My 2 cents, not sure it helps Zoltan.

> This would avoid changing everyone's workflow with the current ppc-next
> usage, while also standardize a branch for the future release patches
> during freeze.

