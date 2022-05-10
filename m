Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAED522561
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 22:24:09 +0200 (CEST)
Received: from localhost ([::1]:49772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noWOt-0003t5-UX
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 16:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1noWNN-00031E-9m; Tue, 10 May 2022 16:22:33 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1noWNL-0002a4-Ec; Tue, 10 May 2022 16:22:32 -0400
Received: by mail-oi1-x235.google.com with SMTP id r1so353567oie.4;
 Tue, 10 May 2022 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QX8WGWSHypx6GQ2zQvBvi4SVMb7QF8fTcbM2EGoj5OM=;
 b=Ya1PxMBwPmxJvJq3G474Ddq+a/U5LD3y19jteMqsBuC2MVFpPnu6x2r4USUOP/DZrM
 v2KzqDF7bdozvAs9nHRSC9oaeKWYayjuq+Z6tOztG+xMlneUG6V5tFiVbpv1DSzCRHsU
 +b2mNquc8UAjJkL0z4+l/0I/nG52qULDiUyLxq47CjBAe7QBnkUOm+9+yH0HzV12OV/n
 fOn/uEGnqyfF0FMJflqITYyKZTjP42842q4yFmuzm4XWTV8zPoDT+GyBqZuaUlW9C0eH
 Tv3treXy7KMPv5SxbyX5j3Q1/a2z7I1vMLlt58jVK+priPJj0zzk3enYYlh+8appXkUE
 K1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QX8WGWSHypx6GQ2zQvBvi4SVMb7QF8fTcbM2EGoj5OM=;
 b=X40iecCu6aFb8nwxcNSZCPiyvEQMPVBBTf4saDJ/05pvxWkrngbbYyMmnCgLlfU4qM
 1qDz4sR9p2/M3ld6tWoOuxoUPmFyUzd7OyKSB8KPnFzCM09TNN3IIK+0z94RfrIrVwUy
 onbHnIn4tNVhn6yGU4xXIn6vEgt0JW1Ew7VXWMfI+Pj5RvxV1+TGr48LjRz7SbeQAQ50
 XB7Z0+yHrdFNoAg6oKfjq9cIdpDf+rDNonbcnVGeun+J0mEtJJgold9OuSA0p5lohAZQ
 48t3RrG5A4mwTdj0OO+CeW82WUNIpr41M5SeJdPjCSRhWe9hD4hynfe1eb/FqZDx2Mah
 PgjA==
X-Gm-Message-State: AOAM530ysfR/+71Vy7foas1nXzh4+xBVo7Twh87jK1TUDV/ocB7dhGxJ
 8iSozKW+TytLg7IOvkEASRI=
X-Google-Smtp-Source: ABdhPJxrwIzczX7bi7afnA/IIHl14wnXG9q3Tx8agiASnGASYJKcyfWge/PPoqoNqTki8dygeam+mw==
X-Received: by 2002:a05:6808:2089:b0:326:df52:459c with SMTP id
 s9-20020a056808208900b00326df52459cmr895742oiw.202.1652214149794; 
 Tue, 10 May 2022 13:22:29 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:6d99:130b:198b:b4b2:dcf0?
 ([2804:431:c7c7:6d99:130b:198b:b4b2:dcf0])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a9d7242000000b0060603221279sm52584otk.73.2022.05.10.13.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 13:22:29 -0700 (PDT)
Message-ID: <33fe879e-ccb3-13a7-f7ed-5e2031dd9b31@gmail.com>
Date: Tue, 10 May 2022 17:22:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220427064204.373027-1-joel@jms.id.au>
 <e29248b7-1a61-87db-dc81-5c9db844b7cf@gmail.com>
 <ee50cc96-e26b-beb1-3042-d9b84b9589cc@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <ee50cc96-e26b-beb1-3042-d9b84b9589cc@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/10/22 14:34, Lucas Mateus Martins Araujo e Castro wrote:
> 
> On 27/04/2022 17:51, Daniel Henrique Barboza wrote:
>> On 4/27/22 03:42, Joel Stanley wrote:
>>> These are new hwcap bits added for power10.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>> MMA support for TCG is on the list so I think it makes sense for this to
>>> land after those are merged.
>>
>> I believe you mean this series:
>>
>>
>> [RFC PATCH 0/7] VSX MMA Implementation
>>
>>
>> In that case I'll queue this patch together with it.
> Daniel and Joel, do you want me to send this with my patch series so there's no need to rebase this patch and they can be added together?

Yes please. That'll make my life easier when queueing them.


Daniel

>>
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
> -- 
> Lucas Mateus M. Araujo e Castro
> Instituto de Pesquisas ELDORADO <https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
> Departamento Computação Embarcada
> Analista de Software Trainee
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

