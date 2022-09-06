Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D55AF574
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 22:10:23 +0200 (CEST)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVetr-0005eG-1n
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 16:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVerg-0002g8-LZ; Tue, 06 Sep 2022 16:08:08 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVere-00038W-NN; Tue, 06 Sep 2022 16:08:08 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so8815610otq.5; 
 Tue, 06 Sep 2022 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=MQwroybn2laV6pKgyjyLonRW+lxcEIayvT2KIKhKzNg=;
 b=DFCafK03PztJ5CypKs1hCH+lVWrLCb5+tIJ/ByvrU+ngE0zmNe+ShorDrW8xqL2SKA
 aYkd9G25MvLMCZ9zz+33SpiqfY9J9pQYqPAW56C0rQVohAz7c7VHgWpbEnqJA791hVcc
 J21kbB1ZgO3SLhfLEEgm64uODPU9r2qC0CxD0tuFVDQteVkS8BO0IsBsfNbrQ4cdKbFq
 boB520eAWfmwfdHErp1TRONSgRxBNvShAfLlEEN8lYKT7sqpAOdjFbb/DqbOA019r5Ak
 Vp3/h14MJHAOy7LMUAyiNBvcuPT4/2sfsOdlmp6i7XUiEn8Hn1AviiHlqQRfjFVeW2Vv
 iTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MQwroybn2laV6pKgyjyLonRW+lxcEIayvT2KIKhKzNg=;
 b=gCiwsEBRhr9twszHTrZCilgoTVX08tLwb8Y1KatlQ92gqIfmksYh8qUBtqLkpewKX4
 F6CiU8snt5kRHOBfES8fnNwQMSpQBcf4XhIXYEknRbogo5xet3MMa3JfZqncoP4o3Axa
 lIJvtjgxvDF68ZfANcBx/zobvc807rcIGe6RPRI5GvfkbXFDU7FvtbjarcFGWfKL6CMf
 wifXcizkhJ0S84k24S5O4ej7EUCeRcXv4YN/7k8WWUffpmZ4CSZReevSA+mQLgREPniW
 u0ZrLnLvhzBlIc6dZgMSGf1Sr+vl2KMBt4CeNACGetOXvVIbvqtQ7gRj3dfep0xIThTG
 yofg==
X-Gm-Message-State: ACgBeo1EUwIbyM3gg8UmwQUqN7Hdzs1sT0FbuDhLI6JKQ0VII9WyO+ok
 wDmGiadzdt/0+LqjJo5V1Rk=
X-Google-Smtp-Source: AA6agR5uM5Ps1zInQPy2fNZwBUfalIQuhZsU3zreHDUIVwq6cQ6hShPM9DOzxWAZcUPDtsvfG9TV0Q==
X-Received: by 2002:a05:6830:1e33:b0:637:3143:d3b5 with SMTP id
 t19-20020a0568301e3300b006373143d3b5mr73821otr.285.1662494885090; 
 Tue, 06 Sep 2022 13:08:05 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 t6-20020a056870f20600b0010d5d5c3fc3sm6928337oao.8.2022.09.06.13.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 13:08:04 -0700 (PDT)
Message-ID: <b9a8ae2b-fcec-8190-76e4-0c63866b3b0f@gmail.com>
Date: Tue, 6 Sep 2022 17:07:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 0/8] Multiple ppc instructions fixes
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.752,
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

On 9/6/22 09:55, Víctor Colombo wrote:
> This patch set fixes multiple instructions for PPC targets that were
> producing incorrect results, or setting the wrong bits in FPSCR.
> 
> Patch 1 is just a style fix, trivial.
> Patch 8 adds helper_reset_fpstatus() calls to instructions
>      that have an issue where the exception flags are being kept from
>      the previous instruction, causing incorrect bits to be set,
>      specially the non-sticky FI bit.
> Other patches fixes other specific situations.
> 
> v1->v2:
> - Squash patches 8 through 19 and write a better commit message to it.
> - Dropped Daniel's R-b in the squashed patches, as the squash merged
>      both reviewed and non-reviewed patches. Now require a new, single
>      R-b.
> 
> Víctor Colombo (8):
>    target/ppc: Remove extra space from s128 field in ppc_vsr_t
>    target/ppc: Remove unused xer_* macros
>    target/ppc: Zero second doubleword in DFP instructions
>    target/ppc: Set result to QNaN for DENBCD when VXCVI occurs
>    target/ppc: Zero second doubleword for VSX madd instructions
>    target/ppc: Set OV32 when OV is set
>    target/ppc: Zero second doubleword of VSR registers for FPR insns
>    target/ppc: Clear fpstatus flags on helpers missing it
> 
>   target/ppc/cpu.h        |  6 +-----
>   target/ppc/dfp_helper.c | 31 ++++++++++++++++++++++++++++---
>   target/ppc/fpu_helper.c | 39 +++++++++++++++++++++++++++------------
>   target/ppc/int_helper.c |  4 ++--
>   target/ppc/translate.c  |  8 ++++++++
>   5 files changed, 66 insertions(+), 22 deletions(-)
> 

