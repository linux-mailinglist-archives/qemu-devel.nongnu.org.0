Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE456097CB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 03:32:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiqm-0007Yn-Am
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1omJFI-0005Um-59; Sat, 22 Oct 2022 14:29:20 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1omJFG-00080E-G0; Sat, 22 Oct 2022 14:29:19 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-12c8312131fso7454436fac.4; 
 Sat, 22 Oct 2022 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zhjS0oeSWUQaBn8mSIhlIcL7keoOPNi1ZfDOYCAmvRA=;
 b=N3/Fp+HO9DpETL0BWhMOoTiHJwv0I6zbqEKI9DDfL3yFY0mUWWXGHh8jAWVwsIecrT
 lNMcPcwPDxZAGvhQ7arXv3QA83R4GI7wJdvFv2x+1C2TXNlGPi1cMy1ZdZkpf7R8e+K+
 kigO7KVaX+vEPSCvHmfdLlePClz1djs2KBO41dxOVrOuTxvyQYZMoH5+dt2ribMzRXVd
 dQAbQ25lLnS7m1I4hLsKtj054wNZAaxfKAIbd9d5s/T4isYPmnX77kWNh5U7nFnrY+Px
 DtSnfuVXHa2v9cVQWesT8G7vlLvo8DDqyH3yC1AuB8RMC1Yz7WFDI3z6+tY4+Ehr4Zwo
 8Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zhjS0oeSWUQaBn8mSIhlIcL7keoOPNi1ZfDOYCAmvRA=;
 b=4KO2qxMeA0wNYGm22bH5o5r4NKg4IcP7vGSmJ/MAV3mzhPONX/culhWiJnLph+Xdcy
 ezfV6eYpiw2d+6s4ATimJwzNZZBjafs/RR9rh/fjQ0S36IeMjkOv+cA4z/dNrB+hwbyO
 C2y5Qtzkz44pccPvYwOpmAAxnK8VrOZCRHOa0KnRM3YRYtsT8x6B9RAcJBQAo1SlNZGx
 JbHNVlVGSOxFZJxc8aUHCCeiz7yT84sxuIq6UBY9BcMkC0TRqDbIHhdn7myiKmckg0Bg
 S/6HBmnhHtFoT+Yp2esPYqMvCUSyo04rZLWaJ3ScQNb0tI6D8O/Yh0MtVclmoUa0nMzL
 d07w==
X-Gm-Message-State: ACrzQf2v0Llw8+qyMBD7Sp8ya+/E17uxZxIQ5CWCTcxdeFCVmkbiM0No
 9XEfNKW2WAESk+zWyjOkBeE=
X-Google-Smtp-Source: AMsMyM6DCXRxNti6wlaCFmpWVsUxZP22nL/ijoOnHvmAqEcbLegeXugK+0HcYrTjKPy5A5hFtYSyYw==
X-Received: by 2002:a05:6870:d0c7:b0:136:9add:78d4 with SMTP id
 k7-20020a056870d0c700b001369add78d4mr15460968oaa.9.1666463356903; 
 Sat, 22 Oct 2022 11:29:16 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a056870c08600b0010c727a3c79sm3152661oad.26.2022.10.22.11.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 11:29:16 -0700 (PDT)
Message-ID: <374a8cee-1706-ff31-63a7-e9c8452b5c05@gmail.com>
Date: Sat, 22 Oct 2022 15:29:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/3] PowerPC interrupt rework
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 fbarrat@linux.ibm.com, alex.bennee@linaro.org, farosas@linux.ibm.com
References: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 10/21/22 11:21, Matheus Ferst wrote:
> This version fixes the problems found by Daniel with e500 tests and
> rebases on ppc-next.
> 
> Based-on: https://gitlab.com/danielhb/qemu/-/tree/ppc-next
> 
> Matheus Ferst (3):
>    target/ppc: introduce ppc_maybe_interrupt
>    target/ppc: unify cpu->has_work based on cs->interrupt_request
>    target/ppc: move the p*_interrupt_powersave methods to excp_helper.c
> 
>   hw/ppc/pnv_core.c        |   1 +
>   hw/ppc/ppc.c             |   7 +-
>   hw/ppc/spapr_hcall.c     |   6 ++
>   hw/ppc/spapr_rtas.c      |   2 +-
>   target/ppc/cpu.c         |   2 +
>   target/ppc/cpu.h         |   1 +
>   target/ppc/cpu_init.c    | 196 +--------------------------------------
>   target/ppc/excp_helper.c | 144 ++++++++++++++++++++++++++++
>   target/ppc/helper.h      |   1 +
>   target/ppc/helper_regs.c |   2 +
>   target/ppc/internal.h    |   6 --
>   target/ppc/translate.c   |  11 ++-
>   12 files changed, 170 insertions(+), 209 deletions(-)
> 

