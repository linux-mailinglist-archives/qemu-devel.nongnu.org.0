Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92C50908F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:39:09 +0200 (CEST)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGAO-0008OX-9U
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFkJ-0008IG-JN; Wed, 20 Apr 2022 15:12:11 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFkH-0002P5-No; Wed, 20 Apr 2022 15:12:11 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 v12-20020a9d7d0c000000b006054b51c3d4so1732812otn.8; 
 Wed, 20 Apr 2022 12:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FMO5ICRBjQRtXoIGG7x70zlJWC3qmIoUZFWypSEhtIg=;
 b=TZoor2Q+bm8uqQ26/zSMwoRz3eTxe/MpSNVcjW7AIqiSggrx0gJETKtwDvLX6Oedej
 fAOQA8XqacbnMQUHzu+wHPgdgcmBiY4PjjMds0KUC1WIMb36RY9SHcwxZMbFvoZXcgG1
 As+Ofqlrl/QuCLYVz/WztqoG2uKQ9+MUn+IQ+/X9lGi+tSekABOYgad628gWr8h78/bj
 1vl+v9r7n9xndOl4RoH+rWNhdiCVw80LmspjAYug/SuCVHI58F0WvRa3p54aJLBwBoS3
 fnnMFBwfk24Wj20lILG4o+G2iO2NKZTPQlS946Ntg0sL+pX6jgOeJTP8InHEdKTx1bnF
 7Z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FMO5ICRBjQRtXoIGG7x70zlJWC3qmIoUZFWypSEhtIg=;
 b=qmXW4bJ7vwmud+zs2ugZw7yL43TSp/igIXAiQfJob+/9AN7Gyk9ZCJ0Cryqr5N2MiS
 95gtnse5favMHhS+xedWeypcy4t4uj/dQmxwK8k20lMoYUDtU4vI0V6oUAliQp9VtxhR
 fvQA2p5s4RZWfbFBd4InwCHOIRWPVSJ/nSUjqfRC4BFDSOVpUkiEJyUczOuAPhUiOGbM
 gtIHR7BKZVk+Cz7grWUekzNnRpGRhI3ivKZPyKhPjBiORgEaJxUBUlHxn+449VuZgI3D
 lGXvrV5q9xIfJusHZoqFIl4mwvxFklDdTVh6Vev51e73zJa1ApPQAmkPIvaie9XP4MAl
 oQZQ==
X-Gm-Message-State: AOAM530L6s1Z1ml/LsId2yNvGeBD3NXu94QIpxRsBCpAztGmur1QSED+
 7DMr/eb9qAQsZIcSw0cG2dU=
X-Google-Smtp-Source: ABdhPJxiZyWk2PU52lGDLjXHuhpkafNa1sv3L3Zho5CfW7hZ8lKZjZy+QbLi0uhQkwXyn3bqWR7Xuw==
X-Received: by 2002:a9d:114:0:b0:604:8e3f:f5fe with SMTP id
 20-20020a9d0114000000b006048e3ff5femr8256597otu.252.1650481928186; 
 Wed, 20 Apr 2022 12:12:08 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a4a3c15000000b0033364bde9besm7039888ooa.32.2022.04.20.12.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:12:07 -0700 (PDT)
Message-ID: <5c09f3f0-3548-647c-4094-1f39d7272217@gmail.com>
Date: Wed, 20 Apr 2022 16:12:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/2] spapr: Make the nested code TCG only
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220325221113.255834-1-farosas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220325221113.255834-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 3/25/22 19:11, Fabiano Rosas wrote:
> The spapr virtual hypervisor implementation of the nested KVM API
> depends on the first level guest to be emulated by TCG. So move the
> whole code under CONFIG_TCG.
> 
> v2:
> 
> - Created hypercall_register_nested instead of reusing
>    hypercall_register_softmmu;
> 
> - Rearranged the ifdef a bit to keep the hypercall_register_*
>    functions closer;
> 
> - Dropped the more paranoid patch that checked for KVM at every
>    call. I couldn't convince myself anymore that it was necessary.
> 
> v1:
> https://lists.nongnu.org/archive/html/qemu-ppc/2022-03/msg00412.html
> 
> Fabiano Rosas (2):
>    spapr: Move hypercall_register_softmmu
>    spapr: Move nested KVM hypercalls under a TCG only config.
> 
>   hw/ppc/spapr_hcall.c | 74 ++++++++++++++++++++++++++------------------
>   1 file changed, 44 insertions(+), 30 deletions(-)
> 

