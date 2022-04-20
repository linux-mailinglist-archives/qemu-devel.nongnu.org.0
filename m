Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268E509102
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:02:02 +0200 (CEST)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGWX-0003lF-3D
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFpr-00034O-0Y; Wed, 20 Apr 2022 15:17:55 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFpp-0003Lh-Hg; Wed, 20 Apr 2022 15:17:54 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e2afb80550so3034809fac.1; 
 Wed, 20 Apr 2022 12:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=QghN2hr6dvFRZ7wx5YJ2Y8JedLHfGHLoUK8jkzls5XE=;
 b=WnEvPaeO3M/+80+zb40dE77zr/tePYFlZcz0SgtsuAyYw40TWynpmvilRFoeXWAIrj
 NsgcuyhNH/nXnsLRQYKxm7wg30jFqyXsuqC67fPFPh1btetaq+FFopsiGzUVdQVT7z5z
 FLwbKkEHzT24KGEcLN/mIjTrMEGlmHNh2bxD8qkiBesSSsG3Q/xWJKRXuBcsntphbxAV
 KpcVGXGkXTwC7SpSQdMRUb5Enn5YEUs6KK6pbcAkANJjlNsto3vzTsbzV4bn/giXIoUL
 ZAb++xi1TNAm3lN2m9PuY7KCmXTDs8aoT09r2GAfD8RdN2sgSF1Du/o9ltquhnBxlXJj
 rRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QghN2hr6dvFRZ7wx5YJ2Y8JedLHfGHLoUK8jkzls5XE=;
 b=c34hCucIDZ+V0h6ripnEwPs0UMeN28AsSx/BRsP6yqwr4i9bi5mv36X5BkDxe8p3Gg
 Mqb9JdRxo29Klk3UceJjSLLokkYXyaAxVYn/PnK0peVBfS+2PNdeetxsafeylk1s20Re
 00VDASUl5J+nO7PwadhLKb9IHhLFs6+Giu9GeLI/uGjIrmiyEnJLvpLU1UDwkI100/+E
 VMUAWGQdVVuT0wSO1PAhd4EDDPXhgOweA50dLBJI81gTSIS0n1fcgnC/noERYfeW2kjB
 DUwm7AtnE9mS6qcKVG+MD2WDOEufARrjPR/OwHA0PRb6Nuca8hE+9DDszTsF4w1YCnj9
 bRxw==
X-Gm-Message-State: AOAM531gJI3Pr40fvy63mIKUyVw9pZG4tYn3zYqZk4hg8tJMHINpy1a3
 sb+r13sxGPStdaIVsqfWqpI=
X-Google-Smtp-Source: ABdhPJzpqWLMQGvjv9X+s14zsl6Q5DSB0uECbvqdgmgJpVQCAaxnVCEhOPMym582EHHq5qzu0rhyzA==
X-Received: by 2002:a05:6870:45a5:b0:e1:f27d:d1c8 with SMTP id
 y37-20020a05687045a500b000e1f27dd1c8mr2269782oao.60.1650482272121; 
 Wed, 20 Apr 2022 12:17:52 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a9d6851000000b0060551d14386sm2739464oto.13.2022.04.20.12.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:17:51 -0700 (PDT)
Message-ID: <5c190dd3-a55f-c638-8c55-056c467885f8@gmail.com>
Date: Wed, 20 Apr 2022 16:17:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/2] Remove PCIE root bridge LSI on powernv
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220408131303.147840-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220408131303.147840-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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



On 4/8/22 10:13, Frederic Barrat wrote:
> The powernv8/powernv9/powernv10 machines allocate a LSI for their root
> port bridge, which is not the case on real hardware. The default root
> port implementation in qemu requests a LSI. Since the powernv
> implementation derives from it, that's where the LSI is coming
> from. This series fixes it, so that the model matches the hardware.
> 
> However, the code in hw/pci to handle AER and hotplug events assume a
> LSI is defined. It tends to assert/deassert a LSI if MSI or MSIX is
> not enabled. Since we have hardware where that is not true, this patch
> also fixes a few code paths to check if a LSI is configured before
> trying to trigger it.
> 
> 
> Changes from v1:
>   - addressed comments from Daniel
> 
> 
> Frederic Barrat (2):
>    pcie: Don't try triggering a LSI when not defined
>    ppc/pnv: Remove LSI on the PCIE host bridge
> 
>   hw/pci-host/pnv_phb3.c | 1 +
>   hw/pci-host/pnv_phb4.c | 1 +
>   hw/pci/pcie.c          | 5 +++--
>   hw/pci/pcie_aer.c      | 2 +-
>   4 files changed, 6 insertions(+), 3 deletions(-)
> 

