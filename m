Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532B57569D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 22:52:35 +0200 (CEST)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC5p4-0004As-IF
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 16:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC5m7-0007fP-EA; Thu, 14 Jul 2022 16:49:31 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC5m5-0004yF-Nu; Thu, 14 Jul 2022 16:49:31 -0400
Received: by mail-oi1-x22f.google.com with SMTP id j70so3812730oih.10;
 Thu, 14 Jul 2022 13:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FX0H5cn1kzoGHUn0zeGxXb75jaxU3KRWO/i92AoK6Lg=;
 b=gJPX/PFMknX0t4U2bqphtAoa6Ex/IFq7DPnkB5skb4YiMLr/+MyabsIm2oFwC3G5VB
 tB4CVay1ynaqw0W6emvlgVlZoIl7Mkxg2AwSamPMbjn+F+EsW+q2jTzP2sZAFyMohgbt
 Xi+ULGtDZmCuJkPYdye/7HZVD2DlcFdkhzhwXE1wTwB4phFVoeOJNI95ekJd31bRxKt6
 zyiIo/oAm4gmnZWo9FwQ78yn/VziaINbJeL6vs3kcuE0uVn/G6ioPiRk+NiqeYXHS01u
 9yB61hAOH/T1QTP6XKyArAH6fQICJVTjtaaeQfkuUSQUFg+xJD51R/BzFtifo+FZRBKD
 EdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FX0H5cn1kzoGHUn0zeGxXb75jaxU3KRWO/i92AoK6Lg=;
 b=RaNfaqPMiNUukJOm/CjUkBeqSBM5koTbidv2VICtLgDAhR06Bw48D0be2Hiz+pNMVB
 CWOHVz63Ivapv2dr8Hw83rxkulBkUUdQT/hlBqSFZWOMO+pLGf2SHhDB9S8p2IbR29B8
 GQEkrqUV4SH4BNOVX2JkEJPz0Cm/KxR4PMnTP9wMvJX4JbFh940NBmcmsF/qNMImbghZ
 R3msbN9EXhToc9MhLktyTgCG7aj6sWIAABHokYhIHr6W5lOigj4wNYw7RKFuVhYBnnK5
 5LXjw+rMX/+5TpexT9wS40M+8MYpiGU9+uXw5tgr55Qymx72CyX1F20iFDJMNqYvRju6
 wwPQ==
X-Gm-Message-State: AJIora/yIiGdffASScpV/SRTkBgaJdw2jJgJ48unhoLhxdqmq2Oxdbid
 MGE8fmFN45A+XllUEuhztiRq863wCk8=
X-Google-Smtp-Source: AGRyM1vzEv+K7jX8mUsFnqeyR1jcUCTmHle4diNZ4VgoCs7xSqi8kQ5h97KeXd7YY7TDolhIXySvGA==
X-Received: by 2002:a05:6808:1995:b0:335:a0f0:4b8 with SMTP id
 bj21-20020a056808199500b00335a0f004b8mr5346774oib.57.1657831767235; 
 Thu, 14 Jul 2022 13:49:27 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 u21-20020a056870421500b001019fb71e4bsm1427939oac.17.2022.07.14.13.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 13:49:26 -0700 (PDT)
Message-ID: <05e5c32e-e0be-2301-9a4c-dd89f0c44128@gmail.com>
Date: Thu, 14 Jul 2022 17:49:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND 00/11] target/ppc: Implement slbiag move slb* to
 decodetree
Content-Language: en-US
To: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org
References: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 7/1/22 10:34, Lucas Coutinho wrote:
> Resent after rebasing and fixing conflicts with master.
> Add Leandro Lupori as reviewer.
> 
> Based-on: <20220624191424.190471-1-leandro.lupori@eldorado.org.br>
> 
> Implement the following PowerISA v3.0 instuction:
> slbiag: SLB Invalidate All Global X-form
> 
> Move the following PowerISA v3.0 instuction to decodetree:
> slbie: SLB Invalidate Entry X-form
> slbieg: SLB Invalidate Entry Global X-form
> slbia: SLB Invalidate All X-form
> slbmte: SLB Move To Entry X-form
> slbmfev: SLB Move From Entry VSID X-form
> slbmfee: SLB Move From Entry ESID X-form
> slbfee: SLB Find Entry ESID
> slbsync: SLB Synchronize
> 
> Lucas Coutinho (9):
>    target/ppc: Move slbie to decodetree
>    target/ppc: Move slbieg to decodetree
>    target/ppc: Move slbia to decodetree
>    target/ppc: Move slbmte to decodetree
>    target/ppc: Move slbmfev to decodetree
>    target/ppc: Move slbmfee to decodetree
>    target/ppc: Move slbfee to decodetree
>    target/ppc: Move slbsync to decodetree
>    target/ppc: Implement slbiag
> 
> Matheus Ferst (2):
>    target/ppc: receive DisasContext explicitly in GEN_PRIV
>    target/ppc: add macros to check privilege level
> 
>   target/ppc/helper.h                          |  15 +-
>   target/ppc/insn32.decode                     |  26 ++
>   target/ppc/mmu-hash64.c                      |  41 +-
>   target/ppc/translate.c                       | 417 +++++++------------
>   target/ppc/translate/fixedpoint-impl.c.inc   |   7 +-
>   target/ppc/translate/fp-impl.c.inc           |   4 +-
>   target/ppc/translate/storage-ctrl-impl.c.inc | 146 +++++++
>   7 files changed, 377 insertions(+), 279 deletions(-)
> 

