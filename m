Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C8A5315BD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:28:54 +0200 (CEST)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDjZ-0003E0-7O
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntDg0-0007hp-Jz; Mon, 23 May 2022 15:25:12 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntDfv-0000RB-Jx; Mon, 23 May 2022 15:25:12 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 t14-20020a9d66ce000000b0060af9ed4b87so5637444otm.9; 
 Mon, 23 May 2022 12:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HtWRs67tcKGN5qW1X3t2IT2q5nUK9hHeSSqPNFrlUao=;
 b=Zt1tb3JjyqSARiioT+NpqQbsbt6fblqpvMMYiWTKoP6HmewKCLsIiZBhZJNuMqa4qW
 USjWJFv8FjKzgqKqe6MtGQUoZGpL/sSyl6BtCgQfFgD8IGJgD5Z8nWeiXRxUo7ROVOhh
 44JllVmkthlbAZPG7L+LgTxJ5uioNU4WUx/LIb6owYVN1OQd8xsV5huhjUj/4EWTwdoS
 0z8Ppzr/0EdlRnFOknpRuRSXJQKJ9Yj3NsIyVkQRqOFctbDradn6MfAKE7Tr/GIvuHUD
 UHN/btMjYrjEPPDh7np1egu7b7PKmFav8lKAmC+Xz0liaLudHQtCNQsoY2YjkPimvR8c
 eBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HtWRs67tcKGN5qW1X3t2IT2q5nUK9hHeSSqPNFrlUao=;
 b=eKZd5z9aYKMT3RL/TWPRGDChXetGngd0J3Uu4+v9fBewY4Zt4WXgcwYaYyR+WI3HCo
 38Tr416RmyDFa33g48yW9NpYZes297jEU81tGouccGGavUdn8NKI1BSRFCpbgBL+Rf+s
 PxO5c13EKo5hS+t8EurmDlNScKT/svj3OV8Kp5yxXGoxEMwvu6RDj6QVAd03yLHUnHvO
 hxRsHj43LhvPNkbMxuTYiM4+6PuhdZc5UTLK9VoYyKpd/4Ity4UB2oYx0pOHzKLBAQ/+
 rYkjo0INcl5ZhrCf2nEEji5WiqyQHZe5v9cjZbsgV2NjCSxuvN2zVrM6CKwFdGcwDfFG
 2/QQ==
X-Gm-Message-State: AOAM5306bypEPMtSLxrn8gYNC5WCy/SBD/If59GL0hmx6ChVL4LAp/KH
 K2fb6g4jNo+w/EklJutDUbI=
X-Google-Smtp-Source: ABdhPJyUrd1K3MpSHlj8CKldmwJhxw6mDtdpfibKlUGkH5XQ9Co+ZkOHN+i2RM9SI0su5e4WhS7TmA==
X-Received: by 2002:a9d:4547:0:b0:60b:103e:f836 with SMTP id
 p7-20020a9d4547000000b0060b103ef836mr2814798oti.250.1653333903079; 
 Mon, 23 May 2022 12:25:03 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 q3-20020a9d6643000000b0060b128b935csm1490706otm.39.2022.05.23.12.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 12:25:02 -0700 (PDT)
Message-ID: <d2b9c0a7-bd68-8860-8214-691c19532f05@gmail.com>
Date: Mon, 23 May 2022 16:24:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 00/12] Change helper declarations to use call flags
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org
References: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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

On 5/19/22 17:18, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> In our "PowerISA Vector/VSX instruction batch" patch series, rth noted[1]
> that helpers that only access vector registers should be declared with
> DEF_HELPER_FLAGS_* and TCG_CALL_NO_RWG. We fixed helpers in that series,
> but there are older helpers that could use the same optimization.
> 
> Guided by the presence of env as the first argument, in patches 1~4 we
> change helpers that do not have access to the cpu_env pointer to modify
> any globals. Then, we change other helpers that receive cpu_env but do
> not use it and apply the same fix, taking the opportunity to move them
> to decodetree.
> 
> [1] https://lists.gnu.org/archive/html/qemu-ppc/2022-02/msg00568.html
> 
> Patches without review: 06.
> 
> v2:
>   - darn32/darn64 helpers declared with TCG_CALL_NO_RWG_SE;
>   - xscvspdpn implemented with helper_todouble, dropped helper_XSCVSPDPN;
>   - vmsumuhs and vmsumshs helpers declared with TCG_CALL_NO_RWG;
>   - Link to v1: https://lists.gnu.org/archive/html/qemu-ppc/2022-05/msg00287.html
> 
> Matheus Ferst (12):
>    target/ppc: declare darn32/darn64 helpers with TCG_CALL_NO_RWG_SE
>    target/ppc: use TCG_CALL_NO_RWG in vector helpers without env
>    target/ppc: use TCG_CALL_NO_RWG in BCD helpers
>    target/ppc: use TCG_CALL_NO_RWG in VSX helpers without env
>    target/ppc: Use TCG_CALL_NO_RWG_SE in fsel helper
>    target/ppc: implement xscvspdpn with helper_todouble
>    target/ppc: declare xvxsigsp helper with call flags
>    target/ppc: declare xxextractuw and xxinsertw helpers with call flags
>    target/ppc: introduce do_va_helper
>    target/ppc: declare vmsum[um]bm helpers with call flags
>    target/ppc: declare vmsumuh[ms] helper with call flags
>    target/ppc: declare vmsumsh[ms] helper with call flags
> 
>   target/ppc/fpu_helper.c             |  22 +--
>   target/ppc/helper.h                 | 225 ++++++++++++++--------------
>   target/ppc/insn32.decode            |  28 +++-
>   target/ppc/int_helper.c             |  22 +--
>   target/ppc/translate/fp-impl.c.inc  |  30 +++-
>   target/ppc/translate/fp-ops.c.inc   |   1 -
>   target/ppc/translate/vmx-impl.c.inc |  62 ++++----
>   target/ppc/translate/vmx-ops.c.inc  |   4 -
>   target/ppc/translate/vsx-impl.c.inc | 107 ++++++++-----
>   target/ppc/translate/vsx-ops.c.inc  |   4 -
>   10 files changed, 284 insertions(+), 221 deletions(-)
> 

