Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFD1531577
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:19:33 +0200 (CEST)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCeS-0005rP-RJ
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntCbp-0003IQ-GI; Mon, 23 May 2022 14:16:49 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntCbn-0006UY-UV; Mon, 23 May 2022 14:16:49 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 b14-20020a056830104e00b0060b1ef4ac60so856750otp.0; 
 Mon, 23 May 2022 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TXdZzOT0yDRHSrdbMnDY6tQbFF59sAn9fQCTfL82E30=;
 b=XeHDb359sM9d/AFMCcdP/ouMCvkWGlFoRPb6cxpjdQvkWS+TuCawk1mjSU8ALOFpO3
 W15crhcs88nLNjxnyAAA7Ewbb1Xow5I5eCqUpQJZO1g6U0AmUks4EMGcJhJfjMCn+PKV
 +8w8LoNI/l4TQJi8nnOlgwamXsC4qL0pGM9MTFILdMac/+7phrU3gR07g6a6yRrqpMcG
 Bn/+461zEje9mmSr4S1zSF0pwCuf29GPoZaQgChbquHmjqNrcGd8ntlv8vhXmXZzRmt0
 ooiKOVwWTLarhMhaLBDwz2unLe0xmHK+JpzZvShLwyxv0/LBxUjLKR3RKFGxR01qw+0T
 7hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TXdZzOT0yDRHSrdbMnDY6tQbFF59sAn9fQCTfL82E30=;
 b=rREcs8BjH5DgRBpWwr7MKK7/Hz/8Bw86namyeNYYJrMZ4ThFlHPWATCnqN1YacK4Fv
 1le6rP0VtKV85LdNdJq9+ok9ls0ItKrzmaxT+MZiO4nvX7yyJAxrRWwY6Pm16hskfpY6
 C1PmxEE9T9QwkJWSRbZTltmBJoSaKX1Q2PlYwObdGjU9rmmdCaRxO4Iogv1sbcso+Y06
 zQ5gho1Q0jW0LlbuK850Vz+SqSCMJ2/eDW2vRoBoGNo1jGs1NEZpE+U/+0R5OeuxP4HP
 poWqYPVoaZH5O5yXAAL5F7U/7hqTj0jEUSB71+11UHz+US24Jc+PQ2o4FtLpe5/+UBFx
 Ytsg==
X-Gm-Message-State: AOAM533+8KR1idNzUqhE2KqOWSTKgMqS/4lMm1HoLg9OnnnVSCK0vV9M
 n1DupoBa2vDISSwSDR5Yjms=
X-Google-Smtp-Source: ABdhPJwBWw1DU32NVX/3txpCmuk+1vrnhpde5Vx3Yy4iSAOJthXL+db3DEgOrqv95pCn358Lk+CWCg==
X-Received: by 2002:a9d:58c3:0:b0:5e6:d8f7:c18c with SMTP id
 s3-20020a9d58c3000000b005e6d8f7c18cmr8995618oth.364.1653329806393; 
 Mon, 23 May 2022 11:16:46 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 n24-20020a4ae758000000b0035eb4e5a6b1sm4529660oov.7.2022.05.23.11.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 11:16:46 -0700 (PDT)
Message-ID: <734ae3fc-dbad-673f-853e-8c69039c7d16@gmail.com>
Date: Mon, 23 May 2022 15:16:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 0/3] target/ppc: Fix FPSCR.FI bit
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, rashmica.g@gmail.com
References: <20220517161522.36132-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220517161522.36132-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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

On 5/17/22 13:15, Víctor Colombo wrote:
> Hello everyone,
> 
> According to Power ISA, the FI bit in FPSCR is non-sticky.
> This means that if an instruction is said to modify the FI bit, then
> it should be set or cleared depending on the result of the
> instruction. Otherwise, it should be kept as was before.
> 
> This patch set fixes inconsistencies found in QEMU's handling of the
> FPSCR.FI bit, where it's treating as all instructions are supposed
> to change FI.
> 
> Thanks!
> 
> v2:
> - move the FI change from float_inexact_excp to do_float_check_status
> - remove the setting of FI from float_overflow_excp, making
>    do_float_check_status() the only responsible for it.
> - make float_overflow_excp() return float_flag_inexact if it should
>    update the inexact flags.
> - Add patch 3, moving the renaming of sfprf to sfifprf to it
>    (previously on patch 1)
> 
> v3:
> - rewrite patch 1 commit message
> - fix missing comment change in patch 3
> - add all R-b
> 
> Víctor Colombo (3):
>    target/ppc: Fix FPSCR.FI bit being cleared when it shouldn't
>    target/ppc: Fix FPSCR.FI changing in float_overflow_excp()
>    target/ppc: Rename sfprf to sfifprf where it's also used as set fi
>      flag
> 
>   target/ppc/cpu.h        |   2 +
>   target/ppc/fpu_helper.c | 223 +++++++++++++++++++++-------------------
>   2 files changed, 117 insertions(+), 108 deletions(-)
> 

