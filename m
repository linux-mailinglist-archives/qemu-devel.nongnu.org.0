Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF4576305
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:47:28 +0200 (CEST)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLfD-00088H-0L
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oCLcW-0005m6-Lg; Fri, 15 Jul 2022 09:44:40 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:36360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oCLcV-00068c-AA; Fri, 15 Jul 2022 09:44:40 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10bf634bc50so6268359fac.3; 
 Fri, 15 Jul 2022 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7kLFIrwlXRp9I191nNxbgKsVf0vBhshhqcIWk2p1NpM=;
 b=PnQTX+DERH3BgSgxkhOhV/0MamIZzLyvK04RZqXzdXXxytKUZgJor9NFiBnlTjBHPn
 NXDD18bN8hq6b+DXyfq+RwOyAAiL6ABOxOYY4kg8bn/3MFYB7j0SoJamtRuR+TjWcOjr
 e00oB654SyzZbhCmMSo5ef+GA5m0SVCXM3l7Oa4rfgLJtyconh4+ttwWsHd3ZJHhx1f4
 UFCQQ/WX158edKAd7xzbBPmCfTVGzkpctAmbJNVInB/uFYP3pJostteWTEZ+1XXiEa6y
 bsPvEPl30xNHP9ptrM6NtP2NDftuTbyNrOFhG591pwt+lA2UPsV7pB7KNGdrJfeUPNo6
 qEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7kLFIrwlXRp9I191nNxbgKsVf0vBhshhqcIWk2p1NpM=;
 b=AeVmxwzXx5K5tMLrfFiSyB8pEFSGeLR+3g4zrGPxCGlPw3tal+kE1Xsb5Sbfofvk7c
 41gtTmkCnL9WsGK8eOHH70lVrSmCrpZn4fWZLWRP5rHTP6iDaS85B15inqIvNhkjxgoE
 2dKen1AoEv+EOk16SykcWm8XLdFPzJQd3A5DGxVMSfHIknJmZ4PUZLrgvYnMp8ViR5Dd
 5OnTIrMCAlLCxMywS2+ko/NuD6w5vPn6KZmDiihnQVDa+zJUU7FlQT+NRA5Vzwp0XdsV
 5priF0zuJyELgTpamhfuIC9hCvJCtwzjUb4Dop5atzHvIGZ/BrAejewGRBZlbvgHBlPZ
 BmQA==
X-Gm-Message-State: AJIora8qc/VJNn3g0Ki6UhF1OXuLnQfeNPeA5vGIAv1UTLu+PQUvx+yc
 StT31f1fjjhuAMeDbp2PuEk=
X-Google-Smtp-Source: AGRyM1sW+K01TE8pvybD4l9aILR1Frc3wy6TWGv472A4n66DvwrRhV25/l6x+yUTp/41YtpKz02Hjg==
X-Received: by 2002:a05:6871:71f:b0:10b:e9bc:db5f with SMTP id
 f31-20020a056871071f00b0010be9bcdb5fmr7522421oap.100.1657892677688; 
 Fri, 15 Jul 2022 06:44:37 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 c12-20020a544e8c000000b0033a0ef748a8sm1692346oiy.54.2022.07.15.06.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 06:44:37 -0700 (PDT)
Message-ID: <7e54c377-ac10-e9a8-f291-75f4266e733e@gmail.com>
Date: Fri, 15 Jul 2022 10:44:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/3] ppc: Check for bad Radix configs
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org
References: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
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

On 6/28/22 10:39, Leandro Lupori wrote:
> Changes from v2:
> - Improved comments on patch 2
> - Improved commit message on patch 3
> - Now emulating CPU behavior on misaligned page table base addresses
> 
> Leandro Lupori (3):
>    ppc: Check partition and process table alignment
>    target/ppc: Improve Radix xlate level validation
>    target/ppc: Check page dir/table base alignment
> 
>   hw/ppc/spapr.c             |  5 +++
>   hw/ppc/spapr_hcall.c       |  9 ++++
>   target/ppc/mmu-book3s-v3.c |  5 +++
>   target/ppc/mmu-radix64.c   | 92 ++++++++++++++++++++++++++++++--------
>   4 files changed, 93 insertions(+), 18 deletions(-)
> 

