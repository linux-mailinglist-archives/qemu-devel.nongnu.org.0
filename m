Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C0E5762B4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:26:26 +0200 (CEST)
Received: from localhost ([::1]:45326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLKr-0002sR-Oh
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oCLIX-0000te-V6; Fri, 15 Jul 2022 09:24:02 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:43937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oCLIW-0001Z7-8X; Fri, 15 Jul 2022 09:24:01 -0400
Received: by mail-oi1-x231.google.com with SMTP id j70so6019256oih.10;
 Fri, 15 Jul 2022 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DSM9jQzd694m1MpWmIblxBV/hj4QCp5eDgPT+MG1cOQ=;
 b=Ka6nUChoPMSgBabzQpmK+1yp3eDeXubczK0IaR7UNr5PdXmtKQhG5Y8nrVfWgsWA+L
 rlkgW0UrGSEuHlZ3LQXi/pnn0H85WpR8agN1JyFuxO6E9OgHWQyoR3PElk0eFMnSC00C
 O94DF8DGJvTfYfEmXVKV7S8UntQlcyFghDsvabo3dIKQKeDhlrj4ycTpAdiVhPn831mD
 6RNi778eMOgCK2CeUBULCNj9QRZ2FmCApcc+EoKK0mrP5irhqoUWrGPkDwCOOGI9QPGY
 PyT+dFZC2xvhXyASZs4pzNfjXmtsTZ4/7Zhl8g/LPMfdSAG9+PwzTUK8PJBh5OtW0J62
 PNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DSM9jQzd694m1MpWmIblxBV/hj4QCp5eDgPT+MG1cOQ=;
 b=CCHwdx9zLo5tRTm0yr+ocVYI3uHUDKy7N5wVzyvCesTWbjExQNka452SOJNnsypuNT
 lTrSIIf1ek261GuOcWcuond3faHW1iD5G6ZQ9lKszbOmGlabF7S03nUbF17gOzEpWCYA
 V6Zv7tqHPY1jbIiWuluOuZ+jgVsJeYoQwsfJ0tWHDrUPm7Fdn9nZUJT/ElDlpMp9BEb3
 +o2hVuCFmN+ldDADkX6gddsbZbdEQLkQ5Y/RO/I0w4bkDST2XWGhguPJrWKQoyJJM6We
 D8GwiwRd48oiQ20V+dp6aQqXFtqu4Q18AibSJ3t9iigxlPOd+lnqkA3018qtk3gr7IfK
 Y7pQ==
X-Gm-Message-State: AJIora+Vq9P/yoZtA9QLqeZhKXKhmAzJRDc86J6L0/0tiAm51OK0V/1f
 pK/jNgLQkl/dLYBSGaEavjg=
X-Google-Smtp-Source: AGRyM1sG+4eiy0tpZ8E11QYdPIJN4nqQpV5KcPab+rgAdhDpasI/sk7drbl842qsyabtR2g1TMrXNQ==
X-Received: by 2002:a05:6808:120f:b0:325:bc53:2150 with SMTP id
 a15-20020a056808120f00b00325bc532150mr7295515oil.139.1657891437567; 
 Fri, 15 Jul 2022 06:23:57 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 w70-20020acaad49000000b0033a528fe681sm486812oie.37.2022.07.15.06.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 06:23:57 -0700 (PDT)
Message-ID: <72c6d73b-0869-ab1a-3c2c-1c0fa334f643@gmail.com>
Date: Fri, 15 Jul 2022 10:23:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v3 0/3] Implement Power ISA 3.1B hash insns
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, farosas@linux.ibm.com
References: <20220713165458.58807-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220713165458.58807-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
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



On 7/13/22 13:54, Víctor Colombo wrote:
> This patch series implements the 4 instructions added in Power ISA
> 3.1B:
> 
> - hashchk
> - hashst
> - hashchkp
> - hashstp
> 
> To build it, you need to apply the following patches on top of master:
> <20220701133507.740619-2-lucas.coutinho@eldorado.org.br>
> <20220701133507.740619-3-lucas.coutinho@eldorado.org.br>
> <20220712193741.59134-2-leandro.lupori@eldorado.org.br>
> <20220712193741.59134-3-leandro.lupori@eldorado.org.br>
> 
> Working branch for ease of use can be found here:
> https://github.com/PPC64/qemu/tree/vccolombo-hash-to-send-v3
> 
> What do you think about the choice to implement the hash algorithm
> from the ground up, following the SIMON-like algorithm presented in
> Power ISA? IIUC, this algorithm is not the same as the original[1].
> Other options would be to use other algorithm already implemented
> in QEMU, or even make this instruction a nop for all Power versions.
> 
> Also, I was thinking about using the call to spr_register_kvm() in
> init_proc_POWER10 to initialize the registers with a random value.
> I'm not sure what is the behavior here, I would expect that is the job
> of the OS to set the regs, but looks like KVM is not exporting them,
> so they are always 0 (?). Does anyone have any insight on this?

This happens because KVM on POWER10 isn't handling these registers
appropriately. We are probably missing kernel/kvm code to do so.

Since KVM on POWER10 is on an uncertain spot at this moment I wouldn't
worry too much about it. Making the regs read/write work in TCG is good
enough for now.


Daniel

> 
> v1->v2:
> - Split the patch in 2
> - Rebase to master
> 
> v2->v3:
> - Split patches in 3
>      - the new patch (patch 1) is separating the kvm header
>        changes [Cornelia]
> 
> [1] https://eprint.iacr.org/2013/404.pdf
> 
> Víctor Colombo (3):
>    linux-headers/asm-powerpc/kvm.h: Add HASHKEYR and HASHPKEYR in headers
>    target/ppc: Implement hashst and hashchk
>    target/ppc: Implement hashstp and hashchkp
> 
>   linux-headers/asm-powerpc/kvm.h            |  3 +
>   target/ppc/cpu.h                           |  2 +
>   target/ppc/cpu_init.c                      |  7 ++
>   target/ppc/excp_helper.c                   | 82 ++++++++++++++++++++++
>   target/ppc/helper.h                        |  4 ++
>   target/ppc/insn32.decode                   | 10 +++
>   target/ppc/translate.c                     |  5 ++
>   target/ppc/translate/fixedpoint-impl.c.inc | 34 +++++++++
>   8 files changed, 147 insertions(+)
> 

