Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A551B1CB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 00:27:40 +0200 (CEST)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmNT7-0000nJ-Uc
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 18:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmNRx-0008Fn-V2; Wed, 04 May 2022 18:26:25 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:41710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmNRw-0007Np-EI; Wed, 04 May 2022 18:26:25 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-edf9ddb312so1698246fac.8; 
 Wed, 04 May 2022 15:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nSLe6ReYKeuyKzcKE31AbQnD4uTZxCXSGBlPmc2pFyQ=;
 b=HmHBlbYMl20x5Bi1ZGp+iIfFFis3bBkVSJa/vNyhIIcBLwHjAzjLS1PRfWDETqOSo3
 i0ft6y0fz1lxESpEGk4x5T8xXyFkAm7S36upU6kkrEL2X2tPB8m2/E2aixxgqNA8fi0S
 uA7vo0BEFV2B9fMaCYVCemV4OGPgaczwlYTM+YCCZZGn6LYHHTgCsedath8VBAODutst
 fApuMDXmG1EEFbuO5lxvjMDpSTIQXYErnvYfhiIZkSq7f4AasUFufUszMwjKx15QLFyh
 gmiPfDjQKp8w4oYvavwp+S6an2z/M2LDCyws6JFrE5Wn5hfyTIJsmSE0zz3XhFSNpZML
 HEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nSLe6ReYKeuyKzcKE31AbQnD4uTZxCXSGBlPmc2pFyQ=;
 b=lfJpDWeRUmM2qZSI+dJlLmfUmpC4wUyqfb4COLPc1330QPRtRz/XOjq8vC73Hoqt63
 bDYCbwRanetfXHuqCAL4QMqys8F9UF3/Ia0fjL6Clr+YnehhQikw7JXiP9GZJsiJRJO0
 ZdEM1Lcu6ZvrcO96Emy/gyS3nj1rmqaIHEN0kDy4YqOAWit4y9MGKQRZMWAv+wuLvJcD
 s3jGIzIDg9zapSbq3IauSXeJ9T7KXD3LipOnvEJ7dkHca+vzst3zlKHgwZUTVtFUq/R9
 gqKidNex83xVhNkZxiWeRD/nKxAG1Ayv2MFf4HCTklawlMXT2oCYsIuI85U+DqdhE4es
 tTQQ==
X-Gm-Message-State: AOAM531Neo4RNK3F4m/DNT5Kgp9qYfClqUTe7XVTdHieHxO4qVHaj72Z
 Q8yu+iDp/m35wdXA1sLe1uM=
X-Google-Smtp-Source: ABdhPJziPUiNCzdv7dc8atGLD15g2ftYnTZfEBPlw9ni/EUDeREgE0aTQANoPTXhPYkU7JM2nUJArA==
X-Received: by 2002:a05:6870:b3a2:b0:e9:f22:5819 with SMTP id
 w34-20020a056870b3a200b000e90f225819mr854782oap.293.1651703182792; 
 Wed, 04 May 2022 15:26:22 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 a19-20020a9d4713000000b0060603221243sm5521731otf.19.2022.05.04.15.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 15:26:22 -0700 (PDT)
Message-ID: <13a5f478-8645-7885-7742-b3310fdca73c@gmail.com>
Date: Wed, 4 May 2022 19:26:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/2] ppc/xive: Update for guest interrupt handling
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: npiggin@gmail.com
References: <20220429071620.177142-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220429071620.177142-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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



On 4/29/22 04:16, Frederic Barrat wrote:
> This short series fixes a couple of issues about interrupt handling
> found when running a KVM guest on the powernv9 and powernv10 models. I
> split a patch I previously sent.
> 
> Changlog:
> v2:
>   - update comment on patch 1
>   - picked up Cedric's reviewed-by on patch 2
> 

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> Frederic Barrat (2):
>    ppc/xive: Always recompute the PIPR when pushing an OS context
>    ppc/xive: Update the state of the External interrupt signal
> 
>   hw/intc/xive.c        | 25 ++++++++++++++++++++++---
>   hw/intc/xive2.c       | 18 +++++++++++-------
>   include/hw/ppc/xive.h |  1 +
>   3 files changed, 34 insertions(+), 10 deletions(-)
> 

