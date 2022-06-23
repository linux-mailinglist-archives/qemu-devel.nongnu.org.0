Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A86558B38
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 00:30:59 +0200 (CEST)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4VLm-0001m9-G0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 18:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4VJg-0000E3-DT; Thu, 23 Jun 2022 18:28:48 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:40936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4VJe-0006cV-Oh; Thu, 23 Jun 2022 18:28:48 -0400
Received: by mail-oi1-x233.google.com with SMTP id be10so1319586oib.7;
 Thu, 23 Jun 2022 15:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8spRB5YG/KQ/nFSxqxtcJnZGw9/YPm/xLPipRfXEPkY=;
 b=DGtS0tQ6EIrhKy8l7StlHtBrDY/RcwumNpqRknVgcMo0Te5HwB70w1XPRgLtNvpOJP
 0xz8yGk8kVNIwLF0AWU/xNmXNJBaZ9ibkddTsrCJoO9f+c54Ldt1U+OEZV0MhQY1OwIp
 uoe/Dt5wwW760z5OI8zq4PUAOXcDoSXEqtL7WD6iW1kYJbpXbmz9RXfmLWLA+s0nl3ut
 Am39H15zeDrPd1pNGNxpWLV1PBoRQmI04tJjC4Bm9bJDlcXwe+lQ1qlxEHtIJEc1gLVt
 SWOVvDugQQUyUWa4HYmvJ9p4b70+44ha08BHycsHGldtT/CzwHuNjbg6ddwRlgDUqV6Z
 dP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8spRB5YG/KQ/nFSxqxtcJnZGw9/YPm/xLPipRfXEPkY=;
 b=vsgMPq+xgIRt6nJPgaxh3gwr8YOBZgUrYX1m4Z9ORZxWll+G8U1IsVhQwjCoWOr+8D
 Q82Q0/5MT3Lq8xLNNoALA9SJAeFRFlsltVdHeGaFXDdbkWveDAJ2VG37ymBoiqxVhOkn
 rbB44mkmE/63XHPtqFPg6e052r4fN7Tp/Rm0XcaQcAWAUSaegRE5oUGKPnj5zIh3hEif
 iU5+vamPj0eGizX4G1W0JTXyGJjA2Qr0zlFc0VuDRRyTaQRsSMlz48S+zzdmyBFMdjQH
 90QRvL0IuBEM8HwMF53eFdoBq50eUjs3nLHkqYEnXQ2/GkWjIcfPVawiFPC9Hv2IOElT
 ATMw==
X-Gm-Message-State: AJIora9zeKbmWp3LXXx6vZZ2ePP642EwRyTSjrjf+iQCHmO+zg9seea2
 6ZZ2u9hT75Oqkh3egPvU3eU=
X-Google-Smtp-Source: AGRyM1tu7u/FmleJUuJSg7ciEDFArmGUs4T1akHiO1ep7+77YxZ3AsOJRLPqNXKvRK7EhO1wsyyAkw==
X-Received: by 2002:a05:6808:108:b0:335:26da:768f with SMTP id
 b8-20020a056808010800b0033526da768fmr152384oie.16.1656023324213; 
 Thu, 23 Jun 2022 15:28:44 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a4ac906000000b0035eb4e5a6c7sm319780ooq.29.2022.06.23.15.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 15:28:43 -0700 (PDT)
Message-ID: <47549757-d105-7a2d-a48a-e43afe6a66a6@gmail.com>
Date: Thu, 23 Jun 2022 19:28:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/11] target/ppc: Implement slbiag move slb* to decodetree
Content-Language: en-US
To: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org
References: <20220615192006.3075821-1-lucas.coutinho@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220615192006.3075821-1-lucas.coutinho@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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

Lucas,

Can you please rebase this series with current master?

I got a conflict in patch 03, and every other patch that tries to add
instructions in insn32.decode, because of a missing "TLB Management
Instructions" that are not present there anymore.


Thanks,


Daniel

On 6/15/22 16:19, Lucas Coutinho wrote:
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
> Based-on: <20220614163018.39819-1-leandro.lupori@eldorado.org.br>
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

