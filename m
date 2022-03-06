Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262B4CEDEF
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 22:26:28 +0100 (CET)
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQyOY-0003yC-MV
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 16:26:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQyNg-0003JO-Jx
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:25:32 -0500
Received: from [2a00:1450:4864:20::42a] (port=33321
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQyNf-00083h-2t
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:25:32 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j17so20523329wrc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 13:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jUhIoPs9vqzYt00stjVl2hRjAUwu3mFVrNiTaDkfkHE=;
 b=pvxvhk+0CeamlSjDivXkiTaxKopU2ecfEzEJIZD7fAACQOe+evPJRuihydZbq3b4a1
 Od8P9UlCah2uOf/XbovpcSxGMZCpeFedQNk11qqe3Ffii+on0/daqZtly4abty94hI+q
 2deHwem39KP5RBYJqjRFsxQaCPNmUIbrymuyzpYKZ7MewAvXhKdnpzblgoDRdxlfxFqw
 VG2nKR6yaiLZOo6DST209jNe5sGZ2lXRuvCDsS2Gbh+9vF7wGhitO15MY0a5VtC9/opv
 ToywmRIDWRPJxM/uB86NaTh6a1k0d3T1XL20zMi9ak6tuM2IiGEn8bj8vK9TWvKYL0PG
 Q7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jUhIoPs9vqzYt00stjVl2hRjAUwu3mFVrNiTaDkfkHE=;
 b=mW4lfAmV1aU3x19LizvgMt564D9kUPHguJ/6IKvQ22hlISeXDEVc2Pyvy/nPBNIizQ
 Dvbx68SLOvmPdHLjkvRK7W8+IgAxpPnzv/Q12knqoF/WkJ6qOI0z/C45iAOknG+O+Rfp
 qC5KX09FSE/sqa5HtcfhUUwO5hY2riuWSK9eJegPuQJAncf4tZiN1/J/iurN9kU8IWSX
 3uiuAwKKB0D4rGeSnEBTMnhahhl9E06craDHYfQbWZJ5nI7qQ0ljs+loaCq6/0nHs/8y
 DCf4dYZ2cFqwtCfO7+l9VSHXxGHZI0vewc31J4/wOxbf5rvYPsH5jxziNPQANRbUtp3N
 xkvA==
X-Gm-Message-State: AOAM5310gXRJHdPM3yplvt1vOxXcC8+7OhgnE+OuIoGEFx1O8E0Knk41
 UvDoGUQkCaApVUnIc902eCy/ObiU/jg=
X-Google-Smtp-Source: ABdhPJxo8RO55tkp9CFra6HjDKV1rONXfRwfaSoOTU0gstG3CIPOvMZDwmUSXMp2b/VV6L35IGBXcA==
X-Received: by 2002:a5d:6790:0:b0:1f1:dabd:9134 with SMTP id
 v16-20020a5d6790000000b001f1dabd9134mr6076449wru.447.1646601929218; 
 Sun, 06 Mar 2022 13:25:29 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x5-20020adfec05000000b001e58cc95affsm9657608wrn.38.2022.03.06.13.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 13:25:28 -0800 (PST)
Message-ID: <fde9cf50-f547-1043-1a46-dae121954220@gmail.com>
Date: Sun, 6 Mar 2022 22:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PULL 28/33] target: Use forward declared type instead of
 structure type
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
 <20220306130000.8104-29-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306130000.8104-29-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/22 13:59, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The CPU / CPU state are forward declared.
> 
>    $ git grep -E 'struct [A-Za-z]+CPU\ \*'
>    target/arm/hvf_arm.h:16:void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
>    target/openrisc/cpu.h:234:    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
>    target/openrisc/cpu.h:238:    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,
> 
>    $ git grep -E 'struct CPU[A-Za-z]+State\ \*'

Updating this regexp to catch CPUX86State:

   $ git grep -E 'struct CPU[A-Za-z0-9]+State\ \*'
   target/i386/hvf/x86_emu.c:174:static bool is_host_reg(struct 
CPUX86State *env, target_ulong ptr)
   target/i386/hvf/x86_emu.c:179:void write_val_ext(struct CPUX86State 
*env, target_ulong ptr, target_ulong val, int size)
   target/i386/hvf/x86_emu.c:188:uint8_t *read_mmio(struct CPUX86State 
*env, target_ulong ptr, int bytes)
   ...

>    target/mips/internal.h:137:    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
>    target/mips/internal.h:139:    void (*helper_tlbwi)(struct CPUMIPSState *env);
>    target/mips/internal.h:140:    void (*helper_tlbwr)(struct CPUMIPSState *env);
>    target/mips/internal.h:141:    void (*helper_tlbp)(struct CPUMIPSState *env);
>    target/mips/internal.h:142:    void (*helper_tlbr)(struct CPUMIPSState *env);
>    target/mips/internal.h:143:    void (*helper_tlbinv)(struct CPUMIPSState *env);
>    target/mips/internal.h:144:    void (*helper_tlbinvf)(struct CPUMIPSState *env);
>    target/xtensa/cpu.h:347:    struct CPUXtensaState *env;
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20220214183144.27402-12-f4bug@amsat.org>
> ---
>   target/arm/hvf_arm.h        |  2 +-
>   target/mips/internal.h      | 14 +++++++-------
>   target/openrisc/cpu.h       |  4 ++--
>   target/xtensa/cpu.h         |  2 +-
>   target/i386/nvmm/nvmm-all.c | 14 +++++++-------
>   target/i386/whpx/whpx-all.c | 18 +++++++++---------
>   6 files changed, 27 insertions(+), 27 deletions(-)

Diffstat with new regexp:

  target/arm/hvf_arm.h        |   2 +-
  target/i386/hvf/x86_emu.c   | 110 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------
  target/i386/hvf/x86_emu.h   |  22 +++++++++++-----------
  target/i386/nvmm/nvmm-all.c |  14 +++++++-------
  target/i386/whpx/whpx-all.c |  18 +++++++++---------
  target/mips/internal.h      |  14 +++++++-------
  target/openrisc/cpu.h       |   4 ++--
  target/xtensa/cpu.h         |   2 +-
  8 files changed, 93 insertions(+), 93 deletions(-)

